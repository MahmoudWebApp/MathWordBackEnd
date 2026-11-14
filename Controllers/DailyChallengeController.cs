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
            .Select(x => new { x.CurrentStageId })
            .FirstOrDefaultAsync(ct);
        if (learner == null) return Unauthorized();

        var targetStage = stageId ?? learner.CurrentStageId;
        if (!targetStage.HasValue || targetStage.Value <= 0)
            return Conflict(new { Message = "LearningStageRequired" });

        if (!await _db.EducationalStages.AsNoTracking()
            .AnyAsync(x => x.Id == targetStage.Value, ct))
            return NotFound(new { Message = "StageNotFound" });

        var allowed = await _access.GetAllowedCategoryIdsAsync(User, ct);
        if (allowed == null) return Forbid();

        var eligible = await _db.Problems.AsNoTracking()
            .Where(p => p.StageId == targetStage.Value &&
                p.Category.StageId == targetStage.Value &&
                allowed.Contains(p.CategoryId))
            .OrderBy(p => p.Id)
            .Select(p => new { p.Id, p.CategoryId, p.TitleAr, p.TitleEn, p.Points })
            .ToListAsync(ct);

        var day = DateTime.UtcNow.Date;
        // Stable per learner, stage and UTC day. No unstable runtime string hashing.
        var offset = eligible.Count == 0 ? 0 :
            (int)(((long)DateOnly.FromDateTime(day).DayNumber * 31 + (long)userId * 17 +
                (long)targetStage.Value * 13) % eligible.Count);
        var selected = Enumerable.Range(0, Math.Min(5, eligible.Count))
            .Select(i => eligible[(offset + i) % eligible.Count]).ToList();
        var ids = selected.Select(p => p.Id).ToArray();

        var solved = await _db.UserProgresses.AsNoTracking()
            .Where(p => p.UserId == userId && ids.Contains(p.ProblemId) && p.IsSolved)
            .Select(p => p.ProblemId).ToListAsync(ct);
        var solvedIds = solved.ToHashSet();

        return Ok(new
        {
            DateUtc = day.ToString("yyyy-MM-dd"),
            StageId = targetStage.Value,
            Total = selected.Count,
            Completed = selected.Count(p => solvedIds.Contains(p.Id)),
            Problems = selected.Select(p => new
            {
                p.Id, p.CategoryId, p.TitleAr, p.TitleEn, p.Points,
                IsSolved = solvedIds.Contains(p.Id)
            }).ToList()
        });
    }
}
