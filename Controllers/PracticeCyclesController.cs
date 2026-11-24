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
    }

    [HttpPost("reset")]
    [ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
    public async Task<IActionResult> Reset([FromBody] ResetPracticeRequest? request,
        CancellationToken ct)
    {
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var userId)
            || userId <= 0) return Unauthorized();

        if (request is null || request.StageId <= 0 ||
            (request.CategoryId.HasValue && request.CategoryId.Value <= 0))
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
        if(await tracks.ActiveAsync(latest.CurrentStageId,latest.CurrentTrackId,ct) is not null)
            return Conflict(new { Message = "TrackPracticeCycleRequired" });
        var scope = _db.UserProgresses
            .Where(p => p.UserId == userId &&
                p.Problem.StageId == request.StageId &&
                p.Problem.Category.StageId == request.StageId);
        if (request.CategoryId.HasValue)
            scope = scope.Where(p => p.Problem.CategoryId == request.CategoryId.Value);

        var rows = await scope.ToListAsync(ct);
        var solvedIds = rows.Where(p => p.IsSolved).Select(p => p.ProblemId).ToArray();
        var attemptedCount = rows.Count(p => p.Attempts > 0);

        foreach (var progress in rows)
        {
            // Favorites remain favorites. The audit is an independent table,
            // so old answer submissions are never deleted.
            progress.IsSolved = false;
            progress.IsCorrect = false;
            progress.SelectedOptionId = 0;
            progress.Attempts = 0;
            progress.TimeSpentSeconds = 0;
            progress.SolvedAt = null;
            progress.FirstAttemptCorrect = null;
            progress.FirstSelectedOptionId = null;
            progress.FirstAttemptAt = null;
            progress.BestTimeSeconds = null;
            progress.TotalTimeSpentSeconds = 0;
            progress.CorrectAttempts = 0;
            progress.IncorrectAttempts = 0;
            progress.MasteryStatus = MasteryStatuses.New;
            progress.IsInErrorNotebook = false;
            progress.IsErrorNotebookArchived = false;
            progress.NextReviewAt = null;
            progress.ConsecutiveCorrectReviews = 0;
        }

        // SolvedCount tracks currently solved users, not number of attempts.
        // Repeated resets followed by re-solves never inflate it.
        if (solvedIds.Length > 0)
            await _db.Problems.Where(p => solvedIds.Contains(p.Id))
                .ExecuteUpdateAsync(set => set.SetProperty(p => p.SolvedCount,
                    p => p.SolvedCount > 0 ? p.SolvedCount - 1 : 0), ct);

        await _db.SaveChangesAsync(ct);
        await transaction.CommitAsync(ct);

        return Ok(new
        {
            request.StageId,
            request.CategoryId,
            ResetProblems = attemptedCount,
            ResetSolved = solvedIds.Length,
            PreservedFavorites = rows.Count(p => p.IsFavorite),
            // Immutable attempts retained for admin audit but not visible in
            // the learner-facing simplified practice UI.
            PracticeCycleReset = true
        });
    }
}
