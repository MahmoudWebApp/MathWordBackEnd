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

        // Only past solved work may influence today's picks. Solving a challenge
        // problem today must NEVER cause the list to reshuffle mid-session.
        var solvedBeforeToday = await _db.UserProgresses.AsNoTracking()
            .Where(p => p.UserId == userId && p.IsSolved &&
                p.SolvedAt.HasValue && p.SolvedAt.Value < day)
            .Select(p => p.ProblemId).ToListAsync(ct);
        var previouslySolved = solvedBeforeToday.ToHashSet();

        var eligible = await _db.Problems.AsNoTracking()
            .Where(p => p.StageId == targetStage.Value &&
                p.Category.StageId == targetStage.Value &&
                allowed.Contains(p.CategoryId))
            .OrderBy(p => p.Id)
            .Select(p => new { p.Id, p.CategoryId, p.TitleAr, p.TitleEn, p.Points })
            .ToListAsync(ct);

        // Spread five questions over different topics where possible. The
        // arithmetic score is stable across processes (unlike HashCode.Random).
        // Prefer questions that were not solved before the UTC day began.
        var seed = (long)DateOnly.FromDateTime(day).DayNumber * 31 +
                   (long)userId * 17 + (long)targetStage.Value * 13;
        long Rank(int id) => ((long)id * 1103515245L + seed * 1013904223L) & 0x7fffffff;
        var selected = eligible
            .GroupBy(p => p.CategoryId)
            .OrderBy(g => Rank(g.Key))
            .SelectMany(g => g
                .OrderBy(p => previouslySolved.Contains(p.Id) ? 1 : 0)
                .ThenBy(p => Rank(p.Id))
                .Select((problem, index) => new { problem, index }))
            .OrderBy(x => x.index)
            .ThenBy(x => Rank(x.problem.CategoryId))
            .Take(5)
            .Select(x => x.problem)
            .ToList();
        var ids = selected.Select(p => p.Id).ToArray();

        // An old lifetime 'IsSolved' flag is not a daily-challenge result.
        // Credit a challenge item only for a correct attempt TODAY (UTC).
        // Reuse existing problem-answer processing; do not award extra points.
        var completedToday = await _db.ProblemAttempts.AsNoTracking()
            .Where(p => p.UserId == userId && ids.Contains(p.ProblemId) &&
                p.IsCorrect && p.SubmittedAt >= day && p.SubmittedAt < nextDay)
            .Select(p => p.ProblemId)
            .Distinct().ToListAsync(ct);
        var completedIds = completedToday.ToHashSet();

        return Ok(new
        {
            DateUtc = day.ToString("yyyy-MM-dd"),
            StageId = targetStage.Value,
            Total = selected.Count,
            Completed = selected.Count(p => completedIds.Contains(p.Id)),
            Problems = selected.Select(p => new
            {
                p.Id, p.CategoryId, p.TitleAr, p.TitleEn, p.Points,
                IsSolved = completedIds.Contains(p.Id)
            }).ToList()
        });
    }
}
