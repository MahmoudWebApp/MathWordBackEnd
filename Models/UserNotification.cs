namespace MathWorldAPI.Models;

/// <summary>Persistent in-app notice owned by one user; no external delivery costs.</summary>
public sealed class UserNotification
{
    public long Id { get; set; }
    public int UserId { get; set; }
    public string Type { get; set; } = "system";
    public string TitleAr { get; set; } = string.Empty;
    public string TitleEn { get; set; } = string.Empty;
    public string BodyAr { get; set; } = string.Empty;
    public string BodyEn { get; set; } = string.Empty;
    public string? TargetPath { get; set; }
    public DateTime CreatedAtUtc { get; set; } = DateTime.UtcNow;
    public DateTime? ReadAtUtc { get; set; }
}
