using System.Text.Json.Serialization;

namespace MathWorldAPI.Models
{
    public class AppUser
    {
        public int Id { get; set; }
        public string FullName { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string PasswordHash { get; set; } = string.Empty;
        public string Role { get; set; } = "Student";
        public string SubscriptionType { get; set; } = "Free";
        // Null means an explicitly indefinite Premium grant (legacy-compatible).
        public DateTime? PremiumExpiresAtUtc { get; set; }
        public int? CurrentTrackId { get; set; }
        public int? CurrentStageId { get; set; } // Nullable for existing learners
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
        public bool IsActive { get; set; } = true;

        // Increment atomically when credentials or privileges are revoked.
        [JsonIgnore]
        public int TokenVersion { get; set; }
        [JsonIgnore] public int StaffPermissions { get; set; }
        [JsonIgnore] public bool StaffSetupPending { get; set; }
        [JsonIgnore] public string? VerifiedNotificationEmail { get; set; }
        [JsonIgnore] public bool EmailLearningUpdates { get; set; }
        [JsonIgnore] public bool EmailSubscriptionUpdates { get; set; }
        [JsonIgnore] public bool EmailImportantAnnouncements { get; set; }
        [JsonIgnore] public string? EmailNotificationLocale { get; set; }
        [JsonIgnore] public DateTime? PremiumExpiryNotifiedAtUtc { get; set; }

        [JsonIgnore]
        public List<UserProgress> UserProgresses { get; set; } = new();

        [JsonIgnore]
        public List<ProblemAttempt> ProblemAttempts { get; set; } = new();

        [JsonIgnore]
        public List<SocialLogin> SocialLogins { get; set; } = new();

        public string? ProfilePicture { get; set; }
        public DateTime? LastLoginAt { get; set; }
    }
}