using MathWorldAPI.Data;
using MathWorldAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Services;

/// <summary>Bounded, idempotent expiry notices; does not mutate entitlements.</summary>
public sealed class PremiumExpiryNoticeWorker(IServiceScopeFactory scopes,IConfiguration config,
    ILogger<PremiumExpiryNoticeWorker> logger):BackgroundService
{
    protected override async Task ExecuteAsync(CancellationToken ct)
    {
        if(!config.GetValue<bool>("MathWorldNotifications:PremiumExpiryEnabled"))return;
        var delay=TimeSpan.FromSeconds(Math.Clamp(config.GetValue("MathWorldNotifications:PremiumExpiryPollSeconds",300),5,3600));
        while(!ct.IsCancellationRequested)
        {
            try
            {
                using var scope=scopes.CreateScope();
                var db=scope.ServiceProvider.GetRequiredService<AppDbContext>();
                var now=DateTime.UtcNow;
                // No historical email flood on activation; recent downtime can
                // catch up within this explicit 48-hour notice window.
                var cutoff=now.AddHours(-48);
                var ids=await db.Users.AsNoTracking().Where(u=>u.IsActive&&u.Role=="Student"&&u.SubscriptionType=="Premium"&&
                    u.PremiumExpiresAtUtc.HasValue&&u.PremiumExpiresAtUtc<=now&&u.PremiumExpiresAtUtc>cutoff&&
                    u.PremiumExpiryNotifiedAtUtc!=u.PremiumExpiresAtUtc)
                    .OrderBy(u=>u.PremiumExpiresAtUtc).ThenBy(u=>u.Id).Select(u=>u.Id).Take(50).ToListAsync(ct);
                foreach(var id in ids)
                {
                    // Separate context per transaction avoids stale tracked
                    // entities after a rollback or concurrent renewal.
                    using var itemScope=scopes.CreateScope();
                    var itemDb=itemScope.ServiceProvider.GetRequiredService<AppDbContext>();
                    var queue=itemScope.ServiceProvider.GetRequiredService<RecoveryEmailQueue>();
                    var stream=itemScope.ServiceProvider.GetRequiredService<NotificationStreamBroker>();
                    await using var tx=await itemDb.Database.BeginTransactionAsync(ct);
                    await itemDb.Database.SqlQuery<int>($"SELECT 1 AS \"Value\" FROM pg_advisory_xact_lock({-987654321},{id})").SingleAsync(ct);
                    var u=await itemDb.Users.SingleOrDefaultAsync(x=>x.Id==id&&x.IsActive&&x.Role=="Student",ct);
                    var at=DateTime.UtcNow;
                    if(u==null||u.SubscriptionType!="Premium"||u.PremiumExpiresAtUtc is not DateTime expiry||
                        expiry>at||expiry<=at.AddHours(-48)||u.PremiumExpiryNotifiedAtUtc==expiry)continue;
                    u.PremiumExpiryNotifiedAtUtc=expiry;
                    itemDb.UserNotifications.Add(new UserNotification{
                        UserId=id,Type="subscription",TitleAr="انتهى اشتراك Premium",TitleEn="Premium expired",
                        BodyAr="تبقى إنجازاتك محفوظة. يمكنك مراجعة خطتك من حسابك.",
                        BodyEn="Your achievements remain saved. Review your plan in your account.",
                        TargetPath="/dashboard",CreatedAtUtc=at});
                    queue.AddOptionalNotice(u,"premium-expired",at);
                    await itemDb.SaveChangesAsync(ct);
                    await tx.CommitAsync(ct);
                    stream.Notify(id);
                }
            }
            catch(OperationCanceledException) when(ct.IsCancellationRequested){break;}
            catch(Exception){logger.LogWarning("Premium expiry notice sweep failed; will retry without duplicating committed notices.");}
            await Task.Delay(delay,ct);
        }
    }
}
