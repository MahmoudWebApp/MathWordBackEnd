namespace MathWorldAPI.Models;

/// <summary>
/// Checkout discount definition, separate from one-time Premium gift codes.
/// Never grants Premium without a verified checkout/payment workflow.
/// </summary>
public sealed class PremiumDiscountCode
{
    public long Id { get; set; }
    public string CodeHash { get; set; } = string.Empty;
    public string Label { get; set; } = string.Empty;
    public string DiscountKind { get; set; } = "Percentage";
    public decimal Amount { get; set; }
    public DateTime StartsAtUtc { get; set; }
    public DateTime EndsAtUtc { get; set; }
    public bool Enabled { get; set; } = true;
    public int? MaxRedemptions { get; set; }
    // Null allows multiple purchases by the same student; 1 is the default.
    public int? MaxRedemptionsPerStudent { get; set; } = 1;
    public int RedemptionCount { get; set; }
    public int CreatedByAdminId { get; set; }
    public DateTime CreatedAtUtc { get; set; } = DateTime.UtcNow;
}
