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
        // Old editor is retired. Free topics are always the first two by
        // editorial order, and this API must not create conflicting overrides.
        return StatusCode(StatusCodes.Status410Gone, new
        {
            Message = "FreeCategoriesAreFirstTwoByOrder",
            StageId = stageId
        });
    }
}
