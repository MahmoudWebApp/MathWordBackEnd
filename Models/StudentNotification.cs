namespace MathWorldAPI.Models
{
    /// <summary>
    /// Private, persistent notification for one learner.
    /// </summary>
    public sealed class StudentNotification
    {
        public long Id { get; set; }
        public int UserId { get; set; }
        public string Type { get; set; } = "announcement";
        public string TitleAr { get; set; } = string.Empty;
        public string TitleEn { get; set; } = string.Empty;
        public string BodyAr { get; set; } = string.Empty;
        public string BodyEn { get; set; } = string.Empty;
        public string? ActionPath { get; set; }
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
        public DateTime? ReadAt { get; set; }
        public AppUser User { get; set; } = null!;
    }
}