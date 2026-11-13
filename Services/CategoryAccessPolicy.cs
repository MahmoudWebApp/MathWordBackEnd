using MathWorldAPI.Models;

namespace MathWorldAPI.Services;

/// <summary>
/// Pure entitlement rules for the category-access model.
/// This service is not wired into controllers yet: endpoints must switch
/// atomically from legacy daily quotas to server-enforced category checks.
/// </summary>
public static class CategoryAccessPolicy
{
    /// <summary>
    /// Determines whether an active learner can access a category.
    /// Free category IDs are selected per educational stage by admin policy.
    /// </summary>
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

        if (!learner.IsActive || stageId <= 0 || categoryId <= 0)
            return false;

        if (!string.Equals(learner.Role, "Student", StringComparison.OrdinalIgnoreCase))
            return false;

        return PremiumEntitlement.IsActive(learner, nowUtc)
            || freeCategoryIds.Contains(categoryId);
    }

    /// <summary>
    /// A category may contain any positive number of vetted questions.
    /// This does not represent a daily attempt quota.
    /// </summary>
    public static bool IsValidGroupSize(int questionCount) => questionCount > 0;
}
