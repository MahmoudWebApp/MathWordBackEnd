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
    private readonly IConfiguration _configuration;

    public StageCategoryAccessController(AppDbContext db, IConfiguration configuration)
    {
        _db = db;
        _configuration = configuration;
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

        var categories = await _db.Categories.AsNoTracking()
            .Where(category => category.StageId == stageId)
            .OrderBy(category => category.Order)
            .ThenBy(category => category.Id)
            .ToListAsync(cancellationToken);

        // Temporary configuration mechanism; audited admin configuration
        // must replace this before launch.
        var raw = _configuration[$"FreeCategoryAccess:Stages:{stageId}"];
        List<int>? configured = null;
        if (!string.IsNullOrWhiteSpace(raw))
        {
            var parts = raw.Split(',', StringSplitOptions.TrimEntries |
                StringSplitOptions.RemoveEmptyEntries);
            if (parts.Length != CategoryAccessPolicy.DefaultFreeCategoriesPerStage ||
                parts.Any(part => !int.TryParse(part, out _)))
                return StatusCode(503, new { Message = "FreeCategoryConfigurationInvalid" });

            configured = parts.Select(int.Parse).ToList();
        }

        IReadOnlyList<int> ids;
        try
        {
            ids = CategoryAccessPolicy.ResolveFreeCategoryIds(categories, configured);
        }
        catch (ArgumentException)
        {
            return StatusCode(503, new { Message = "FreeCategoryConfigurationInvalid" });
        }

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
