namespace MathWorldAPI.Models;

/// <summary>
/// Server-owned payment order record. No student endpoint can mark an order paid.
/// The payment provider integration will verify settlements before changing state.
/// </summary>
public sealed class PremiumCheckoutOrder
{
    public long Id { get; set; }
    public int StudentId { get; set; }
    public long? DiscountCodeId { get; set; }
    public string OrderReference { get; set; } = string.Empty;
    public string Status { get; set; } = "Pending";
    public decimal SubtotalUsd { get; set; }
    public decimal DiscountUsd { get; set; }
    public decimal TotalUsd { get; set; }
    public string Currency { get; set; } = "USD";
    public string? Provider { get; set; }
    public string? ProviderPaymentId { get; set; }
    public DateTime CreatedAtUtc { get; set; } = DateTime.UtcNow;
    public DateTime? VerifiedPaidAtUtc { get; set; }
    public DateTime? DiscountRedeemedAtUtc { get; set; }
}
