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
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
        public bool IsActive { get; set; } = true;

        [JsonIgnore]
        public List<UserProgress> UserProgresses { get; set; } = new();
        [JsonIgnore]
        public List<SocialLogin> SocialLogins { get; set; } = new();
    }
}