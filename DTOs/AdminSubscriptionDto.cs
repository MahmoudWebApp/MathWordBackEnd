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

    public sealed class SubscriptionStatusDto
    {
        public int LearnerId { get; set; }
        public string SubscriptionType { get; set; } = "Free";
        public DateTime? PremiumExpiresAtUtc { get; set; }
        public bool Unlimited { get; set; }
    }
}
