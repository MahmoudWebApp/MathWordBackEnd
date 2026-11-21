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
    private readonly IImgBbStorageService _imageStorage;

    public StageCategoryAccessController(AppDbContext db, IImgBbStorageService imageStorage)
    {
        _db = db;
        _imageStorage = imageStorage;
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
                category.DescriptionAr,
                category.DescriptionEn,
                category.Icon,
                category.Order
            })
            .ToListAsync(cancellationToken);
        // The stage catalog is the single source of truth for both access
        // and publish-ready inventory. Count only problems whose stage matches
        // their category, matching the protected problem-list endpoints.
        var problemCounts = await _db.Problems.AsNoTracking()
            .Where(problem => problem.StageId == stageId &&
                problem.Category.StageId == stageId)
            .GroupBy(problem => problem.CategoryId)
            .Select(group => new { CategoryId = group.Key, Count = group.Count() })
            .ToDictionaryAsync(item => item.CategoryId, item => item.Count,
                cancellationToken);

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
                category.DescriptionAr,
                category.DescriptionEn,
                Icon = _imageStorage.GetFullUrl(category.Icon) ?? string.Empty,
                category.Order,
                ProblemsCount = problemCounts.GetValueOrDefault(category.Id),
                IsFree = freeIds.Contains(category.Id)
            }).ToList(),
            FreeCategoryIds = ids,
            FreeCategoryCount = ids.Count,
            HasSavedFreeSelection = hasSavedSelection,
            DailyProblemLimit = (int?)null,
            GroupsHaveVariableSizes = true
        });
    }
    /// <summary>
    /// Public math samples from server-configured Free categories only.
    /// Questions are read-only; never expose options, answers or solutions.
    /// </summary>
    [HttpGet("{stageId:int}/examples")]
    [ResponseCache(Duration = 120, Location = ResponseCacheLocation.Any)]
    public async Task<IActionResult> GetExamples(
        int stageId, CancellationToken cancellationToken)
    {
        if (stageId <= 0)
            return BadRequest(new { Message = "InvalidStageId" });

        if (!await _db.EducationalStages.AsNoTracking()
            .AnyAsync(stage => stage.Id == stageId, cancellationToken))
            return NotFound(new { Message = "StageNotFound" });

        var freeCategoryIds = await HttpContext.RequestServices
            .GetRequiredService<ProblemCategoryAccessService>()
            .GetFreeCategoryIdsAsync(stageId, cancellationToken);

        var examples = await _db.Problems.AsNoTracking()
            .Where(problem => problem.StageId == stageId &&
                problem.Category.StageId == stageId &&
                freeCategoryIds.Contains(problem.CategoryId))
            .OrderBy(problem => problem.Id)
            .Select(problem => new
            {
                problem.Id,
                problem.TitleAr,
                problem.TitleEn,
                problem.QuestionTextAr,
                problem.QuestionTextEn,
                CategoryNameAr = problem.Category.NameAr,
                CategoryNameEn = problem.Category.NameEn
            })
            .Take(4)
            .ToListAsync(cancellationToken);

        return Ok(new { StageId = stageId, Results = examples });
    }

}
