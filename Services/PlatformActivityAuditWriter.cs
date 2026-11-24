using MathWorldAPI.Data;
using MathWorldAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Services;

/// <summary>Best-effort explicit authentication and sign-out event recorder.</summary>
public sealed class PlatformActivityAuditWriter
{
    private readonly AppDbContext _db;
    private readonly ILogger<PlatformActivityAuditWriter> _logger;

    public PlatformActivityAuditWriter(AppDbContext db,
        ILogger<PlatformActivityAuditWriter> logger)
    {
        _db = db;
        _logger = logger;
    }

    public async Task TryRecordAsync(int actorId, string action,
        string origin = "api", CancellationToken ct = default)
    {
        if (actorId <= 0 || string.IsNullOrWhiteSpace(action) || action.Length > 64)
            return;
        try
        {
            var role = await _db.Users.AsNoTracking()
                .Where(u => u.Id == actorId)
                .Select(u => u.Role).SingleOrDefaultAsync(ct);
            if (!AccountRolePolicy.IsSupportedSessionRole(role)) return;
            _db.PlatformActivityEvents.Add(new PlatformActivityEvent
            {
                ActorUserId = actorId, ActorRole = role!, Action = action,
                Resource = "Authentication", Origin = origin,
                CreatedAtUtc = DateTime.UtcNow
            });
            await _db.SaveChangesAsync(ct);
        }
        catch (Exception error) when (!ct.IsCancellationRequested)
        {
            _logger.LogError(error, "Authentication audit not persisted for user {Id}", actorId);
        }
    }
}
