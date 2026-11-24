using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

/// <summary>
/// Stable UTC daily practice selection. Reuses normal answer submission and
/// progress accounting; does not award duplicate bonus points.
/// </summary>
[ApiController]
[Route("api/users/daily-challenge")]
[Authorize(Roles = "Student")]
public sealed class DailyChallengeController : ControllerBase
{
    private readonly AppDbContext _db;
    private readonly ProblemCategoryAccessService _access;

    public DailyChallengeController(AppDbContext db, ProblemCategoryAccessService access)
    {
        _db = db;
        _access = access;
    }

    [HttpGet]
    [ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
    public async Task<IActionResult> Get([FromQuery] int? stageId, CancellationToken ct)
    {
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var userId))
            return Unauthorized();

        var learner = await _db.Users.AsNoTracking()
            .Where(x => x.Id == userId && x.IsActive && x.Role == "Student")
            .FirstOrDefaultAsync(ct);
        if (learner == null) return Unauthorized();
        // The daily challenge is an account-upgrade benefit; unrestricted
        // problem solving in Free categories remains available separately.
        if (!PremiumEntitlement.IsActive(learner))
            return StatusCode(StatusCodes.Status403Forbidden,
                new { Message = "AccountUpgradeRequired" });

        // The student workspace is always scoped to the currently selected stage.
        // A caller cannot force the challenge to select problems from another stage.
        var targetStage = learner.CurrentStageId;
        if (!targetStage.HasValue || targetStage.Value <= 0)
            return Conflict(new { Message = "LearningStageRequired" });
        if (stageId.HasValue && stageId.Value != targetStage.Value)
            return BadRequest(new { Message = "StageMismatch" });

        if (!await _db.EducationalStages.AsNoTracking()
            .AnyAsync(x => x.Id == targetStage.Value, ct))
            return NotFound(new { Message = "StageNotFound" });

        var allowed = await _access.GetAllowedCategoryIdsAsync(User, ct);
        if (allowed == null) return Forbid();

        var day = DateTime.UtcNow.Date;
        var nextDay = day.AddDays(1);

        // Choose questions that have not already been attempted in this practice
        // cycle before today. Previously incorrect work is not answerable from
        // the challenge screen unless an explicit mistake review is requested.
        // The first-attempt timestamp keeps today's selection stable even after
        // a question is answered later on the same UTC day.
        var tracks=HttpContext.RequestServices.GetRequiredService<LearningTrackService>();
        var track=await tracks.ActiveAsync(targetStage,learner.CurrentTrackId,ct);
        var practiceScope=TrackPractice.Scope(HttpContext.RequestServices.GetRequiredService<IConfiguration>(),track?.Id);
        var scopedProgress=TrackPractice.For(_db,practiceScope);
        var attemptedBeforeToday = await scopedProgress.AsNoTracking()
            .Where(p => p.UserId == userId &&
                ((p.Attempts > 0 &&
                    (p.FirstAttemptAt ?? p.LastAttemptAt) < day) ||
                 (p.IsSolved && p.SolvedAt.HasValue && p.SolvedAt.Value < day)))
            .Select(p => p.ProblemId).ToListAsync(ct);

        var scoped=track is null?_db.Problems.AsNoTracking():tracks.ValidProblems(track.Id);
        var eligible = await scoped
            .Where(p => p.StageId == targetStage.Value &&
                p.Category.StageId == targetStage.Value &&
                allowed.Contains(p.CategoryId) &&
                !attemptedBeforeToday.Contains(p.Id))
            .OrderBy(p => p.Id)
            .Select(p => new { p.Id, p.CategoryId, p.TitleAr, p.TitleEn, p.Points })
            .ToListAsync(ct);

        // Spread five questions over different topics where possible. The
        // arithmetic score is stable across processes (unlike HashCode.Random).
        // Never include a previously attempted problem from before today.
        var seed = (long)DateOnly.FromDateTime(day).DayNumber * 31 +
                   (long)userId * 17 + (long)targetStage.Value * 13;
        long Rank(int id) => ((long)id * 1103515245L + seed * 1013904223L) & 0x7fffffff;
        var selected = eligible
            .GroupBy(p => p.CategoryId)
            .OrderBy(g => Rank(g.Key))
            .SelectMany(g => g
                .OrderBy(p => Rank(p.Id))
                .Select((problem, index) => new { problem, index }))
            .OrderBy(x => x.index)
            .ThenBy(x => Rank(x.problem.CategoryId))
            .Take(5)
            .Select(x => x.problem)
            .ToList();
        var ids = selected.Select(p => p.Id).ToArray();

        // Each daily question counts once as soon as an answer is submitted,
        // whether right or wrong. The UI then advances to the next question.
        // The correct count is independent and is shown in the result screen.
        // Ignore prior audit rows after a voluntary practice cycle reset.
        var activeAttempts = await scopedProgress.AsNoTracking()
            .Where(p => p.UserId == userId && p.Attempts > 0 &&
                ids.Contains(p.ProblemId))
            .Select(p => p.ProblemId).ToListAsync(ct);
        var activeIds = activeAttempts.ToHashSet();
        var answersToday = await _db.ProblemAttempts.AsNoTracking()
            .Where(p => p.UserId == userId && p.PracticeScopeId==practiceScope && ids.Contains(p.ProblemId) &&
                p.SubmittedAt >= day && p.SubmittedAt < nextDay)
            .GroupBy(p => p.ProblemId)
            .Select(g => new { ProblemId = g.Key,
                IsCorrect = g.Any(p => p.IsCorrect) })
            .ToListAsync(ct);
        var answeredIds = answersToday.Where(p => activeIds.Contains(p.ProblemId))
            .Select(p => p.ProblemId).ToHashSet();
        var correctIds = answersToday.Where(p => p.IsCorrect &&
            activeIds.Contains(p.ProblemId))
            .Select(p => p.ProblemId).ToHashSet();

        return Ok(new
        {
            DateUtc = day.ToString("yyyy-MM-dd"),
            StageId = targetStage.Value,
            TrackId = track?.Id,
            Total = selected.Count,
            Completed = selected.Count(p => answeredIds.Contains(p.Id)),
            Correct = selected.Count(p => correctIds.Contains(p.Id)),
            Problems = selected.Select(p => new
            {
                p.Id, p.CategoryId, p.TitleAr, p.TitleEn, p.Points,
                IsAnswered = answeredIds.Contains(p.Id),
                IsSolved = correctIds.Contains(p.Id)
            }).ToList()
        });
    }
}
