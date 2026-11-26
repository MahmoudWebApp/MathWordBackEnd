using System.Data;
using System.Security.Claims;
using System.Security.Cryptography;
using MathWorldAPI.Data;
using MathWorldAPI.Models;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Npgsql;

namespace MathWorldAPI.Controllers;

[ApiController]
[Authorize(Roles="Student")]
[Route("api/users/certificates")]
[ResponseCache(NoStore=true,Location=ResponseCacheLocation.None)]
public sealed class LearningCertificatesController(AppDbContext db,IConfiguration config,LearningTrackService tracks,NotificationStreamBroker stream,RecoveryEmailQueue emailQueue):ControllerBase
{
    private bool Enabled=>config.GetValue<bool>("Certificates:Enabled");
    private bool IssuanceEnabled=>Enabled&&config.GetValue<bool>("Certificates:IssuanceEnabled")&&config.GetValue<bool>("LearningSessions:Enabled");
    private int UserId=>int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier),out var id)?id:0;
    private Task<AppUser?> Owner(CancellationToken ct)=>db.Users.AsNoTracking()
        .SingleOrDefaultAsync(u=>u.Id==UserId&&u.IsActive&&u.Role=="Student",ct);
    public sealed record IssueInput(int StageId,int? TrackId,int? CategoryId);
    private sealed record Evaluation(string ScopeKey,string Kind,string TitleAr,string TitleEn,int TotalProblems,
        int SolvedProblems,int RequiredSkills,int IndependentSkills,bool CatalogReady)
    {
        public bool Eligible=>CatalogReady&&TotalProblems>=5&&SolvedProblems==TotalProblems&&RequiredSkills>0&&IndependentSkills==RequiredSkills;
    }

    private async Task<(Evaluation? Data,IActionResult? Error)> Evaluate(AppUser student,IssueInput input,CancellationToken ct)
    {
        if(input.StageId<=0||input.TrackId is <=0||input.CategoryId is <=0)
            return (null,BadRequest(new{Message="InvalidCertificateScope"}));
        if(student.CurrentStageId!=input.StageId)return (null,Conflict(new{Message="CertificateScopeChanged"}));
        var track=await tracks.ActiveAsync(student.CurrentStageId,student.CurrentTrackId,ct);
        if((tracks.Enabled&&student.CurrentTrackId.HasValue&&track==null)||input.TrackId!=track?.Id)
            return (null,Conflict(new{Message="CertificateScopeChanged"}));
        if(!input.CategoryId.HasValue&&track==null)return (null,BadRequest(new{Message="CertificateTrackRequired"}));
        var category=input.CategoryId.HasValue?await db.Categories.AsNoTracking()
            .SingleOrDefaultAsync(c=>c.Id==input.CategoryId&&c.StageId==input.StageId,ct):null;
        if(input.CategoryId.HasValue&&category==null)return (null,NotFound());
        if(category!=null&&track!=null&&!await db.LearningTrackCategories.AnyAsync(x=>x.TrackId==track.Id&&x.CategoryId==category.Id,ct))
            return (null,NotFound());
        var scope=track==null?db.Problems.AsNoTracking().Where(p=>p.StageId==input.StageId&&p.Category.StageId==input.StageId):tracks.ValidProblems(track.Id);
        if(category!=null)scope=scope.Where(p=>p.CategoryId==category.Id);
        var skills=db.CurriculumSkills.AsNoTracking().Where(s=>s.StageId==input.StageId&&s.IsPublished&&s.Domain.IsPublished);
        if(track!=null)skills=skills.Where(s=>db.LearningTrackSkills.Any(x=>x.TrackId==track.Id&&x.SkillId==s.Id));
        if(category!=null)skills=skills.Where(s=>s.CategoryId==category.Id);
        var links=db.CurriculumProblemSkills.AsNoTracking().Where(x=>x.IsPrimary&&
            skills.Any(s=>s.Id==x.SkillId)&&scope.Any(p=>p.Id==x.ProblemId&&p.CategoryId==x.Skill.CategoryId));
        var total=await scope.CountAsync(ct);
        var required=await skills.CountAsync(ct);
        var completeCatalog=total>=5&&required>0&&
            !await scope.AnyAsync(p=>p.Options.Count!=4||p.Options.Count(o=>o.IsCorrect)!=1||!links.Any(x=>x.ProblemId==p.Id),ct)&&
            !await skills.AnyAsync(s=>!links.Any(x=>x.SkillId==s.Id),ct);
        if(track!=null&&!input.CategoryId.HasValue)
            completeCatalog=completeCatalog&&!await db.LearningTrackCategories.AnyAsync(x=>x.TrackId==track.Id&&!scope.Any(p=>p.CategoryId==x.CategoryId),ct);
        var scopedTrack=input.TrackId??0;
        var ordinary=db.ProblemAttempts.AsNoTracking().Where(a=>a.UserId==student.Id&&a.PracticeScopeId==scopedTrack);
        var guided=from a in db.LearningSessionAttempts.AsNoTracking()
            join session in db.LearningSessions.AsNoTracking() on a.SessionId equals session.Id
            where session.UserId==student.Id&&session.StageId==input.StageId&&session.TrackId==input.TrackId
            select a;
        // An overlapping question solved in another track is lifetime credit,
        // but not proof of completion of this particular track.
        var solved=input.TrackId.HasValue
            ?await scope.CountAsync(p=>ordinary.Any(a=>a.ProblemId==p.Id&&a.IsCorrect)||guided.Any(a=>a.ProblemId==p.Id&&a.IsCorrect),ct)
            :await scope.CountAsync(p=>db.PermanentProblemAchievements.Any(a=>a.UserId==student.Id&&a.ProblemId==p.Id),ct);
        // Require independently successful evidence per skill. A correct retry
        // or hint-assisted solve can count for completion but not independence.
        var independent=await links.Where(link=>
            ordinary.Any(a=>a.ProblemId==link.ProblemId&&a.IsCorrect&&a.IsOfficial&&!a.UsedHint&&
                !ordinary.Any(previous=>previous.ProblemId==a.ProblemId&&previous.AttemptNumber<a.AttemptNumber))||
            (from a in db.LearningSessionAttempts
             join session in db.LearningSessions on a.SessionId equals session.Id
             where session.UserId==student.Id&&session.StageId==input.StageId&&session.TrackId==input.TrackId&&
                 session.Kind=="practice"&&a.ProblemId==link.ProblemId&&a.IsCorrect&&a.AttemptNumber==1&&!a.UsedHint
             select a).Any()).Select(x=>x.SkillId).Distinct().CountAsync(ct);
        var kind=category!=null?"category":track!.Kind=="course"?"course":"grade";
        var key=FormattableString.Invariant($"{input.StageId}:{input.TrackId??0}:{input.CategoryId??0}");
        var ar=category!=null?(track!=null?track.NameAr+" — "+category.NameAr:category.NameAr):track!.NameAr;
        var en=category!=null?(track!=null?track.NameEn+" — "+category.NameEn:category.NameEn):track!.NameEn;
        return (new(key,kind,ar,en,total,solved,required,independent,completeCatalog),null);
    }

    private static object PrivateView(LearningCertificate c)=>new{c.Id,c.StageId,c.TrackId,c.CategoryId,c.Kind,c.StudentName,
        c.TitleAr,c.TitleEn,c.VerificationCode,c.PolicyVersion,c.TotalProblems,c.RequiredSkills,c.IssuedAtUtc};

    [HttpGet]
    public async Task<IActionResult> List(CancellationToken ct,[FromQuery]int page=1,[FromQuery]int? pageSize=null)
    {
        if(!Enabled)return NotFound();
        if(await Owner(ct)==null)return Unauthorized();
        if(page<1||page>10000||pageSize is <1 or >50)return BadRequest();
        var query=db.LearningCertificates.AsNoTracking().Where(c=>c.UserId==UserId);
        var ordered=query.OrderByDescending(c=>c.IssuedAtUtc).ThenBy(c=>c.Id);
        if(!pageSize.HasValue)
        {
            var legacy=await ordered.ToListAsync(ct);
            return Ok(new{IssuanceEnabled,Items=legacy.Select(PrivateView).ToArray()});
        }
        var total=await query.CountAsync(ct);
        var rows=await ordered.Skip((page-1)*pageSize.Value).Take(pageSize.Value).ToListAsync(ct);
        return Ok(new{IssuanceEnabled,Items=rows.Select(PrivateView).ToArray(),Total=total,Page=page,PageSize=pageSize.Value});
    }

    [HttpGet("eligibility")]
    public async Task<IActionResult> Eligibility([FromQuery]int stageId,[FromQuery]int? trackId,[FromQuery]int? categoryId,CancellationToken ct)
    {
        if(!IssuanceEnabled)return NotFound();
        var student=await Owner(ct);
        if(student==null)return Unauthorized();
        if(!PremiumEntitlement.IsActive(student))return StatusCode(403,new{Message="PremiumRequired"});
        var (data,error)=await Evaluate(student,new(stageId,trackId,categoryId),ct);
        return error??Ok(data);
    }

    [HttpPost("issue")]
    public async Task<IActionResult> Issue(IssueInput input,CancellationToken ct)
    {
        if(!IssuanceEnabled)return NotFound();
        try
        {
            await using var tx=await db.Database.BeginTransactionAsync(IsolationLevel.RepeatableRead,ct);
            await db.Database.SqlQuery<int>($"SELECT 1 AS \"Value\" FROM pg_advisory_xact_lock({-987654320},{UserId})").SingleAsync(ct);
            var student=await Owner(ct);
            if(student==null)return Unauthorized();
            if(!PremiumEntitlement.IsActive(student))return StatusCode(403,new{Message="PremiumRequired"});
            var (data,error)=await Evaluate(student,input,ct);
            if(data==null)return error!;
            var existing=await db.LearningCertificates.AsNoTracking().SingleOrDefaultAsync(c=>c.UserId==student.Id&&c.ScopeKey==data.ScopeKey,ct);
            if(existing!=null)return Ok(PrivateView(existing));
            if(!data.Eligible)return Conflict(new{Message="CertificateRequirementsNotMet",Eligibility=data});
            var now=DateTime.UtcNow;
            now=new DateTime(now.Ticks-now.Ticks%10,DateTimeKind.Utc);
            if(string.IsNullOrWhiteSpace(student.FullName)||student.FullName.Length>300||
                data.TitleAr.Length>500||data.TitleEn.Length>500)
                return Conflict(new{Message="CertificateIdentityUnavailable"});
            var record=new LearningCertificate{Id=Guid.NewGuid(),UserId=student.Id,StageId=input.StageId,TrackId=input.TrackId,
                CategoryId=input.CategoryId,ScopeKey=data.ScopeKey,Kind=data.Kind,StudentName=student.FullName,
                TitleAr=data.TitleAr,TitleEn=data.TitleEn,VerificationCode=Convert.ToHexString(RandomNumberGenerator.GetBytes(16)).ToLowerInvariant(),
                PolicyVersion=1,TotalProblems=data.TotalProblems,RequiredSkills=data.RequiredSkills,IssuedAtUtc=now};
            db.LearningCertificates.Add(record);
            db.UserNotifications.Add(new UserNotification{UserId=student.Id,Type="achievement",
                TitleAr="شهادتك التعليمية جاهزة",TitleEn="Your learning certificate is ready",
                BodyAr="يمكنك عرض الشهادة وتنزيلها من قسم شهاداتي.",BodyEn="View and download the certificate in My learning certificates.",
                TargetPath="/dashboard/certificates",CreatedAtUtc=now});
            emailQueue.AddOptionalNotice(student,"certificate-issued",now);
            db.PlatformActivityEvents.Add(new PlatformActivityEvent{ActorUserId=student.Id,ActorRole="Student",Action="CertificateIssued",
                Resource="LearningCertificate",ResourceId=record.Id.ToString("D"),Origin="api",CreatedAtUtc=now});
            await db.SaveChangesAsync(ct);
            await tx.CommitAsync(ct);
            stream.Notify(student.Id);
            return Ok(PrivateView(record));
        }
        catch(PostgresException e) when(e.SqlState is "40001" or "23505"){return Conflict(new{Message="CertificateRetry"});}
        catch(DbUpdateException e) when(e.InnerException is PostgresException p&&p.SqlState is "40001" or "23505"){return Conflict(new{Message="CertificateRetry"});}
    }

    // A learner keeps the issued certificate even after Premium expires.
    [HttpGet("{id:guid}/pdf")]
    public async Task<IActionResult> Pdf(Guid id,[FromQuery]string lang="ar",CancellationToken ct=default)
    {
        if(!Enabled)return NotFound();
        if(lang is not ("ar" or "en"))return BadRequest(new{Message="InvalidCertificateLanguage"});
        if(await Owner(ct)==null)return Unauthorized();
        var c=await db.LearningCertificates.AsNoTracking().SingleOrDefaultAsync(x=>x.Id==id&&x.UserId==UserId,ct);
        if(c==null)return NotFound();
        Response.Headers["X-Content-Type-Options"]="nosniff";
        return File(PremiumAnalyticsPdfExporter.CreateCertificate(c,lang=="ar"),"application/pdf",$"mathworld-certificate-{c.Id:D}-{lang}.pdf");
    }

    // High-entropy verification capability, no public names or student IDs.
    [AllowAnonymous]
    [HttpGet("/api/certificates/verify/{code}")]
    public async Task<IActionResult> Verify(string code,CancellationToken ct)
    {
        if(!Enabled||code.Length!=32||code.Any(c=>!Uri.IsHexDigit(c)))return NotFound();
        var c=await db.LearningCertificates.AsNoTracking().SingleOrDefaultAsync(x=>x.VerificationCode==code.ToLowerInvariant(),ct);
        if(c==null)return NotFound();
        return Ok(new{Valid=true,c.Kind,c.TitleAr,c.TitleEn,c.PolicyVersion,c.TotalProblems,c.RequiredSkills,c.IssuedAtUtc});
    }
}
