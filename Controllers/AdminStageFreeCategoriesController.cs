using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.Models;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

/// <summary>
/// Audit-backed admin selection of exactly two free categories per stage.
/// The public catalog and protected problem reads use the same persisted row.
/// </summary>
[ApiController]
[Route("api/admin/stages")]
[Authorize(Roles = "Admin")]
public sealed class AdminStageFreeCategoriesController : ControllerBase
{
    private readonly AppDbContext _db;

    public AdminStageFreeCategoriesController(AppDbContext db) => _db = db;

    public sealed class SelectionRequest
    {
        public List<int>? CategoryIds { get; set; }
    }

    [HttpPut("{stageId:int}/free-categories")]
    public async Task<IActionResult> SetFreeCategories(
        int stageId, [FromBody] SelectionRequest? request, CancellationToken ct)
    {
        var adminId = int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var parsed)
            ? parsed : 0;
        if (adminId <= 0 || !await _db.Users.AsNoTracking().AnyAsync(
                u => u.Id == adminId && u.Role == "Admin" && u.IsActive, ct))
            return Forbid();

        var ids = request?.CategoryIds;
        if (stageId <= 0 || ids is null || ids.Count != 2 ||
            ids.Any(id => id <= 0) || ids[0] == ids[1])
            return BadRequest(new { Message = "ExactlyTwoDistinctFreeCategoriesRequired" });

        if (!await _db.EducationalStages.AsNoTracking()
                .AnyAsync(stage => stage.Id == stageId, ct))
            return NotFound(new { Message = "StageNotFound" });

        var categories = await _db.Categories.AsNoTracking()
            .Where(c => c.StageId == stageId && ids.Contains(c.Id))
            .ToListAsync(ct);
        if (categories.Count != 2)
            return BadRequest(new { Message = "FreeCategoriesMustBelongToStage" });

        // Validate using the same policy used by the learner access service.
        try
        {
            CategoryAccessPolicy.ResolveFreeCategoryIds(categories, ids);
        }
        catch (ArgumentException)
        {
            return BadRequest(new { Message = "InvalidFreeCategorySelection" });
        }

        var selection = await _db.StageFreeCategorySelections
            .FirstOrDefaultAsync(entry => entry.StageId == stageId, ct);
        if (selection == null)
        {
            selection = new StageFreeCategorySelection { StageId = stageId };
            _db.StageFreeCategorySelections.Add(selection);
        }
        selection.FirstCategoryId = ids[0];
        selection.SecondCategoryId = ids[1];
        selection.UpdatedByAdminId = adminId;
        selection.UpdatedAtUtc = DateTime.UtcNow;
        await _db.SaveChangesAsync(ct);

        return Ok(new
        {
            StageId = stageId,
            FreeCategoryIds = new[] { selection.FirstCategoryId, selection.SecondCategoryId }
        });
    }
}
