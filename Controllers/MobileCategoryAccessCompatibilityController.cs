using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

/// <summary>
/// Serves the category-access and subscription snapshots required by the
/// current Flutter client, without depending on unreleased Premium migrations.
/// Problem detail, browse and answer endpoints remain the enforcement authority.
/// This controller must be retired/reconciled when the staged Premium backend
/// rollout replaces it with the permanent access catalog implementation.
/// </summary>
[ApiController]
[Route("api")]
public sealed class MobileCategoryAccessCompatibilityController : ControllerBase
{
    private readonly AppDbContext _db;
    private readonly IImgBbStorageService _imageStorage;

    public MobileCategoryAccessCompatibilityController(
        AppDbContext db,
        IImgBbStorageService imageStorage)
    {
        _db = db;
        _imageStorage = imageStorage;
    }

    [HttpGet("stages/{stageId:int}/free-categories")]
    [ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
    public async Task<IActionResult> GetStageCategories(
        int stageId, CancellationToken cancellationToken)
    {
        if (stageId <= 0)
            return BadRequest(new { Message = "InvalidStageId" });

        var exists = await _db.EducationalStages.AsNoTracking()
            .AnyAsync(stage => stage.Id == stageId, cancellationToken);
        if (!exists)
            return NotFound(new { Message = "StageNotFound" });

        // Keep the same deterministic Free pair used by problem enforcement.
        // Do not add a daily attempt limit or assume unshipped DB tables.
        var categories = await _db.Categories.AsNoTracking()
            .Where(category => category.StageId == stageId)
            .OrderBy(category => category.Order)
            .ThenBy(category => category.Id)
            .Select(category => new
            {
                category.Id,
                category.NameAr,
                category.NameEn,
                category.Icon,
                category.Order,
                ProblemsCount = category.Problems.Count(problem =>
                    problem.StageId == stageId)
            })
            .ToListAsync(cancellationToken);

        var freeIds = categories.Take(2)
            .Select(category => category.Id).ToList();
        var freeSet = freeIds.ToHashSet();

        return Ok(new
        {
            StageId = stageId,
            Categories = categories.Select(category => new
            {
                category.Id,
                category.NameAr,
                category.NameEn,
                Icon = _imageStorage.GetFullUrl(category.Icon) ?? string.Empty,
                category.Order,
                category.ProblemsCount,
                IsFree = freeSet.Contains(category.Id)
            }).ToList(),
            FreeCategoryIds = freeIds,
            FreeCategoryCount = freeIds.Count,
            HasSavedFreeSelection = false,
            DailyProblemLimit = (int?)null
        });
    }

    [Authorize(Roles = "Student")]
    [HttpGet("users/subscription")]
    [ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
    public async Task<IActionResult> GetSubscription(
        CancellationToken cancellationToken)
    {
        if (!int.TryParse(
            User.FindFirstValue(ClaimTypes.NameIdentifier), out var studentId) ||
            studentId <= 0)
            return Unauthorized(new { Message = "Unauthorized" });

        var subscription = await _db.Users.AsNoTracking()
            .Where(user => user.Id == studentId &&
                user.Role == "Student" && user.IsActive)
            .Select(user => user.SubscriptionType)
            .FirstOrDefaultAsync(cancellationToken);

        if (subscription == null)
            return Unauthorized(new { Message = "Unauthorized" });

        var isPremium = string.Equals(
            subscription, "Premium", StringComparison.OrdinalIgnoreCase);

        return Ok(new
        {
            SubscriptionType = isPremium ? "Premium" : "Free",
            IsPremium = isPremium,
            DailyProblemLimit = (int?)null
        });
    }
}
