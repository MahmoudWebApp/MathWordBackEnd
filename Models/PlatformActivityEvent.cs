namespace MathWorldAPI.Models;

/// <summary>
/// Append-only, privacy-minimal operational trail. Records actions and object
/// types/IDs, never request bodies, passwords, tokens or answer text.
/// Historical events remain available if a student is later disabled.
/// </summary>
public sealed class PlatformActivityEvent
{
    public long Id { get; set; }
    public int ActorUserId { get; set; }
    public string ActorRole { get; set; } = "";
    public string Action { get; set; } = "";
    public string Resource { get; set; } = "";
    public string? ResourceId { get; set; }
    public string Origin { get; set; } = "api";
    public DateTime CreatedAtUtc { get; set; } = DateTime.UtcNow;
}
