using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

/// <summary>
/// Student badges derived from actual unique solved questions.
/// No mutable client-side points, no separate claimable badge state.
/// </summary>
[ApiController]
[Route("api/users/achievements")]
[Authorize(Roles = "Student")]
public sealed class StudentAchievementsController : ControllerBase
{
    private readonly AppDbContext _db;
    private static readonly (int Count, string Key, string TitleAr, string TitleEn)[] Milestones =
    [
        (1, "first_step", "الخطوة الأولى", "First Step"),
        (10, "getting_started", "بداية قوية", "Strong Start"),
        (25, "steady_solver", "مثابر الرياضيات", "Steady Solver"),
        (50, "problem_explorer", "مستكشف المسائل", "Problem Explorer"),
        (100, "century_club", "مئة مسألة", "Century Club"),
        (250, "number_master", "خبير الأعداد", "Number Master"),
        (500, "math_champion", "بطل الرياضيات", "Math Champion"),
        (1000, "legend", "أسطورة الرياضيات", "Math Legend")
    ];

    public StudentAchievementsController(AppDbContext db) => _db = db;

    [HttpGet]
    [ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
    public async Task<IActionResult> Get(CancellationToken ct)
    {
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var userId) ||
            userId <= 0)
            return Unauthorized();
        var student = await _db.Users.AsNoTracking().FirstOrDefaultAsync(
            u => u.Id == userId && u.Role == "Student" && u.IsActive, ct);
        if (student == null) return Unauthorized();
        var allBadgesEnabled = PremiumEntitlement.IsActive(student);

        // Progress badges describe the CURRENT stage, never answers earned in
        // another stage. Changing stage keeps the underlying history intact.
        var stageId = student.CurrentStageId ?? 1;
        var permanentEnabled=HttpContext.RequestServices.GetRequiredService<IConfiguration>()
            .GetValue<bool>("LearningSessions:Enabled");
        var activeStages=_db.UserProgresses.AsNoTracking().Where(p=>p.UserId==userId&&p.IsSolved)
            .Select(p=>new{StageId=p.Problem.StageId, p.ProblemId}).Distinct().Select(p=>p.StageId);
        var permanentStages=_db.PermanentProblemAchievements.AsNoTracking().Where(p=>p.UserId==userId)
            .Select(p=>p.StageId);
        var solvedByStage = await (permanentEnabled?permanentStages:activeStages)
            .GroupBy(p => p)
            .Select(g => new { StageId = g.Key, Solved = g.Count() })
            .ToListAsync(ct);
        var solved = solvedByStage.FirstOrDefault(x => x.StageId == stageId)?.Solved ?? 0;
        var stagesWithSolved = solvedByStage.Count(x => x.Solved > 0);
        var stageCount = await _db.EducationalStages.AsNoTracking().CountAsync(ct);

        // First two stage milestones are Free; advanced ones are Premium.
        var badges = Milestones.Select((m, index) => StudentBadgeRules.Create(
            $"stage_{stageId}_{m.Key}",m.TitleAr,m.TitleEn,m.Count,solved,index < 2 || allBadgesEnabled,
            "solved","medal",$"حل {m.Count} مسألة مختلفة في المرحلة الحالية.",
            $"Solve {m.Count} distinct problems in the current stage.")).ToList();

        // Record the threshold crossing from the same history used for the badge.
        // This is not a Premium activation or historical badge-unlock timestamp.
        // Never substitute the current date for missing legacy solve dates.
        var dates=permanentEnabled
            ? await _db.PermanentProblemAchievements.AsNoTracking()
                .Where(p=>p.UserId==userId&&p.StageId==stageId)
                .OrderBy(p=>p.EarnedAtUtc).ThenBy(p=>p.ProblemId)
                .Take(Milestones.Max(m=>m.Count)).Select(p=>(DateTime?)p.EarnedAtUtc).ToListAsync(ct)
            : await _db.UserProgresses.AsNoTracking()
                .Where(p=>p.UserId==userId&&p.IsSolved&&p.Problem.StageId==stageId)
                .GroupBy(p=>p.ProblemId)
                .Select(g=>g.Min(p=>p.SolvedAt))
                .OrderBy(d=>d==null?0:1).ThenBy(d=>d)
                .Take(Milestones.Max(m=>m.Count)).ToListAsync(ct);
        if(dates.All(d=>d.HasValue))
            for(var i=0;i<badges.Count;i++)
                if(badges[i].Earned&&dates.Count>=badges[i].RequiredSolved)
                    badges[i]=badges[i] with {MilestoneReachedAtUtc=dates[badges[i].RequiredSolved-1]};

        badges.Add(StudentBadgeRules.Create("all_stages_explorer","مستكشف جميع المراحل","All-Stage Explorer",
            stageCount,stagesWithSolved,allBadgesEnabled,"stages","globe",
            "حل مسألة واحدة على الأقل في كل مرحلة.","Solve at least one problem in every stage."));

        // Grade awards use the selected visible track and its actual answer
        // history, not stage totals or membership alone. Never infer old
        // stage-only activity as belonging to a particular grade.
        var tracks=HttpContext.RequestServices.GetRequiredService<LearningTrackService>();
        var track=await tracks.ActiveAsync(student.CurrentStageId,student.CurrentTrackId,ct);
        if(student.CurrentStageId.HasValue&&(!tracks.Enabled||track is not null))
        {
            var scope=track is null?_db.Problems.AsNoTracking().Where(p=>p.StageId==stageId):tracks.ValidProblems(track.Id);
            var trackId=track?.Id;
            var practiceScope=trackId??0;
            var ordinary=_db.ProblemAttempts.AsNoTracking().Where(a=>a.UserId==userId&&a.PracticeScopeId==practiceScope&&
                scope.Any(p=>p.Id==a.ProblemId));
            var guided=from a in _db.LearningSessionAttempts.AsNoTracking()
                       join session in _db.LearningSessions.AsNoTracking() on a.SessionId equals session.Id
                       where session.UserId==userId&&session.StageId==stageId&&
                           (!trackId.HasValue||session.TrackId==trackId)&&scope.Any(p=>p.Id==a.ProblemId)
                       select a;
            var progress=TrackPractice.For(_db,practiceScope).AsNoTracking()
                .Where(p=>p.UserId==userId&&scope.Any(q=>q.Id==p.ProblemId));
            var solvedIds=progress.Where(p=>p.IsSolved).Select(p=>p.ProblemId)
                .Union(ordinary.Where(a=>a.IsOfficial&&a.IsCorrect).Select(a=>a.ProblemId));
            var independent=ordinary.Where(a=>a.IsOfficial&&a.IsCorrect&&a.AttemptNumber==1&&!a.UsedHint).Select(a=>a.ProblemId);
            var days=ordinary.Select(a=>a.SubmittedAt.Date);
            if(permanentEnabled)
            {
                solvedIds=solvedIds.Union(guided.Where(a=>a.IsCorrect).Select(a=>a.ProblemId));
                independent=independent.Union(guided.Where(a=>a.IsCorrect&&a.AttemptNumber==1&&!a.UsedHint).Select(a=>a.ProblemId));
                days=days.Union(guided.Select(a=>a.SubmittedAtUtc.Date));
                if(track is null)
                    solvedIds=solvedIds.Union(_db.PermanentProblemAchievements.AsNoTracking()
                        .Where(a=>a.UserId==userId&&scope.Any(p=>p.Id==a.ProblemId)).Select(a=>a.ProblemId));
            }
            var categoryTotals=await scope.GroupBy(p=>p.CategoryId).Select(g=>new{Id=g.Key,Total=g.Count()}).ToListAsync(ct);
            var categorySolved=await scope.Where(p=>solvedIds.Contains(p.Id)).GroupBy(p=>p.CategoryId)
                .Select(g=>new{Id=g.Key,Total=g.Count()}).ToListAsync(ct);
            var total=categoryTotals.Sum(c=>c.Total);
            var completed=categoryTotals.Count(c=>c.Total>0&&categorySolved.Any(s=>s.Id==c.Id&&s.Total==c.Total));
            var mastered=await progress.Where(p=>p.MasteryStatus=="Mastered").Select(p=>p.ProblemId).Distinct().CountAsync(ct);
            var firstTry=await independent.Distinct().CountAsync(ct);
            var activityDays=await days.Distinct().ToListAsync(ct);
            var prefix=trackId.HasValue?$"track_{trackId}_":$"stage_{stageId}_";
            var gradeNameAr=track?.NameAr??"المرحلة الحالية";
            var gradeNameEn=track?.NameEn??"current stage";
            badges.AddRange(StudentBadgeRules.GradeBadges(prefix,gradeNameAr,gradeNameEn,total,
                categorySolved.Sum(c=>c.Total),mastered,completed,categoryTotals.Count,firstTry,
                StudentBadgeRules.LongestStreak(activityDays),allBadgesEnabled,trackId.HasValue));
        }

        var next = badges.FirstOrDefault(m => m.Unit=="solved"&&m.IsAvailable && !m.Earned);
        return Ok(new
        {
            StageId = stageId,
            UniqueSolved = solved,
            ScoreBasis = permanentEnabled ? "PermanentAchievements" : "ActiveProgress",
            EarnedCount = badges.Count(b => b.Earned),
            TotalBadges = badges.Count,
            NextMilestone = next?.RequiredSolved,
            Badges = badges
        });
    }
}
