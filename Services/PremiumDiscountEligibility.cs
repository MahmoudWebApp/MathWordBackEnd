namespace MathWorldAPI.Services;

/// <summary>
/// Date and usage eligibility for future Premium checkout discount codes.
/// UTC timestamps are evaluated on the server; checkout must revalidate
/// eligibility atomically when a payment is confirmed.
/// </summary>
public static class PremiumDiscountEligibility
{
    public enum Status
    {
        Scheduled,
        Active,
        Expired,
        Disabled,
        Exhausted
    }

    public sealed record Policy(
        DateTime StartsAtUtc,
        DateTime EndsAtUtc,
        bool Enabled,
        int? MaxRedemptions,
        int RedemptionCount);

    public static void Validate(Policy policy)
    {
        if (policy.StartsAtUtc.Kind != DateTimeKind.Utc ||
            policy.EndsAtUtc.Kind != DateTimeKind.Utc)
            throw new ArgumentException("Discount dates must use UTC.");
        if (policy.EndsAtUtc <= policy.StartsAtUtc)
            throw new ArgumentException("Discount end must be after start.");
        if (policy.MaxRedemptions is <= 0)
            throw new ArgumentOutOfRangeException(nameof(policy));
        if (policy.RedemptionCount < 0)
            throw new ArgumentOutOfRangeException(nameof(policy));
    }

    public static Status Evaluate(Policy policy, DateTime nowUtc)
    {
        Validate(policy);
        if (nowUtc.Kind != DateTimeKind.Utc)
            throw new ArgumentException("Current time must use UTC.", nameof(nowUtc));
        if (!policy.Enabled) return Status.Disabled;
        if (nowUtc < policy.StartsAtUtc) return Status.Scheduled;
        // End is exclusive: at the exact end instant the code has expired.
        if (nowUtc >= policy.EndsAtUtc) return Status.Expired;
        if (policy.MaxRedemptions is int max && policy.RedemptionCount >= max)
            return Status.Exhausted;
        return Status.Active;
    }
}
