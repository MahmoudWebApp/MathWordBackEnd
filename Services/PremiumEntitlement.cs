using MathWorldAPI.Models;

namespace MathWorldAPI.Services
{
    /// <summary>
    /// Centralized entitlement check. A future expiry-aware schema migration
    /// will extend this policy; clients must never decide entitlement.
    /// </summary>
    public static class PremiumEntitlement
    {
        public static bool IsActive(string? subscriptionType) =>
            string.Equals(subscriptionType, "Premium",
                StringComparison.OrdinalIgnoreCase);

        public static bool IsActive(AppUser user) =>
            IsActive(user.SubscriptionType);
    }
}
