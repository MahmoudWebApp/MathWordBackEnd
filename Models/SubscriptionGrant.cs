namespace MathWorldAPI.Models
{
    /// <summary>Immutable record of administrator subscription changes.</summary>
    public sealed class SubscriptionGrant
    {
        public long Id { get; set; }
        public int LearnerId { get; set; }
        public int AdminId { get; set; }
        public string PreviousType { get; set; } = "Free";
        public string NewType { get; set; } = "Free";
        public DateTime? PreviousExpiresAtUtc { get; set; }
        public DateTime? NewExpiresAtUtc { get; set; }
        public string Reason { get; set; } = string.Empty;
        public DateTime ChangedAtUtc { get; set; } = DateTime.UtcNow;
    }
}
