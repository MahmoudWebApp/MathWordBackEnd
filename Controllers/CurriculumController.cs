using MathWorldAPI.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

/// <summary>
/// Public, read-only published taxonomy. Never exposes draft skills, problems or answers.
/// Frontend and Flutter should consume the same endpoint and localize by NameAr/NameEn.
/// </summary>
[ApiController]
[AllowAnonymous]
[Route("api/curriculum")]
public sealed class CurriculumController : ControllerBase
{
    private readonly AppDbContext _db;
    public CurriculumController(AppDbContext db) => _db = db;

    [HttpGet("frameworks")]
    public IActionResult Frameworks() => Ok(new
    {
        BasedOn = new[]
        {
            new { Key = "CCSS", Name = "Common Core State Standards", Purpose = "Grade-level skills and learning objectives" },
            new { Key = "Cambridge", Name = "Cambridge International Mathematics", Purpose = "Curriculum progression cross-check" },
            new { Key = "PISA", Name = "OECD PISA Mathematics", Purpose = "Reasoning and real-world applications" }
        },
        DisclaimerAr = "ننظّم المحتوى بالاستناد إلى أطر تعليمية دولية، ولسنا جهة معتمدة من هذه المؤسسات.",
        DisclaimerEn = "Our curriculum draws on international education frameworks; MathWorld is not accredited or endorsed by these organizations."
    });

    [HttpGet("domains")]
    public async Task<IActionResult> Domains(CancellationToken cancellationToken)
    {
        var items = await _db.CurriculumDomains.AsNoTracking()
            .Where(d => d.IsPublished)
            .OrderBy(d => d.SortOrder).ThenBy(d => d.Id)
            .Select(d => new { d.StableKey, d.NameAr, d.NameEn, d.DescriptionAr, d.DescriptionEn })
            .ToListAsync(cancellationToken);
        return Ok(items);
    }

    [HttpGet("stages/{stageId:int}/skills")]
    public async Task<IActionResult> Skills(int stageId, CancellationToken cancellationToken)
    {
        if (stageId <= 0) return BadRequest();
        var items = await _db.CurriculumSkills.AsNoTracking()
            .Where(s => s.IsPublished && s.StageId == stageId && s.Domain.IsPublished)
            .OrderBy(s => s.SortOrder).ThenBy(s => s.Id)
            .Select(s => new
            {
                s.StableKey, s.CategoryId, DomainKey = s.Domain.StableKey,
                s.NameAr, s.NameEn, s.DescriptionAr, s.DescriptionEn
            }).ToListAsync(cancellationToken);
        return Ok(items);
    }
}
