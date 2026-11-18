using MathWorldAPI.Models;

namespace MathWorldAPI.Services
{
    /// <summary>
    /// Effective subscription is evaluated server-side at request time.
    /// Null expiry preserves existing indefinite Premium accounts.
    /// </summary>
    public static class PremiumEntitlement
    {
        public static bool IsActive(string? subscriptionType) =>
            string.Equals(subscriptionType, "Premium",
                StringComparison.OrdinalIgnoreCase);

        public static bool IsActive(string? subscriptionType, DateTime? expiresAtUtc,
            DateTime? nowUtc = null) =>
            IsActive(subscriptionType) &&
            (!expiresAtUtc.HasValue || expiresAtUtc.Value > (nowUtc ?? DateTime.UtcNow));

        public static bool IsActive(AppUser user, DateTime? nowUtc = null) =>
            IsActive(user.SubscriptionType, user.PremiumExpiresAtUtc, nowUtc);

        public static string EffectiveType(AppUser user, DateTime? nowUtc = null) =>
            IsActive(user, nowUtc) ? "Premium" : "Free";
    }
}
