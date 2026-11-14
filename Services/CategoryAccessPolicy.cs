using MathWorldAPI.Models;

namespace MathWorldAPI.Services;

/// <summary>
/// Category access rules. No daily question quota exists in this policy.
/// Controllers must validate the category belongs to the requested stage.
/// </summary>
public static class CategoryAccessPolicy
{
    public const int DefaultFreeCategoriesPerStage = 2;

    /// <summary>
    /// Resolves free categories for one stage. Configured IDs are honored only
    /// if they belong to the stage; otherwise the first two categories by
    /// editorial Order, then Id, are used. Configuration is a transitional
    /// mechanism until the audited admin editor is implemented.
    /// </summary>
    public static IReadOnlyList<int> ResolveFreeCategoryIds(
        IEnumerable<Category> stageCategories,
        IEnumerable<int>? configuredIds = null)
    {
        if (stageCategories is null)
            throw new ArgumentNullException(nameof(stageCategories));

        var categories = stageCategories
            .OrderBy(category => category.Order)
            .ThenBy(category => category.Id)
            .ToList();

        if (categories.Count == 0)
            return Array.Empty<int>();

        var stageId = categories[0].StageId;
        if (categories.Any(category => category.StageId != stageId))
            throw new ArgumentException("All categories must belong to the same stage.", nameof(stageCategories));

        var available = categories.Select(category => category.Id).ToHashSet();
        var configured = configuredIds?.ToList();
        if (configured is not null)
        {
            if (configured.Count != DefaultFreeCategoriesPerStage ||
                configured.Distinct().Count() != configured.Count ||
                configured.Any(id => !available.Contains(id)))
                throw new ArgumentException("Exactly two valid category IDs from the same stage are required.", nameof(configuredIds));
            return configured;
        }

        return categories.Take(DefaultFreeCategoriesPerStage)
            .Select(category => category.Id).ToList();
    }

    public static bool CanAccess(
        AppUser learner,
        int stageId,
        int categoryId,
        IReadOnlyCollection<int> freeCategoryIds,
        DateTime? nowUtc = null)
    {
        if (learner is null)
            throw new ArgumentNullException(nameof(learner));
        if (freeCategoryIds is null)
            throw new ArgumentNullException(nameof(freeCategoryIds));
        if (!learner.IsActive || stageId <= 0 || categoryId <= 0 ||
            !string.Equals(learner.Role, "Student", StringComparison.OrdinalIgnoreCase))
            return false;

        return PremiumEntitlement.IsActive(learner, nowUtc)
            || freeCategoryIds.Contains(categoryId);
    }

    /// <summary>Groups have editor-selected positive sizes, never a fixed ten.</summary>
    public static bool IsValidGroupSize(int questionCount) => questionCount > 0;
}
