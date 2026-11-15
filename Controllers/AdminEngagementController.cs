using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.Helpers;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

/// <summary>
/// Operational metrics for real learner adoption, activity, and subject usage.
/// Never interpret HTTP last-seen or practice timestamps as logout times.
/// Admin accounts are not included in any learner counts.
/// </summary>
[ApiController]
[Authorize(Roles = "Admin")]
[Route("api/admin/engagement")]
[ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
public sealed class AdminEngagementController : ControllerBase
{
    private readonly AppDbContext _db;
    public AdminEngagementController(AppDbContext db) => _db = db;

    private async Task<bool> ActiveAdmin(CancellationToken ct)
    {
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var id)) return false;
        return await _db.Users.AsNoTracking().AnyAsync(
            u => u.Id == id && u.IsActive && u.Role == "Admin", ct);
    }

    private static DateTime Cutoff(int days) => DateTime.UtcNow.Date.AddDays(1 - days);
    private static DateTime PresenceCutoff() => DateTime.UtcNow.AddMinutes(-5);

    [HttpGet("overview")]
    public async Task<IActionResult> Overview([FromQuery] int days = 30, CancellationToken ct = default)
    {
        if (!await ActiveAdmin(ct)) return Forbid();
        if (days is < 1 or > 90) return BadRequest(new { Message = "InvalidActivityWindow" });
        var start = Cutoff(days);
        // Online means distinct active learners with a confirmed server
        // heartbeat in the last five minutes; not active browser sockets.
        var presenceCutoff = PresenceCutoff();
        var online = from presence in _db.LearnerPresences.AsNoTracking()
                     join student in _db.Users.AsNoTracking()
                         on presence.UserId equals student.Id
                     where presence.LastSeenAtUtc >= presenceCutoff &&
                           student.IsActive && student.Role == "Student"
                     select new { presence.UserId, student.CurrentStageId };
        var onlineLearners = await online.Select(x => x.UserId).Distinct().CountAsync(ct);
        var onlineByStage = await online
            .Where(x => x.CurrentStageId.HasValue)
            .GroupBy(x => x.CurrentStageId!.Value)
            .Select(g => new { StageId = g.Key, Count = g.Select(x => x.UserId).Distinct().Count() })
            .ToDictionaryAsync(x => x.StageId, x => x.Count, ct);

        var learners = _db.Users.AsNoTracking().Where(x => x.Role == "Student");
        var attempts = _db.ProblemAttempts.AsNoTracking()
            .Where(x => x.User.Role == "Student" && x.SubmittedAt >= start);
        var counts = await attempts.GroupBy(x => 1).Select(g => new
        {
            Active = g.Select(x => x.UserId).Distinct().Count(),
            Successful = g.Count(x => x.IsOfficial && x.IsCorrect)
        }).FirstOrDefaultAsync(ct);

        var activity = await attempts.GroupBy(x => x.SubmittedAt.Date).Select(g => new
        {
            Day = g.Key, ActiveSolvers = g.Select(x => x.UserId).Distinct().Count()
        }).ToListAsync(ct);
        var registrations = await learners.Where(u => u.CreatedAt >= start)
            .GroupBy(u => u.CreatedAt.Date).Select(g => new { Day = g.Key, Signups = g.Count() })
            .ToListAsync(ct);
        var activityMap = activity.ToDictionary(x => x.Day.Date);
        var newMap = registrations.ToDictionary(x => x.Day.Date);
        var timeline = Enumerable.Range(0, days).Select(offset =>
        {
            var day = start.AddDays(offset);
            activityMap.TryGetValue(day, out var a);
            newMap.TryGetValue(day, out var r);
            return new { DayUtc = day, ActiveSolvers = a?.ActiveSolvers ?? 0,
                Signups = r?.Signups ?? 0 };
        }).ToList();

        var stages = await _db.EducationalStages.AsNoTracking()
            .OrderBy(s => s.Order).ThenBy(s => s.Id)
            .Select(s => new { s.Id, s.NameAr, s.NameEn }).ToListAsync(ct);
        var stageActivity = await attempts.GroupBy(a => a.Problem.StageId)
            .Select(g => new
            {
                StageId = g.Key,
                Active = g.Select(a => a.UserId).Distinct().Count(),
                Successful = g.Count(a => a.IsOfficial && a.IsCorrect)
            }).ToListAsync(ct);
        var stageSignups = await learners.Where(u => u.CreatedAt >= start &&
                u.CurrentStageId.HasValue)
            .GroupBy(u => u.CurrentStageId!.Value)
            .Select(g => new { StageId = g.Key, Count = g.Count() }).ToListAsync(ct);
        var activityByStage = stageActivity.ToDictionary(x => x.StageId);
        var registrationsByStage = stageSignups.ToDictionary(x => x.StageId);

        return Ok(LanguageHelper.SuccessResponse(new
        {
            GeneratedAtUtc = DateTime.UtcNow, WindowDays = days,
            TotalStudents = await learners.CountAsync(ct),
            NewStudents = await learners.CountAsync(u => u.CreatedAt >= start, ct),
            ActiveSolvers = counts?.Active ?? 0, SuccessfulSolves = counts?.Successful ?? 0,
            OnlineLearners = onlineLearners, PresenceWindowMinutes = 5,
            DailyActivity = timeline,
            Stages = stages.Select(s =>
            {
                activityByStage.TryGetValue(s.Id, out var a);
                registrationsByStage.TryGetValue(s.Id, out var signups);
                return new { StageId = s.Id, s.NameAr, s.NameEn,
                    ActiveSolvers = a?.Active ?? 0,
                    OnlineLearners = onlineByStage.GetValueOrDefault(s.Id),
                    SuccessfulSolves = a?.Successful ?? 0,
                    Signups = signups?.Count ?? 0 };
            }).ToArray()
        }, "Success", LanguageHelper.GetLanguageFromRequest(Request)));
    }

    [HttpGet("stages/{stageId:int}")]
    public async Task<IActionResult> Stage(int stageId, [FromQuery] int days = 30,
        CancellationToken ct = default)
    {
        if (!await ActiveAdmin(ct)) return Forbid();
        if (stageId <= 0 || days is < 1 or > 90)
            return BadRequest(new { Message = "InvalidActivityFilter" });
        var stage = await _db.EducationalStages.AsNoTracking()
            .Where(s => s.Id == stageId)
            .Select(s => new { s.Id, s.NameAr, s.NameEn })
            .FirstOrDefaultAsync(ct);
        if (stage == null) return NotFound(new { Message = "StageNotFound" });

        var start = Cutoff(days);
        var categories = await _db.Categories.AsNoTracking().Where(c => c.StageId == stageId)
            .OrderBy(c => c.Order).ThenBy(c => c.Id)
            .Select(c => new { c.Id, c.NameAr, c.NameEn }).ToListAsync(ct);
        var activity = await _db.ProblemAttempts.AsNoTracking()
            .Where(a => a.User.Role == "Student" && a.Problem.StageId == stageId &&
                a.SubmittedAt >= start)
            .GroupBy(a => a.Problem.CategoryId)
            .Select(g => new
            {
                CategoryId = g.Key, Attempts = g.Count(),
                ActiveSolvers = g.Select(a => a.UserId).Distinct().Count()
            }).ToListAsync(ct);

        // All-time unique solved questions, not answer correctness percentages.
        // First aggregate by learner/category on PostgreSQL; only compact
        // aggregated rows are transferred to the application.
        var solvedByLearner = await _db.UserProgresses.AsNoTracking()
            .Where(p => p.IsSolved && p.User.Role == "Student" &&
                p.Problem.StageId == stageId)
            .GroupBy(p => new { p.Problem.CategoryId, p.UserId, p.User.FullName })
            .Select(g => new
            {
                g.Key.CategoryId, g.Key.UserId, g.Key.FullName, Solved = g.Count()
            }).ToListAsync(ct);
        var activityByCategory = activity.ToDictionary(x => x.CategoryId);
        var leaderboard = solvedByLearner.GroupBy(x => x.UserId)
            .Select(g => new
            {
                UserId = g.Key, FullName = g.First().FullName,
                Solved = g.Sum(x => x.Solved)
            })
            .OrderByDescending(x => x.Solved).ThenBy(x => x.UserId)
            .Take(20).Select((x, index) => new
            {
                Rank = index + 1, x.UserId, x.FullName, x.Solved
            }).ToArray();

        return Ok(LanguageHelper.SuccessResponse(new
        {
            StageId = stage.Id, stage.NameAr, stage.NameEn, WindowDays = days,
            TopStudents = leaderboard,
            Categories = categories.Select(c =>
            {
                activityByCategory.TryGetValue(c.Id, out var a);
                var ranked = solvedByLearner.Where(x => x.CategoryId == c.Id)
                    .OrderByDescending(x => x.Solved).ThenBy(x => x.UserId)
                    .Take(5).Select((x, index) => new
                    {
                        Rank = index + 1, x.UserId, x.FullName, x.Solved
                    }).ToArray();
                return new
                {
                    CategoryId = c.Id, c.NameAr, c.NameEn,
                    ActiveSolvers = a?.ActiveSolvers ?? 0,
                    AttemptsInWindow = a?.Attempts ?? 0,
                    TotalSolved = solvedByLearner.Where(x => x.CategoryId == c.Id)
                        .Sum(x => x.Solved),
                    TopStudents = ranked
                };
            }).ToArray()
        }, "Success", LanguageHelper.GetLanguageFromRequest(Request)));
    }

    [HttpGet("students")]
    public async Task<IActionResult> Students([FromQuery] int page = 1,
        [FromQuery] int? stageId = null,
        [FromQuery] string? search = null,
        [FromQuery] bool onlineOnly = false, CancellationToken ct = default)
    {
        if (!await ActiveAdmin(ct)) return Forbid();
        const int pageSize = 20;
        if (page is < 1 or > 50000 || stageId is <= 0 ||
            (search?.Length ?? 0) > 80)
            return BadRequest(new { Message = "InvalidLearnerFilter" });
        var users = _db.Users.AsNoTracking().Where(u => u.Role == "Student");
        if (stageId.HasValue) users = users.Where(u => u.CurrentStageId == stageId.Value);
        if (onlineOnly)
        {
            var activeSince = PresenceCutoff();
            users = users.Where(u => u.IsActive && _db.LearnerPresences.Any(p =>
                p.UserId == u.Id && p.LastSeenAtUtc >= activeSince));
        }
        var q = search?.Trim();
        if (!string.IsNullOrWhiteSpace(q))
            users = users.Where(u => EF.Functions.ILike(u.FullName, "%" + q + "%"));
        var total = await users.CountAsync(ct);
        var entries = await users.OrderByDescending(u => u.CreatedAt).ThenByDescending(u => u.Id)
            .Skip((page - 1) * pageSize).Take(pageSize)
            .Select(u => new { u.Id, u.FullName, u.CreatedAt, u.LastLoginAt,
                u.CurrentStageId, u.IsActive }).ToListAsync(ct);
        var ids = entries.Select(x => x.Id).ToArray();
        var attemptStats = await _db.ProblemAttempts.AsNoTracking()
            .Where(a => ids.Contains(a.UserId))
            .GroupBy(a => a.UserId)
            .Select(g => new { UserId = g.Key, LastPracticeAt = g.Max(a => a.SubmittedAt),
                Attempts = g.Count() }).ToListAsync(ct);
        var attemptByUser = attemptStats.ToDictionary(x => x.UserId);
        var lastHeartbeat = await _db.LearnerPresences.AsNoTracking()
            .Where(p => ids.Contains(p.UserId))
            .GroupBy(p => p.UserId)
            .Select(g => new { UserId = g.Key, LastSeenAtUtc = g.Max(p => p.LastSeenAtUtc) })
            .ToDictionaryAsync(x => x.UserId, x => x.LastSeenAtUtc, ct);
        var presenceCutoff = PresenceCutoff();
        return Ok(LanguageHelper.SuccessResponse(new
        {
            Total = total, Page = page, PageSize = pageSize,
            Students = entries.Select(u =>
            {
                attemptByUser.TryGetValue(u.Id, out var stat);
                return new { u.Id, u.FullName, u.CreatedAt, u.LastLoginAt,
                    u.CurrentStageId, u.IsActive,
                    LastPracticeAt = (DateTime?)stat?.LastPracticeAt,
                    LastHeartbeatAtUtc = lastHeartbeat.TryGetValue(u.Id, out var heartbeat)
                        ? (DateTime?)heartbeat : null,
                    IsOnline = u.IsActive && lastHeartbeat.TryGetValue(u.Id, out var seen) &&
                        seen >= presenceCutoff,
                    Attempts = stat?.Attempts ?? 0 };
            }).ToArray(),
            PresenceWindowMinutes = 5,
            Note = "Online means a server heartbeat within five minutes; exact signout cannot be inferred from abrupt app/browser closure."
        }, "Success", LanguageHelper.GetLanguageFromRequest(Request)));
    }
}
