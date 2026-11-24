using System.Security.Claims;
using System.Text.Json;
using MathWorldAPI.Data;
using MathWorldAPI.Models;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

[ApiController]
[Route("api/editorial/problems")]
[Authorize(Roles="Admin,Supervisor")]
[SupervisorEndpoint]
[ResponseCache(NoStore=true,Location=ResponseCacheLocation.None)]
public sealed class EditorialProblemsController(AppDbContext db,IConfiguration config):ControllerBase
{
    public sealed record SaveInput(int Revision,WizardProblem Content);
    public sealed record ActionInput(int Revision,string Note="",bool Confirm=false);
    private int ActorId=>int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);
    private bool Admin=>User.IsInRole(AccountRolePolicy.LegacyAdmin);

    private async Task<AppUser?> Actor(int permission,bool locked,CancellationToken ct)
    {
        IQueryable<AppUser> query=locked
            ?db.Users.FromSqlInterpolated($@"SELECT * FROM ""Users"" WHERE ""Id""={ActorId} FOR SHARE")
            :db.Users.AsNoTracking();
        var u=await query.SingleOrDefaultAsync(x=>x.Id==ActorId,ct);
        return u is not null&&u.IsActive&&!u.StaffSetupPending&&
            ((Admin&&u.Role==AccountRolePolicy.LegacyAdmin)||
             (!Admin&&u.Role==AccountRolePolicy.Supervisor&&(u.StaffPermissions&permission)==permission))?u:null;
    }
    private IQueryable<CurriculumDraftItem> Own()=>db.CurriculumDraftItems.Where(x=>x.WizardJson!=null&&(Admin||x.OwnerUserId==ActorId));
    private Task<CurriculumDraftItem?> Lock(long id,CancellationToken ct)=>db.CurriculumDraftItems
        .FromSqlInterpolated($@"SELECT * FROM ""CurriculumDraftItems"" WHERE ""Id""={id} FOR UPDATE")
        .SingleOrDefaultAsync(x=>x.WizardJson!=null&&(Admin||x.OwnerUserId==ActorId),ct);
    private void Audit(CurriculumDraftItem d,string action)=>db.PlatformActivityEvents.Add(new PlatformActivityEvent{
        ActorUserId=ActorId,ActorRole=Admin?"Admin":"Supervisor",Action=action,Resource="EditorialProblem",
        ResourceId=d.Id.ToString(),Origin="api",CreatedAtUtc=DateTime.UtcNow});
    private static object View(CurriculumDraftItem d)=>new{d.Id,d.OwnerUserId,d.LastEditorUserId,d.Revision,
        Status=d.EditorialStatus,d.SubmittedAtUtc,d.ReviewedAtUtc,d.ReviewedByUserId,d.ReviewNote,d.PublishedAtUtc,d.PublishedProblemId,
        Content=WizardProblemContract.Read(d.WizardJson!)};
    private static void Save(CurriculumDraftItem d,WizardProblem p,string json,int actor)
    {
        d.WizardJson=json;d.LastEditorUserId=actor;
        d.QuestionTextAr=p.Question?.Ar??"";d.QuestionTextEn=p.Question?.En??"";
        d.DifficultyLevel=Math.Clamp(p.DifficultyLevel,1,5);
    }
    [HttpGet("classification/{stageId:int}")]
    public async Task<IActionResult> Classification(int stageId,CancellationToken ct)
    {
        if(await Actor(AccountRolePolicy.EditDrafts,false,ct) is null)return Forbid();
        return Ok(new{
            Stages=await db.EducationalStages.OrderBy(x=>x.Id).Select(x=>new{x.Id,x.NameAr,x.NameEn}).ToListAsync(ct),
            Tracks=await db.LearningTracks.Where(x=>x.StageId==stageId).OrderBy(x=>x.SortOrder).Select(x=>new{x.Id,x.NameAr,x.NameEn,x.IsPublished}).ToListAsync(ct),
            Categories=await db.Categories.Where(x=>x.StageId==stageId).OrderBy(x=>x.Order).Select(x=>new{x.Id,x.NameAr,x.NameEn}).ToListAsync(ct),
            Skills=await db.CurriculumSkills.Where(x=>x.StageId==stageId&&x.IsPublished&&x.Domain.IsPublished).OrderBy(x=>x.SortOrder).Select(x=>new{x.Id,x.CategoryId,x.NameAr,x.NameEn}).ToListAsync(ct)});
    }
    [HttpGet]
    public async Task<IActionResult> List([FromQuery]int page=1,CancellationToken ct=default)
    {
        if(await Actor(AccountRolePolicy.EditDrafts,false,ct) is null)return Forbid();
        if(page is <1 or >10000)return BadRequest();
        var q=Own().AsNoTracking();
        var items=await q.OrderByDescending(x=>x.Id).Skip((page-1)*30).Take(30)
            .Select(x=>new{x.Id,x.OwnerUserId,x.Revision,Status=x.EditorialStatus,x.QuestionTextAr,x.QuestionTextEn,x.ReviewNote,x.PublishedProblemId}).ToListAsync(ct);
        return Ok(new{Total=await q.CountAsync(ct),Items=items});
    }
    [HttpGet("{id:long}")]
    public async Task<IActionResult> Detail(long id,CancellationToken ct)
    {
        if(await Actor(AccountRolePolicy.EditDrafts,false,ct) is null)return Forbid();
        var d=await Own().AsNoTracking().SingleOrDefaultAsync(x=>x.Id==id,ct);
        return d is null?NotFound():Ok(View(d));
    }
    [HttpPost]
    public async Task<IActionResult> Create(SaveInput input,CancellationToken ct)
    {
        if(input.Content is null)return BadRequest();
        var json=WizardProblemContract.Serialize(input.Content);
        if(json.Length>180000)return BadRequest(new{Message="DraftTooLarge"});
        await using var tx=await db.Database.BeginTransactionAsync(ct);
        if(await Actor(AccountRolePolicy.EditDrafts,true,ct) is null)return Forbid();
        var d=new CurriculumDraftItem{OwnerUserId=ActorId,ContentKey="wizard-"+Guid.NewGuid().ToString("N"),EditorialStatus="Draft"};
        Save(d,input.Content,json,ActorId);db.CurriculumDraftItems.Add(d);await db.SaveChangesAsync(ct);
        Audit(d,"EditorialDraftCreated");await db.SaveChangesAsync(ct);await tx.CommitAsync(ct);
        return StatusCode(201,View(d));
    }
    [HttpPut("{id:long}")]
    public async Task<IActionResult> Update(long id,SaveInput input,CancellationToken ct)
    {
        if(input.Content is null)return BadRequest();
        var json=WizardProblemContract.Serialize(input.Content);
        if(json.Length>180000)return BadRequest(new{Message="DraftTooLarge"});
        await using var tx=await db.Database.BeginTransactionAsync(ct);
        if(await Actor(AccountRolePolicy.EditDrafts,true,ct) is null)return Forbid();
        var d=await Lock(id,ct);if(d is null)return NotFound();
        if(d.Revision!=input.Revision||d.Revision==int.MaxValue||d.EditorialStatus is not ("Draft" or "NeedsChanges"))
            return Conflict(new{Message="DraftChangedOrLocked"});
        Save(d,input.Content,json,ActorId);d.Revision++;
        Audit(d,"EditorialDraftUpdated");await db.SaveChangesAsync(ct);await tx.CommitAsync(ct);return Ok(View(d));
    }
    private async Task<List<string>> Validate(WizardProblem p,CancellationToken ct)
    {
        var errors=WizardProblemContract.Validate(p);if(errors.Count>0)return errors;
        var skills=new[]{p.PrimarySkillId}.Concat(p.SecondarySkillIds??Array.Empty<int>()).ToArray();
        if(!await db.Categories.AnyAsync(c=>c.Id==p.CategoryId&&c.StageId==p.StageId,ct))errors.Add("CategoryStageMismatch");
        if(await db.CurriculumSkills.CountAsync(s=>skills.Contains(s.Id)&&s.StageId==p.StageId&&s.CategoryId==p.CategoryId&&s.IsPublished&&s.Domain.IsPublished,ct)!=skills.Length)errors.Add("SkillCategoryMismatch");
        if(await db.LearningTracks.CountAsync(t=>p.TrackIds!.Contains(t.Id)&&t.StageId==p.StageId,ct)!=p.TrackIds!.Length)errors.Add("TrackStageMismatch");
        var existing=await db.Problems.AsNoTracking().Where(x=>x.StageId==p.StageId).Select(x=>new{x.QuestionTextAr,x.QuestionTextEn}).ToListAsync(ct);
        if(existing.Any(x=>WizardProblemContract.Normalize(x.QuestionTextAr)==WizardProblemContract.Normalize(p.Question!.Ar)||
            WizardProblemContract.Normalize(x.QuestionTextEn)==WizardProblemContract.Normalize(p.Question!.En)))errors.Add("QuestionAlreadyExists");
        return errors;
    }
    [HttpPost("{id:long}/submit")]
    public async Task<IActionResult> Submit(long id,ActionInput input,CancellationToken ct)
    {
        await using var tx=await db.Database.BeginTransactionAsync(ct);
        if(await Actor(AccountRolePolicy.SubmitDrafts,true,ct) is null)return Forbid();
        var d=await Lock(id,ct);if(d is null)return NotFound();
        if(d.Revision!=input.Revision||d.Revision==int.MaxValue||d.EditorialStatus is not ("Draft" or "NeedsChanges"))return Conflict();
        var errors=await Validate(WizardProblemContract.Read(d.WizardJson!),ct);
        if(errors.Count>0)return BadRequest(new{Message="EditorialValidationFailed",Errors=errors});
        d.EditorialStatus="PendingReview";d.SubmittedAtUtc=DateTime.UtcNow;d.Revision++;
        Audit(d,"EditorialDraftSubmitted");await db.SaveChangesAsync(ct);await tx.CommitAsync(ct);return Ok(View(d));
    }
    [HttpPost("{id:long}/review")]
    public async Task<IActionResult> Review(long id,ActionInput input,CancellationToken ct)
    {
        if(!Admin)return Forbid();
        if(!WizardProblemContract.Text(input.Note,2000))return BadRequest(new{Message="ReviewNoteRequired"});
        await using var tx=await db.Database.BeginTransactionAsync(ct);
        if(await Actor(0,true,ct) is null)return Forbid();
        var d=await Lock(id,ct);if(d is null)return NotFound();
        if(d.Revision!=input.Revision||d.Revision==int.MaxValue||d.EditorialStatus is not ("PendingReview" or "Approved"))return Conflict();
        if(input.Confirm)
        {
            var errors=await Validate(WizardProblemContract.Read(d.WizardJson!),ct);
            if(errors.Count>0)return Conflict(new{Message="EditorialValidationFailed",Errors=errors});
        }
        d.EditorialStatus=input.Confirm?"Approved":"NeedsChanges";d.ReviewedAtUtc=DateTime.UtcNow;
        d.ReviewedByUserId=ActorId;d.ReviewNote=input.Note.Trim();d.Revision++;
        Audit(d,input.Confirm?"EditorialDraftApproved":"EditorialDraftReturned");await db.SaveChangesAsync(ct);await tx.CommitAsync(ct);return Ok(View(d));
    }
    [HttpPost("{id:long}/publish")]
    public async Task<IActionResult> Publish(long id,ActionInput input,CancellationToken ct)
    {
        if(!Admin)return Forbid();
        if(!input.Confirm)return BadRequest();
        if(!config.GetValue<bool>("EditorialWizard:PublicationEnabled"))return Conflict(new{Message="EditorialPublicationDisabled"});
        await using var tx=await db.Database.BeginTransactionAsync(ct);
        if(await Actor(0,true,ct) is null)return Forbid();
        await db.Database.SqlQuery<int>($"SELECT 1 AS \"Value\" FROM pg_advisory_xact_lock({-987654319})").SingleAsync(ct);
        var d=await Lock(id,ct);if(d is null)return NotFound();
        if(d.Revision!=input.Revision||d.Revision==int.MaxValue||d.EditorialStatus!="Approved"||d.PublishedProblemId.HasValue)return Conflict();
        var p=WizardProblemContract.Read(d.WizardJson!);
        var errors=await Validate(p,ct);if(errors.Count>0)return Conflict(new{Message="EditorialValidationFailed",Errors=errors});
        // Lock target track revisions before adding links. Existing published tracks remain valid.
        var trackIds=p.TrackIds!.Order().ToArray();
        var tracks=await db.LearningTracks.FromSqlInterpolated($@"SELECT * FROM ""LearningTracks"" WHERE ""Id""=ANY({trackIds}) ORDER BY ""Id"" FOR UPDATE").ToListAsync(ct);
        if(tracks.Count!=trackIds.Length||tracks.Any(t=>t.StageId!=p.StageId||t.Revision==int.MaxValue))return Conflict();
        var flatAr=WizardProblemContract.FlatSolution(p.Solution!,true);var flatEn=WizardProblemContract.FlatSolution(p.Solution!,false);
        if(flatAr.Length>12000||flatEn.Length>12000)return Conflict(new{Message="SolutionTooLong"});
        var problem=new MathProblem{StageId=p.StageId,CategoryId=p.CategoryId,Points=p.Points,
            TitleAr=p.Title!.Ar.Trim(),TitleEn=p.Title.En.Trim(),QuestionTextAr=p.Question!.Ar.Trim(),QuestionTextEn=p.Question.En.Trim(),
            DetailedSolutionAr=flatAr,DetailedSolutionEn=flatEn,
            EditorialDetailsJson=JsonSerializer.Serialize(new{p.DifficultyLevel,p.Hints,p.Solution,
                Distractors=p.Options!.Select((o,i)=>new{o.ErrorType,o.Reason,Order=i+1}).ToArray()}),
            Options=p.Options!.Select((o,i)=>new QuestionOption{LatexCode=o.LatexCode.Trim(),IsCorrect=o.IsCorrect,Order=i+1}).ToList()};
        db.Problems.Add(problem);await db.SaveChangesAsync(ct);
        var skillIds=new[]{p.PrimarySkillId}.Concat(p.SecondarySkillIds??Array.Empty<int>()).ToArray();
        db.CurriculumProblemSkills.AddRange(skillIds.Select(x=>new CurriculumProblemSkill{ProblemId=problem.Id,SkillId=x,IsPrimary=x==p.PrimarySkillId}));
        foreach(var t in tracks)
        {
            if(!await db.LearningTrackCategories.AnyAsync(x=>x.TrackId==t.Id&&x.CategoryId==p.CategoryId,ct))
                db.LearningTrackCategories.Add(new LearningTrackCategory{TrackId=t.Id,CategoryId=p.CategoryId});
            var linked=await db.LearningTrackSkills.Where(x=>x.TrackId==t.Id&&skillIds.Contains(x.SkillId)).Select(x=>x.SkillId).ToListAsync(ct);
            db.LearningTrackSkills.AddRange(skillIds.Where(x=>!linked.Contains(x)).Select(x=>new LearningTrackSkill{TrackId=t.Id,SkillId=x}));
            db.LearningTrackProblems.Add(new LearningTrackProblem{TrackId=t.Id,ProblemId=problem.Id});t.Revision++;
        }
        d.PublishedProblemId=problem.Id;d.PublishedAtUtc=DateTime.UtcNow;d.EditorialStatus="Published";d.Revision++;
        Audit(d,"EditorialDraftPublished");await db.SaveChangesAsync(ct);await tx.CommitAsync(ct);return Ok(View(d));
    }
}
