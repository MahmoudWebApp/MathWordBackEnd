namespace MathWorldAPI.DTOs
{
    /// <summary>
    /// Current quota for an authenticated Student in one real stage.
    /// A Premium account has Unlimited=true and Remaining=null.
    /// Reset is always next midnight UTC.
    /// </summary>
    public sealed class StageDailyQuotaDto
    {
        public int StageId { get; set; }
        public string NameAr { get; set; } = string.Empty;
        public string NameEn { get; set; } = string.Empty;
        public int Limit { get; set; }
        public int Used { get; set; }
        public int? Remaining { get; set; }
        public bool Unlimited { get; set; }
        public string SubscriptionType { get; set; } = "Free";
        public DateTime? PremiumExpiresAtUtc { get; set; }
        public DateTime DayUtc { get; set; }
        public DateTime ResetsAtUtc { get; set; }
    }
}
