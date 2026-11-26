using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.Helpers;
using MathWorldAPI.Services;
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
    private bool PermanentEnabled => HttpContext.RequestServices.GetRequiredService<IConfiguration>()
        .GetValue<bool>("LearningSessions:Enabled");

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
        var ordinary = _db.ProblemAttempts.AsNoTracking()
            .Where(x => x.User.Role == "Student" && x.SubmittedAt >= start &&
                x.Problem.Category.StageId == x.Problem.StageId)
            .Select(x=>new{x.UserId,StageId=x.Problem.StageId,x.SubmittedAt});
        var guided = from answer in _db.LearningSessionAttempts.AsNoTracking()
                     join session in _db.LearningSessions.AsNoTracking() on answer.SessionId equals session.Id
                     join student in learners on session.UserId equals student.Id
                     where answer.SubmittedAtUtc>=start
                     select new{session.UserId,session.StageId,SubmittedAt=answer.SubmittedAtUtc};
        var attempts = PermanentEnabled ? ordinary.Concat(guided) : ordinary;
        var counts = await attempts.GroupBy(x => 1).Select(g => new
        {
            Active = g.Select(x => x.UserId).Distinct().Count()
        }).FirstOrDefaultAsync(ct);

        // Count distinct questions first solved in this window, including a
        // correct retry after an incorrect official attempt. Counting only
        // IsOfficial && IsCorrect hides those genuine successes, while
        // counting every correct attempt inflates repeated practice.
        var ordinarySolved = _db.UserProgresses.AsNoTracking()
            .Where(p => p.User.Role == "Student" && p.IsSolved &&
                p.SolvedAt >= start &&
                p.Problem.Category.StageId == p.Problem.StageId)
            .Select(p=>new{p.UserId,StageId=p.Problem.StageId,p.ProblemId});
        var permanentSolved = from credit in _db.PermanentProblemAchievements.AsNoTracking()
                              join student in learners on credit.UserId equals student.Id
                              where credit.EarnedAtUtc>=start
                              select new{credit.UserId,credit.StageId,credit.ProblemId};
        var newlySolved = PermanentEnabled ? permanentSolved : ordinarySolved;
        var successfulSolves = await newlySolved.CountAsync(ct);
        var solvedByStage = await newlySolved
            .GroupBy(p => p.StageId)
            .Select(g => new { StageId = g.Key, Count = g.Count() })
            .ToDictionaryAsync(x => x.StageId, x => x.Count, ct);

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
        var stageActivity = await attempts.GroupBy(a => a.StageId)
            .Select(g => new
            {
                StageId = g.Key,
                Active = g.Select(a => a.UserId).Distinct().Count()
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
            ScoreBasis = PermanentEnabled ? "PermanentAchievements" : "ActiveProgress",
            TotalStudents = await learners.CountAsync(ct),
            NewStudents = await learners.CountAsync(u => u.CreatedAt >= start, ct),
            ActiveSolvers = counts?.Active ?? 0, SuccessfulSolves = successfulSolves,
            OnlineLearners = onlineLearners, PresenceWindowMinutes = 5,
            DailyActivity = timeline,
            Stages = stages.Select(s =>
            {
                activityByStage.TryGetValue(s.Id, out var a);
                registrationsByStage.TryGetValue(s.Id, out var signups);
                return new { StageId = s.Id, s.NameAr, s.NameEn,
                    ActiveSolvers = a?.Active ?? 0,
                    OnlineLearners = onlineByStage.GetValueOrDefault(s.Id),
                    SuccessfulSolves = solvedByStage.GetValueOrDefault(s.Id),
                    Signups = signups?.Count ?? 0 };
            }).ToArray()
        }, "Success", LanguageHelper.GetLanguageFromRequest(Request)));
    }

    [HttpGet("stages/{stageId:int}")]
    public async Task<IActionResult> Stage(int stageId, [FromQuery] int days = 30,
        [FromQuery] int? trackId = null, CancellationToken ct = default)
    {
        if (!await ActiveAdmin(ct)) return Forbid();
        if (stageId <= 0 || days is < 1 or > 90 || trackId is <= 0)
            return BadRequest(new { Message = "InvalidActivityFilter" });
        var stage = await _db.EducationalStages.AsNoTracking()
            .Where(s => s.Id == stageId)
            .Select(s => new { s.Id, s.NameAr, s.NameEn })
            .FirstOrDefaultAsync(ct);
        if (stage == null) return NotFound(new { Message = "StageNotFound" });

        if(trackId.HasValue&&!await _db.LearningTracks.AnyAsync(t=>t.Id==trackId.Value&&t.StageId==stageId,ct))
            return BadRequest(new { Message = "TrackStageMismatch" });
        var start = Cutoff(days);
        var categories = await _db.Categories.AsNoTracking().Where(c => c.StageId == stageId &&
            (!trackId.HasValue||_db.LearningTrackCategories.Any(l=>l.TrackId==trackId.Value&&l.CategoryId==c.Id)))
            .OrderBy(c => c.Order).ThenBy(c => c.Id)
            .Select(c => new { c.Id, c.NameAr, c.NameEn }).ToListAsync(ct);
        var ordinaryActivity = _db.ProblemAttempts.AsNoTracking()
            .Where(a => a.User.Role == "Student" && a.Problem.StageId == stageId &&
                a.Problem.Category.StageId == stageId && a.SubmittedAt >= start &&
                (!trackId.HasValue||a.PracticeScopeId==trackId.Value))
            .Select(a=>new{a.UserId,CategoryId=a.Problem.CategoryId});
        var sessionActivity = from answer in _db.LearningSessionAttempts.AsNoTracking()
                              join session in _db.LearningSessions.AsNoTracking() on answer.SessionId equals session.Id
                              join student in _db.Users.AsNoTracking() on session.UserId equals student.Id
                              join problem in _db.Problems.AsNoTracking() on answer.ProblemId equals problem.Id
                              where student.Role=="Student" && session.StageId==stageId &&
                                  (!trackId.HasValue||session.TrackId==trackId.Value) &&
                                  problem.StageId==stageId && problem.Category.StageId==stageId && answer.SubmittedAtUtc>=start
                              select new{session.UserId,problem.CategoryId};
        var activity = await (PermanentEnabled?ordinaryActivity.Concat(sessionActivity):ordinaryActivity)
            .GroupBy(a => a.CategoryId)
            .Select(g => new
            {
                CategoryId = g.Key, Attempts = g.Count(),
                ActiveSolvers = g.Select(a => a.UserId).Distinct().Count()
            }).ToListAsync(ct);

        // All-time unique solved questions, not answer correctness percentages.
        // First aggregate by learner/category on PostgreSQL; only compact
        // aggregated rows are transferred to the application.
        var ordinarySolved = (trackId.HasValue?TrackPractice.For(_db,trackId.Value):_db.UserProgresses).AsNoTracking()
            .Where(p => p.IsSolved && p.User.Role == "Student" &&
                p.Problem.StageId == stageId && p.Problem.Category.StageId == stageId)
            .Select(p=>new{CategoryId=p.Problem.CategoryId,p.UserId,p.User.FullName,p.ProblemId,Points=(long)p.Problem.Points});
        var permanentSolved = from credit in _db.PermanentProblemAchievements.AsNoTracking()
                              join student in _db.Users.AsNoTracking() on credit.UserId equals student.Id
                              where credit.StageId==stageId && student.Role=="Student" && student.IsActive
                              select new{credit.CategoryId,credit.UserId,student.FullName,credit.ProblemId,Points=(long)credit.Points};
        // Scoped solved counts combine both flows, once per student and
        // question. Do not attribute unscoped lifetime credit to a grade.
        var guidedSolved = from answer in _db.LearningSessionAttempts.AsNoTracking()
                           join session in _db.LearningSessions.AsNoTracking() on answer.SessionId equals session.Id
                           join student in _db.Users.AsNoTracking() on session.UserId equals student.Id
                           join problem in _db.Problems.AsNoTracking() on answer.ProblemId equals problem.Id
                           where trackId.HasValue && session.TrackId==trackId.Value && session.StageId==stageId &&
                               student.Role=="Student" && answer.IsCorrect && problem.StageId==stageId && problem.Category.StageId==stageId
                           select new{problem.CategoryId,session.UserId,student.FullName,answer.ProblemId,Points=(long)problem.Points};
        var scopedSolved = trackId.HasValue&&PermanentEnabled ? ordinarySolved.Union(guidedSolved) : ordinarySolved;
        var solvedByLearner = await (PermanentEnabled&&!trackId.HasValue?permanentSolved:scopedSolved)
            .GroupBy(p => new { p.CategoryId, p.UserId, p.FullName })
            .Select(g => new
            {
                g.Key.CategoryId, g.Key.UserId, g.Key.FullName, Solved = g.Count(), Points=g.Sum(p=>p.Points)
            }).ToListAsync(ct);
        var activityByCategory = activity.ToDictionary(x => x.CategoryId);
        var leaderboard = solvedByLearner.GroupBy(x => x.UserId)
            .Select(g => new
            {
                UserId = g.Key, FullName = g.First().FullName,
                Solved = g.Sum(x => x.Solved), Points=g.Sum(x=>x.Points)
            })
            .OrderByDescending(x => x.Solved).ThenByDescending(x=>x.Points).ThenBy(x => x.UserId)
            .Take(20).Select((x, index) => new
            {
                Rank = index + 1, x.UserId, x.FullName, x.Solved,x.Points
            }).ToArray();

        return Ok(LanguageHelper.SuccessResponse(new
        {
            StageId = stage.Id, TrackId=trackId, stage.NameAr, stage.NameEn, WindowDays = days,
            ScoreBasis = trackId.HasValue?(PermanentEnabled?"TrackPracticeAndSessions":"TrackPractice"):PermanentEnabled ? "PermanentAchievements" : "ActiveProgress",
            TopStudents = leaderboard,
            Categories = categories.Select(c =>
            {
                activityByCategory.TryGetValue(c.Id, out var a);
                var ranked = solvedByLearner.Where(x => x.CategoryId == c.Id)
                    .OrderByDescending(x => x.Solved).ThenByDescending(x=>x.Points).ThenBy(x => x.UserId)
                    .Take(5).Select((x, index) => new
                    {
                        Rank = index + 1, x.UserId, x.FullName, x.Solved,x.Points
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
        [FromQuery] int? trackId = null,
        [FromQuery] string? search = null,
        [FromQuery] bool onlineOnly = false, CancellationToken ct = default)
    {
        if (!await ActiveAdmin(ct)) return Forbid();
        const int pageSize = 20;
        if (page is < 1 or > 50000 || stageId is <= 0 || trackId is <= 0 ||
            (search?.Length ?? 0) > 80)
            return BadRequest(new { Message = "InvalidLearnerFilter" });
        var users = _db.Users.AsNoTracking().Where(u => u.Role == "Student");
        if (stageId.HasValue) users = users.Where(u => u.CurrentStageId == stageId.Value);
        if(trackId.HasValue){
            if(!await _db.LearningTracks.AnyAsync(t=>t.Id==trackId.Value&&(!stageId.HasValue||t.StageId==stageId.Value),ct))
                return BadRequest(new { Message = "TrackStageMismatch" });
            users=users.Where(u=>u.CurrentTrackId==trackId.Value);
        }
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
                u.CurrentStageId, u.CurrentTrackId, u.IsActive }).ToListAsync(ct);
        var ids = entries.Select(x => x.Id).ToArray();
        var ordinaryAttempts = _db.ProblemAttempts.AsNoTracking()
            .Where(a => ids.Contains(a.UserId)&&(!trackId.HasValue||a.PracticeScopeId==trackId.Value)).Select(a=>new{a.UserId,a.SubmittedAt});
        var sessionAttempts = from answer in _db.LearningSessionAttempts.AsNoTracking()
                              join session in _db.LearningSessions.AsNoTracking() on answer.SessionId equals session.Id
                              where ids.Contains(session.UserId)&&(!trackId.HasValue||session.TrackId==trackId.Value)
                              select new{session.UserId,SubmittedAt=answer.SubmittedAtUtc};
        var attemptStats = await (PermanentEnabled?ordinaryAttempts.Concat(sessionAttempts):ordinaryAttempts)
            .GroupBy(a => a.UserId)
            .Select(g => new { UserId = g.Key, LastPracticeAt = g.Max(a => a.SubmittedAt),
                Attempts = g.Count() }).ToListAsync(ct);
        var attemptByUser = attemptStats.ToDictionary(x => x.UserId);
        var lastHeartbeat = await _db.LearnerPresences.AsNoTracking()
            .Where(p => ids.Contains(p.UserId))
            .GroupBy(p => p.UserId)
            .Select(g => new { UserId = g.Key, LastSeenAtUtc = g.Max(p => p.LastSeenAtUtc) })
            .ToDictionaryAsync(x => x.UserId, x => x.LastSeenAtUtc, ct);
        // Only a user-requested API sign-out is a verified sign-out time.
        // Admin operator events are never part of the learner report.
        var lastSignOuts = await _db.PlatformActivityEvents.AsNoTracking()
            .Where(e => ids.Contains(e.ActorUserId) &&
                e.ActorRole == "Student" && e.Action == "ExplicitSignOut")
            .GroupBy(e => e.ActorUserId)
            .Select(g => new { UserId = g.Key,
                LastExplicitSignOutAtUtc = g.Max(e => e.CreatedAtUtc) })
            .ToDictionaryAsync(x => x.UserId, x => x.LastExplicitSignOutAtUtc, ct);
        var presenceCutoff = PresenceCutoff();
        return Ok(LanguageHelper.SuccessResponse(new
        {
            Total = total, Page = page, PageSize = pageSize,
            Students = entries.Select(u =>
            {
                attemptByUser.TryGetValue(u.Id, out var stat);
                return new { u.Id, u.FullName, u.CreatedAt, u.LastLoginAt,
                    u.CurrentStageId, u.CurrentTrackId, u.IsActive,
                    LastPracticeAt = (DateTime?)stat?.LastPracticeAt,
                    LastExplicitSignOutAtUtc = lastSignOuts.TryGetValue(u.Id, out var signout)
                        ? (DateTime?)signout : null,
                    LastHeartbeatAtUtc = lastHeartbeat.TryGetValue(u.Id, out var heartbeat)
                        ? (DateTime?)heartbeat : null,
                    IsOnline = u.IsActive && lastHeartbeat.TryGetValue(u.Id, out var seen) &&
                        seen >= presenceCutoff,
                    Attempts = stat?.Attempts ?? 0 };
            }).ToArray(),
            PresenceWindowMinutes = 5,
            Note = "Online means a recent server heartbeat. LastExplicitSignOutAtUtc is only user-requested sign-out; closing a browser or app is not a verified sign-out."
        }, "Success", LanguageHelper.GetLanguageFromRequest(Request)));
    }
}
