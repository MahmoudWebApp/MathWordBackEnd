namespace MathWorldAPI.Models
{
    public class SocialLogin
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string Provider { get; set; } = string.Empty;
        public string ProviderId { get; set; } = string.Empty;
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

        public AppUser User { get; set; } = null!;
    }
}