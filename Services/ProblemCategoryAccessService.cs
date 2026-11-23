using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Services;

/// <summary>
/// Single source of truth for Free/Premium problem-category access.
/// The catalog remains public, but protected problem content must use this service.
/// </summary>
public sealed class ProblemCategoryAccessService
{
    private readonly AppDbContext _db;
    private readonly IConfiguration _configuration;

    public ProblemCategoryAccessService(AppDbContext db, IConfiguration configuration)
    {
        _db = db;
        _configuration = configuration;
    }

    public async Task<IReadOnlyList<int>> GetFreeCategoryIdsAsync(
        int stageId, CancellationToken cancellationToken = default)
    {
        var categories = await _db.Categories.AsNoTracking()
            .Where(c => c.StageId == stageId)
            .OrderBy(c => c.Order).ThenBy(c => c.Id)
            .ToListAsync(cancellationToken);
        var saved = await _db.StageFreeCategorySelections.AsNoTracking()
            .FirstOrDefaultAsync(x => x.StageId == stageId, cancellationToken);
        return ResolveFreeCategoryIds(stageId, categories, saved);
    }

    /// <summary>
    /// Evaluate the same fail-closed policy against already fetched categories
    /// and an optional saved selection. Pure in-memory operation: no SQL here.
    /// Allows stage catalogs and authenticated problem reads to reuse one
    /// category snapshot instead of re-querying Tokyo per stage.
    /// </summary>
    public IReadOnlyList<int> ResolveFreeCategoryIds(
        int stageId,
        IEnumerable<Category> categories,
        StageFreeCategorySelection? saved)
    {
        if (saved != null)
        {
            try
            {
                return CategoryAccessPolicy.ResolveFreeCategoryIds(categories,
                    new[] { saved.FirstCategoryId, saved.SecondCategoryId });
            }
            catch (ArgumentException)
            {
                return Array.Empty<int>();
            }
        }
        var raw = _configuration[$"FreeCategoryAccess:Stages:{stageId}"];
        List<int>? configured = null;
        if (raw is not null)
        {
            var parts = raw.Split(',', StringSplitOptions.TrimEntries |
                StringSplitOptions.RemoveEmptyEntries);
            if (parts.Length != CategoryAccessPolicy.DefaultFreeCategoriesPerStage ||
                parts.Any(part => !int.TryParse(part, out _)))
                return Array.Empty<int>(); // Fail closed.
            configured = parts.Select(int.Parse).ToList();
        }

        try
        {
            return CategoryAccessPolicy.ResolveFreeCategoryIds(categories, configured);
        }
        catch (ArgumentException)
        {
            return Array.Empty<int>();
        }
    }

    /// <summary>
    /// Reordering categories must not silently replace the two default Free
    /// categories. Admins can persist the current pair first through the
    /// dedicated stage configuration endpoint, then reorder freely.
    /// Persisted/configured selections are independent of editorial order.
    /// </summary>
    public async Task<bool> WouldReorderChangeImplicitFreeCategoriesAsync(
        int stageId, int categoryId, int proposedOrder,
        CancellationToken cancellationToken = default)
    {
        if (await _db.StageFreeCategorySelections.AsNoTracking()
                .AnyAsync(x => x.StageId == stageId, cancellationToken) ||
            _configuration[$"FreeCategoryAccess:Stages:{stageId}"] is not null)
            return false;

        var categories = await _db.Categories.AsNoTracking()
            .Where(c => c.StageId == stageId)
            .ToListAsync(cancellationToken);
        var target = categories.FirstOrDefault(c => c.Id == categoryId);
        if (target is null || target.Order == proposedOrder)
            return false;

        var before = CategoryAccessPolicy.ResolveFreeCategoryIds(categories);
        target.Order = proposedOrder;
        var after = CategoryAccessPolicy.ResolveFreeCategoryIds(categories);
        return !before.SequenceEqual(after);
    }

    /// <summary>
    /// Null means unrestricted admin access. Empty means no category access.
    /// </summary>
    public async Task<List<int>?> GetAllowedCategoryIdsAsync(
        ClaimsPrincipal principal, CancellationToken cancellationToken = default)
    {
        // Validate the database user before trusting any role claim.
        // A revoked or inactive account must not retain category access.
        if (principal.Identity?.IsAuthenticated == true &&
            string.IsNullOrWhiteSpace(principal.FindFirstValue(ClaimTypes.NameIdentifier)))
            return new List<int>();

        var rawId = principal.FindFirstValue(ClaimTypes.NameIdentifier);
        if (!string.IsNullOrWhiteSpace(rawId))
        {
            if (!int.TryParse(rawId, out var id) || id <= 0)
                return new List<int>();

            var learner = await _db.Users.AsNoTracking()
                .FirstOrDefaultAsync(u => u.Id == id, cancellationToken);
            if (learner == null || !learner.IsActive ||
                principal.Identity?.IsAuthenticated != true)
                return new List<int>();
            if (principal.Identity?.IsAuthenticated == true &&
                principal.IsInRole("Admin") &&
                string.Equals(learner.Role, "Admin", StringComparison.OrdinalIgnoreCase))
                return null;
            if (!string.Equals(learner.Role, "Student", StringComparison.OrdinalIgnoreCase))
                return new List<int>();

            if (PremiumEntitlement.IsActive(learner))
                return await _db.Categories.AsNoTracking()
                    .Select(c => c.Id).ToListAsync(cancellationToken);
        }

        // Previously: DISTINCT stages + 2 SQL queries for each of four
        // stages (9 sequential DB round trips for every Free problem read).
        // Now: one category snapshot + one saved-selection snapshot.
        // Never cache eligibility across users, and preserve configured/
        // invalid-selection fail-closed behavior exactly.
        var categories = await _db.Categories.AsNoTracking()
            .OrderBy(c => c.StageId).ThenBy(c => c.Order).ThenBy(c => c.Id)
            .ToListAsync(cancellationToken);
        var savedSelections = await _db.StageFreeCategorySelections.AsNoTracking()
            .ToDictionaryAsync(s => s.StageId, cancellationToken);
        var allowed = new List<int>();
        foreach (var stage in categories.GroupBy(c => c.StageId))
        {
            savedSelections.TryGetValue(stage.Key, out var saved);
            allowed.AddRange(ResolveFreeCategoryIds(stage.Key, stage, saved));
        }
        return allowed;
    }

    /// <summary>
    /// Fail closed for inconsistent legacy records: a problem must belong to
    /// the same stage as its category before access can be granted.
    /// </summary>
    public async Task<bool> CanReadProblemAsync(
        ClaimsPrincipal principal, int stageId, int categoryId,
        CancellationToken cancellationToken = default)
    {
        if (stageId <= 0 || categoryId <= 0)
            return false;
        var categoryMatchesStage = await _db.Categories.AsNoTracking()
            .AnyAsync(c => c.Id == categoryId && c.StageId == stageId,
                cancellationToken);
        if (!categoryMatchesStage)
            return false;
        return await CanReadProblemAsync(principal, categoryId, cancellationToken);
    }

    public async Task<bool> CanReadProblemAsync(
        ClaimsPrincipal principal, int categoryId,
        CancellationToken cancellationToken = default)
    {
        var allowed = await GetAllowedCategoryIdsAsync(principal, cancellationToken);
        return allowed == null || allowed.Contains(categoryId);
    }
}
