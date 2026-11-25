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

        return StatusCode(410, new { Message = "FreeCategoriesFollowEditorialOrder" });
    }
}
