using System.Globalization;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text.Json;
using MathWorldAPI.Data;
using MathWorldAPI.Helpers;
using Microsoft.AspNetCore.RateLimiting;
using MathWorldAPI.Models;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

// Foundation only. Feature flag stays OFF until scoped legacy progress,
// server-owned hints/points/badges and both clients are integrated.
[ApiController]
[Authorize(Roles="Student")]
[Route("api/users/learning-sessions")]
[ResponseCache(NoStore=true,Location=ResponseCacheLocation.None)]
public sealed class LearningSessionsController(AppDbContext db, IConfiguration config,
    LearningTrackService tracks, ProblemCategoryAccessService access) : ControllerBase
{
    public sealed record StartInput(Guid RequestId,string Kind,int Count=5,int? CategoryId=null);
    public sealed record AnswerInput(Guid RequestId,int Position,int ProblemId,int SelectedOptionId);
    public sealed record HintInput(int Position,int ProblemId,int Level);
    public sealed record QuestionRef(int Id,string Fingerprint);
    private sealed record Scope(int UserId,int StageId,int? TrackId,List<int> Allowed,bool Premium);
    private bool Enabled => config.GetValue<bool>("LearningSessions:Enabled");
    private int UserId => int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier),out var id)?id:0;
    private static bool ValidKind(string? kind)=>kind is "practice" or "daily";
    private static string Key(string kind,int stage,int? track,int? category,DateTime now) =>
        kind=="daily"?"daily:"+now.ToString("yyyyMMdd",CultureInfo.InvariantCulture):
        FormattableString.Invariant($"practice:{stage}:{track??0}:{category??0}");
    private static bool SameScope(LearningSession session,Scope scope) =>
        session.StageId==scope.StageId && session.TrackId==scope.TrackId;
    private static bool CurrentDay(LearningSession session,DateTime now) =>
        session.Kind!="daily" || session.CreatedAtUtc.Date==now.Date;
    private static string Fingerprint(MathProblem p) => Convert.ToHexString(SHA256.HashData(
        JsonSerializer.SerializeToUtf8Bytes(new {p.Id,p.StageId,p.CategoryId,p.QuestionTextAr,p.QuestionTextEn,
            Options=p.Options.OrderBy(o=>o.Order).ThenBy(o=>o.Id)
                .Select(o=>new{o.Id,o.Order,o.LatexCode,o.IsCorrect}).ToArray()})));
    private static QuestionRef[] Questions(LearningSession s) =>
        JsonSerializer.Deserialize<QuestionRef[]>(s.QuestionsJson) ?? Array.Empty<QuestionRef>();
    private async Task LockLearner(int id,CancellationToken ct) =>
        await db.Database.SqlQuery<int>($"SELECT 1 AS \"Value\" FROM pg_advisory_xact_lock({-987654320},{id})").SingleAsync(ct);
    private async Task<(Scope? Scope,IActionResult? Error)> Resolve(string kind,CancellationToken ct)
    {
        var learner=await db.Users.AsNoTracking().SingleOrDefaultAsync(u=>u.Id==UserId&&u.Role=="Student"&&u.IsActive,ct);
        if(learner is null)return (null,Unauthorized());
        if(kind=="daily"&&!PremiumEntitlement.IsActive(learner))
            return (null,StatusCode(403,new{Message="AccountUpgradeRequired"}));
        if(learner.CurrentStageId is not int stage || stage<=0)
            return (null,Conflict(new{Message="LearningStageRequired"}));
        var track=await tracks.ActiveAsync(stage,learner.CurrentTrackId,ct);
        if(tracks.Enabled&&learner.CurrentTrackId.HasValue&&track is null)
            return (null,Conflict(new{Message="LearningTrackUnavailable"}));
        var allowed=await access.GetAllowedCategoryIdsAsync(User,ct);
        if(allowed is null)return (null,Forbid());
        return (new Scope(learner.Id,stage,track?.Id,allowed,PremiumEntitlement.IsActive(learner)),null);
    }
    private IQueryable<MathProblem> Eligible(Scope scope,int? category)
    {
        var query=scope.TrackId.HasValue?tracks.ValidProblems(scope.TrackId.Value):db.Problems.AsNoTracking();
        return query.Where(p=>p.StageId==scope.StageId&&p.Category.StageId==scope.StageId&&
            scope.Allowed.Contains(p.CategoryId)&&(!category.HasValue||p.CategoryId==category.Value)&&
            p.Options.Count==4&&p.Options.Count(o=>o.IsCorrect)==1);
    }
    private async Task<MathProblem?> LoadQuestion(Scope scope,LearningSession session,QuestionRef reference,CancellationToken ct)
    {
        var problem=await Eligible(scope,session.CategoryId).Include(p=>p.Options)
            .SingleOrDefaultAsync(p=>p.Id==reference.Id,ct);
        return problem is not null&&Fingerprint(problem)==reference.Fingerprint?problem:null;
    }
    private static object PublicQuestion(MathProblem p)=>new{
        p.Id,p.CategoryId,p.TitleAr,p.TitleEn,p.QuestionTextAr,p.QuestionTextEn,
        Options=p.Options.OrderBy(o=>o.Order).ThenBy(o=>o.Id).Select(o=>new{o.Id,o.LatexCode,o.Order}).ToArray()
    };
    private async Task<IActionResult> ViewSession(LearningSession session,Scope scope,DateTime now,CancellationToken ct)
    {
        if(session.AbandonedAtUtc.HasValue)return Conflict(new{Message="SessionAbandoned"});
        if(!SameScope(session,scope))return Conflict(new{Message="SessionScopeChanged"});
        if(!CurrentDay(session,now))return Conflict(new{Message="DailySessionExpired"});
        if(session.CategoryId.HasValue&&!scope.Allowed.Contains(session.CategoryId.Value))
            return StatusCode(403,new{Message="CategoryLocked"});
        var questions=Questions(session);
        if(questions.Length!=session.Total)return Conflict(new{Message="SessionContentUnavailable"});
        object? current=null;
        if(session.Completed<session.Total)
        {
            var p=await LoadQuestion(scope,session,questions[session.Completed],ct);
            if(p is null)return Conflict(new{Message="SessionContentUnavailable"});
            current=PublicQuestion(p);
        }
        return Ok(new{session.Id,session.Kind,session.StageId,session.TrackId,session.CategoryId,
            session.Total,session.Completed,session.CreatedAtUtc,session.CompletedAtUtc,
            IsComplete=session.Completed==session.Total,CurrentQuestion=current,
            CanUseHints=scope.Premium&&session.Completed<session.Total,
            HintsRevealed=scope.Premium?session.HintsRevealed:0});
    }

    [HttpPost("start")]
    public async Task<IActionResult> Start(StartInput input,CancellationToken ct)
    {
        if(!Enabled)return NotFound();
        if(!ValidKind(input.Kind)||input.RequestId==Guid.Empty||
           input.Count is <5 or >10||(input.CategoryId.HasValue&&input.CategoryId.Value<=0)||
           (input.Kind=="daily"&&(input.Count!=5||input.CategoryId.HasValue)))
            return BadRequest(new{Message="InvalidLearningSession"});
        await using var tx=await db.Database.BeginTransactionAsync(ct);
        await LockLearner(UserId,ct);
        var (scope,error)=await Resolve(input.Kind,ct);
        if(scope is null)return error!;
        var now=DateTime.UtcNow;
        if(input.CategoryId.HasValue&&!scope.Allowed.Contains(input.CategoryId.Value))
            return StatusCode(403,new{Message="CategoryLocked"});
        var key=Key(input.Kind,scope.StageId,scope.TrackId,input.CategoryId,now);
        var replay=await db.LearningSessions.AsNoTracking().SingleOrDefaultAsync(s=>s.UserId==scope.UserId&&s.StartRequestId==input.RequestId,ct);
        if(replay is not null)
        {
            if(replay.ScopeKey!=key||replay.Total!=input.Count||replay.Kind!=input.Kind)
                return Conflict(new{Message="SessionRequestConflict"});
            return await ViewSession(replay,scope,now,ct);
        }
        var active=await db.LearningSessions.AsNoTracking().SingleOrDefaultAsync(s=>s.UserId==scope.UserId&&s.ScopeKey==key&&
            (s.Kind=="daily"||(s.CompletedAtUtc==null&&s.AbandonedAtUtc==null)),ct);
        if(active is not null)return await ViewSession(active,scope,now,ct);

        var candidates=await Eligible(scope,input.CategoryId).Select(p=>new{p.Id,p.CategoryId}).ToListAsync(ct);
        // Deterministic round-robin across real categories. Prefer never solved
        // questions where possible; existing solves NEVER complete this session.
        var solved=await db.UserProgresses.AsNoTracking().Where(p=>p.UserId==scope.UserId&&p.IsSolved)
            .Select(p=>p.ProblemId).ToListAsync(ct);
        var done=solved.ToHashSet();
        long seed=(long)scope.UserId*17+now.DayOfYear*31L+(scope.TrackId??scope.StageId)*13L;
        long Rank(int id)=>(id*1103515245L+seed*1013904223L)&0x7fffffff;
        var ids=candidates.GroupBy(p=>p.CategoryId)
            .SelectMany(g=>g.OrderBy(p=>done.Contains(p.Id)).ThenBy(p=>Rank(p.Id)).ThenBy(p=>p.Id)
                .Select((p,index)=>new{p.Id,p.CategoryId,index}))
            .OrderBy(p=>done.Contains(p.Id)).ThenBy(p=>p.index).ThenBy(p=>Rank(p.CategoryId)).ThenBy(p=>p.Id)
            .Take(input.Count).Select(p=>p.Id).ToArray();
        if(ids.Length!=input.Count)return Conflict(new{Message="InsufficientSessionProblems"});
        var loaded=await Eligible(scope,input.CategoryId).Where(p=>ids.Contains(p.Id)).Include(p=>p.Options).ToListAsync(ct);
        if(loaded.Count!=ids.Length)return Conflict(new{Message="SessionContentUnavailable"});
        var byId=loaded.ToDictionary(p=>p.Id);
        var session=new LearningSession{Id=Guid.NewGuid(),UserId=scope.UserId,StageId=scope.StageId,TrackId=scope.TrackId,
            CategoryId=input.CategoryId,Kind=input.Kind,ScopeKey=key,StartRequestId=input.RequestId,
            QuestionsJson=JsonSerializer.Serialize(ids.Select(id=>new QuestionRef(id,Fingerprint(byId[id])))),
            Total=ids.Length,CreatedAtUtc=now};
        db.LearningSessions.Add(session);
        await db.SaveChangesAsync(ct);await tx.CommitAsync(ct);
        return await ViewSession(session,scope,now,ct);
    }

    [HttpGet("current")]
    public async Task<IActionResult> Current([FromQuery]string kind,[FromQuery]int? categoryId,CancellationToken ct)
    {
        if(!Enabled)return NotFound();
        if(!ValidKind(kind)||(categoryId.HasValue&&categoryId.Value<=0)||(kind=="daily"&&categoryId.HasValue))
            return BadRequest(new{Message="InvalidLearningSession"});
        var (scope,error)=await Resolve(kind,ct);
        if(scope is null)return error!;
        var now=DateTime.UtcNow;
        var key=Key(kind,scope.StageId,scope.TrackId,categoryId,now);
        var session=await db.LearningSessions.AsNoTracking().SingleOrDefaultAsync(s=>s.UserId==scope.UserId&&s.ScopeKey==key&&
            (s.Kind=="daily"||(s.CompletedAtUtc==null&&s.AbandonedAtUtc==null)),ct);
        return session is null?NotFound(new{Message="NoLearningSession"}):await ViewSession(session,scope,now,ct);
    }

    [HttpGet("{id:guid}")]
    public async Task<IActionResult> Get(Guid id,CancellationToken ct)
    {
        if(!Enabled)return NotFound();
        var session=await db.LearningSessions.AsNoTracking().SingleOrDefaultAsync(s=>s.Id==id&&s.UserId==UserId,ct);
        if(session is null)return NotFound();
        var (scope,error)=await Resolve(session.Kind,ct);
        return scope is null?error!:await ViewSession(session,scope,DateTime.UtcNow,ct);
    }

    [HttpPost("{id:guid}/answer")]
    public async Task<IActionResult> Answer(Guid id,AnswerInput input,CancellationToken ct)
    {
        if(!Enabled)return NotFound();
        if(input.RequestId==Guid.Empty||input.Position is <0 or >9||input.ProblemId<=0||input.SelectedOptionId<=0)
            return BadRequest(new{Message="InvalidSessionAnswer"});
        // Reject unrelated question IDs before taking any shared question lock.
        var owned=await db.LearningSessions.AsNoTracking().SingleOrDefaultAsync(s=>s.Id==id&&s.UserId==UserId,ct);
        if(owned is null)return NotFound();
        var ownedRefs=Questions(owned);
        if(input.Position>=ownedRefs.Length||ownedRefs[input.Position].Id!=input.ProblemId)
            return Conflict(new{Message="SessionQuestionMismatch"});
        await using var tx=await db.Database.BeginTransactionAsync(ct);
        // Same ordering as ordinary submit: question lock, then learner lock.
        await ProblemTransactionLocks.LockQuestionForAnswerAsync(db,input.ProblemId,ct);
        await LockLearner(UserId,ct);
        var session=await db.LearningSessions.SingleOrDefaultAsync(s=>s.Id==id&&s.UserId==UserId,ct);
        if(session is null)return NotFound();
        var (scope,error)=await Resolve(session.Kind,ct);
        if(scope is null)return error!;
        var now=DateTime.UtcNow;
        if(!SameScope(session,scope))return Conflict(new{Message="SessionScopeChanged"});
        if(!CurrentDay(session,now))return Conflict(new{Message="DailySessionExpired"});
        var refs=Questions(session);
        if(refs.Length!=session.Total||input.Position>=refs.Length||refs[input.Position].Id!=input.ProblemId)
            return Conflict(new{Message="SessionQuestionMismatch"});
        var previous=await db.LearningSessionAttempts.AsNoTracking().SingleOrDefaultAsync(a=>a.SessionId==id&&a.RequestId==input.RequestId,ct);
        if(previous is not null&&(previous.Position!=input.Position||previous.ProblemId!=input.ProblemId||previous.SelectedOptionId!=input.SelectedOptionId))
            return Conflict(new{Message="SessionRequestConflict"});
        if(session.AbandonedAtUtc.HasValue)return Conflict(new{Message="SessionAbandoned"});
        if(previous is null&&(session.CompletedAtUtc.HasValue||input.Position!=session.Completed))
            return Conflict(new{Message="SessionQuestionMismatch"});
        var p=await LoadQuestion(scope,session,refs[input.Position],ct);
        if(p is null)return Conflict(new{Message="SessionContentUnavailable"});
        var option=p.Options.SingleOrDefault(o=>o.Id==input.SelectedOptionId);
        if(option is null)return BadRequest(new{Message="OptionNotFound"});
        if(previous is not null)return AnswerView(session,previous,p);
        var number=await db.LearningSessionAttempts.Where(a=>a.SessionId==id&&a.Position==input.Position)
            .MaxAsync(a=>(int?)a.AttemptNumber,ct)??0;
        if(number==int.MaxValue)return Conflict(new{Message="SessionAttemptLimit"});
        var attempt=new LearningSessionAttempt{SessionId=id,RequestId=input.RequestId,Position=input.Position,
            ProblemId=p.Id,SelectedOptionId=option.Id,SelectedOptionText=option.LatexCode,
            IsCorrect=option.IsCorrect,AttemptNumber=number+1,UsedHint=session.HintsRevealed>0,SubmittedAtUtc=now};
        db.LearningSessionAttempts.Add(attempt);
        // Only a correct answer advances. Replays or normal problem submits
        // never enter this branch a second time or alter session completion.
        if(attempt.IsCorrect)
        {
            attempt.PointsEarned=await PermanentAchievementLedger.AwardAsync(db,UserId,p,now,ct);
            session.Completed++;
            session.HintsRevealed=0;
            if(session.Completed==session.Total)session.CompletedAtUtc=now;
        }
        await db.SaveChangesAsync(ct);await tx.CommitAsync(ct);
        return AnswerView(session,attempt,p);
    }

    // Explicit restart of the selected practice session only. Preserve
    // attempts, earned achievements, favorites and today's challenge.
    [HttpPost("{id:guid}/abandon")]
    public async Task<IActionResult> Abandon(Guid id,CancellationToken ct)
    {
        if(!Enabled)return NotFound();
        await using var tx=await db.Database.BeginTransactionAsync(ct);
        await LockLearner(UserId,ct);
        var session=await db.LearningSessions.SingleOrDefaultAsync(s=>s.Id==id&&s.UserId==UserId,ct);
        if(session is null)return NotFound();
        var (scope,error)=await Resolve(session.Kind,ct);
        if(scope is null)return error!;
        if(!SameScope(session,scope))return Conflict(new{Message="SessionScopeChanged"});
        if(session.Kind!="practice"||session.CompletedAtUtc.HasValue)
            return Conflict(new{Message="CannotAbandonSession"});
        if(!session.AbandonedAtUtc.HasValue)
        {
            session.AbandonedAtUtc=DateTime.UtcNow;
            session.HintsRevealed=0;
            db.PlatformActivityEvents.Add(new PlatformActivityEvent{ActorUserId=UserId,ActorRole="Student",
                Action="PracticeSessionAbandoned",Resource="LearningSession",ResourceId=id.ToString("D"),
                Origin="api",CreatedAtUtc=session.AbandonedAtUtc.Value});
            await db.SaveChangesAsync(ct);
        }
        await tx.CommitAsync(ct);
        return Ok(new{session.Id,session.AbandonedAtUtc});
    }

    [HttpPost("{id:guid}/hints")]
    [EnableRateLimiting("solution-preview")]
    public async Task<IActionResult> Hint(Guid id,HintInput input,CancellationToken ct)
    {
        if(!Enabled)return NotFound();
        if(input.Position is <0 or >9||input.ProblemId<=0||input.Level is <0 or >2)
            return BadRequest(new{Message="InvalidHintLevel"});
        var owned=await db.LearningSessions.AsNoTracking().SingleOrDefaultAsync(s=>s.Id==id&&s.UserId==UserId,ct);
        if(owned is null)return NotFound();
        var refs=Questions(owned);
        if(input.Position>=refs.Length||refs[input.Position].Id!=input.ProblemId)
            return Conflict(new{Message="SessionQuestionMismatch"});
        await using var tx=await db.Database.BeginTransactionAsync(ct);
        await ProblemTransactionLocks.LockQuestionForAnswerAsync(db,input.ProblemId,ct);
        await LockLearner(UserId,ct);
        var session=await db.LearningSessions.SingleOrDefaultAsync(s=>s.Id==id&&s.UserId==UserId,ct);
        if(session is null)return NotFound();
        var (scope,error)=await Resolve(session.Kind,ct);
        if(scope is null)return error!;
        if(!scope.Premium)return StatusCode(403,new{Message="PremiumRequired"});
        var now=DateTime.UtcNow;
        if(!SameScope(session,scope)||!CurrentDay(session,now)||session.CompletedAtUtc.HasValue||session.AbandonedAtUtc.HasValue||session.Completed!=input.Position)
            return Conflict(new{Message="SessionQuestionMismatch"});
        var p=await LoadQuestion(scope,session,refs[input.Position],ct);
        if(p is null)return Conflict(new{Message="SessionContentUnavailable"});
        BilingualText[]? hints=null;
        if(p.EditorialDetailsJson is not null)
        {
            using var json=JsonDocument.Parse(p.EditorialDetailsJson);
            if(json.RootElement.TryGetProperty("Hints",out var value))
                hints=value.Deserialize<BilingualText[]>();
        }
        if(hints is null||hints.Length!=2||hints.Any(h=>!WizardProblemContract.Pair(h,1000)))
            return Ok(new{Available=false,RevealedCount=0,Hints=Array.Empty<object>()});
        if(input.Level>session.HintsRevealed+1)
            return Conflict(new{Message="RevealPreviousHintFirst"});
        if(input.Level>session.HintsRevealed)
        {
            session.HintsRevealed=input.Level;
            db.PlatformActivityEvents.Add(new PlatformActivityEvent{ActorUserId=UserId,ActorRole="Student",
                Action="SessionHint"+input.Level,Resource="LearningSession",
                ResourceId=FormattableString.Invariant($"{id:D}:{input.Position}"),Origin="api",CreatedAtUtc=now});
            await db.SaveChangesAsync(ct);
        }
        await tx.CommitAsync(ct);
        var ar=LanguageHelper.GetLanguageFromRequest(Request)!="en";
        return Ok(new{Available=true,RevealedCount=session.HintsRevealed,
            Hints=hints.Take(session.HintsRevealed).Select((h,i)=>new{Level=i+1,Text=ar?h.Ar:h.En}).ToArray()});
    }

    // Permanent achievements are derived from immutable correct-attempt
    // evidence and completed session rows, not mutable active-stage progress.
    // No bonus points are minted; each badge key is emitted at most once.
    [HttpGet("achievements")]
    public async Task<IActionResult> Achievements(CancellationToken ct)
    {
        if(!Enabled)return NotFound();
        if(!await db.Users.AsNoTracking().AnyAsync(u=>u.Id==UserId&&u.IsActive&&u.Role=="Student",ct))
            return Unauthorized();
        var owned=db.LearningSessions.AsNoTracking().Where(x=>x.UserId==UserId);
        var completed=owned.Where(x=>x.CompletedAtUtc!=null);
        var dailyDates=await completed.Where(x=>x.Kind=="daily").OrderBy(x=>x.CompletedAtUtc)
            .Select(x=>x.CompletedAtUtc!.Value).ToListAsync(ct);
        var days=dailyDates.Select(x=>x.Date).Distinct().ToArray();
        var practice=await completed.Where(x=>x.Kind=="practice").OrderBy(x=>x.CompletedAtUtc)
            .Select(x=>x.CompletedAtUtc).FirstOrDefaultAsync(ct);
        var attempts=from a in db.LearningSessionAttempts.AsNoTracking()
                     join session in owned on a.SessionId equals session.Id select a;
        var correct=attempts.Where(a=>a.IsCorrect);
        var independent=await correct.CountAsync(a=>a.AttemptNumber==1&&!a.UsedHint,ct);
        var assisted=await correct.CountAsync(a=>a.UsedHint,ct);
        var persistence=await correct.Where(a=>a.AttemptNumber>1).OrderBy(a=>a.SubmittedAtUtc)
            .Select(a=>(DateTime?)a.SubmittedAtUtc).FirstOrDefaultAsync(ct);
        var badges=new List<object>();
        if(practice.HasValue)badges.Add(new{Key="first-practice",TitleAr="بداية التدريب",TitleEn="First practice",EarnedAtUtc=practice.Value});
        if(days.Length>0)badges.Add(new{Key="first-daily",TitleAr="أول تحدٍ",TitleEn="First daily challenge",EarnedAtUtc=dailyDates[0]});
        if(days.Length>=7)badges.Add(new{Key="seven-daily-days",TitleAr="سبعة أيام من التحدي",TitleEn="Seven challenge days",
            EarnedAtUtc=dailyDates.First(x=>x.Date==days[6])});
        if(persistence.HasValue)badges.Add(new{Key="persistence",TitleAr="المثابرة",TitleEn="Persistence",EarnedAtUtc=persistence.Value});
        var permanent=db.PermanentProblemAchievements.AsNoTracking().Where(x=>x.UserId==UserId);
        return Ok(new{PermanentSolvedProblems=await permanent.CountAsync(ct),
            PermanentPoints=await permanent.SumAsync(x=>(long)x.Points,ct),
            CompletedPracticeSessions=await completed.CountAsync(x=>x.Kind=="practice",ct),
            CompletedDailyChallenges=days.Length,CorrectSessionAnswers=await correct.CountAsync(ct),
            UniqueSolvedProblems=await correct.Select(a=>a.ProblemId).Distinct().CountAsync(ct),
            IndependentFirstCorrect=independent,AssistedCorrect=assisted,Badges=badges});
    }

    private IActionResult AnswerView(LearningSession s,LearningSessionAttempt a,MathProblem p)=>Ok(new{
        SessionId=s.Id,a.Position,a.ProblemId,a.RequestId,a.IsCorrect,a.AttemptNumber,
        FirstAttemptCorrect=a.IsCorrect&&a.AttemptNumber==1,a.UsedHint,a.PointsEarned,
        IndependentFirstCorrect=a.IsCorrect&&a.AttemptNumber==1&&!a.UsedHint,s.Completed,s.Total,
        IsComplete=s.Completed==s.Total,
        CorrectOptionId=a.IsCorrect?(int?)a.SelectedOptionId:null,
        DetailedSolutionAr=a.IsCorrect?p.DetailedSolutionAr:null,
        DetailedSolutionEn=a.IsCorrect?p.DetailedSolutionEn:null,
        SolutionStructure=a.IsCorrect?WizardProblemContract.LocalizedSolution(p.EditorialDetailsJson,LanguageHelper.GetLanguageFromRequest(Request)):null
    });
}
