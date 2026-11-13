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

        return Ok(new
        {
            StageId = stageId,
            FreeCategoryIds = ids,
            FreeCategoryCount = ids.Count,
            DailyProblemLimit = (int?)null,
            GroupsHaveVariableSizes = true
        });
    }
}
