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
