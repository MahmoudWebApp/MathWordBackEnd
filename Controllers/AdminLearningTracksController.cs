using System.ComponentModel.DataAnnotations;
using System.Security.Claims;
using System.Text.RegularExpressions;
using MathWorldAPI.Data;
using MathWorldAPI.Models;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

[ApiController]
[Route("api/admin/learning-tracks")]
[Authorize(Policy="AdminOnly")]
[ResponseCache(NoStore=true,Location=ResponseCacheLocation.None)]
public sealed class AdminLearningTracksController(AppDbContext db,LearningTrackService service):ControllerBase
{
    public sealed record TrackInput(int StageId,[Required,StringLength(80)] string Code,[Required] string Kind,
        [Required,StringLength(150)] string NameAr,[Required,StringLength(150)] string NameEn,
        [StringLength(1500)] string DescriptionAr="",[StringLength(1500)] string DescriptionEn="",int SortOrder=0);
    public sealed record MappingInput(int Revision, int[] CategoryIds,int[] SkillIds,int[] ProblemIds);
    public sealed record PublishInput(int Revision,bool Publish);
    public sealed record MetadataInput(int Revision,[Required,StringLength(150)] string NameAr,[Required,StringLength(150)] string NameEn,
        [StringLength(1500)] string DescriptionAr="",[StringLength(1500)] string DescriptionEn="",int SortOrder=0);
    private int ActorId=>int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);

    private void Audit(int id,string action)=>db.PlatformActivityEvents.Add(new PlatformActivityEvent{
        ActorUserId=ActorId,ActorRole=AccountRolePolicy.LegacyAdmin,Action=action,Resource="LearningTrack",
        ResourceId=id.ToString(),Origin="api",CreatedAtUtc=DateTime.UtcNow});

    [HttpGet]
    public async Task<IActionResult> List([FromQuery]int? stageId,CancellationToken ct)
    {
        var tracks=await db.LearningTracks.AsNoTracking().Where(t=>stageId==null||t.StageId==stageId)
            .OrderBy(t=>t.StageId).ThenBy(t=>t.SortOrder).ThenBy(t=>t.Id)
            .Select(t=>new {Track=t,CategoryCount=db.LearningTrackCategories.Count(x=>x.TrackId==t.Id),
                SkillCount=db.LearningTrackSkills.Count(x=>x.TrackId==t.Id),ProblemCount=db.LearningTrackProblems.Count(x=>x.TrackId==t.Id)})
            .ToListAsync(ct);
        return Ok(new {Enabled=service.Enabled,Items=tracks});
    }
    [HttpGet("{id:int}")]
    public async Task<IActionResult> Detail(int id,CancellationToken ct)
    {
        var t=await db.LearningTracks.AsNoTracking().SingleOrDefaultAsync(x=>x.Id==id,ct);
        if(t is null)return NotFound();
        return Ok(new{Track=t,CategoryIds=await db.LearningTrackCategories.Where(x=>x.TrackId==id).Select(x=>x.CategoryId).ToArrayAsync(ct),
            SkillIds=await db.LearningTrackSkills.Where(x=>x.TrackId==id).Select(x=>x.SkillId).ToArrayAsync(ct),
            ProblemIds=await db.LearningTrackProblems.Where(x=>x.TrackId==id).Select(x=>x.ProblemId).ToArrayAsync(ct),
            Coverage=await service.CoverageAsync(id,t.StageId,ct)});
    }

    [HttpGet("inventory/{stageId:int}")]
    public async Task<IActionResult> Inventory(int stageId,[FromQuery]int page=1,[FromQuery]int? categoryId=null,CancellationToken ct=default)
    {
        if(page is <1 or >10000)return BadRequest();
        if(!await db.EducationalStages.AnyAsync(x=>x.Id==stageId,ct))return NotFound();
        var categories=await db.Categories.AsNoTracking().Where(x=>x.StageId==stageId)
            .OrderBy(x=>x.Order).ThenBy(x=>x.Id).Select(x=>new{x.Id,x.NameAr,x.NameEn}).ToListAsync(ct);
        var skills=await db.CurriculumSkills.AsNoTracking().Where(x=>x.StageId==stageId&&(categoryId==null||x.CategoryId==categoryId))
            .OrderBy(x=>x.SortOrder).ThenBy(x=>x.Id).Select(x=>new{x.Id,x.CategoryId,x.NameAr,x.NameEn,x.IsPublished}).ToListAsync(ct);
        var problems=db.Problems.AsNoTracking().Where(x=>x.StageId==stageId&&x.Category.StageId==stageId&&(categoryId==null||x.CategoryId==categoryId));
        var items=await problems.OrderBy(x=>x.Id).Skip((page-1)*100).Take(100)
            .Select(x=>new{x.Id,x.CategoryId,x.TitleAr,x.TitleEn,
                PrimarySkillId=db.CurriculumProblemSkills.Where(ps=>ps.ProblemId==x.Id&&ps.IsPrimary).Select(ps=>(int?)ps.SkillId).FirstOrDefault(),
                AssignedTrackCount=db.LearningTrackProblems.Count(lp=>lp.ProblemId==x.Id)}).ToListAsync(ct);
        return Ok(new{Categories=categories,Skills=skills,Problems=items,Total=await problems.CountAsync(ct)});
    }

    [HttpPost]
    public async Task<IActionResult> Create(TrackInput input,CancellationToken ct)
    {
        if(!Regex.IsMatch(input.Code,"^[a-z0-9]+(-[a-z0-9]+)*$") || input.Kind is not ("grade" or "course") ||
           string.IsNullOrWhiteSpace(input.NameAr)||string.IsNullOrWhiteSpace(input.NameEn)||input.SortOrder is <0 or >10000 ||
           !await db.EducationalStages.AnyAsync(x=>x.Id==input.StageId,ct))return BadRequest();
        await using var tx=await db.Database.BeginTransactionAsync(ct);
        if(await db.LearningTracks.AnyAsync(x=>x.StageId==input.StageId&&x.Code==input.Code,ct))return Conflict();
        var t=new LearningTrack{StageId=input.StageId,Code=input.Code,Kind=input.Kind,NameAr=input.NameAr.Trim(),NameEn=input.NameEn.Trim(),
            DescriptionAr=input.DescriptionAr??"",DescriptionEn=input.DescriptionEn??"",SortOrder=input.SortOrder};
        db.LearningTracks.Add(t);
        try{await db.SaveChangesAsync(ct);}catch(DbUpdateException e)when(e.InnerException is Npgsql.PostgresException {SqlState:"23505"}){return Conflict();}
        Audit(t.Id,"LearningTrackCreated");await db.SaveChangesAsync(ct);await tx.CommitAsync(ct);
        return StatusCode(201,t);
    }

    [HttpPut("{id:int}/metadata")]
    public async Task<IActionResult> Metadata(int id,MetadataInput input,CancellationToken ct)
    {
        if(input.Revision is <0 or int.MaxValue || string.IsNullOrWhiteSpace(input.NameAr) ||
           string.IsNullOrWhiteSpace(input.NameEn) || input.SortOrder is <0 or >10000)return BadRequest();
        await using var tx=await db.Database.BeginTransactionAsync(ct);
        var t=await db.LearningTracks.FromSqlInterpolated($@"SELECT * FROM ""LearningTracks"" WHERE ""Id""={id} FOR UPDATE").SingleOrDefaultAsync(ct);
        if(t is null)return NotFound();
        if(t.Revision!=input.Revision)return Conflict(new{Message="TrackChanged"});
        t.NameAr=input.NameAr.Trim();t.NameEn=input.NameEn.Trim();t.DescriptionAr=input.DescriptionAr??"";
        t.DescriptionEn=input.DescriptionEn??"";t.SortOrder=input.SortOrder;t.Revision++;
        Audit(id,"LearningTrackMetadataUpdated");await db.SaveChangesAsync(ct);await tx.CommitAsync(ct);
        return Ok(new{t.Revision});
    }

    [HttpPut("{id:int}/mapping")]
    public async Task<IActionResult> Map(int id,MappingInput input,CancellationToken ct)
    {
        if(input.Revision is <0 or int.MaxValue)return BadRequest();
        await using var tx=await db.Database.BeginTransactionAsync(ct);
        var t=await db.LearningTracks.FromSqlInterpolated($@"SELECT * FROM ""LearningTracks"" WHERE ""Id""={id} FOR UPDATE").SingleOrDefaultAsync(ct);
        if(t is null)return NotFound();
        if(t.Revision!=input.Revision||t.IsPublished)return Conflict(new{Message="UnpublishOrRefreshTrack"});
        var invalid=await service.ValidateMappingAsync(t.StageId,new(input.CategoryIds,input.SkillIds,input.ProblemIds),ct);
        if(invalid is not null)return BadRequest(new{Message=invalid});
        await db.LearningTrackCategories.Where(x=>x.TrackId==id).ExecuteDeleteAsync(ct);
        await db.LearningTrackSkills.Where(x=>x.TrackId==id).ExecuteDeleteAsync(ct);
        await db.LearningTrackProblems.Where(x=>x.TrackId==id).ExecuteDeleteAsync(ct);
        db.LearningTrackCategories.AddRange(input.CategoryIds.Select(x=>new LearningTrackCategory{TrackId=id,CategoryId=x}));
        db.LearningTrackSkills.AddRange(input.SkillIds.Select(x=>new LearningTrackSkill{TrackId=id,SkillId=x}));
        db.LearningTrackProblems.AddRange(input.ProblemIds.Select(x=>new LearningTrackProblem{TrackId=id,ProblemId=x}));
        t.Revision++;Audit(id,"LearningTrackMapped");await db.SaveChangesAsync(ct);await tx.CommitAsync(ct);
        return Ok(new{t.Revision});
    }

    // Server-owned reviewed proposal, not a client-supplied publication request.
    public sealed record DraftPlacementRow(int ProblemId,int CategoryId,int PrimarySkillId,string StableKey,string ExpectedQuestionAr,string ExpectedQuestionEn);
    public sealed record DraftPlacementGroup(int StageId,string Code,DraftPlacementRow[] Rows);
    public sealed record DraftPlacementPackage(int Version,string Status,int ExcludedCount,DraftPlacementGroup[] Tracks);
    public sealed record DraftBatchRequest(bool Confirm,MappingRevision[]? Revisions);
    public sealed record MappingRevision(int Id,int Revision);
    public sealed record DraftBatchItem(int Id,int Revision,string Code,int StageId,int Problems,int FreeProblems,string Status);

    private static DraftPlacementPackage LoadDraftPlacement()
    {
        using var stream=typeof(AdminLearningTracksController).Assembly.GetManifestResourceStream("MathWorld.G1.TrackDraftBatch")
            ??throw new InvalidOperationException("Reviewed placement resource unavailable");
        return System.Text.Json.JsonSerializer.Deserialize<DraftPlacementPackage>(stream)
            ??throw new InvalidOperationException("Reviewed placement resource invalid");
    }

    [HttpPost("reviewed-draft-batch")]
    public async Task<IActionResult> ReviewedDraftBatch(DraftBatchRequest input,CancellationToken ct)
    {
        var proposal=LoadDraftPlacement();
        if(proposal.Version!=1||proposal.Status!="ReviewedSourceMatchedDraftProposal"||
            proposal.Tracks.Length==0||proposal.Tracks.Any(g=>g.Rows.Length==0)||
            proposal.Tracks.Select(g=>(g.StageId,g.Code)).Distinct().Count()!=proposal.Tracks.Length)
            return BadRequest(new{Message="InvalidMapping"});
        var proposalIds=proposal.Tracks.SelectMany(g=>g.Rows).Select(r=>r.ProblemId).ToArray();
        // This package defines one provisional baseline placement per question.
        if(proposalIds.Distinct().Count()!=proposalIds.Length)return BadRequest(new{Message="InvalidMapping"});
        if(input.Confirm&&(input.Revisions is null||input.Revisions.Length!=proposal.Tracks.Length||
            input.Revisions.Any(x=>x is null||x.Id<=0||x.Revision<0)||
            input.Revisions.Select(x=>x.Id).Distinct().Count()!=input.Revisions.Length))return BadRequest(new{Message="TrackBatchRevisionRequired"});
        // Keep the existing publication rule and all learner history untouched.
        // Lock track rows in stable order; use one serializable transaction so a
        // concurrent edit cannot silently change the checked source or mapping.
        await using var tx=await db.Database.BeginTransactionAsync(System.Data.IsolationLevel.Serializable,ct);
        try
        {
            var tracks=await db.LearningTracks.FromSqlRaw("SELECT * FROM \"LearningTracks\" ORDER BY \"Id\" FOR UPDATE").ToListAsync(ct);
            var output=new List<DraftBatchItem>();
            var pending=new List<(LearningTrack Track,TrackMapping Mapping)>();
            // Fetch shared source and current mappings once per batch, rather than
            // repeating database round trips for each track while holding locks.
            var sourceRows=await (from p in db.Problems.AsNoTracking()
                join ps in db.CurriculumProblemSkills.AsNoTracking() on p.Id equals ps.ProblemId
                where proposalIds.Contains(p.Id)&&ps.IsPrimary&&p.Category.StageId==p.StageId&&
                    ps.Skill.StageId==p.StageId&&ps.Skill.CategoryId==p.CategoryId&&ps.Skill.IsPublished&&ps.Skill.Domain.IsPublished
                select new {p.Id,p.StageId,p.CategoryId,p.QuestionTextAr,p.QuestionTextEn,ps.SkillId,ps.Skill.StableKey}).ToListAsync(ct);
            var sourceById=sourceRows.ToLookup(s=>s.Id);
            var trackIds=tracks.Select(t=>t.Id).ToArray();
            var categoriesByTrack=(await db.LearningTrackCategories.AsNoTracking().Where(x=>trackIds.Contains(x.TrackId)).ToListAsync(ct))
                .ToLookup(x=>x.TrackId,x=>x.CategoryId);
            var skillsByTrack=(await db.LearningTrackSkills.AsNoTracking().Where(x=>trackIds.Contains(x.TrackId)).ToListAsync(ct))
                .ToLookup(x=>x.TrackId,x=>x.SkillId);
            var problemsByTrack=(await db.LearningTrackProblems.AsNoTracking().Where(x=>trackIds.Contains(x.TrackId)).ToListAsync(ct))
                .ToLookup(x=>x.TrackId,x=>x.ProblemId);
            var freeByStage=new Dictionary<int,int[]>();
            foreach(var placement in proposal.Tracks.OrderBy(g=>g.StageId).ThenBy(g=>g.Code))
            {
                var track=tracks.SingleOrDefault(t=>t.StageId==placement.StageId&&t.Code==placement.Code);
                if(track is null)return Conflict(new{Message="TrackBatchIdentityMissing",placement.Code});
                if(input.Confirm&&!input.Revisions!.Any(r=>r.Id==track.Id&&r.Revision==track.Revision))
                    return Conflict(new{Message="TrackChanged",placement.Code});
                if(track.IsPublished||track.Revision==int.MaxValue)return Conflict(new{Message="UnpublishOrRefreshTrack",placement.Code});
                var ids=placement.Rows.Select(x=>x.ProblemId).ToArray();
                var changed=placement.Rows.Where(row=>
                {
                    var matches=sourceById[row.ProblemId];
                    return matches.Count()!=1||!matches.Any(s=>s.StageId==placement.StageId&&s.CategoryId==row.CategoryId&&
                        s.SkillId==row.PrimarySkillId&&s.StableKey==row.StableKey&&s.QuestionTextAr==row.ExpectedQuestionAr&&
                        s.QuestionTextEn==row.ExpectedQuestionEn);
                }).Select(row=>row.ProblemId).ToArray();
                if(changed.Length>0)
                    return Conflict(new{Message="TrackBatchSourceChanged",placement.Code,ProblemIds=changed});
                var map=new TrackMapping(placement.Rows.Select(x=>x.CategoryId).Distinct().Order().ToArray(),
                    placement.Rows.Select(x=>x.PrimarySkillId).Distinct().Order().ToArray(),ids.Order().ToArray());
                var oldC=categoriesByTrack[track.Id].ToArray();
                var oldS=skillsByTrack[track.Id].ToArray();
                var oldP=problemsByTrack[track.Id].ToArray();
                var same=oldC.Order().SequenceEqual(map.CategoryIds)&&oldS.Order().SequenceEqual(map.SkillIds)&&oldP.Order().SequenceEqual(map.ProblemIds);
                if(!same&&(oldC.Length!=0||oldS.Length!=0||oldP.Length!=0))
                    return Conflict(new{Message="TrackBatchExistingMapping",placement.Code});
                // Use the same current Free policy as the normal track catalog.
                if(!freeByStage.TryGetValue(placement.StageId,out var free))
                {
                    free=await service.GetFreeCategoryIdsForPlacementAsync(placement.StageId,ct);
                    freeByStage.Add(placement.StageId,free);
                }
                output.Add(new(track.Id,track.Revision,track.Code,track.StageId,ids.Length,
                    placement.Rows.Count(x=>free.Contains(x.CategoryId)),same?"AlreadyMapped":"Ready"));
                if(!same)pending.Add((track,map));
            }
            if(input.Confirm)
            {
                foreach(var (t,m) in pending)
                {
                    db.LearningTrackCategories.AddRange(m.CategoryIds.Select(x=>new LearningTrackCategory{TrackId=t.Id,CategoryId=x}));
                    db.LearningTrackSkills.AddRange(m.SkillIds.Select(x=>new LearningTrackSkill{TrackId=t.Id,SkillId=x}));
                    db.LearningTrackProblems.AddRange(m.ProblemIds.Select(x=>new LearningTrackProblem{TrackId=t.Id,ProblemId=x}));
                    t.Revision++;Audit(t.Id,"LearningTrackReviewedDraftMapped");
                }
                await db.SaveChangesAsync(ct);
                await tx.CommitAsync(ct);
            }
            return Ok(new{Confirmed=input.Confirm,AppliedTracks=input.Confirm?pending.Count:0,
                ExcludedCount=proposal.ExcludedCount,Items=output});
        }
        catch(Npgsql.PostgresException e)when(e.SqlState is "40001" or "40P01")
        {return Conflict(new{Message="TrackChanged"});}
        catch(DbUpdateException e)when(e.InnerException is Npgsql.PostgresException {SqlState:"40001" or "40P01" or "23505"})
        {return Conflict(new{Message="TrackChanged"});}
    }

    [HttpPut("{id:int}/publication")]
    public async Task<IActionResult> Publication(int id,PublishInput input,CancellationToken ct)
    {
        if(input.Revision is <0 or int.MaxValue)return BadRequest();
        await using var tx=await db.Database.BeginTransactionAsync(ct);
        var t=await db.LearningTracks.FromSqlInterpolated($@"SELECT * FROM ""LearningTracks"" WHERE ""Id""={id} FOR UPDATE").SingleOrDefaultAsync(ct);
        if(t is null)return NotFound();
        if(t.Revision!=input.Revision)return Conflict(new{Message="TrackChanged"});
        if(input.Publish)
        {
            var coverage=await service.CoverageAsync(id,t.StageId,ct);
            var mapped=await db.LearningTrackProblems.CountAsync(x=>x.TrackId==id,ct);
            var categories=await db.LearningTrackCategories.CountAsync(x=>x.TrackId==id,ct);
            if(coverage.Problems==0||coverage.Problems!=mapped||coverage.Categories!=categories||coverage.FreeProblems==0)
                return Conflict(new{Message="TrackNotReady",Coverage=coverage});
        }
        t.IsPublished=input.Publish;t.Revision++;
        Audit(id,input.Publish?"LearningTrackPublished":"LearningTrackUnpublished");
        await db.SaveChangesAsync(ct);await tx.CommitAsync(ct);
        return Ok(new{t.Revision,t.IsPublished});
    }
}
