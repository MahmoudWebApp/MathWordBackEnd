using MathWorldAPI.Data;
using MathWorldAPI.Models;
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

        // One projected catalog query returns both metadata and counts.
        // The previous flow fetched categories twice, counted problems in a
        // third query, and looked up the same Free selection twice. Those
        // serial DB round trips are expensive across regions.
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
                category.Order,
                ProblemsCount = _db.Problems.Count(problem =>
                    problem.CategoryId == category.Id &&
                    problem.StageId == category.StageId)
            })
            .ToListAsync(cancellationToken);

        var saved = await _db.StageFreeCategorySelections.AsNoTracking()
            .FirstOrDefaultAsync(item => item.StageId == stageId, cancellationToken);
        var access = HttpContext.RequestServices
            .GetRequiredService<ProblemCategoryAccessService>();
        var policyCategories = categories.Select(category => new Category
        {
            Id = category.Id,
            StageId = stageId,
            Order = category.Order
        });
        var ids = access.ResolveFreeCategoryIds(stageId, policyCategories, saved);
        var freeIds = ids.ToHashSet();
        var hasSavedSelection = saved is not null;

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
                category.ProblemsCount,
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
