using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.Models;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

[ApiController]
[Authorize(Roles="Student")]
[ResponseCache(NoStore=true,Location=ResponseCacheLocation.None)]
[Route("api/users/current-grade-report")]
public sealed class CurrentGradeReportsController(AppDbContext db, IConfiguration config, LearningTrackService tracks):ControllerBase
{
    private sealed record Totals(int CategoryId,int Attempts,int Correct,long Points);
    private sealed record Recent(int ProblemId,int CategoryId,string TitleAr,string TitleEn,bool IsCorrect,int PointsEarned,DateTime SubmittedAtUtc,string Source);
    private static double? Percent(int numerator,int denominator)=>denominator==0?null:Math.Round(100.0*numerator/denominator,1);

    [HttpGet]
    public async Task<IActionResult> Get(CancellationToken ct,[FromQuery] bool allowSharedPractice=false)
    {
        if(!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier),out var uid)||uid<=0)return Unauthorized();
        var student=await db.Users.AsNoTracking().SingleOrDefaultAsync(u=>u.Id==uid&&u.IsActive&&u.Role=="Student",ct);
        if(student is null)return Unauthorized();
        if(!PremiumEntitlement.IsActive(student))return StatusCode(403,new{Message="PremiumRequired"});
        var track=await tracks.ActiveAsync(student.CurrentStageId,student.CurrentTrackId,ct);
        if(track is null)return Conflict(new{Message="LearningTrackRequired"});
        var isolated=TrackPractice.Enabled(config);
        // Older clients assume every metric is isolated to a grade. Require
        // explicit opt-in to shared practice reporting so they cannot mislabel it.
        if(!isolated&&!allowSharedPractice)return Conflict(new{Message="TrackReportIsolationUnavailable"});
        var id=track.Id;
        var practiceScope=TrackPractice.Scope(config,id);
        // Resolve eligible problem IDs once for this read-only report. The
        // same snapshot scopes all aggregates and recent attempts, rather
        // than recompiling the full track/skill join for every SQL command.
        var validIds=await tracks.ValidProblems(id).Select(p=>p.Id).ToArrayAsync(ct);
        var valid=db.Problems.AsNoTracking().Where(p=>validIds.Contains(p.Id));
        var inventory=await valid.GroupBy(p=>new{p.CategoryId,p.Category.NameAr,p.Category.NameEn,p.Category.Order})
            .Select(g=>new{g.Key.CategoryId,g.Key.NameAr,g.Key.NameEn,g.Key.Order,ProblemsCount=g.Count()})
            .OrderBy(x=>x.Order).ThenBy(x=>x.CategoryId).ToListAsync(ct);
        var progress=await TrackPractice.For(db,practiceScope).AsNoTracking()
            .Where(p=>p.UserId==uid&&validIds.Contains(p.ProblemId))
            .GroupBy(p=>p.Problem.CategoryId).Select(g=>new{CategoryId=g.Key,Solved=g.Count(p=>p.IsSolved),Mastered=g.Count(p=>p.MasteryStatus==MasteryStatuses.Mastered)})
            .ToDictionaryAsync(x=>x.CategoryId,ct);
        var ordinary=db.ProblemAttempts.AsNoTracking().Where(a=>a.UserId==uid&&a.PracticeScopeId==practiceScope&&validIds.Contains(a.ProblemId));
        var guided=from a in db.LearningSessionAttempts.AsNoTracking()
            join s in db.LearningSessions.AsNoTracking() on a.SessionId equals s.Id
            join p in valid on a.ProblemId equals p.Id
            where s.UserId==uid&&s.TrackId==id&&s.StageId==track.StageId&&(s.Kind=="practice"||s.Kind=="daily")
            select new{Attempt=a,Problem=p};
        // Count actual points awarded, not nominal question values.
        var aTotals=await ordinary.GroupBy(a=>a.Problem.CategoryId)
            .Select(g=>new Totals(g.Key,g.Count(),g.Count(a=>a.IsCorrect),g.Sum(a=>(long)a.PointsEarned))).ToListAsync(ct);
        var bTotals=await guided.GroupBy(a=>a.Problem.CategoryId)
            .Select(g=>new Totals(g.Key,g.Count(),g.Count(a=>a.Attempt.IsCorrect),g.Sum(a=>(long)a.Attempt.PointsEarned))).ToListAsync(ct);
        var history=aTotals.Concat(bTotals).GroupBy(x=>x.CategoryId).ToDictionary(g=>g.Key,g=>new Totals(g.Key,g.Sum(x=>x.Attempts),g.Sum(x=>x.Correct),g.Sum(x=>x.Points)));
        var categories=inventory.Select(c=>{
            var p=progress.GetValueOrDefault(c.CategoryId);var h=history.GetValueOrDefault(c.CategoryId);
            var mastered=p?.Mastered??0;var attempts=h?.Attempts??0;var correct=h?.Correct??0;
            return new{c.CategoryId,c.NameAr,c.NameEn,c.ProblemsCount,Solved=p?.Solved??0,Mastered=mastered,
                MasteryPercent=Percent(mastered,c.ProblemsCount),Attempts=attempts,AccuracyPercent=Percent(correct,attempts),Correct=correct,Points=h?.Points??0L};
        }).ToList();
        var recentOrdinary=await ordinary.OrderByDescending(a=>a.SubmittedAt).ThenByDescending(a=>a.Id).Take(10)
            .Select(a=>new Recent(a.ProblemId,a.Problem.CategoryId,a.Problem.TitleAr,a.Problem.TitleEn,a.IsCorrect,a.PointsEarned,a.SubmittedAt,isolated?"ordinary":"shared-practice")).ToListAsync(ct);
        var recentGuided=await guided.OrderByDescending(a=>a.Attempt.SubmittedAtUtc).ThenBy(a=>a.Attempt.RequestId).Take(10)
            .Select(a=>new Recent(a.Problem.Id,a.Problem.CategoryId,a.Problem.TitleAr,a.Problem.TitleEn,a.Attempt.IsCorrect,a.Attempt.PointsEarned,a.Attempt.SubmittedAtUtc,"session")).ToListAsync(ct);
        var total=categories.Sum(c=>c.ProblemsCount);var solved=categories.Sum(c=>c.Solved);var count=categories.Sum(c=>c.Attempts);
        return Ok(new{TrackId=id,track.StageId,Track=new{track.Id,track.NameAr,track.NameEn},ProblemsCount=total,Solved=solved,
            CompletionPercent=Percent(solved,total),Attempts=count,AccuracyPercent=Percent(categories.Sum(c=>c.Correct),count),Points=categories.Sum(c=>c.Points),Categories=categories,
            RecentAttempts=recentOrdinary.Concat(recentGuided).OrderByDescending(a=>a.SubmittedAtUtc).Take(10).ToArray(),
            MetricsScope="CurrentTrack",HistoryScope=isolated?"RecordedTrackAttempts":"SharedPracticeAndRecordedTrackAttempts",
            ProgressScope=isolated?"CurrentPracticeCycle":"SharedStagePracticeCycle",TrackPracticeIsolationEnabled=isolated});
    }
}
