using MathWorldAPI.Data;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

/// <summary>
/// Public, read-only stage category-access catalog.
/// This endpoint does not authorize problem access; server-side checks in
/// problem endpoints are a separate mandatory migration step.
/// </summary>
[ApiController]
[Route("api/stages")]
public sealed class StageCategoryAccessController : ControllerBase
{
    private readonly AppDbContext _db;

    public StageCategoryAccessController(AppDbContext db)
    {
        _db = db;
    }

    [HttpGet("{stageId:int}/free-categories")]
    [ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
    public async Task<IActionResult> GetFreeCategories(
        int stageId, CancellationToken cancellationToken)
    {
        if (stageId <= 0)
            return BadRequest(new { Message = "InvalidStageId" });

        var exists = await _db.EducationalStages.AsNoTracking()
            .AnyAsync(stage => stage.Id == stageId, cancellationToken);
        if (!exists)
            return NotFound(new { Message = "StageNotFound" });

        var ids = await HttpContext.RequestServices
            .GetRequiredService<ProblemCategoryAccessService>()
            .GetFreeCategoryIdsAsync(stageId, cancellationToken);

        var categories = await _db.Categories.AsNoTracking()
            .Where(category => category.StageId == stageId)
            .OrderBy(category => category.Order).ThenBy(category => category.Id)
            .Select(category => new
            {
                category.Id,
                category.NameAr,
                category.NameEn,
                category.Icon,
                category.Order
            })
            .ToListAsync(cancellationToken);
        var freeIds = ids.ToHashSet();
        var hasSavedSelection = await _db.StageFreeCategorySelections.AsNoTracking()
            .AnyAsync(selection => selection.StageId == stageId, cancellationToken);

        return Ok(new
        {
            StageId = stageId,
            Categories = categories.Select(category => new
            {
                category.Id,
                category.NameAr,
                category.NameEn,
                category.Icon,
                category.Order,
                IsFree = freeIds.Contains(category.Id)
            }).ToList(),
            FreeCategoryIds = ids,
            FreeCategoryCount = ids.Count,
            HasSavedFreeSelection = hasSavedSelection,
            DailyProblemLimit = (int?)null,
            GroupsHaveVariableSizes = true
        });
    }
}
