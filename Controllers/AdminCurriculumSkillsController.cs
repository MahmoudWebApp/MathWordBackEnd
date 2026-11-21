using System.Security.Claims;
using MathWorldAPI.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

/// <summary>
/// Editorial review of draft, standards-linked skill coverage. Admin-only.
/// Never claims that template classification proves mathematical correctness
/// or student mastery. Does not publish content or modify student records.
/// </summary>
[ApiController]
[Authorize(Roles = "Admin")]
[Route("api/admin/curriculum/skills")]
public sealed class AdminCurriculumSkillsController : ControllerBase
{
    private readonly AppDbContext _db;

    public AdminCurriculumSkillsController(AppDbContext db) => _db = db;

    [HttpGet("coverage")]
    public async Task<IActionResult> Coverage(CancellationToken ct)
    {
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var adminId)
            || adminId <= 0
            || !await _db.Users.AsNoTracking().AnyAsync(
                u => u.Id == adminId && u.IsActive && u.Role == "Admin", ct))
            return Forbid();

        var categories = await _db.Categories.AsNoTracking()
            .OrderBy(c => c.StageId).ThenBy(c => c.Order).ThenBy(c => c.Id)
            .Select(c => new { c.Id, c.StageId, c.NameAr, c.NameEn })
            .ToListAsync(ct);
        var problems = await _db.Problems.AsNoTracking()
            .Select(p => new { p.Id, p.StageId, p.CategoryId })
            .ToListAsync(ct);
        var skills = await _db.CurriculumSkills.AsNoTracking()
            .OrderBy(s => s.StageId).ThenBy(s => s.CategoryId).ThenBy(s => s.SortOrder).ThenBy(s => s.Id)
            .Select(s => new
            {
                s.Id, s.StageId, s.CategoryId, s.StableKey, s.NameAr, s.NameEn,
                s.IsPublished, DomainKey = s.Domain.StableKey
            }).ToListAsync(ct);
        var links = await _db.CurriculumProblemSkills.AsNoTracking()
            .Where(l => l.IsPrimary)
            .Select(l => new { l.ProblemId, l.SkillId })
            .ToListAsync(ct);
        var standardCounts = await _db.CurriculumSkillStandards.AsNoTracking()
            .GroupBy(s => s.SkillId)
            .Select(g => new { SkillId = g.Key, Count = g.Count() })
            .ToListAsync(ct);

        var linkedProblems = links.Select(l => l.ProblemId).ToHashSet();
        var bySkill = links.GroupBy(l => l.SkillId)
            .ToDictionary(g => g.Key, g => g.Count());
        var byStandard = standardCounts.ToDictionary(s => s.SkillId, s => s.Count);
        var skillById = skills.ToDictionary(s => s.Id);
        var problemById = problems.ToDictionary(p => p.Id);
        var invalidLinks = links.Count(l =>
            !skillById.TryGetValue(l.SkillId, out var skill) ||
            !problemById.TryGetValue(l.ProblemId, out var problem) ||
            skill.StageId != problem.StageId ||
            skill.CategoryId != problem.CategoryId);

        var result = categories.Select(c =>
        {
            var categorySkills = skills.Where(s => s.CategoryId == c.Id
                && s.StageId == c.StageId).ToList();
            var categoryProblems = problems.Where(p => p.CategoryId == c.Id
                && p.StageId == c.StageId).ToList();
            return new
            {
                CategoryId = c.Id,
                c.StageId,
                c.NameAr,
                c.NameEn,
                ProblemCount = categoryProblems.Count,
                MappedProblemCount = categoryProblems.Count(p => linkedProblems.Contains(p.Id)),
                SkillCount = categorySkills.Count,
                DraftSkillCount = categorySkills.Count(s => !s.IsPublished),
                Skills = categorySkills.Select(s => new
                {
                    s.StableKey, s.DomainKey, s.NameAr, s.NameEn, s.IsPublished,
                    ProblemCount = bySkill.GetValueOrDefault(s.Id),
                    StandardMappingCount = byStandard.GetValueOrDefault(s.Id)
                }).ToArray()
            };
        }).ToArray();

        return Ok(new
        {
            TotalProblems = problems.Count,
            MappedProblems = problems.Count(p => linkedProblems.Contains(p.Id)),
            UnmappedProblems = problems.Count(p => !linkedProblems.Contains(p.Id)),
            TotalSkills = skills.Count,
            DraftSkills = skills.Count(s => !s.IsPublished),
            PublishedSkills = skills.Count(s => s.IsPublished),
            StandardsMappedSkills = standardCounts.Count,
            InvalidPrimaryLinks = invalidLinks,
            SkillTaggingApproved = false,
            MasteryEvidenceReady = false,
            Categories = result
        });
    }
}
