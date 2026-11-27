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
        // The grouped coverage query below is the visibility check for this
        // public list. Avoid evaluating the full valid-link EXISTS twice.
        // Empty or invalid tracks still never enter the response.
        var items=tracks.Enabled?await db.LearningTracks.AsNoTracking().Where(t=>t.IsPublished&&t.StageId==stageId)
            .OrderBy(t=>t.SortOrder).ThenBy(t=>t.Id).ToListAsync(ct):new List<LearningTrack>();
        var result=new List<object>();
        if(items.Count==0)return Ok(new{Enabled=tracks.Enabled,Items=result});
        // One grouped category coverage query for all tracks; select the first
        // two populated categories independently for each track.
        var ids=items.Select(t=>t.Id).ToArray();
        var rows=await (from link in tracks.ValidLinks()
            join category in db.Categories.AsNoTracking() on link.CategoryId equals category.Id
            where ids.Contains(link.TrackId)
            group link by new{link.TrackId,link.CategoryId,category.Order} into g
            select new{g.Key.TrackId,g.Key.CategoryId,g.Key.Order,
                Problems=g.Select(x=>x.ProblemId).Distinct().Count(),
                Skills=g.Select(x=>x.SkillId).Distinct().Count()}).ToListAsync(ct);
        var totals=rows.GroupBy(row=>row.TrackId).ToDictionary(g=>g.Key,g=>new{
            Problems=g.Sum(x=>x.Problems), Categories=g.Count(), Skills=g.Sum(x=>x.Skills),
            FreeProblems=g.OrderBy(x=>x.Order).ThenBy(x=>x.CategoryId)
                .Take(CategoryAccessPolicy.DefaultFreeCategoriesPerStage).Sum(x=>x.Problems)
        });
        foreach(var t in items)
        {
            if(!totals.TryGetValue(t.Id,out var coverage)||coverage.Problems==0)continue;
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
        var free=await access.GetTrackFreeCategoryIdsAsync(id,t.StageId,ct:ct);
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
        await using var tx=await db.Database.BeginTransactionAsync(ct);
        await db.Database.SqlQuery<int>($"SELECT 1 AS \"Value\" FROM pg_advisory_xact_lock({-987654320}, {uid})").SingleAsync(ct);
        var t=await tracks.VisibleTracks().SingleOrDefaultAsync(x=>x.Id==input.TrackId,ct);
        if(t is null)return NotFound();
        // Atomic stage + track selection; no progress is modified.
        var n=await db.Users.Where(x=>x.Id==uid&&x.IsActive&&x.Role=="Student")
            .ExecuteUpdateAsync(x=>x.SetProperty(u=>u.CurrentStageId,t.StageId).SetProperty(u=>u.CurrentTrackId,t.Id),ct);
        if(n!=1)return Unauthorized();
        await tx.CommitAsync(ct);
        return Ok(new{Enabled=true,StageId=t.StageId,TrackId=t.Id});
    }
    [Authorize(Roles="Student")]
    [HttpGet("api/users/learning-tracks/{id:int}/categories/{categoryId:int}/problems")]
    public async Task<IActionResult> PracticeCatalog(int id,int categoryId,[FromQuery]int page=1,[FromQuery]bool hideSolved=false,CancellationToken ct=default,[FromQuery]int pageSize=5,[FromQuery]string? q=null)
    {
        if(!tracks.Enabled)return NotFound();
        if(page is <1 or >10000 || pageSize is <1 or >50 || q?.Length>120)return BadRequest();
        var t=await tracks.VisibleTracks().SingleOrDefaultAsync(x=>x.Id==id,ct);
        if(t is null)return NotFound();
        var allowed=await access.GetAllowedCategoryIdsAsync(User,ct)??new List<int>();
        if(!allowed.Contains(categoryId))return StatusCode(403,new{Message="CategoryLocked"});
        var uid=int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);
        if(!await db.Users.AsNoTracking().AnyAsync(u=>u.Id==uid&&u.IsActive&&u.Role=="Student"&&u.CurrentStageId==t.StageId&&u.CurrentTrackId==id,ct))
            return StatusCode(403,new{Message="CurrentTrackOnly"});
        var valid=tracks.ValidProblems(id).Where(p=>p.CategoryId==categoryId);
        if(!await valid.AnyAsync(ct))return NotFound();
        var scopedProgress=TrackPractice.For(db,TrackPractice.Scope(HttpContext.RequestServices.GetRequiredService<IConfiguration>(),id));
        if(hideSolved)valid=valid.Where(p=>!scopedProgress.Any(x=>x.UserId==uid&&x.ProblemId==p.Id&&x.IsSolved));
        var term=q?.Trim();
        if(!string.IsNullOrEmpty(term))
        {
            // Search only the already-authorized track/category, before paging.
            var pattern="%"+term.Replace("!","!!").Replace("%","!%").Replace("_","!_")+"%";
            valid=valid.Where(p=>EF.Functions.ILike(p.TitleAr,pattern,"!")||
                EF.Functions.ILike(p.TitleEn,pattern,"!")||
                EF.Functions.ILike(p.QuestionTextAr,pattern,"!")||
                EF.Functions.ILike(p.QuestionTextEn,pattern,"!"));
        }
        var total=await valid.CountAsync(ct);
        var items=await valid.OrderBy(p=>scopedProgress.Any(x=>x.UserId==uid&&x.ProblemId==p.Id&&x.IsSolved)).ThenBy(p=>p.Id).Skip((page-1)*pageSize).Take(pageSize)
            .Select(p=>new{p.Id,p.CategoryId,p.TitleAr,p.TitleEn,p.Points,p.StageId,
                CategoryNameAr=p.Category.NameAr,CategoryNameEn=p.Category.NameEn,
                StageNameAr=p.Stage.NameAr,StageNameEn=p.Stage.NameEn,
                IsSolved=scopedProgress.Any(x=>x.UserId==uid&&x.ProblemId==p.Id&&x.IsSolved),
                HasAttempted=scopedProgress.Any(x=>x.UserId==uid&&x.ProblemId==p.Id&&x.Attempts>0),
                IsFavorite=db.UserProgresses.AsNoTracking().Any(x=>x.UserId==uid&&x.ProblemId==p.Id&&x.IsFavorite)})
            .ToListAsync(ct);
        return Ok(new{TrackId=id,CategoryId=categoryId,Total=total,Page=page,PageSize=pageSize,Items=items});
    }

    // Stable continuation independent of mutable unsolved-first pagination.
    [Authorize(Roles="Student")]
    [HttpGet("api/users/learning-tracks/{id:int}/categories/{categoryId:int}/next")]
    public async Task<IActionResult> NextProblem(int id,int categoryId,[FromQuery]int afterProblemId,CancellationToken ct)
    {
        if(afterProblemId<=0)return BadRequest();
        if(!tracks.Enabled)return NotFound();
        var t=await tracks.VisibleTracks().SingleOrDefaultAsync(x=>x.Id==id,ct);
        if(t is null)return NotFound();
        var allowed=await access.GetAllowedCategoryIdsAsync(User,ct)??new List<int>();
        if(!allowed.Contains(categoryId))return StatusCode(403,new{Message="CategoryLocked"});
        var uid=int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);
        if(!await db.Users.AsNoTracking().AnyAsync(u=>u.Id==uid&&u.IsActive&&u.Role=="Student"&&u.CurrentStageId==t.StageId&&u.CurrentTrackId==id,ct))
            return StatusCode(403,new{Message="CurrentTrackOnly"});
        var valid=tracks.ValidProblems(id).Where(p=>p.CategoryId==categoryId);
        if(!await valid.AnyAsync(p=>p.Id==afterProblemId,ct))return NotFound();
        var progress=TrackPractice.For(db,TrackPractice.Scope(HttpContext.RequestServices.GetRequiredService<IConfiguration>(),id));
        var eligible=valid.Where(p=>p.Id!=afterProblemId&&!progress.Any(x=>x.UserId==uid&&x.ProblemId==p.Id&&(x.IsSolved||(x.Attempts>0&&!x.IsInErrorNotebook))));
        var next=await eligible
            .OrderBy(p=>progress.Any(x=>x.UserId==uid&&x.ProblemId==p.Id&&x.Attempts>0))
            .ThenBy(p=>p.Id<=afterProblemId).ThenBy(p=>p.Id)
            .Select(p=>new{p.Id,p.CategoryId,p.TitleAr,p.TitleEn,
                RequiresRetry=progress.Any(x=>x.UserId==uid&&x.ProblemId==p.Id&&x.Attempts>0&&x.IsInErrorNotebook)})
            .FirstOrDefaultAsync(ct);
        return Ok(new{TrackId=id,CategoryId=categoryId,HasNext=next!=null,Problem=next});
    }

    [Authorize(Roles="Student")]
    [HttpGet("api/users/learning-tracks/continue")]
    public async Task<IActionResult> Continue(CancellationToken ct)
    {
        var uid=int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);
        var user=await db.Users.AsNoTracking().SingleAsync(x=>x.Id==uid,ct);
        if(!PremiumEntitlement.IsActive(user))return StatusCode(403,new{Message="PremiumRequired"});
        var track=await tracks.ActiveAsync(user.CurrentStageId,user.CurrentTrackId,ct);
        if(track is null)return NotFound();
        var allowed=await access.GetAllowedCategoryIdsAsync(User,ct)??new List<int>();
        // Continue with new, unattempted material; mistakes are handled by the
        // existing error notebook, not presented as new questions.
        var scopedProgress=TrackPractice.For(db,TrackPractice.Scope(HttpContext.RequestServices.GetRequiredService<IConfiguration>(),track.Id));
        var next=await tracks.ValidProblems(track.Id).Where(p=>allowed.Contains(p.CategoryId)&&
            !scopedProgress.Any(up=>up.UserId==uid&&up.ProblemId==p.Id&&(up.IsSolved||up.Attempts>0)))
            .OrderBy(p=>p.Category.Order).ThenBy(p=>p.Id)
            .Select(p=>new{p.Id,p.CategoryId,p.TitleAr,p.TitleEn}).FirstOrDefaultAsync(ct);
        return Ok(new{TrackId=track.Id,Problem=next});
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
        var progress=await TrackPractice.For(db,TrackPractice.Scope(HttpContext.RequestServices.GetRequiredService<IConfiguration>(),id)).AsNoTracking().Where(p=>p.UserId==uid&&valid.Any(v=>v.Id==p.ProblemId))
            .GroupBy(p=>p.Problem.CategoryId).Select(g=>new{CategoryId=g.Key,Solved=g.Count(p=>p.IsSolved),
                Attempted=g.Count(p=>p.Attempts>0),Mastered=g.Count(p=>p.MasteryStatus==MasteryStatuses.Mastered)}).ToListAsync(ct);
        var lookup=progress.ToDictionary(p=>p.CategoryId);
        var categories=inventory.Select(c=>new{c.CategoryId,ProblemsCount=c.Total,IsLocked=!allowed.Contains(c.CategoryId),
            Solved=lookup.GetValueOrDefault(c.CategoryId)?.Solved??0,Attempted=lookup.GetValueOrDefault(c.CategoryId)?.Attempted??0,
            Mastered=lookup.GetValueOrDefault(c.CategoryId)?.Mastered??0}).ToList();
        var total=inventory.Sum(c=>c.Total);var solved=categories.Sum(c=>c.Solved);
        return Ok(new{TrackId=id,t.StageId,TrackPracticeIsolationEnabled=TrackPractice.Enabled(HttpContext.RequestServices.GetRequiredService<IConfiguration>()),ProblemsCount=total,Solved=solved,CompletionPercent=total==0?0:Math.Round(100.0*solved/total,1),Categories=categories});
    }
}
