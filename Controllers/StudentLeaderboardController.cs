using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.Helpers;
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

        // Membership is not a score: include active students who selected
        // this stage in a separate count, even before their first solve.
        // Never assign a leaderboard rank or points for mere registration.
        var stageParticipants = await _db.Users.AsNoTracking()
            .CountAsync(u => u.Role == "Student" && u.IsActive &&
                u.CurrentStageId == stage.Id, ct);

        // A rolling window, not a guessed calendar week/month.
        var cutoff = period == "weekly" ? DateTime.UtcNow.AddDays(-7) :
            period == "monthly" ? DateTime.UtcNow.AddDays(-30) : (DateTime?)null;

        // UserProgress is the same canonical source used by the student
        // dashboard. Legacy solved questions can predate ProblemAttempts,
        // so aggregating attempts made a learner with 5 solved problems
        // disappear entirely from the leaderboard.
        // A progress row represents one user/problem (no repeat inflation).
        // Scope by the problem's stage, not the student's current selection.
        var query = _db.UserProgresses.AsNoTracking()
            .Where(p => p.Problem.StageId == stage.Id &&
                p.Problem.Category.StageId == stage.Id &&
                p.User.Role == "Student" && p.User.IsActive &&
                p.IsSolved);
        if (cutoff is not null)
            query = query.Where(p => p.SolvedAt >= cutoff.Value);

        // Keep ranking and pagination in PostgreSQL. Loading every learner into
        // memory made even a 20-row page increasingly slow as the platform grew.
        var ranked = query.GroupBy(p => p.UserId)
            .Select(g => new
            {
                UserId = g.Key,
                SolvedProblems = g.Count(),
                Points = g.Sum(p => p.Problem.Points),
                FirstTryCorrect = g.Count(p => p.FirstAttemptCorrect == true)
            })
            .Where(x => x.SolvedProblems > 0);

        var totalLearners = await ranked.CountAsync(ct);
        var pageScores = await ranked
            .OrderByDescending(x => x.SolvedProblems)
            .ThenByDescending(x => x.Points)
            .ThenByDescending(x => x.FirstTryCorrect)
            .ThenBy(x => x.UserId)
            .Skip((page - 1) * pageSize)
            .Take(pageSize)
            .ToListAsync(ct);

        // Compute the current learner's position without materializing other
        // learners' scores. Preserve exactly the same tie-breaking rules.
        int? myRank = null;
        var mine = await ranked.FirstOrDefaultAsync(x => x.UserId == userId, ct);
        if (mine != null)
        {
            var ahead = await ranked.CountAsync(x =>
                x.SolvedProblems > mine.SolvedProblems ||
                (x.SolvedProblems == mine.SolvedProblems &&
                 x.Points > mine.Points) ||
                (x.SolvedProblems == mine.SolvedProblems &&
                 x.Points == mine.Points &&
                 x.FirstTryCorrect > mine.FirstTryCorrect) ||
                (x.SolvedProblems == mine.SolvedProblems &&
                 x.Points == mine.Points &&
                 x.FirstTryCorrect == mine.FirstTryCorrect &&
                 x.UserId < mine.UserId), ct);
            myRank = ahead + 1;
        }
        var ids = pageScores.Select(x => x.UserId).ToList();
        var names = await _db.Users.AsNoTracking()
            .Where(u => ids.Contains(u.Id))
            .Select(u => new { u.Id, u.FullName })
            .ToDictionaryAsync(x => x.Id, x => x.FullName, ct);
        var arabic = LanguageHelper.GetLanguageFromRequest(Request) != "en";
        var entries = pageScores
            .Select((x, offset) => new
            {
                Rank = (page - 1) * pageSize + offset + 1,
                DisplayName = x.UserId == userId ? (arabic ? "أنت" : "You") :
                    AbbreviatedName(names.GetValueOrDefault(x.UserId), arabic),
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
            TotalLearners = totalLearners,
            StageParticipants = stageParticipants,
            MyRank = myRank,
            Entries = entries
        });
    }

    private static string AbbreviatedName(string? fullName, bool arabic)
    {
        var parts = (fullName ?? "").Trim().Split(
            (char[]?)null, StringSplitOptions.RemoveEmptyEntries);
        if (parts.Length == 0) return arabic ? "مشارك" : "Learner";
        return parts.Length == 1 ? parts[0] : $"{parts[0]} {parts[1][0]}.";
    }
}
