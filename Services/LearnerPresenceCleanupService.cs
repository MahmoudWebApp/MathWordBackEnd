using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Services;

/// <summary>
/// Deletes expired ephemeral presence rows periodically. No one is marked
/// 'logged out'; presence simply ages out if the device disappears.
/// </summary>
public sealed class LearnerPresenceCleanupService : BackgroundService
{
    private readonly IServiceScopeFactory _scopeFactory;
    private readonly ILogger<LearnerPresenceCleanupService> _logger;

    public LearnerPresenceCleanupService(
        IServiceScopeFactory scopeFactory,
        ILogger<LearnerPresenceCleanupService> logger)
    {
        _scopeFactory = scopeFactory;
        _logger = logger;
    }

    protected override async Task ExecuteAsync(CancellationToken stoppingToken)
    {
        // A one-hour retention window preserves diagnostics for brief
        // reconnects; online counts use only the last five minutes.
        using var timer = new PeriodicTimer(TimeSpan.FromHours(1));
        try
        {
            while (await timer.WaitForNextTickAsync(stoppingToken))
            {
                try
                {
                    using var scope = _scopeFactory.CreateScope();
                    var db = scope.ServiceProvider.GetRequiredService<AppDbContext>();
                    var expiredBefore = DateTime.UtcNow.AddHours(-1);
                    var removed = await db.LearnerPresences
                        .Where(x => x.LastSeenAtUtc < expiredBefore)
                        .ExecuteDeleteAsync(stoppingToken);
                    if (removed > 0)
                        _logger.LogInformation("Expired {Count} stale learner presence sessions.", removed);
                }
                catch (Exception ex) when (!stoppingToken.IsCancellationRequested)
                {
                    _logger.LogWarning(ex,
                        "Learner presence cleanup failed. Confirm the staging migration is applied.");
                }
            }
        }
        catch (OperationCanceledException) when (stoppingToken.IsCancellationRequested)
        {
            // Graceful shutdown.
        }
    }
}
