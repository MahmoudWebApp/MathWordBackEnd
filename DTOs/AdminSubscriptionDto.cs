using System.ComponentModel.DataAnnotations;

namespace MathWorldAPI.DTOs
{
    public sealed class UpdateSubscriptionDto
    {
        [Required]
        public string SubscriptionType { get; set; } = string.Empty;
        public DateTime? PremiumExpiresAtUtc { get; set; }
        [Required, StringLength(500, MinimumLength = 3)]
        public string Reason { get; set; } = string.Empty;
    }

    /// <summary>
    /// Grant one audited year of Premium for one or more active learners.
    /// The server determines the term, never the browser clock.
    /// </summary>
    public sealed class AnnualPremiumGrantDto
    {
        [Required, MinLength(1), MaxLength(100)]
        public List<int> LearnerIds { get; set; } = new();
    }

    public sealed class SubscriptionStatusDto
    {
        public int LearnerId { get; set; }
        public string SubscriptionType { get; set; } = "Free";
        public DateTime? PremiumExpiresAtUtc { get; set; }
        public bool Unlimited { get; set; }
    }
}
