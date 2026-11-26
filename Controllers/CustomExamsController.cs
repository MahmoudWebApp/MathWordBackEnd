using System.Security.Claims;
using System.Security.Cryptography;
using System.Text.Json;
using MathWorldAPI.Data;
using MathWorldAPI.Models;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

[ApiController]
[Authorize(Roles="Student")]
[ResponseCache(NoStore=true, Location=ResponseCacheLocation.None)]
[Route("api/users/custom-exams")]
public sealed class CustomExamsController(AppDbContext db, IConfiguration config, LearningTrackService tracks, ProblemCategoryAccessService access):ControllerBase
{
    public sealed record StartInput(Guid RequestId,int? CategoryId,int Count=10,int? DifficultyLevel=null);
    public sealed record AnswerInput(int Position,int OptionId);
    private sealed record Option(int Id,string LatexCode,bool IsCorrect);
    private sealed record Question(int Id,int CategoryId,string TitleAr,string TitleEn,string QuestionTextAr,string QuestionTextEn,Option[] Options);
    private sealed record Answer(int Position,int OptionId);
    private sealed record ExamSnapshot(int? DifficultyLevel,Question[] Questions);
    private int Uid=>int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier),out var id)?id:0;
    // PostgreSQL timestamps have microsecond precision. Use the persisted precision
    // before returning the first response so idempotent retries are byte-stable.
    private static DateTime Now()
    {
        var now=DateTime.UtcNow;
        return new DateTime(now.Ticks-now.Ticks%10,DateTimeKind.Utc);
    }
    private bool Enabled=>config.GetValue<bool>("CustomExams:Enabled");
    private Task<AppUser?> Owner(CancellationToken ct)=>db.Users.AsNoTracking().SingleOrDefaultAsync(u=>u.Id==Uid&&u.IsActive&&u.Role=="Student",ct);
    private Task<CustomExam?> Find(Guid id,CancellationToken ct)=>db.Set<CustomExam>().SingleOrDefaultAsync(e=>e.Id==id&&e.UserId==Uid,ct);
    private async Task Lock(CancellationToken ct)=>await db.Database.SqlQuery<int>($"SELECT 1 AS \"Value\" FROM pg_advisory_xact_lock({-987654321},{Uid})").SingleAsync(ct);
    private static ExamSnapshot Snapshot(CustomExam e)
    {
        // Preserve reading the original array-format snapshots.
        return e.QuestionsJson.TrimStart().StartsWith("[",StringComparison.Ordinal)
            ? new ExamSnapshot(null,JsonSerializer.Deserialize<Question[]>(e.QuestionsJson)??throw new InvalidOperationException("Invalid exam snapshot"))
            : JsonSerializer.Deserialize<ExamSnapshot>(e.QuestionsJson)??throw new InvalidOperationException("Invalid exam snapshot");
    }
    private static Question[] Questions(CustomExam e)=>Snapshot(e).Questions;
    private static int? ReviewedDifficulty(string? json)
    {
        if(string.IsNullOrWhiteSpace(json))return null;
        try
        {
            using var parsed=JsonDocument.Parse(json);
            if(parsed.RootElement.ValueKind==JsonValueKind.Object&&parsed.RootElement.TryGetProperty("DifficultyLevel",out var value)&&
                value.ValueKind==JsonValueKind.Number&&value.TryGetInt32(out var level)&&level is >=1 and <=5)return level;
        }
        catch(JsonException) { }
        return null;
    }
    private static List<Answer> Answers(CustomExam e)=>JsonSerializer.Deserialize<List<Answer>>(e.AnswersJson)??throw new InvalidOperationException("Invalid exam answers");
    private static object Public(Question q)=>new{q.Id,q.CategoryId,q.TitleAr,q.TitleEn,q.QuestionTextAr,q.QuestionTextEn,Options=q.Options.Select(o=>new{o.Id,o.LatexCode})};
    private static object View(CustomExam e)
    {
        var snapshot=Snapshot(e);var q=snapshot.Questions;var a=Answers(e);var finished=e.FinishedAtUtc.HasValue;
        return new{e.Id,e.StageId,e.TrackId,e.CategoryId,snapshot.DifficultyLevel,e.TitleAr,e.TitleEn,e.Total,e.PassPercent,e.CreatedAtUtc,e.FinishedAtUtc,e.AbandonedAtUtc,
            Answered=a.Count,Score=finished?e.Score:null,Passed=finished?(bool?)(e.Score!.Value*100>=e.PassPercent*e.Total):null,
            CurrentQuestion=!finished&&!e.AbandonedAtUtc.HasValue&&a.Count<q.Length?Public(q[a.Count]):null,
            CertificateIssued=finished&&e.VerificationCode!=null,
            Review=finished?q.Select((x,i)=>new{Question=Public(x),SelectedOptionId=a[i].OptionId,CorrectOptionId=x.Options.Single(o=>o.IsCorrect).Id}).ToArray():null};
    }
    private async Task<IActionResult?> Active(CustomExam e,AppUser owner,CancellationToken ct)
    {
        if(!PremiumEntitlement.IsActive(owner))return StatusCode(403,new{Message="PremiumRequired"});
        var track=await tracks.ActiveAsync(owner.CurrentStageId,owner.CurrentTrackId,ct);
        if(track==null||track.Id!=e.TrackId||track.StageId!=e.StageId)return Conflict(new{Message="ExamScopeChanged"});
        return null;
    }
    [HttpGet("availability")]
    public async Task<IActionResult> Availability(CancellationToken ct)
    {
        if(await Owner(ct)==null)return Unauthorized();
        return Ok(new{Enabled});
    }
    [HttpGet("setup")]
    public async Task<IActionResult> Setup(CancellationToken ct)
    {
        if(!Enabled)return NotFound();var owner=await Owner(ct);if(owner==null)return Unauthorized();
        if(!PremiumEntitlement.IsActive(owner))return StatusCode(403,new{Message="PremiumRequired"});
        var t=await tracks.ActiveAsync(owner.CurrentStageId,owner.CurrentTrackId,ct);
        if(t==null)return Conflict(new{Message="LearningTrackRequired"});
        var allowed=await access.GetAllowedCategoryIdsAsync(User,ct)??new List<int>();
        var valid=tracks.ValidProblems(t.Id).Where(p=>allowed.Contains(p.CategoryId)&&p.Options.Count==4&&p.Options.Count(o=>o.IsCorrect)==1);
        var rows=await valid.Select(p=>new{p.CategoryId,p.Category.NameAr,p.Category.NameEn,p.Category.Order,p.EditorialDetailsJson}).ToListAsync(ct);
        var categories=rows.GroupBy(p=>new{p.CategoryId,p.NameAr,p.NameEn,p.Order}).Select(g=>new{Id=g.Key.CategoryId,g.Key.NameAr,g.Key.NameEn,g.Key.Order,Count=g.Count(),DifficultyCounts=g.Select(x=>ReviewedDifficulty(x.EditorialDetailsJson)).Where(x=>x.HasValue).GroupBy(x=>x!.Value).Select(x=>new{Level=x.Key,Count=x.Count()}).OrderBy(x=>x.Level).ToArray()}).OrderBy(c=>c.Order).ThenBy(c=>c.Id).ToArray();
        return Ok(new{Track=new{t.Id,t.StageId,t.NameAr,t.NameEn},Categories=categories,Counts=new[]{5,10,15,20},PassPercent=70});
    }
    [HttpPost("start")]
    public async Task<IActionResult> Start(StartInput input,CancellationToken ct)
    {
        if(!Enabled)return NotFound();
        if(input.RequestId==Guid.Empty||input.Count is not (5 or 10 or 15 or 20)||input.CategoryId is <=0||input.DifficultyLevel is <1 or >5)return BadRequest(new{Message="InvalidExamRequest"});
        await using var tx=await db.Database.BeginTransactionAsync(ct);await Lock(ct);
        var owner=await Owner(ct);if(owner==null)return Unauthorized();if(!PremiumEntitlement.IsActive(owner))return StatusCode(403,new{Message="PremiumRequired"});
        var t=await tracks.ActiveAsync(owner.CurrentStageId,owner.CurrentTrackId,ct);if(t==null)return Conflict(new{Message="LearningTrackRequired"});
        var replay=await db.Set<CustomExam>().SingleOrDefaultAsync(e=>e.UserId==Uid&&e.StartRequestId==input.RequestId,ct);
        if(replay!=null){if(replay.TrackId!=t.Id||replay.CategoryId!=input.CategoryId||replay.Total!=input.Count||Snapshot(replay).DifficultyLevel!=input.DifficultyLevel)return Conflict(new{Message="ExamRequestConflict"});return Ok(View(replay));}
        var active=await db.Set<CustomExam>().SingleOrDefaultAsync(e=>e.UserId==Uid&&e.FinishedAtUtc==null&&e.AbandonedAtUtc==null,ct);
        if(active!=null)return Conflict(new{Message="ActiveExamExists",ExamId=active.Id});
        var allowed=await access.GetAllowedCategoryIdsAsync(User,ct)??new List<int>();
        if(input.CategoryId.HasValue&&!allowed.Contains(input.CategoryId.Value))return StatusCode(403,new{Message="CategoryLocked"});
        var valid=tracks.ValidProblems(t.Id).Where(p=>allowed.Contains(p.CategoryId)&&(!input.CategoryId.HasValue||p.CategoryId==input.CategoryId.Value)&&p.Options.Count==4&&p.Options.Count(o=>o.IsCorrect)==1);
        var candidates=await valid.Select(p=>new{p.Id,p.CategoryId,p.EditorialDetailsJson}).ToListAsync(ct);
        if(input.DifficultyLevel.HasValue)candidates=candidates.Where(p=>ReviewedDifficulty(p.EditorialDetailsJson)==input.DifficultyLevel).ToList();
        var ids=candidates.GroupBy(p=>p.CategoryId).SelectMany(g=>g.OrderBy(_=>RandomNumberGenerator.GetInt32(int.MaxValue)).Select((p,i)=>new{p.Id,Index=i,Rank=RandomNumberGenerator.GetInt32(int.MaxValue)})).OrderBy(p=>p.Index).ThenBy(p=>p.Rank).Take(input.Count).Select(p=>p.Id).ToArray();
        if(ids.Length!=input.Count)return Conflict(new{Message="InsufficientExamProblems"});
        var rows=await valid.Where(p=>ids.Contains(p.Id)).Include(p=>p.Options).AsNoTracking().ToListAsync(ct);
        if(rows.Count!=ids.Length)return Conflict(new{Message="ExamContentChanged"});
        var byId=rows.ToDictionary(p=>p.Id);var snapshot=ids.Select(id=>{var p=byId[id];return new Question(p.Id,p.CategoryId,p.TitleAr,p.TitleEn,p.QuestionTextAr,p.QuestionTextEn,p.Options.OrderBy(_=>RandomNumberGenerator.GetInt32(int.MaxValue)).Select(o=>new Option(o.Id,o.LatexCode,o.IsCorrect)).ToArray());}).ToArray();
        var category=input.CategoryId.HasValue?await db.Categories.AsNoTracking().SingleOrDefaultAsync(c=>c.Id==input.CategoryId.Value&&c.StageId==t.StageId,ct):null;
        if(input.CategoryId.HasValue&&category==null)return NotFound();
        var e=new CustomExam{Id=Guid.NewGuid(),StartRequestId=input.RequestId,UserId=Uid,StageId=t.StageId,TrackId=t.Id,CategoryId=input.CategoryId,TitleAr=category==null?t.NameAr:t.NameAr+" — "+category.NameAr,TitleEn=category==null?t.NameEn:t.NameEn+" — "+category.NameEn,QuestionsJson=JsonSerializer.Serialize(new ExamSnapshot(input.DifficultyLevel,snapshot)),Total=input.Count,PassPercent=70,CreatedAtUtc=Now()};
        db.Set<CustomExam>().Add(e);await db.SaveChangesAsync(ct);await tx.CommitAsync(ct);return Ok(View(e));
    }
    [HttpGet]
    public async Task<IActionResult> List(CancellationToken ct)
    {
        if(!Enabled)return NotFound();if(await Owner(ct)==null)return Unauthorized();
        var items=await db.Set<CustomExam>().AsNoTracking().Where(e=>e.UserId==Uid).OrderByDescending(e=>e.CreatedAtUtc).Take(100).Select(e=>new{e.Id,e.TitleAr,e.TitleEn,e.Total,e.Score,e.PassPercent,e.FinishedAtUtc,e.AbandonedAtUtc,e.CreatedAtUtc,CertificateIssued=e.VerificationCode!=null}).ToListAsync(ct);
        return Ok(new{Items=items});
    }
    [HttpGet("{id:guid}")]
    public async Task<IActionResult> Get(Guid id,CancellationToken ct)
    {
        if(!Enabled)return NotFound();var owner=await Owner(ct);if(owner==null)return Unauthorized();var e=await Find(id,ct);if(e==null)return NotFound();
        if(!e.FinishedAtUtc.HasValue&&!e.AbandonedAtUtc.HasValue){var error=await Active(e,owner,ct);if(error!=null)return error;}
        return Ok(View(e));
    }
    [HttpPost("{id:guid}/answer")]
    public async Task<IActionResult> Submit(Guid id,AnswerInput input,CancellationToken ct)
    {
        if(!Enabled)return NotFound();await using var tx=await db.Database.BeginTransactionAsync(ct);await Lock(ct);
        var owner=await Owner(ct);if(owner==null)return Unauthorized();var e=await Find(id,ct);if(e==null)return NotFound();var error=await Active(e,owner,ct);if(error!=null)return error;
        if(e.FinishedAtUtc.HasValue||e.AbandonedAtUtc.HasValue)return Conflict(new{Message="ExamClosed"});
        var answers=Answers(e);var questions=Questions(e);
        if(input.Position<0||input.Position>=questions.Length)return BadRequest(new{Message="InvalidExamPosition"});
        if(input.Position<answers.Count)return answers[input.Position].OptionId==input.OptionId?Ok(View(e)):Conflict(new{Message="ExamAnswerAlreadySubmitted"});
        if(input.Position!=answers.Count||!questions[input.Position].Options.Any(o=>o.Id==input.OptionId))return BadRequest(new{Message="InvalidExamAnswer"});
        answers.Add(new Answer(input.Position,input.OptionId));e.AnswersJson=JsonSerializer.Serialize(answers);
        await db.SaveChangesAsync(ct);await tx.CommitAsync(ct);return Ok(View(e));
    }
    [HttpPost("{id:guid}/finish")]
    public async Task<IActionResult> Finish(Guid id,CancellationToken ct)
    {
        if(!Enabled)return NotFound();await using var tx=await db.Database.BeginTransactionAsync(ct);await Lock(ct);
        var owner=await Owner(ct);if(owner==null)return Unauthorized();var e=await Find(id,ct);if(e==null)return NotFound();
        if(e.FinishedAtUtc.HasValue)return Ok(View(e));var error=await Active(e,owner,ct);if(error!=null)return error;
        if(e.AbandonedAtUtc.HasValue)return Conflict(new{Message="ExamClosed"});var q=Questions(e);var a=Answers(e);
        if(a.Count!=e.Total||q.Length!=e.Total)return Conflict(new{Message="ExamIncomplete"});
        e.Score=a.Count(x=>q[x.Position].Options.Any(o=>o.Id==x.OptionId&&o.IsCorrect));
        e.FinishedAtUtc=Now();
        if(e.Score.Value*100>=e.PassPercent*e.Total){if(string.IsNullOrWhiteSpace(owner.FullName)||owner.FullName.Length>300)return Conflict(new{Message="CertificateIdentityUnavailable"});e.CertificateStudentName=owner.FullName;e.VerificationCode=Convert.ToHexString(RandomNumberGenerator.GetBytes(16)).ToLowerInvariant();}
        await db.SaveChangesAsync(ct);await tx.CommitAsync(ct);return Ok(View(e));
    }
    [HttpPost("{id:guid}/abandon")]
    public async Task<IActionResult> Abandon(Guid id,CancellationToken ct)
    {
        if(!Enabled)return NotFound();await using var tx=await db.Database.BeginTransactionAsync(ct);await Lock(ct);
        if(await Owner(ct)==null)return Unauthorized();var e=await Find(id,ct);if(e==null)return NotFound();if(e.FinishedAtUtc.HasValue)return Conflict(new{Message="ExamClosed"});e.AbandonedAtUtc??=Now();await db.SaveChangesAsync(ct);await tx.CommitAsync(ct);return Ok(new{e.Id,e.AbandonedAtUtc});
    }
    [HttpGet("{id:guid}/certificate")]
    public async Task<IActionResult> Certificate(Guid id,[FromQuery]string lang="ar",CancellationToken ct=default)
    {
        if(!Enabled)return NotFound();if(lang is not ("ar" or "en"))return BadRequest();if(await Owner(ct)==null)return Unauthorized();var e=await Find(id,ct);if(e?.VerificationCode==null||!e.FinishedAtUtc.HasValue)return NotFound();
        Response.Headers["X-Content-Type-Options"]="nosniff";
        return File(PremiumAnalyticsPdfExporter.CreateExamCertificate(e,lang=="ar"),"application/pdf",$"mathworld-exam-{e.Id:D}-{lang}.pdf");
    }
    [AllowAnonymous]
    [HttpGet("/api/exam-certificates/verify/{code}")]
    public async Task<IActionResult> Verify(string code,CancellationToken ct)
    {
        if(!Enabled||code.Length!=32||code.Any(c=>!Uri.IsHexDigit(c)))return NotFound();var e=await db.Set<CustomExam>().AsNoTracking().SingleOrDefaultAsync(e=>e.VerificationCode==code.ToLowerInvariant(),ct);if(e==null)return NotFound();
        return Ok(new{Valid=true,e.TitleAr,e.TitleEn,e.Score,e.Total,e.PassPercent,e.FinishedAtUtc,e.PolicyVersion});
    }
}
