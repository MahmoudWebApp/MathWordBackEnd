namespace MathWorldAPI.Models;

/// <summary>
/// Single-use gift code for a fixed Premium period. Only a SHA-256 digest
/// is stored, never the redeemable plaintext code.
/// </summary>
public sealed class PremiumAccessCode
{
    public long Id { get; set; }
    public string CodeHash { get; set; } = string.Empty;
    public string Label { get; set; } = string.Empty;
    public int PremiumDays { get; set; } = 365;
    public int CreatedByAdminId { get; set; }
    public DateTime CreatedAtUtc { get; set; } = DateTime.UtcNow;
    public DateTime ExpiresAtUtc { get; set; }
    public int? RedeemedByUserId { get; set; }
    public DateTime? RedeemedAtUtc { get; set; }
    public DateTime? RevokedAtUtc { get; set; }
}
