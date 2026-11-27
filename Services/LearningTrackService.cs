using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Services;

public sealed record TrackCoverage(int Categories,int Skills,int Problems,int FreeProblems);
public sealed record TrackMapping(int[] CategoryIds,int[] SkillIds,int[] ProblemIds);

public sealed class LearningTrackService(AppDbContext db, IConfiguration config, ProblemCategoryAccessService access)
{
    public bool Enabled => config.GetValue<bool>("LearningTracks:Enabled");

    // Resolve only a currently visible selection, never an arbitrary caller-supplied track.
    // Historic stage reports retain their original meaning.
    public async Task<LearningTrack?> ActiveAsync(int? stageId,int? trackId,CancellationToken ct)
    {
        if(!Enabled || !stageId.HasValue || !trackId.HasValue)return null;
        return await VisibleTracks().SingleOrDefaultAsync(t=>t.StageId==stageId && t.Id==trackId,ct);
    }

    public async Task<LearningTrack?> ActiveForStudentAsync(ClaimsPrincipal principal,CancellationToken ct)
    {
        if(!Enabled || !principal.IsInRole("Student") ||
            !int.TryParse(principal.FindFirstValue(ClaimTypes.NameIdentifier),out var id))return null;
        // Resolve the live student and selected visible track in one round trip.
        var selected=from u in db.Users.AsNoTracking()
            where u.Id==id&&u.IsActive&&u.Role=="Student"
            join t in VisibleTracks()
                on new { StageId=u.CurrentStageId, TrackId=u.CurrentTrackId }
                equals new { StageId=(int?)t.StageId, TrackId=(int?)t.Id }
            select t;
        return await selected.SingleOrDefaultAsync(ct);
    }

    public async Task<bool> CanPracticeAsync(ClaimsPrincipal principal,int problemId,CancellationToken ct)
    {
        if(!Enabled||!principal.IsInRole("Student"))return true;
        if(!int.TryParse(principal.FindFirstValue(ClaimTypes.NameIdentifier),out var uid))return false;
        // Keep the legacy no-selection fallback, but never allow an inactive
        // student or an invalid/unpublished selected track. One SQL snapshot
        // replaces the separate account read and mapping check.
        var valid=ValidLinks().Where(l=>l.ProblemId==problemId);
        return await db.Users.AsNoTracking().AnyAsync(u=>
            u.Id==uid&&u.IsActive&&u.Role=="Student"&&
            (!u.CurrentTrackId.HasValue||
                (u.CurrentStageId.HasValue&&db.LearningTracks.Any(t=>
                    t.Id==u.CurrentTrackId&&t.StageId==u.CurrentStageId&&t.IsPublished&&
                    valid.Any(l=>l.TrackId==t.Id)))),ct);
    }

    // Recheck original stage/category and published primary skill every time.
    // Old content changes cannot make an invalid mapping visible to students.
    public sealed class ValidTrackLink {public int TrackId{get;init;} public int ProblemId{get;init;} public int CategoryId{get;init;} public int SkillId{get;init;}}

    // Keep public catalog and practice validation on the same relational rule.
    public IQueryable<ValidTrackLink> ValidLinks() => ValidLinksFor(db);

    public static IQueryable<ValidTrackLink> ValidLinksFor(AppDbContext db) =>
        from link in db.LearningTrackProblems.AsNoTracking()
        join track in db.LearningTracks on link.TrackId equals track.Id
        join problem in db.Problems on link.ProblemId equals problem.Id
        join ps in db.CurriculumProblemSkills on problem.Id equals ps.ProblemId
        join tc in db.LearningTrackCategories on new { TrackId=track.Id, CategoryId=problem.CategoryId }
            equals new { tc.TrackId, tc.CategoryId }
        join ts in db.LearningTrackSkills on new { TrackId=track.Id, SkillId=ps.SkillId }
            equals new { ts.TrackId, ts.SkillId }
        where problem.StageId==track.StageId&&problem.Category.StageId==track.StageId&&
            ps.IsPrimary&&ps.Skill.IsPublished&&ps.Skill.Domain.IsPublished&&
            ps.Skill.StageId==track.StageId&&ps.Skill.CategoryId==problem.CategoryId
        select new ValidTrackLink {TrackId=link.TrackId,ProblemId=problem.Id,CategoryId=problem.CategoryId,SkillId=ps.SkillId};

    public IQueryable<MathProblem> ValidProblems(int trackId)
    {
        var problemIds=ValidLinks().Where(l=>l.TrackId==trackId).Select(l=>l.ProblemId);
        return db.Problems.AsNoTracking().Where(p=>problemIds.Contains(p.Id));
    }

    public IQueryable<LearningTrack> VisibleTracks()
    {
        var links=ValidLinks();
        return db.LearningTracks.AsNoTracking().Where(t=>t.IsPublished&&links.Any(l=>l.TrackId==t.Id));
    }

    public async Task<int[]> GetFreeCategoryIdsForPlacementAsync(int stageId,int[] categoryIds,CancellationToken ct)
        => await db.Categories.AsNoTracking().Where(c=>c.StageId==stageId&&categoryIds.Contains(c.Id))
            .OrderBy(c=>c.Order).ThenBy(c=>c.Id).Select(c=>c.Id)
            .Take(CategoryAccessPolicy.DefaultFreeCategoriesPerStage).ToArrayAsync(ct);

    public async Task<TrackCoverage> CoverageAsync(int id,int stageId,CancellationToken ct)
    {
        var free=await access.GetTrackFreeCategoryIdsAsync(id,stageId,requirePublished:false,ct:ct);
        var valid=ValidProblems(id);
        var categories=await valid.Select(p=>p.CategoryId).Distinct().CountAsync(ct);
        var skills=await db.CurriculumProblemSkills.AsNoTracking()
            .Where(ps=>ps.IsPrimary && valid.Any(p=>p.Id==ps.ProblemId))
            .Select(ps=>ps.SkillId).Distinct().CountAsync(ct);
        var problems=await valid.CountAsync(ct);
        var freeProblems=await valid.CountAsync(p=>free.Contains(p.CategoryId),ct);
        return new(categories,skills,problems,freeProblems);
    }

    public async Task<string?> ValidateMappingAsync(int stageId,TrackMapping mapping,CancellationToken ct)
    {
        var c=mapping.CategoryIds; var s=mapping.SkillIds; var p=mapping.ProblemIds;
        if(c is null || s is null || p is null || c.Length>300 || s.Length>2000 || p.Length>10000 ||
            c.Any(x=>x<=0)||s.Any(x=>x<=0)||p.Any(x=>x<=0) ||
            c.Distinct().Count()!=c.Length || s.Distinct().Count()!=s.Length || p.Distinct().Count()!=p.Length)
            return "InvalidMapping";
        if(await db.Categories.CountAsync(x=>c.Contains(x.Id)&&x.StageId==stageId,ct)!=c.Length)
            return "CategoryStageMismatch";
        if(await db.CurriculumSkills.CountAsync(x=>s.Contains(x.Id)&&x.StageId==stageId&&c.Contains(x.CategoryId),ct)!=s.Length)
            return "SkillCategoryMismatch";
        if(await db.Problems.CountAsync(x=>p.Contains(x.Id)&&x.StageId==stageId&&x.Category.StageId==stageId&&c.Contains(x.CategoryId)&&
            db.CurriculumProblemSkills.Any(ps=>ps.ProblemId==x.Id&&ps.IsPrimary&&s.Contains(ps.SkillId)&&
                ps.Skill.StageId==stageId&&ps.Skill.CategoryId==x.CategoryId),ct)!=p.Length)
            return "ProblemPrimarySkillMismatch";
        return null;
    }
}
