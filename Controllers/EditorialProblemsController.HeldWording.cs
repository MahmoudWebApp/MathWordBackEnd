using System.Text.Json;
using MathWorldAPI.Models;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

public sealed partial class EditorialProblemsController
{
    public sealed record HeldWordingInput(int[] ProblemIds,bool Confirm=false);
    private const string WordingPrefix="g1-wording-";
    private static bool IsHeldWording(CurriculumDraftItem d)=>d.SourceProblemId is int id&&d.ContentKey==WordingPrefix+id;

    // All existing learner references, including favorites/hints and session
    // snapshots, are blockers. Never erase or migrate them to clear this guard.
    private async Task<bool> HasWordingHistory(int id,CancellationToken ct)
    {
        if(await db.ProblemAttempts.AnyAsync(x=>x.ProblemId==id,ct)||
            await db.UserProgresses.AnyAsync(x=>x.ProblemId==id,ct)||
            await db.PermanentProblemAchievements.AnyAsync(x=>x.ProblemId==id,ct)||
            await db.LearningSessionAttempts.AnyAsync(x=>x.ProblemId==id,ct)||
            await db.ProblemDiagrams.AnyAsync(x=>x.ProblemId==id,ct)||
            await db.PlatformActivityEvents.AnyAsync(x=>x.ActorRole=="Student"&&x.Resource=="Problem"&&x.ResourceId==id.ToString(),ct))
            return true;
        var needle=JsonSerializer.Serialize(new[]{new{Id=id}});
        return await db.Database.SqlQuery<bool>($@"SELECT EXISTS(SELECT 1 FROM ""LearningSessions"" WHERE CAST(""QuestionsJson"" AS jsonb) @> CAST({needle} AS jsonb)) AS ""Value""").SingleAsync(ct);
    }
    private static bool OriginalWordingMatches(MathProblem source,HeldWordingCatalog.Candidate row)=>
        source.Id==row.ProblemId&&SameQuestion(source,row.Content)&&
        source.TitleAr==row.Content.Title?.Ar&&source.TitleEn==row.Content.Title?.En&&
        source.DetailedSolutionAr==row.ExpectedLegacySolution.Ar&&source.DetailedSolutionEn==row.ExpectedLegacySolution.En&&
        source.Options.OrderBy(o=>o.Order).ThenBy(o=>o.Id).Select(o=>o.Id).SequenceEqual(row.ExpectedOptionIds);
    private static WizardProblem ProposedWording(HeldWordingCatalog.Candidate row,int[] tracks,int[] secondary)
    {
        // Keep the complete corrected question as title when it fits, avoiding
        // arbitrary truncation inside a LaTeX expression.
        var q=row.ProposedQuestion;
        var title=new BilingualText(q.Ar.Length<=250?q.Ar:row.Content.Title!.Ar,
            q.En.Length<=250?q.En:row.Content.Title!.En);
        return row.Content with{Question=q,Title=title,TrackIds=tracks,SecondarySkillIds=secondary,DifficultyLevel=1};
    }
    private async Task<bool> ValidHeldWording(MathProblem source,WizardProblem proposed,CurriculumDraftItem draft,CancellationToken ct)
    {
        if(!HeldWordingCatalog.Current.TryGetValue(source.Id,out var row)||!OriginalWordingMatches(source,row)||
            draft.PrimarySkillKey!=row.PrimarySkillKey||source.EditorialDetailsJson is not null||
            await HasWordingHistory(source.Id,ct))return false;
        var primary=await db.CurriculumProblemSkills.AsNoTracking().Where(x=>x.ProblemId==source.Id&&x.IsPrimary)
            .Select(x=>x.SkillId).ToArrayAsync(ct);
        if(primary.Length!=1||primary[0]!=row.Content.PrimarySkillId||
            !await db.CurriculumSkills.AnyAsync(s=>s.Id==primary[0]&&s.StableKey==row.PrimarySkillKey&&s.IsPublished&&s.Domain.IsPublished,ct))return false;
        var secondary=await db.CurriculumProblemSkills.AsNoTracking().Where(x=>x.ProblemId==source.Id&&!x.IsPrimary)
            .OrderBy(x=>x.SkillId).Select(x=>x.SkillId).ToArrayAsync(ct);
        var current=await db.LearningTrackProblems.AsNoTracking().Where(x=>x.ProblemId==source.Id).Select(x=>x.TrackId).ToArrayAsync(ct);
        var target=await db.LearningTracks.AsNoTracking().SingleOrDefaultAsync(t=>t.StageId==source.StageId&&t.Code==row.ProposedTrackCode,ct);
        if(target is null)return false;
        var tracks=current.Append(target.Id).Distinct().Order().ToArray();
        // A published track may receive a corrected question only inside its
        // existing category and skill scope. Never add a category or skill to
        // a live track through a wording-only operation.
        if(!await HeldWordingScopeIsSafe(tracks,source.CategoryId,primary.Concat(secondary).ToArray(),ct))return false;
        return WizardProblemContract.Serialize(proposed)==WizardProblemContract.Serialize(ProposedWording(row,tracks,secondary));
    }

    private async Task<bool> HeldWordingScopeIsSafe(int[] trackIds,int categoryId,int[] skillIds,CancellationToken ct)
    {
        var published=await db.LearningTracks.AsNoTracking().Where(t=>trackIds.Contains(t.Id)&&t.IsPublished)
            .Select(t=>t.Id).ToArrayAsync(ct);
        if(published.Length==0)return true;
        var categories=await db.LearningTrackCategories.AsNoTracking()
            .Where(c=>published.Contains(c.TrackId)&&c.CategoryId==categoryId).Select(c=>c.TrackId).Distinct().CountAsync(ct);
        if(categories!=published.Length)return false;
        var skills=await db.LearningTrackSkills.AsNoTracking()
            .CountAsync(x=>published.Contains(x.TrackId)&&skillIds.Contains(x.SkillId),ct);
        return skills==published.Length*skillIds.Length;
    }

    [HttpGet("held-wording")]
    public async Task<IActionResult> HeldWording(CancellationToken ct)
    {
        if(!Admin||await Actor(0,false,ct) is null)return Forbid();
        var rows=HeldWordingCatalog.Current.Values.OrderBy(r=>r.ProblemId).ToArray();
        var keys=rows.Select(r=>WordingPrefix+r.ProblemId).ToArray();
        var drafts=await db.CurriculumDraftItems.AsNoTracking().Where(d=>keys.Contains(d.ContentKey))
            .Select(d=>new{d.Id,d.ContentKey,d.Revision,Status=d.EditorialStatus}).ToListAsync(ct);
        return Ok(new{Items=rows,Drafts=drafts,PublicationEnabled=config.GetValue<bool>("EditorialWizard:PublicationEnabled")});
    }

    // IDs only: the client cannot alter wording, option values, classification
    // or the immutable proposal. Confirmation merely creates a draft.
    [HttpPost("held-wording/import")]
    public async Task<IActionResult> ImportHeldWording(HeldWordingInput input,CancellationToken ct)
    {
        if(!Admin)return Forbid();
        if(input.ProblemIds is null||input.ProblemIds.Length is <1 or >50||
            input.ProblemIds.Distinct().Count()!=input.ProblemIds.Length||
            input.ProblemIds.Any(id=>!HeldWordingCatalog.Current.ContainsKey(id)))return BadRequest(new{Message="InvalidHeldWordingIds"});
        await using var tx=await db.Database.BeginTransactionAsync(ct);
        if(await Actor(0,true,ct) is null)return Forbid();
        await db.Database.SqlQuery<int>($"SELECT 1 AS \"Value\" FROM pg_advisory_xact_lock({-987654319})").SingleAsync(ct);
        var drafts=new List<CurriculumDraftItem>();var results=new List<object>();bool failed=false;
        foreach(var id in input.ProblemIds.Order())
        {
            await ProblemTransactionLocks.LockQuestionForAdminMutationAsync(db,id,ct);
            var row=HeldWordingCatalog.Current[id];var errors=new List<string>();
            var key=WordingPrefix+id;
            var existing=await db.CurriculumDraftItems.AsNoTracking().SingleOrDefaultAsync(d=>d.ContentKey==key,ct);
            var p=await db.Problems.AsNoTracking().Include(x=>x.Options).SingleOrDefaultAsync(x=>x.Id==id,ct);
            if(existing is not null){results.Add(new{ProblemId=id,Status="AlreadyExists",DraftId=existing.Id,Errors=Array.Empty<string>()});continue;}
            if(p is null||!OriginalWordingMatches(p,row)||p.EditorialDetailsJson is not null)errors.Add("HeldWordingSourceChanged");
            if(p is not null)
            {
                var skills=await db.CurriculumProblemSkills.AsNoTracking().Where(x=>x.ProblemId==id).ToListAsync(ct);
                var existingTracks=await db.LearningTrackProblems.AsNoTracking().Where(x=>x.ProblemId==id).Select(x=>x.TrackId).ToArrayAsync(ct);
                var target=await db.LearningTracks.AsNoTracking().SingleOrDefaultAsync(t=>t.StageId==p.StageId&&t.Code==row.ProposedTrackCode,ct);
                if(target is null)errors.Add("TargetTrackRequired");
                else
                {
                    var trackIds=existingTracks.Append(target.Id).Distinct().Order().ToArray();
                    var secondary=skills.Where(x=>!x.IsPrimary).Select(x=>x.SkillId).Order().ToArray();
                    var proposed=ProposedWording(row,trackIds,secondary);
                    var d=new CurriculumDraftItem{OwnerUserId=ActorId,ContentKey=key,PrimarySkillKey=row.PrimarySkillKey,
                        EditorialStatus="Draft",SourceProblemId=id,SourceFingerprint=Fingerprint(p),
                        DetailedSolutionAr=p.DetailedSolutionAr,DetailedSolutionEn=p.DetailedSolutionEn};
                    errors.AddRange(WizardProblemContract.Validate(proposed));
                    if(await HasWordingHistory(id,ct))errors.Add("StudentHistoryRequiresVersioning");
                    else if(!await ValidHeldWording(p,proposed,d,ct))errors.Add("HeldWordingClassificationChanged");
                    if(await db.CurriculumDraftItems.AnyAsync(x=>x.SourceProblemId==id&&x.EditorialStatus!="Published"&&x.EditorialStatus!="Withdrawn",ct))errors.Add("AmendmentAlreadyOpen");
                    if(errors.Count==0){Save(d,proposed,WizardProblemContract.Serialize(proposed),ActorId);drafts.Add(d);}
                }
            }
            if(errors.Count>0)failed=true;
            results.Add(new{ProblemId=id,Status=errors.Count>0?"Invalid":"Ready",DraftId=(long?)null,Errors=errors.Distinct().ToArray()});
        }
        if(failed)return BadRequest(new{Message="HeldWordingBatchInvalid",Items=results});
        if(!input.Confirm)return Ok(new{Created=0,Ready=drafts.Count,Items=results});
        db.CurriculumDraftItems.AddRange(drafts);await db.SaveChangesAsync(ct);
        foreach(var d in drafts)Audit(d,"HeldWordingDraftImported");
        await db.SaveChangesAsync(ct);await tx.CommitAsync(ct);
        return Ok(new{Created=drafts.Count,Items=results,DraftIds=drafts.Select(x=>x.Id).ToArray()});
    }
}
