namespace MathWorldAPI.Models;

/// <summary>
/// Ephemeral, per-device learner heartbeat. A row means that this session
/// reached the API recently, not that a browser is still open this instant.
/// No IP address, device fingerprint, answer content or geolocation is stored.
/// </summary>
public sealed class LearnerPresence
{
    public int UserId { get; set; }
    public Guid SessionId { get; set; }
    public DateTime LastSeenAtUtc { get; set; }
}
