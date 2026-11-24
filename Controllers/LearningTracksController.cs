using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.Models;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

[ApiController]
[ResponseCache(NoStore=true,Location=ResponseCacheLocation.None)]
public sealed class LearningTracksController(AppDbContext db,LearningTrackService tracks,ProblemCategoryAccessService access):ControllerBase
{
    [AllowAnonymous]
    [HttpGet("api/stages/{stageId:int}/tracks")]
    public async Task<IActionResult> List(int stageId,CancellationToken ct)
    {
        if(!await db.EducationalStages.AnyAsync(s=>s.Id==stageId,ct))return NotFound();
        var items=tracks.Enabled?await tracks.VisibleTracks().Where(t=>t.StageId==stageId)
            .OrderBy(t=>t.SortOrder).ThenBy(t=>t.Id).ToListAsync(ct):new List<LearningTrack>();
        var result=new List<object>();
        foreach(var t in items)
        {
            var coverage=await tracks.CoverageAsync(t.Id,t.StageId,ct);
            result.Add(new{t.Id,t.StageId,t.Code,t.Kind,t.NameAr,t.NameEn,t.DescriptionAr,t.DescriptionEn,t.SortOrder,
                ProblemsCount=coverage.Problems,CategoriesCount=coverage.Categories,SkillsCount=coverage.Skills,FreeProblemsCount=coverage.FreeProblems});
        }
        return Ok(new{Enabled=tracks.Enabled,Items=result});
    }
    [AllowAnonymous]
    [HttpGet("api/learning-tracks/{id:int}")]
    public async Task<IActionResult> Detail(int id,CancellationToken ct)
    {
        if(!tracks.Enabled)return NotFound();
        var t=await tracks.VisibleTracks().SingleOrDefaultAsync(x=>x.Id==id,ct);
        if(t is null)return NotFound();
        var valid=tracks.ValidProblems(id);
        var free=await access.GetFreeCategoryIdsAsync(t.StageId,ct);
        var categories=await db.Categories.AsNoTracking().Where(c=>valid.Any(p=>p.CategoryId==c.Id))
            .OrderBy(c=>c.Order).ThenBy(c=>c.Id).Select(c=>new{c.Id,c.NameAr,c.NameEn,c.DescriptionAr,c.DescriptionEn,c.Icon,
                IsFree=free.Contains(c.Id),ProblemsCount=valid.Count(p=>p.CategoryId==c.Id)}).ToListAsync(ct);
        var skills=await db.CurriculumSkills.AsNoTracking().Where(s=>s.IsPublished&&s.Domain.IsPublished&&
            db.LearningTrackSkills.Any(ls=>ls.TrackId==id&&ls.SkillId==s.Id)&&
            db.CurriculumProblemSkills.Any(ps=>ps.SkillId==s.Id&&valid.Any(p=>p.Id==ps.ProblemId&&p.CategoryId==s.CategoryId)))
            .OrderBy(s=>s.SortOrder).ThenBy(s=>s.Id).Select(s=>new{s.Id,s.CategoryId,s.NameAr,s.NameEn,s.DescriptionAr,s.DescriptionEn}).ToListAsync(ct);
        var examples=await valid.OrderBy(p=>p.Id).Take(6).Select(p=>new{p.Id,p.CategoryId,p.TitleAr,p.TitleEn}).ToListAsync(ct);
        return Ok(new{Track=new{t.Id,t.StageId,t.Code,t.Kind,t.NameAr,t.NameEn,t.DescriptionAr,t.DescriptionEn},
            Categories=categories,Skills=skills,Examples=examples});
    }
    [Authorize(Roles="Student")]
    [HttpGet("api/users/learning-track")]
    public async Task<IActionResult> Selection(CancellationToken ct)
    {
        var uid=int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);
        var user=await db.Users.AsNoTracking().SingleAsync(x=>x.Id==uid,ct);
        var stage=await LegacyLearningStage.EffectiveIdForUserAsync(db,user.CurrentStageId,user.CreatedAt,ct);
        var t=tracks.Enabled&&user.CurrentTrackId.HasValue?await tracks.VisibleTracks()
            .SingleOrDefaultAsync(x=>x.Id==user.CurrentTrackId&&x.StageId==stage,ct):null;
        return Ok(new{Enabled=tracks.Enabled,StageId=stage,TrackId=t?.Id,Track=t});
    }
    public sealed record SelectInput(int TrackId);
    [Authorize(Roles="Student")]
    [HttpPut("api/users/learning-track")]
    public async Task<IActionResult> Select(SelectInput input,CancellationToken ct)
    {
        if(!tracks.Enabled)return Conflict(new{Message="TracksDisabled"});
        var uid=int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);
        var t=await tracks.VisibleTracks().SingleOrDefaultAsync(x=>x.Id==input.TrackId,ct);
        if(t is null)return NotFound();
        // Atomic stage + track selection; no progress is modified.
        var n=await db.Users.Where(x=>x.Id==uid&&x.IsActive&&x.Role=="Student")
            .ExecuteUpdateAsync(x=>x.SetProperty(u=>u.CurrentStageId,t.StageId).SetProperty(u=>u.CurrentTrackId,t.Id),ct);
        if(n!=1)return Unauthorized();
        return Ok(new{Enabled=true,StageId=t.StageId,TrackId=t.Id});
    }
    [Authorize(Roles="Student")]
    [HttpGet("api/users/learning-tracks/{id:int}/progress")]
    public async Task<IActionResult> Progress(int id,CancellationToken ct)
    {
        if(!tracks.Enabled)return NotFound();
        var t=await tracks.VisibleTracks().SingleOrDefaultAsync(x=>x.Id==id,ct);
        if(t is null)return NotFound();
        var uid=int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);
        var allowed=await access.GetAllowedCategoryIdsAsync(User,ct)??new List<int>();
        var valid=tracks.ValidProblems(id);
        var inventory=await valid.GroupBy(p=>p.CategoryId)
            .Select(g=>new{CategoryId=g.Key,Total=g.Count()}).ToListAsync(ct);
        var progress=await db.UserProgresses.AsNoTracking().Where(p=>p.UserId==uid&&valid.Any(v=>v.Id==p.ProblemId))
            .GroupBy(p=>p.Problem.CategoryId).Select(g=>new{CategoryId=g.Key,Solved=g.Count(p=>p.IsSolved),
                Attempted=g.Count(p=>p.Attempts>0),Mastered=g.Count(p=>p.MasteryStatus==MasteryStatuses.Mastered)}).ToListAsync(ct);
        var lookup=progress.ToDictionary(p=>p.CategoryId);
        var categories=inventory.Select(c=>new{c.CategoryId,ProblemsCount=c.Total,IsLocked=!allowed.Contains(c.CategoryId),
            Solved=lookup.GetValueOrDefault(c.CategoryId)?.Solved??0,Attempted=lookup.GetValueOrDefault(c.CategoryId)?.Attempted??0,
            Mastered=lookup.GetValueOrDefault(c.CategoryId)?.Mastered??0}).ToList();
        var total=inventory.Sum(c=>c.Total);var solved=categories.Sum(c=>c.Solved);
        return Ok(new{TrackId=id,t.StageId,ProblemsCount=total,Solved=solved,CompletionPercent=total==0?0:Math.Round(100.0*solved/total,1),Categories=categories});
    }
}
