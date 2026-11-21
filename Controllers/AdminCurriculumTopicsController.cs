using System.Security.Claims;
using MathWorldAPI.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

/// <summary>Editor inventory of draft categories, never public or learner-visible.</summary>
[ApiController]
[Authorize(Roles = "Admin")]
[Route("api/admin/curriculum/topics")]
public sealed class AdminCurriculumTopicsController : ControllerBase
{
    private readonly AppDbContext _db;
    public AdminCurriculumTopicsController(AppDbContext db) => _db = db;

    [HttpGet("proposals")]
    public async Task<IActionResult> Proposals(CancellationToken ct)
    {
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var adminId)
            || adminId <= 0
            || !await _db.Users.AsNoTracking().AnyAsync(
                user => user.Id == adminId && user.IsActive && user.Role == "Admin", ct))
            return Forbid();

        var rows = await _db.CurriculumTopicProposals.AsNoTracking()
            .OrderBy(x => x.StageId).ThenBy(x => x.SortOrder).ThenBy(x => x.Id)
            .Select(x => new
            {
                x.StableKey,
                x.StageId,
                DomainKey = x.Domain.StableKey,
                x.NameAr,
                x.NameEn,
                x.DescriptionAr,
                x.DescriptionEn,
                x.IconKey,
                x.SortOrder,
                x.EditorialStatus,
                x.ProposedQuestionCount
            }).ToArrayAsync(ct);

        return Ok(new
        {
            Published = false,
            Total = rows.Length,
            TotalDraftProblems = rows.Sum(x => x.ProposedQuestionCount),
            RequiresIndependentReview = true,
            Topics = rows
        });
    }
}
