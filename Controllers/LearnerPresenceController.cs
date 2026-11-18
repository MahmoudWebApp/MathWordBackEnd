using System.Security.Claims;
using MathWorldAPI.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.RateLimiting;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

/// <summary>
/// Authenticated, ephemeral student presence. Online means a server-received
/// heartbeat within the last five minutes, not a verified open browser tab.
/// Session IDs are random per application instance, never device fingerprints.
/// </summary>
[ApiController]
[Authorize(Roles = "Student")]
[Route("api/users/presence")]
[ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
public sealed class LearnerPresenceController : ControllerBase
{
    private readonly AppDbContext _db;
    public LearnerPresenceController(AppDbContext db) => _db = db;

    public sealed record HeartbeatRequest(Guid SessionId);

    private async Task<int?> ActiveStudent(CancellationToken ct)
    {
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var id) || id <= 0)
            return null;
        var valid = await _db.Users.AsNoTracking()
            .AnyAsync(u => u.Id == id && u.Role == "Student" && u.IsActive, ct);
        return valid ? id : null;
    }

    [HttpPost("heartbeat")]
    [EnableRateLimiting("presence")]
    public async Task<IActionResult> Heartbeat([FromBody] HeartbeatRequest? request,
        CancellationToken ct)
    {
        var userId = await ActiveStudent(ct);
        if (userId is null) return Forbid();
        if (request is null || request.SessionId == Guid.Empty)
            return BadRequest(new { Message = "InvalidPresenceSession" });

        // Database clock is authoritative. One row per learner/device session;
        // upsert prevents concurrent heartbeats from creating duplicates.
        // A lower bound of 30s makes a noisy client much cheaper to serve.
        await _db.Database.ExecuteSqlInterpolatedAsync($@"
            INSERT INTO ""LearnerPresences"" (""UserId"", ""SessionId"", ""LastSeenAtUtc"")
            VALUES ({userId.Value}, {request.SessionId}, now())
            ON CONFLICT (""UserId"", ""SessionId"")
            DO UPDATE SET ""LastSeenAtUtc"" = EXCLUDED.""LastSeenAtUtc""
            WHERE ""LearnerPresences"".""LastSeenAtUtc"" < now() - interval '30 seconds'",
            ct);
        Response.Headers.CacheControl = "no-store";
        return NoContent();
    }

    [HttpDelete("sessions/{sessionId:guid}")]
    [EnableRateLimiting("presence")]
    public async Task<IActionResult> CloseSession(Guid sessionId, CancellationToken ct)
    {
        var userId = await ActiveStudent(ct);
        if (userId is null) return Forbid();
        if (sessionId == Guid.Empty) return BadRequest(new { Message = "InvalidPresenceSession" });
        // Only the caller's own session can be removed. Closing a tab or
        // force-quitting may never send this request; stale rows expire.
        await _db.LearnerPresences
            .Where(p => p.UserId == userId.Value && p.SessionId == sessionId)
            .ExecuteDeleteAsync(ct);
        return NoContent();
    }
}
