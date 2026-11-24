using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.Helpers;
using MathWorldAPI.Models;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

/// <summary>
/// Reset the learner's ACTIVE practice cycle, never their immutable attempt
/// audit or favorites. Scope is exactly one selected stage or one of its topics.
/// </summary>
[ApiController]
[Route("api/users/practice")]
[Authorize(Roles = "Student")]
public sealed class PracticeCyclesController : ControllerBase
{
    private readonly AppDbContext _db;
    public PracticeCyclesController(AppDbContext db) => _db = db;

    public sealed class ResetPracticeRequest
    {
        public int StageId { get; set; }
        public int? CategoryId { get; set; }
        public int? TrackId { get; set; }
    }

    [HttpPost("reset")]
    [ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
    public async Task<IActionResult> Reset([FromBody] ResetPracticeRequest? request,
        CancellationToken ct)
    {
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var userId)
            || userId <= 0) return Unauthorized();

        if (request is null || request.StageId <= 0 ||
            (request.CategoryId.HasValue && request.CategoryId.Value <= 0) || request.TrackId is <=0)
            return BadRequest(new { Message = "InvalidPracticeScope" });

        var learner = await _db.Users.AsNoTracking()
            .Where(u => u.Id == userId && u.Role == "Student" && u.IsActive)
            .Select(u => new { u.CurrentStageId, u.CurrentTrackId }).FirstOrDefaultAsync(ct);
        if (learner is null) return Unauthorized();
        var activeStage = await LegacyLearningStage.EffectiveIdAsync(
            _db, learner.CurrentStageId, ct);
        if (!activeStage.HasValue || activeStage.Value != request.StageId)
            return StatusCode(StatusCodes.Status403Forbidden,
                new { Message = "CurrentStageOnly" });

        if (request.CategoryId.HasValue &&
            !await _db.Categories.AsNoTracking().AnyAsync(c =>
                c.Id == request.CategoryId.Value && c.StageId == request.StageId, ct))
            return NotFound(new { Message = "CategoryNotInStage" });

        await using var transaction = await _db.Database.BeginTransactionAsync(ct);
        // Same learner-wide lock as answer submission: reset cannot race a
        // student's answer in another request/API instance.
        await _db.Database.SqlQuery<int>(
            $"SELECT 1 AS \"Value\" FROM pg_advisory_xact_lock({-987654320}, {userId})")
            .SingleAsync(ct);

        // The legacy reset mutates shared problem progress. Until independent
        // practice cycles are introduced, never allow a track selection to
        // accidentally reset the whole stage (including other tracks).
        var tracks=HttpContext.RequestServices.GetRequiredService<LearningTrackService>();
        var latest=await _db.Users.AsNoTracking().SingleAsync(u=>u.Id==userId,ct);
        var latestStage=await LegacyLearningStage.EffectiveIdAsync(_db,latest.CurrentStageId,ct);
        if(!latest.IsActive||latest.Role!="Student"||latestStage!=request.StageId)
            return StatusCode(403,new{Message="CurrentStageOnly"});
        var track=await tracks.ActiveAsync(latest.CurrentStageId,latest.CurrentTrackId,ct);
        var enabled=TrackPractice.Enabled(HttpContext.RequestServices.GetRequiredService<IConfiguration>());
        if(track!=null&&!enabled)return Conflict(new { Message = "TrackPracticeCycleRequired" });
        if(request.TrackId!=track?.Id||(tracks.Enabled&&latest.CurrentTrackId.HasValue&&track==null))
            return Conflict(new{Message="PracticeScopeChanged"});
        var practiceScope=TrackPractice.Scope(HttpContext.RequestServices.GetRequiredService<IConfiguration>(),track?.Id);
        var eligible=track==null?_db.Problems.AsNoTracking().Where(p=>p.StageId==request.StageId&&p.Category.StageId==request.StageId):tracks.ValidProblems(track.Id);
        if(request.CategoryId.HasValue&&!await eligible.AnyAsync(p=>p.CategoryId==request.CategoryId,ct))
            return NotFound(new{Message="CategoryNotInScope"});
        var scope = TrackPractice.For(_db,practiceScope)
            .Where(p => p.UserId == userId &&
                p.Problem.StageId == request.StageId &&
                p.Problem.Category.StageId == request.StageId && eligible.Any(q=>q.Id==p.ProblemId));
        if (request.CategoryId.HasValue)
            scope = scope.Where(p => p.Problem.CategoryId == request.CategoryId.Value);

        var rows = await scope.AsNoTracking().Select(p=>new{p.Id,p.ProblemId,p.IsSolved,p.Attempts}).ToListAsync(ct);
        var solvedIds = rows.Where(p => p.IsSolved).Select(p => p.ProblemId).ToArray();
        var attemptedCount = rows.Count(p => p.Attempts > 0);

        // Update only the selected cycle rows in SQL under the learner lock.
        // Explicit tracking is not necessary and no global favorite/audit
        // column is touched. The transaction rolls everything back on failure.
        var rowIds=rows.Select(p=>p.Id).ToArray();
        if(rowIds.Length>0)
        {
            var changed=await TrackPractice.For(_db,practiceScope)
                .Where(p=>p.UserId==userId&&rowIds.Contains(p.Id))
                .ExecuteUpdateAsync(set=>set
                    .SetProperty(p=>p.IsSolved,false)
                    .SetProperty(p=>p.IsCorrect,false)
                    .SetProperty(p=>p.SelectedOptionId,0)
                    .SetProperty(p=>p.Attempts,0)
                    .SetProperty(p=>p.HintsRevealed,0)
                    .SetProperty(p=>p.TimeSpentSeconds,0)
                    .SetProperty(p=>p.SolvedAt,(DateTime?)null)
                    .SetProperty(p=>p.FirstAttemptCorrect,(bool?)null)
                    .SetProperty(p=>p.FirstSelectedOptionId,(int?)null)
                    .SetProperty(p=>p.FirstAttemptAt,(DateTime?)null)
                    .SetProperty(p=>p.BestTimeSeconds,(int?)null)
                    .SetProperty(p=>p.TotalTimeSpentSeconds,0L)
                    .SetProperty(p=>p.CorrectAttempts,0)
                    .SetProperty(p=>p.IncorrectAttempts,0)
                    .SetProperty(p=>p.MasteryStatus,MasteryStatuses.New)
                    .SetProperty(p=>p.IsInErrorNotebook,false)
                    .SetProperty(p=>p.IsErrorNotebookArchived,false)
                    .SetProperty(p=>p.NextReviewAt,(DateTime?)null)
                    .SetProperty(p=>p.ConsecutiveCorrectReviews,0),ct);
            if(changed!=rowIds.Length)throw new DbUpdateConcurrencyException("Practice cycle rows changed during reset.");
        }

        // SolvedCount tracks currently solved users, not number of attempts.
        // Repeated resets followed by re-solves never inflate it.
        if (solvedIds.Length > 0)
            await _db.Problems.Where(p => solvedIds.Contains(p.Id)&&!_db.UserProgresses.IgnoreQueryFilters().Any(x=>x.UserId==userId&&x.ProblemId==p.Id&&x.PracticeScopeId!=practiceScope&&x.IsSolved))
                .ExecuteUpdateAsync(set => set.SetProperty(p => p.SolvedCount,
                    p => p.SolvedCount > 0 ? p.SolvedCount - 1 : 0), ct);

        var preservedFavorites=await _db.UserProgresses.CountAsync(p=>p.UserId==userId&&p.IsFavorite&&eligible.Any(q=>q.Id==p.ProblemId)&&(!request.CategoryId.HasValue||p.Problem.CategoryId==request.CategoryId),ct);
        await transaction.CommitAsync(ct);

        return Ok(new
        {
            request.StageId,
            request.CategoryId,
            request.TrackId,
            ResetProblems = attemptedCount,
            ResetSolved = solvedIds.Length,
            PreservedFavorites = preservedFavorites,
            // Immutable attempts retained for admin audit but not visible in
            // the learner-facing simplified practice UI.
            PracticeCycleReset = true
        });
    }
}
