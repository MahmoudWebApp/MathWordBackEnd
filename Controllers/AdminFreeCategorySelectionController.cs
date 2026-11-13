using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

[ApiController]
[Route("api/admin/stages")]
[Authorize(Roles = "Admin")]
public sealed class AdminFreeCategorySelectionController : ControllerBase
{
    private readonly AppDbContext _db;
    public AdminFreeCategorySelectionController(AppDbContext db) => _db = db;

    public sealed class UpdateFreeCategoriesRequest
    {
        public List<int>? CategoryIds { get; set; }
    }

    [HttpPut("{stageId:int}/free-categories")]
    public async Task<IActionResult> Update(int stageId,
        [FromBody] UpdateFreeCategoriesRequest request,
        CancellationToken cancellationToken)
    {
        var adminId = int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var id)
            ? id : 0;
        if (adminId <= 0 || !await _db.Users.AsNoTracking()
                .AnyAsync(u => u.Id == adminId && u.Role == "Admin" && u.IsActive,
                    cancellationToken))
            return Forbid();

        var ids = request?.CategoryIds;
        if (stageId <= 0 || ids == null || ids.Count != 2 ||
            ids[0] <= 0 || ids[1] <= 0 || ids[0] == ids[1])
            return BadRequest(new { Message = "ExactlyTwoDistinctCategoriesRequired" });

        var stageExists = await _db.EducationalStages.AsNoTracking()
            .AnyAsync(s => s.Id == stageId, cancellationToken);
        if (!stageExists) return NotFound(new { Message = "StageNotFound" });

        var validCount = await _db.Categories.AsNoTracking()
            .CountAsync(c => c.StageId == stageId && ids.Contains(c.Id), cancellationToken);
        if (validCount != 2)
            return BadRequest(new { Message = "CategoriesMustBelongToStage" });

        var saved = await _db.StageFreeCategorySelections
            .FirstOrDefaultAsync(s => s.StageId == stageId, cancellationToken);
        if (saved == null)
        {
            saved = new StageFreeCategorySelection { StageId = stageId };
            _db.StageFreeCategorySelections.Add(saved);
        }
        saved.FirstCategoryId = ids[0];
        saved.SecondCategoryId = ids[1];
        saved.UpdatedByAdminId = adminId;
        saved.UpdatedAtUtc = DateTime.UtcNow;
        await _db.SaveChangesAsync(cancellationToken);

        return Ok(new
        {
            StageId = stageId,
            FreeCategoryIds = ids,
            UpdatedAtUtc = saved.UpdatedAtUtc
        });
    }
}
