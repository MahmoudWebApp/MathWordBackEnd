using System.Security.Claims;
using System.Text.Json;
using System.Security.Cryptography;
using System.Text;
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
public sealed partial class EditorialProblemsController:ControllerBase
{
    private readonly AppDbContext db;
    private readonly IConfiguration config;
    public EditorialProblemsController(AppDbContext db,IConfiguration config){this.db=db;this.config=config;}
    public sealed record SaveInput(int Revision,WizardProblem Content);
    public sealed record ActionInput(int Revision,string Note="",bool Confirm=false,bool DirectApproval=false);
    public sealed record ImportRow(string ContentKey,string PrimarySkillKey,string[] ProposedTrackCodes,WizardProblem Content);
    public sealed record ImportInput(ImportRow[] Items,bool Confirm=false);
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
        d.SourceProblemId, LegacySolutionAr=d.SourceProblemId.HasValue?d.DetailedSolutionAr:null, LegacySolutionEn=d.SourceProblemId.HasValue?d.DetailedSolutionEn:null,
        Content=WizardProblemContract.Read(d.WizardJson!)};
    private static void Save(CurriculumDraftItem d,WizardProblem p,string json,int actor)
    {
        d.WizardJson=json;d.LastEditorUserId=actor;
        d.QuestionTextAr=p.Question?.Ar??"";d.QuestionTextEn=p.Question?.En??"";
        d.DifficultyLevel=Math.Clamp(p.DifficultyLevel,1,5);
    }
    // The immutable, server-embedded package is visible only to active administrators.
    // The existing import/review routes remain the sole mutation paths.
    [HttpGet("reviewed-bank")]
    public async Task<IActionResult> ReviewedBank(CancellationToken ct)
    {
        if(!Admin||await Actor(0,false,ct) is null)return Forbid();
        var catalog=ReviewedBankCatalog.Current;
        return Ok(new{catalog.HeldCount,PublicationEnabled=config.GetValue<bool>("EditorialWizard:PublicationEnabled"),
            Batches=catalog.Batches.Select(b=>new{b.Kind,b.Number,Count=b.Items.Length})});
    }

    [HttpGet("reviewed-bank/{kind}/{number:int}")]
    public async Task<IActionResult> ReviewedBankBatch(string kind,int number,CancellationToken ct)
    {
        if(!Admin||await Actor(0,false,ct) is null)return Forbid();
        var batch=ReviewedBankCatalog.Current.Batches.SingleOrDefault(b=>b.Kind==kind&&b.Number==number);
        if(batch is null)return NotFound();
        // Read current states by fixed package identity, never by arbitrary client-supplied draft IDs.
        var keys=batch.Kind=="hints"?Array.Empty<string>():batch.Items.Select(row=>
            batch.Kind=="amendments"?"g1-amend-"+row.GetProperty("ProblemId").GetInt32():
                row.GetProperty("ContentKey").GetString()!).ToArray();
        var drafts=await db.CurriculumDraftItems.AsNoTracking().Where(d=>keys.Contains(d.ContentKey)&&d.WizardJson!=null)
            .Select(d=>new{d.Id,d.ContentKey,d.PrimarySkillKey,d.SourceProblemId,d.Revision,Status=d.EditorialStatus,d.PublishedProblemId,d.WizardJson})
            .ToListAsync(ct);
        var trackCodes=(await db.LearningTracks.AsNoTracking().Select(t=>new{t.Id,t.StageId,t.Code}).ToListAsync(ct))
            .ToDictionary(t=>t.Id,t=>(t.StageId,t.Code));
        var sourceIds=batch.Kind=="amendments"?batch.Items.Select(r=>r.GetProperty("ProblemId").GetInt32()).ToArray():Array.Empty<int>();
        var sourceTracks=(await db.LearningTrackProblems.AsNoTracking().Where(x=>sourceIds.Contains(x.ProblemId))
            .Select(x=>new{x.ProblemId,x.TrackId}).ToListAsync(ct)).ToLookup(x=>x.ProblemId,x=>x.TrackId);
        var sourceSecondary=(await db.CurriculumProblemSkills.AsNoTracking().Where(x=>sourceIds.Contains(x.ProblemId)&&!x.IsPrimary)
            .Select(x=>new{x.ProblemId,x.SkillId}).ToListAsync(ct)).ToLookup(x=>x.ProblemId,x=>x.SkillId);
        string[] Codes(JsonElement row)=>batch.Kind=="amendments"?new[]{row.GetProperty("ProposedTrackCode").GetString()!}:
            row.GetProperty("ProposedTrackCodes").EnumerateArray().Select(c=>c.GetString()!).ToArray();
        bool ValidMapping(JsonElement row)
        {
            var stage=row.GetProperty("Content").GetProperty("StageId").GetInt32();
            var codes=Codes(row);
            if(batch.Kind!="amendments")return codes.All(c=>trackCodes.Values.Any(t=>t.StageId==stage&&t.Code==c));
            var pid=row.GetProperty("ProblemId").GetInt32();
            return codes.All(c=>sourceTracks[pid].Any(id=>trackCodes.TryGetValue(id,out var t)&&t.StageId==stage&&t.Code==c));
        }
        var missingMappings=batch.Kind=="hints"?0:batch.Items.Count(row=>!ValidMapping(row));
        var states=drafts.Select(d=>{
            var row=batch.Items[Array.IndexOf(keys,d.ContentKey)];
            var expected=row.GetProperty("Content").Deserialize<WizardProblem>()!;
            var actual=WizardProblemContract.Read(d.WizardJson!);
            var codes=Codes(row);
            var actualIds=actual.TrackIds??Array.Empty<int>();
            var actualCodes=actualIds.Where(trackCodes.ContainsKey)
                .Select(id=>trackCodes[id]).Where(t=>t.StageId==actual.StageId).Select(t=>t.Code).ToArray();
            var amendment=batch.Kind=="amendments";
            var pid=amendment?row.GetProperty("ProblemId").GetInt32():0;
            var trackMatch=ValidMapping(row)&&codes.All(actualCodes.Contains)&&actualIds.Length==actualCodes.Length&&
                (amendment?actualIds.Order().SequenceEqual(sourceTracks[pid].Order()):actualCodes.Length==codes.Length);
            var secondaryMatch=(actual.SecondarySkillIds??Array.Empty<int>()).Order().SequenceEqual(
                amendment?sourceSecondary[pid].Order():(expected.SecondarySkillIds??Array.Empty<int>()).Order());
            // Only fields resolved during the validated import may differ from the package.
            var normalized=actual with{TrackIds=expected.TrackIds,SecondarySkillIds=expected.SecondarySkillIds,
                DifficultyLevel=amendment?expected.DifficultyLevel:actual.DifficultyLevel};
            var matches=trackMatch&&secondaryMatch&&(!amendment||actual.DifficultyLevel==1)&&
                d.PrimarySkillKey==row.GetProperty("PrimarySkillKey").GetString()&&
                (amendment?d.SourceProblemId==pid:d.SourceProblemId==null)&&
                WizardProblemContract.Serialize(normalized)==WizardProblemContract.Serialize(expected);
            return new{d.Id,d.ContentKey,d.Revision,d.Status,d.PublishedProblemId,MatchesCandidate=matches};
        }).ToArray();
        return Ok(new{batch.Kind,batch.Number,batch.Items,Drafts=states,MissingMappings=missingMappings});
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
    public async Task<IActionResult> List([FromQuery]int page=1,[FromQuery]bool activeOnly=false,[FromQuery]bool supervisorReviewOnly=false,[FromQuery]bool ownOnly=false,CancellationToken ct=default)
    {
        if(await Actor(AccountRolePolicy.EditDrafts,false,ct) is null)return Forbid();
        if(page is <1 or >10000)return BadRequest();
        var q=Own().AsNoTracking();
        if(supervisorReviewOnly)
        {
            if(!Admin)return Forbid();
            q=q.Where(x=>x.OwnerUserId!=null&&db.Users.Any(u=>u.Id==x.OwnerUserId&&u.Role==AccountRolePolicy.Supervisor)
                &&(x.EditorialStatus=="PendingReview"||x.EditorialStatus=="Approved"));
        }
        if(ownOnly)q=q.Where(x=>x.OwnerUserId==ActorId);
        if(activeOnly)q=q.Where(x=>x.EditorialStatus=="Draft"||x.EditorialStatus=="NeedsChanges"||x.EditorialStatus=="PendingReview"||x.EditorialStatus=="Approved");
        var items=await q.OrderByDescending(x=>x.Id).Skip((page-1)*30).Take(30)
            .Select(x=>new{x.Id,x.OwnerUserId,x.Revision,Status=x.EditorialStatus,x.QuestionTextAr,x.QuestionTextEn,x.ReviewNote,x.PublishedProblemId,x.SourceProblemId}).ToListAsync(ct);
        return Ok(new{Total=await q.CountAsync(ct),Items=items});
    }
    [HttpGet("{id:long}")]
    public async Task<IActionResult> Detail(long id,CancellationToken ct)
    {
        if(await Actor(AccountRolePolicy.EditDrafts,false,ct) is null)return Forbid();
        var d=await Own().AsNoTracking().SingleOrDefaultAsync(x=>x.Id==id,ct);
        return d is null?NotFound():Ok(View(d));
    }
    // Hash immutable question data and current editorial material, never learner counters.
    private static string Fingerprint(MathProblem p)=>Convert.ToHexString(SHA256.HashData(Encoding.UTF8.GetBytes(
        JsonSerializer.Serialize(new{p.Id,p.StageId,p.CategoryId,p.Points,p.TitleAr,p.TitleEn,p.QuestionTextAr,p.QuestionTextEn,
            p.DetailedSolutionAr,p.DetailedSolutionEn,p.YoutubeSolutionUrl,p.EditorialDetailsJson,
            Options=p.Options.OrderBy(o=>o.Order).ThenBy(o=>o.Id).Select(o=>new{o.Id,o.Order,o.LatexCode,o.IsCorrect})}))));
    private static bool SameQuestion(MathProblem source,WizardProblem p)
    {
        var options=source.Options.OrderBy(o=>o.Order).ThenBy(o=>o.Id).ToArray();
        return p.StageId==source.StageId&&p.CategoryId==source.CategoryId&&p.Points==source.Points&&
            p.Question?.Ar==source.QuestionTextAr&&p.Question?.En==source.QuestionTextEn&&
            p.Options is {Length:4}&&options.Length==4&&p.Options.Select((o,i)=>o is not null&&
                o.LatexCode==options[i].LatexCode&&o.IsCorrect==options[i].IsCorrect).All(x=>x);
    }

    [HttpGet("bank")]
    public async Task<IActionResult> Bank([FromQuery]int page=1,[FromQuery]int? stageId=null,[FromQuery]int? categoryId=null,[FromQuery]int? trackId=null,[FromQuery]string? search=null,[FromQuery]string? status=null,CancellationToken ct=default)
    {
        if(await Actor(AccountRolePolicy.EditDrafts,false,ct) is null)return Forbid();
        if(page is <1 or >10000||search?.Length>160||status is not (null or "open" or "clear"))return BadRequest();
        var q=db.Problems.AsNoTracking().Where(p=>(stageId==null||p.StageId==stageId)&&(categoryId==null||p.CategoryId==categoryId));
        if(trackId.HasValue)q=q.Where(p=>db.LearningTrackProblems.Any(t=>t.TrackId==trackId.Value&&t.ProblemId==p.Id));
        if(!string.IsNullOrWhiteSpace(search))
        {
            var term=search.Trim();
            var isId=int.TryParse(term.TrimStart('#'),out var problemId);
            q=q.Where(p=>(isId&&p.Id==problemId)||p.TitleAr.Contains(term)||p.TitleEn.ToLower().Contains(term.ToLower())||p.QuestionTextAr.Contains(term)||p.QuestionTextEn.ToLower().Contains(term.ToLower()));
        }
        if(status=="open")q=q.Where(p=>db.CurriculumDraftItems.Any(d=>d.SourceProblemId==p.Id&&d.WizardJson!=null&&d.EditorialStatus!="Published"&&d.EditorialStatus!="Withdrawn"));
        if(status=="clear")q=q.Where(p=>!db.CurriculumDraftItems.Any(d=>d.SourceProblemId==p.Id&&d.WizardJson!=null&&d.EditorialStatus!="Published"&&d.EditorialStatus!="Withdrawn"));
        var items=await q.OrderBy(p=>p.StageId).ThenBy(p=>p.CategoryId).ThenBy(p=>p.Id).Skip((page-1)*30).Take(30)
            .Select(p=>new{p.Id,p.StageId,p.CategoryId,p.TitleAr,p.TitleEn,p.EditorialDetailsJson,
                OpenReviewId=db.CurriculumDraftItems.Where(d=>d.SourceProblemId==p.Id&&d.WizardJson!=null&&d.EditorialStatus!="Published"&&d.EditorialStatus!="Withdrawn"&&(Admin||d.OwnerUserId==ActorId)).OrderByDescending(d=>d.Id).Select(d=>(long?)d.Id).FirstOrDefault(),
                HasOpenReview=db.CurriculumDraftItems.Any(d=>d.SourceProblemId==p.Id&&d.EditorialStatus!="Published"&&d.EditorialStatus!="Withdrawn")}).ToListAsync(ct);
        return Ok(new{Total=await q.CountAsync(ct),Items=items.Select(p=>new{p.Id,p.StageId,p.CategoryId,p.TitleAr,p.TitleEn,HasStructuredSolution=WizardProblemContract.HasStructuredSolution(p.EditorialDetailsJson),p.HasOpenReview,p.OpenReviewId})});
    }
    [HttpPost("amend/{problemId:int}")]
    public async Task<IActionResult> Amend(int problemId,CancellationToken ct)
    {
        await using var tx=await db.Database.BeginTransactionAsync(ct);
        if(await Actor(AccountRolePolicy.EditDrafts,true,ct) is null)return Forbid();
        await ProblemTransactionLocks.LockQuestionForAdminMutationAsync(db,problemId,ct);
        var p=await db.Problems.AsNoTracking().Include(x=>x.Options).SingleOrDefaultAsync(x=>x.Id==problemId,ct);
        if(p is null)return NotFound();
        if(await db.CurriculumDraftItems.AnyAsync(x=>x.SourceProblemId==problemId&&x.EditorialStatus!="Published"&&x.EditorialStatus!="Withdrawn",ct))
            return Conflict(new{Message="AmendmentAlreadyOpen"});
        var skills=await db.CurriculumProblemSkills.Where(x=>x.ProblemId==problemId).ToListAsync(ct);
        var tracks=await db.LearningTrackProblems.Where(x=>x.ProblemId==problemId).Select(x=>x.TrackId).ToArrayAsync(ct);
        var options=p.Options.OrderBy(o=>o.Order).ThenBy(o=>o.Id).Select(o=>new WizardOption(o.LatexCode,o.IsCorrect)).ToArray();
        var content=new WizardProblem(StageId:p.StageId,CategoryId:p.CategoryId,Points:p.Points,
            PrimarySkillId:skills.SingleOrDefault(x=>x.IsPrimary)?.SkillId??0,SecondarySkillIds:skills.Where(x=>!x.IsPrimary).Select(x=>x.SkillId).ToArray(),
            TrackIds:tracks,Title:new(p.TitleAr,p.TitleEn),Question:new(p.QuestionTextAr,p.QuestionTextEn),Options:options);
        if(p.EditorialDetailsJson is not null)
        {
            using var doc=JsonDocument.Parse(p.EditorialDetailsJson);var root=doc.RootElement;
            var hints=root.TryGetProperty("Hints",out var h)?h.Deserialize<BilingualText[]>():null;
            var solution=root.TryGetProperty("Solution",out var sol)?sol.Deserialize<WizardSolution>():null;
            if(root.TryGetProperty("Distractors",out var ds)&&ds.ValueKind==JsonValueKind.Array)
            {
                var details=ds.EnumerateArray().ToArray();
                if(details.Length==options.Length)options=options.Select((o,i)=>o with {
                    ErrorType=details[i].GetProperty("ErrorType").GetString()??"",
                    Reason=details[i].GetProperty("Reason").Deserialize<BilingualText>()
                }).ToArray();
            }
            content=content with{Hints=hints,Solution=solution,Options=options,DifficultyLevel=root.TryGetProperty("DifficultyLevel",out var difficulty)?difficulty.GetInt32():1};
        }
        var d=new CurriculumDraftItem{OwnerUserId=ActorId,ContentKey="amend-"+Guid.NewGuid().ToString("N"),EditorialStatus="Draft",
            SourceProblemId=p.Id,SourceFingerprint=Fingerprint(p),DetailedSolutionAr=p.DetailedSolutionAr,DetailedSolutionEn=p.DetailedSolutionEn};
        Save(d,content,WizardProblemContract.Serialize(content),ActorId);
        db.CurriculumDraftItems.Add(d);await db.SaveChangesAsync(ct);Audit(d,"EditorialAmendmentCreated");
        await db.SaveChangesAsync(ct);await tx.CommitAsync(ct);return StatusCode(201,View(d));
    }
    public sealed record AmendmentImportRow(int ProblemId,int[] ExpectedOptionIds,BilingualText ExpectedLegacySolution,
        string PrimarySkillKey,WizardProblem Content,string Status);
    public sealed record AmendmentImportInput(AmendmentImportRow[] Items,bool Confirm=false);

    public sealed record HintImportRow(int ProblemId,string PrimarySkillKey,BilingualText Question,
        BilingualText[] Hints,bool TaxonomyReviewPending=false);
    public sealed record HintImportInput(HintImportRow[] Items,bool Confirm=false,string PreviewToken="",string ReviewNote="");
    // Hints-only publication is independent of the full structured solution workflow.
    // Admin must review the exact payload and previewed source fingerprint before applying.
    [HttpPost("hints/import")]
    [RequestSizeLimit(2_000_000)]
    public async Task<IActionResult> ImportReviewedHints(HintImportInput input,CancellationToken ct)
    {
        if(!Admin)return Forbid();
        if(input.Items is null||input.Items.Length is <1 or >50||
            input.Items.Any(r=>r is null||r.ProblemId<=0||r.TaxonomyReviewPending||
                !WizardProblemContract.Text(r.PrimarySkillKey,160)||!WizardProblemContract.Pair(r.Question,5000)||
                r.Hints is not {Length:2}||r.Hints.Any(h=>!WizardProblemContract.Pair(h,1000))||
                WizardProblemContract.Normalize(r.Hints[0].Ar)==WizardProblemContract.Normalize(r.Hints[1].Ar)||
                WizardProblemContract.Normalize(r.Hints[0].En)==WizardProblemContract.Normalize(r.Hints[1].En))||
            input.Items.Select(r=>r.ProblemId).Distinct().Count()!=input.Items.Length||
            (input.Confirm&&(!WizardProblemContract.Text(input.PreviewToken,64)||input.PreviewToken.Length!=64||
                !WizardProblemContract.Text(input.ReviewNote,2000))))
            return BadRequest(new{Message="InvalidHintBatch"});
        await using var tx=await db.Database.BeginTransactionAsync(ct);
        if(await Actor(0,true,ct) is null)return Forbid();
        await db.Database.SqlQuery<int>($"SELECT 1 AS \"Value\" FROM pg_advisory_xact_lock({-987654319})").SingleAsync(ct);
        var changes=new List<(MathProblem Problem,string Metadata)>();
        var results=new List<object>();var sources=new List<object>();var failed=false;
        foreach(var row in input.Items.OrderBy(r=>r.ProblemId))
        {
            await ProblemTransactionLocks.LockQuestionForAdminMutationAsync(db,row.ProblemId,ct);
            var problem=await db.Problems.Include(p=>p.Options).SingleOrDefaultAsync(p=>p.Id==row.ProblemId,ct);
            var errors=new List<string>();var already=false;
            if(problem is null)errors.Add("ProblemNotFound");
            else
            {
                if(problem.QuestionTextAr!=row.Question.Ar||problem.QuestionTextEn!=row.Question.En)
                    errors.Add("HintSourceChanged");
                var primary=await db.CurriculumProblemSkills.AsNoTracking().Where(s=>s.ProblemId==problem.Id&&s.IsPrimary)
                    .Select(s=>s.SkillId).ToArrayAsync(ct);
                var key=primary.Length==1?await db.CurriculumSkills.AsNoTracking()
                    .Where(s=>s.Id==primary[0]&&s.IsPublished&&s.Domain.IsPublished).Select(s=>s.StableKey).SingleOrDefaultAsync(ct):null;
                if(key!=row.PrimarySkillKey)errors.Add("HintSkillChanged");
                if(await db.CurriculumDraftItems.AnyAsync(d=>d.SourceProblemId==problem.Id&&
                    d.EditorialStatus!="Published"&&d.EditorialStatus!="Withdrawn",ct))errors.Add("AmendmentAlreadyOpen");
                if(problem.Options.Count!=4||problem.Options.Count(o=>o.IsCorrect)!=1||
                    problem.Options.Select(o=>WizardProblemContract.Normalize(o.LatexCode)).Distinct().Count()!=4)
                    errors.Add("InvalidSourceOptions");
                var metadata=JsonSerializer.Serialize(new{Kind="ReviewedHintsOnly",row.Hints});
                already=problem.EditorialDetailsJson==metadata;
                if(problem.EditorialDetailsJson is not null&&!already)errors.Add("ExistingEditorialContentRequiresReview");
                sources.Add(new{row.ProblemId,Fingerprint=Fingerprint(problem),PrimarySkillId=primary.Length==1?primary[0]:0,row.PrimarySkillKey,row.Hints});
                if(errors.Count==0&&!already)changes.Add((problem,metadata));
            }
            if(errors.Count>0)failed=true;
            results.Add(new{row.ProblemId,Status=errors.Count>0?"Invalid":already?"AlreadyExists":"Ready",Errors=errors.ToArray()});
        }
        if(failed)return BadRequest(new{Message="HintBatchInvalid",Items=results});
        var token=Convert.ToHexString(SHA256.HashData(Encoding.UTF8.GetBytes(JsonSerializer.Serialize(new{ActorId,Sources=sources}))));
        if(!input.Confirm)return Ok(new{Applied=0,Ready=changes.Count,PreviewToken=token,Items=results});
        if(!string.Equals(token,input.PreviewToken,StringComparison.Ordinal))
            return Conflict(new{Message="HintPreviewChanged"});
        foreach(var (problem,metadata) in changes)
        {
            problem.EditorialDetailsJson=metadata;
            db.PlatformActivityEvents.Add(new PlatformActivityEvent{ActorUserId=ActorId,ActorRole="Admin",
                Action="ReviewedProblemHintsPublished",Resource="Problem",ResourceId=problem.Id.ToString(),
                Origin="api",CreatedAtUtc=DateTime.UtcNow});
        }
        await db.SaveChangesAsync(ct);await tx.CommitAsync(ct);
        return Ok(new{Applied=changes.Count,Ready=0,Items=results});
    }

    // Prepared improvements for existing problems only. Preview and confirm
    // never update live questions, change classification, or approve a draft.
    [HttpPost("amend/import")]
    [RequestSizeLimit(2_000_000)]
    public async Task<IActionResult> ImportAmendments(AmendmentImportInput input,CancellationToken ct)
    {
        if(!Admin)return Forbid();
        if(input.Items is null||input.Items.Length is <1 or >50||
            input.Items.Any(r=>r is null||r.ProblemId<=0||r.Status!="StructuredAmendmentCandidateNotImported"||
                r.ExpectedOptionIds is not {Length:4}||r.ExpectedOptionIds.Any(i=>i<=0)||
                r.ExpectedOptionIds.Distinct().Count()!=4||r.ExpectedLegacySolution is null||
                !WizardProblemContract.Text(r.PrimarySkillKey,160)||r.Content is null)||
            input.Items.Select(r=>r.ProblemId).Distinct().Count()!=input.Items.Length)
            return BadRequest(new{Message="InvalidAmendmentBatch"});
        await using var tx=await db.Database.BeginTransactionAsync(ct);
        if(await Actor(0,true,ct) is null)return Forbid();
        // Lock order matches publication; ascending problem IDs avoid cross-batch deadlocks.
        await db.Database.SqlQuery<int>($"SELECT 1 AS \"Value\" FROM pg_advisory_xact_lock({-987654319})").SingleAsync(ct);
        var drafts=new List<CurriculumDraftItem>();
        var results=new List<object>();var failed=false;
        foreach(var row in input.Items.OrderBy(r=>r.ProblemId))
        {
            var errors=new List<string>();long? existingId=null;var already=false;
            await ProblemTransactionLocks.LockQuestionForAdminMutationAsync(db,row.ProblemId,ct);
            var p=await db.Problems.AsNoTracking().Include(x=>x.Options).SingleOrDefaultAsync(x=>x.Id==row.ProblemId,ct);
            if(p is null)errors.Add("ProblemNotFound");
            else
            {
                var options=p.Options.OrderBy(o=>o.Order).ThenBy(o=>o.Id).ToArray();
                if(!SameQuestion(p,row.Content)||row.Content.Title?.Ar!=p.TitleAr||row.Content.Title?.En!=p.TitleEn||
                    !options.Select(o=>o.Id).SequenceEqual(row.ExpectedOptionIds)||
                    row.ExpectedLegacySolution.Ar!=p.DetailedSolutionAr||row.ExpectedLegacySolution.En!=p.DetailedSolutionEn)
                    errors.Add("AmendmentSourceChanged");
                if(p.EditorialDetailsJson is not null&&!WizardProblemContract.IsHintsOnly(p.EditorialDetailsJson))errors.Add("ExistingStructuredContentRequiresManualMerge");
                var skills=await db.CurriculumProblemSkills.AsNoTracking().Where(x=>x.ProblemId==p.Id).ToListAsync(ct);
                var primary=skills.SingleOrDefault(x=>x.IsPrimary)?.SkillId??0;
                var key=await db.CurriculumSkills.AsNoTracking().Where(x=>x.Id==primary&&x.IsPublished&&x.Domain.IsPublished)
                    .Select(x=>x.StableKey).SingleOrDefaultAsync(ct);
                if(primary<=0||row.Content.PrimarySkillId!=primary||key!=row.PrimarySkillKey)errors.Add("AmendmentSkillChanged");
                var trackIds=await db.LearningTrackProblems.Where(x=>x.ProblemId==p.Id).Select(x=>x.TrackId).OrderBy(x=>x).ToArrayAsync(ct);
                // The candidate cannot assign an unapproved track or remove existing skills.
                var content=row.Content with{PrimarySkillId=primary,SecondarySkillIds=skills.Where(x=>!x.IsPrimary).Select(x=>x.SkillId).OrderBy(x=>x).ToArray(),
                    TrackIds=trackIds,DifficultyLevel=1};
                // A legacy question may not yet have a mapped track. Validate all
                // other content now; normal submit validation still requires a real track.
                errors.AddRange(WizardProblemContract.Validate(trackIds.Length==0?content with{TrackIds=new[]{1}}:content));
                var json=WizardProblemContract.Serialize(content);
                if(json.Length>180000)errors.Add("DraftTooLarge");
                var existing=await db.CurriculumDraftItems.AsNoTracking().SingleOrDefaultAsync(x=>x.SourceProblemId==p.Id&&
                    x.EditorialStatus!="Published"&&x.EditorialStatus!="Withdrawn",ct);
                if(existing is not null)
                {
                    existingId=existing.Id;
                    // A retry of the exact unedited import is harmless. Do not replace
                    // independently created drafts, revisions, or review decisions.
                    already=existing.ContentKey=="g1-amend-"+p.Id&&existing.EditorialStatus=="Draft"&&
                        existing.Revision==0&&existing.SourceFingerprint==Fingerprint(p)&&existing.WizardJson==json;
                    if(!already)errors.Add("AmendmentAlreadyOpen");
                }
                if(errors.Count==0&&!already)
                {
                    var contentKey="g1-amend-"+p.Id;
                    if(await db.CurriculumDraftItems.AnyAsync(x=>x.ContentKey==contentKey,ct))errors.Add("AmendmentKeyAlreadyUsed");
                    else
                    {
                        var d=new CurriculumDraftItem{OwnerUserId=ActorId,ContentKey=contentKey,PrimarySkillKey=key!,
                            EditorialStatus="Draft",SourceProblemId=p.Id,SourceFingerprint=Fingerprint(p),
                            DetailedSolutionAr=p.DetailedSolutionAr,DetailedSolutionEn=p.DetailedSolutionEn};
                        Save(d,content,json,ActorId);drafts.Add(d);
                    }
                }
            }
            if(errors.Count>0)failed=true;
            results.Add(new{row.ProblemId,Status=errors.Count>0?"Invalid":already?"AlreadyExists":"Ready",
                DraftId=existingId,Errors=errors.Distinct().ToArray()});
        }
        if(failed)return BadRequest(new{Message="AmendmentBatchInvalid",Items=results});
        if(!input.Confirm)return Ok(new{Created=0,Ready=drafts.Count,Items=results});
        db.CurriculumDraftItems.AddRange(drafts);await db.SaveChangesAsync(ct);
        foreach(var d in drafts)Audit(d,"EditorialAmendmentImported");
        await db.SaveChangesAsync(ct);await tx.CommitAsync(ct);
        return Ok(new{Created=drafts.Count,Items=results,DraftIds=drafts.Select(x=>x.Id).ToArray()});
    }

    // Preview first, then confirm. Only Admin can import a prepared content batch;
    // it creates Draft rows, never live questions. Resolve stable keys on this DB.
    [HttpPost("import")]
    [RequestSizeLimit(2_000_000)]
    public async Task<IActionResult> Import(ImportInput input,CancellationToken ct)
    {
        if(!Admin)return Forbid();
        if(input.Items is null||input.Items.Length is <1 or >50||
            input.Items.Any(x=>x is null||!WizardProblemContract.Text(x.ContentKey,100)||
                !System.Text.RegularExpressions.Regex.IsMatch(x.ContentKey,"^[a-z0-9][a-z0-9-]{0,99}$")||
                !WizardProblemContract.Text(x.PrimarySkillKey,160)||x.Content is null||x.ProposedTrackCodes is null||
                x.ProposedTrackCodes.Length is <1 or >50||x.ProposedTrackCodes.Any(c=>!WizardProblemContract.Text(c,80))||
                x.ProposedTrackCodes.Distinct().Count()!=x.ProposedTrackCodes.Length)||
            input.Items.Select(x=>x.ContentKey).Distinct().Count()!=input.Items.Length)return BadRequest(new{Message="InvalidEditorialBatch"});
        await using var tx=await db.Database.BeginTransactionAsync(ct);
        if(await Actor(0,true,ct) is null)return Forbid();
        // Serialize with publication and other imports. Recheck at confirmation.
        await db.Database.SqlQuery<int>($"SELECT 1 AS \"Value\" FROM pg_advisory_xact_lock({-987654319})").SingleAsync(ct);
        var results=new List<object>();var drafts=new List<CurriculumDraftItem>();var failed=false;
        var seenAr=new HashSet<string>();var seenEn=new HashSet<string>();
        foreach(var row in input.Items)
        {
            var existing=await db.CurriculumDraftItems.AsNoTracking().SingleOrDefaultAsync(d=>d.ContentKey==row.ContentKey,ct);
            if(existing is not null)
            {
                // Do not overwrite an existing draft, including published/withdrawn.
                results.Add(new{row.ContentKey,Status="AlreadyExists",DraftId=(long?)existing.Id,Errors=Array.Empty<string>()});
                continue;
            }
            var errors=new List<string>();
            var skill=await db.CurriculumSkills.AsNoTracking().SingleOrDefaultAsync(k=>k.StableKey==row.PrimarySkillKey&&k.IsPublished&&k.Domain.IsPublished,ct);
            if(skill is null)errors.Add("SkillNotFound");
            var p=row.Content;
            if(skill is not null)
            {
                if(p.StageId!=skill.StageId||p.CategoryId!=skill.CategoryId|| (p.SecondarySkillIds?.Length??0)>0)
                    errors.Add("ImportClassificationMismatch");
                var ids=await db.LearningTracks.Where(t=>t.StageId==skill.StageId&&row.ProposedTrackCodes.Contains(t.Code)).Select(t=>t.Id).ToArrayAsync(ct);
                if(ids.Length!=row.ProposedTrackCodes.Length)errors.Add("TrackStageMismatch");
                p=p with{PrimarySkillId=skill.Id,TrackIds=ids};
                var draft=new CurriculumDraftItem{OwnerUserId=ActorId,ContentKey=row.ContentKey,PrimarySkillKey=row.PrimarySkillKey,EditorialStatus="Draft"};
                if(errors.Count==0)errors.AddRange(await Validate(p,ct,draft));
                var ar=WizardProblemContract.Normalize(p.Question?.Ar);var en=WizardProblemContract.Normalize(p.Question?.En);
                if(!seenAr.Add(ar)||!seenEn.Add(en))errors.Add("QuestionAlreadyExistsInBatch");
                // Check unfinished wizard drafts too, not just live Problems.
                if(p.Question is not null && await db.CurriculumDraftItems.AnyAsync(d=>d.WizardJson!=null&&d.EditorialStatus!="Withdrawn"&&
                    (d.QuestionTextAr==p.Question!.Ar||d.QuestionTextEn==p.Question!.En),ct))errors.Add("QuestionAlreadyExistsInDraft");
                var json=WizardProblemContract.Serialize(p);
                if(json.Length>180000)errors.Add("DraftTooLarge");
                if(errors.Count==0){Save(draft,p,json,ActorId);drafts.Add(draft);}
            }
            if(errors.Count>0)failed=true;
            results.Add(new{row.ContentKey,Status=errors.Count==0?"Ready":"Invalid",DraftId=(long?)null,Errors=errors.ToArray()});
        }
        if(failed)return BadRequest(new{Message="EditorialBatchInvalid",Items=results});
        if(!input.Confirm)return Ok(new{Created=0,Ready=drafts.Count,Items=results});
        db.CurriculumDraftItems.AddRange(drafts);await db.SaveChangesAsync(ct);
        foreach(var d in drafts)Audit(d,"EditorialDraftImported");
        await db.SaveChangesAsync(ct);await tx.CommitAsync(ct);
        return Ok(new{Created=drafts.Count,Items=results,DraftIds=drafts.Select(d=>d.Id).ToArray()});
    }
    [HttpPost("{id:long}/withdraw")]
    public async Task<IActionResult> Withdraw(long id,ActionInput input,CancellationToken ct)
    {
        if(!WizardProblemContract.Text(input.Note,2000))return BadRequest(new{Message="ReviewNoteRequired"});
        await using var tx=await db.Database.BeginTransactionAsync(ct);
        if(await Actor(AccountRolePolicy.EditDrafts,true,ct) is null)return Forbid();
        var d=await Lock(id,ct);if(d is null)return NotFound();
        if(d.Revision!=input.Revision||d.Revision==int.MaxValue||
            (d.EditorialStatus is not ("Draft" or "NeedsChanges") && !(Admin&&d.EditorialStatus is ("PendingReview" or "Approved"))))return Conflict();
        d.EditorialStatus="Withdrawn";d.Revision++;d.ReviewNote=input.Note.Trim();
        Audit(d,"EditorialDraftWithdrawn");await db.SaveChangesAsync(ct);await tx.CommitAsync(ct);return Ok(View(d));
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
    private async Task<List<string>> Validate(WizardProblem p,CancellationToken ct,CurriculumDraftItem d)
    {
        var errors=WizardProblemContract.Validate(p);if(errors.Count>0)return errors;
        var skills=new[]{p.PrimarySkillId}.Concat(p.SecondarySkillIds??Array.Empty<int>()).ToArray();
        if(!await db.Categories.AnyAsync(c=>c.Id==p.CategoryId&&c.StageId==p.StageId,ct))errors.Add("CategoryStageMismatch");
        if(await db.CurriculumSkills.CountAsync(s=>skills.Contains(s.Id)&&s.StageId==p.StageId&&s.CategoryId==p.CategoryId&&s.IsPublished&&s.Domain.IsPublished,ct)!=skills.Length)errors.Add("SkillCategoryMismatch");
        if(await db.LearningTracks.CountAsync(t=>p.TrackIds!.Contains(t.Id)&&t.StageId==p.StageId,ct)!=p.TrackIds!.Length)errors.Add("TrackStageMismatch");
        var existing=await db.Problems.AsNoTracking().Where(x=>x.StageId==p.StageId&&x.Id!=d.SourceProblemId).Select(x=>new{x.QuestionTextAr,x.QuestionTextEn}).ToListAsync(ct);
        if(existing.Any(x=>WizardProblemContract.Normalize(x.QuestionTextAr)==WizardProblemContract.Normalize(p.Question!.Ar)||
            WizardProblemContract.Normalize(x.QuestionTextEn)==WizardProblemContract.Normalize(p.Question!.En)))errors.Add("QuestionAlreadyExists");
        if(d.SourceProblemId.HasValue)
        {
            var source=await db.Problems.AsNoTracking().Include(x=>x.Options).SingleOrDefaultAsync(x=>x.Id==d.SourceProblemId,ct);
            if(source is null||Fingerprint(source)!=d.SourceFingerprint)errors.Add("AmendmentSourceChanged");
            else if(IsHeldWording(d))
            {
                if(!await ValidHeldWording(source,p,d,ct))errors.Add("HeldWordingChangedOrHistoryExists");
            }
            else if(!SameQuestion(source,p))errors.Add("AmendmentQuestionImmutable");
            var existingTracks=await db.LearningTrackProblems.Where(x=>x.ProblemId==d.SourceProblemId).Select(x=>x.TrackId).ToArrayAsync(ct);
            if(existingTracks.Any(x=>!p.TrackIds!.Contains(x)))errors.Add("AmendmentTrackRemoval");
            var existingSkills=await db.CurriculumProblemSkills.Where(x=>x.ProblemId==d.SourceProblemId).ToListAsync(ct);
            if(existingSkills.Any(x=>x.IsPrimary?x.SkillId!=p.PrimarySkillId:!skills.Contains(x.SkillId)))errors.Add("AmendmentSkillRemoval");
        }
        return errors;
    }
    [HttpPost("{id:long}/submit")]
    public async Task<IActionResult> Submit(long id,ActionInput input,CancellationToken ct)
    {
        await using var tx=await db.Database.BeginTransactionAsync(ct);
        if(await Actor(AccountRolePolicy.SubmitDrafts,true,ct) is null)return Forbid();
        var d=await Lock(id,ct);if(d is null)return NotFound();
        if(d.Revision!=input.Revision||d.Revision==int.MaxValue||d.EditorialStatus is not ("Draft" or "NeedsChanges"))return Conflict();
        var errors=await Validate(WizardProblemContract.Read(d.WizardJson!),ct,d);
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
            var errors=await Validate(WizardProblemContract.Read(d.WizardJson!),ct,d);
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
        var direct=input.DirectApproval&&d.EditorialStatus is ("Draft" or "PendingReview" or "NeedsChanges");
        var submit=direct&&d.EditorialStatus is ("Draft" or "NeedsChanges");
        var increments=1+(direct?1:0)+(submit?1:0);
        if(d.Revision!=input.Revision||d.Revision>int.MaxValue-increments||(!direct&&d.EditorialStatus!="Approved")||d.PublishedProblemId.HasValue)return Conflict();
        if(direct&&!WizardProblemContract.Text(input.Note,2000))return BadRequest(new{Message="ReviewNoteRequired"});
        var p=WizardProblemContract.Read(d.WizardJson!);
        if(d.SourceProblemId.HasValue)
            await ProblemTransactionLocks.LockQuestionForAdminMutationAsync(db,d.SourceProblemId.Value,ct);
        var errors=await Validate(p,ct,d);if(errors.Count>0)return Conflict(new{Message="EditorialValidationFailed",Errors=errors});
        // Lock target track revisions before adding links. Existing published tracks remain valid.
        var trackIds=p.TrackIds!.Order().ToArray();
        var tracks=await db.LearningTracks.FromSqlInterpolated($@"SELECT * FROM ""LearningTracks"" WHERE ""Id""=ANY({trackIds}) ORDER BY ""Id"" FOR UPDATE").ToListAsync(ct);
        if(tracks.Count!=trackIds.Length||tracks.Any(t=>t.StageId!=p.StageId||t.Revision==int.MaxValue))return Conflict();
        // Recheck scope after taking track locks, before any live content write.
        if(IsHeldWording(d)&&!await HeldWordingScopeIsSafe(trackIds,p.CategoryId,
            new[]{p.PrimarySkillId}.Concat(p.SecondarySkillIds??Array.Empty<int>()).ToArray(),ct))
            return Conflict(new{Message="HeldWordingPublishedScopeChanged"});
        var flatAr=WizardProblemContract.FlatSolution(p.Solution!,true);var flatEn=WizardProblemContract.FlatSolution(p.Solution!,false);
        if(flatAr.Length>12000||flatEn.Length>12000)return Conflict(new{Message="SolutionTooLong"});
        var metadata=JsonSerializer.Serialize(new{p.DifficultyLevel,p.Hints,p.Solution,
            Distractors=p.Options!.Select((o,i)=>new{o.ErrorType,o.Reason,Order=i+1}).ToArray()});
        MathProblem problem;
        if(d.SourceProblemId.HasValue)
        {
            problem=await db.Problems.Include(x=>x.Options).SingleAsync(x=>x.Id==d.SourceProblemId,ct);
            if(Fingerprint(problem)!=d.SourceFingerprint)return Conflict(new{Message="AmendmentSourceChanged"});
            if(IsHeldWording(d))
            {
                if(!await ValidHeldWording(problem,p,d,ct))return Conflict(new{Message="HeldWordingChangedOrHistoryExists"});
                // Fixed, source-bound wording correction only. Never replace option IDs,
                // answer flags, category, points, primary skill or historical data.
                problem.QuestionTextAr=p.Question!.Ar;problem.QuestionTextEn=p.Question.En;
            }
            else if(!SameQuestion(problem,p))return Conflict(new{Message="AmendmentSourceChanged"});
            problem.TitleAr=p.Title!.Ar.Trim();problem.TitleEn=p.Title.En.Trim();
            problem.DetailedSolutionAr=flatAr;problem.DetailedSolutionEn=flatEn;problem.EditorialDetailsJson=metadata;
        }
        else
        {
            problem=new MathProblem{StageId=p.StageId,CategoryId=p.CategoryId,Points=p.Points,
            TitleAr=p.Title!.Ar.Trim(),TitleEn=p.Title.En.Trim(),QuestionTextAr=p.Question!.Ar.Trim(),QuestionTextEn=p.Question.En.Trim(),
            DetailedSolutionAr=flatAr,DetailedSolutionEn=flatEn,
            EditorialDetailsJson=metadata,
            Options=p.Options!.Select((o,i)=>new QuestionOption{LatexCode=o.LatexCode.Trim(),IsCorrect=o.IsCorrect,Order=i+1}).ToList()};
            db.Problems.Add(problem);await db.SaveChangesAsync(ct);
        }
        var skillIds=new[]{p.PrimarySkillId}.Concat(p.SecondarySkillIds??Array.Empty<int>()).ToArray();
        var previousSkills=await db.CurriculumProblemSkills.Where(x=>x.ProblemId==problem.Id).Select(x=>x.SkillId).ToArrayAsync(ct);
        db.CurriculumProblemSkills.AddRange(skillIds.Where(x=>!previousSkills.Contains(x)).Select(x=>new CurriculumProblemSkill{ProblemId=problem.Id,SkillId=x,IsPrimary=x==p.PrimarySkillId}));
        foreach(var t in tracks)
        {
            if(!await db.LearningTrackCategories.AnyAsync(x=>x.TrackId==t.Id&&x.CategoryId==p.CategoryId,ct))
                db.LearningTrackCategories.Add(new LearningTrackCategory{TrackId=t.Id,CategoryId=p.CategoryId});
            var linked=await db.LearningTrackSkills.Where(x=>x.TrackId==t.Id&&skillIds.Contains(x.SkillId)).Select(x=>x.SkillId).ToListAsync(ct);
            db.LearningTrackSkills.AddRange(skillIds.Where(x=>!linked.Contains(x)).Select(x=>new LearningTrackSkill{TrackId=t.Id,SkillId=x}));
            if(!await db.LearningTrackProblems.AnyAsync(x=>x.TrackId==t.Id&&x.ProblemId==problem.Id,ct))
                db.LearningTrackProblems.Add(new LearningTrackProblem{TrackId=t.Id,ProblemId=problem.Id});
            t.Revision++;
        }
        // Explicit administrator approval shares the publication transaction.
        // Any validation, write, or commit failure rolls back every state and audit change.
        if(submit){d.SubmittedAtUtc=DateTime.UtcNow;d.Revision++;Audit(d,"EditorialDraftSubmitted");}
        if(direct){d.ReviewedAtUtc=DateTime.UtcNow;d.ReviewedByUserId=ActorId;d.ReviewNote=input.Note.Trim();d.Revision++;Audit(d,"EditorialDraftApproved");}
        d.PublishedProblemId=problem.Id;d.PublishedAtUtc=DateTime.UtcNow;d.EditorialStatus="Published";d.Revision++;
        Audit(d,d.SourceProblemId.HasValue?"EditorialAmendmentPublished":"EditorialDraftPublished");await db.SaveChangesAsync(ct);await tx.CommitAsync(ct);return Ok(View(d));
    }
}
