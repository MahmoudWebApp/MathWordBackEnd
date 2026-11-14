using System.Security.Claims;
using MathWorldAPI.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

/// <summary>
/// Stage-isolated, privacy-preserving student rankings based only on awarded
/// points and first-time correct solves; retries never inflate the score.
/// </summary>
[ApiController]
[Route("api/users")]
[Authorize(Roles = "Student")]
public sealed class StudentLeaderboardController : ControllerBase
{
    private readonly AppDbContext _db;

    public StudentLeaderboardController(AppDbContext db) => _db = db;

    [HttpGet("leaderboard")]
    [ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
    public async Task<IActionResult> Get(
        [FromQuery] int? stageId,
        [FromQuery] string period = "all",
        [FromQuery] int page = 1,
        [FromQuery] int pageSize = 20,
        CancellationToken ct = default)
    {
        if (page < 1 || pageSize is < 1 or > 50 ||
            (long)(page - 1) * pageSize > int.MaxValue ||
            period is not ("all" or "weekly" or "monthly"))
            return BadRequest(new { Message = "InvalidLeaderboardFilter" });

        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var userId) ||
            userId <= 0)
            return Unauthorized();

        var currentUser = await _db.Users.AsNoTracking().FirstOrDefaultAsync(
            u => u.Id == userId && u.Role == "Student" && u.IsActive, ct);
        if (currentUser is null) return Unauthorized();
        var id = stageId ?? currentUser.CurrentStageId;
        if (id is null) return Conflict(new { Message = "LearningStageRequired" });
        if (id != currentUser.CurrentStageId)
            return StatusCode(StatusCodes.Status403Forbidden, new { Message = "CurrentStageOnly" });

        var stage = await _db.EducationalStages.AsNoTracking()
            .Where(s => s.Id == id)
            .Select(s => new { s.Id, s.NameAr, s.NameEn })
            .FirstOrDefaultAsync(ct);
        if (stage is null) return NotFound(new { Message = "StageNotFound" });

        // A rolling window, not a guessed calendar week/month.
        var cutoff = period == "weekly" ? DateTime.UtcNow.AddDays(-7) :
            period == "monthly" ? DateTime.UtcNow.AddDays(-30) : (DateTime?)null;

        var query = _db.ProblemAttempts.AsNoTracking()
            .Where(a => a.Problem.StageId == stage.Id &&
                a.User.Role == "Student" && a.User.IsActive &&
                a.User.CurrentStageId == stage.Id);
        if (cutoff is not null)
            query = query.Where(a => a.SubmittedAt >= cutoff.Value);

        var scores = await query.GroupBy(a => a.UserId)
            .Select(g => new
            {
                UserId = g.Key,
                SolvedProblems = g.Count(a => a.PointsEarned > 0),
                Points = g.Sum(a => a.PointsEarned),
                FirstTryCorrect = g.Count(a => a.IsOfficial && a.IsCorrect)
            })
            .Where(x => x.SolvedProblems > 0)
            .OrderByDescending(x => x.SolvedProblems)
            .ThenByDescending(x => x.Points)
            .ThenByDescending(x => x.FirstTryCorrect)
            .ThenBy(x => x.UserId)
            .ToListAsync(ct);

        var myIndex = scores.FindIndex(x => x.UserId == userId);
        var entries = scores.Skip((page - 1) * pageSize).Take(pageSize)
            .Select((x, offset) => new
            {
                Rank = (page - 1) * pageSize + offset + 1,
                DisplayName = x.UserId == userId ? "You" : "Learner #" +
                    ((page - 1) * pageSize + offset + 1),
                x.SolvedProblems,
                x.Points,
                x.FirstTryCorrect,
                IsCurrentUser = x.UserId == userId
            }).ToList();

        return Ok(new
        {
            StageId = stage.Id,
            stage.NameAr,
            stage.NameEn,
            Period = period,
            Page = page,
            PageSize = pageSize,
            TotalLearners = scores.Count,
            MyRank = myIndex >= 0 ? myIndex + 1 : (int?)null,
            Entries = entries
        });
    }
}
