using System.Net;
using System.Net.Http.Json;
using System.Net.Mail;
using System.Text.Json;
using MathWorldAPI.Data;
using MathWorldAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Services;

public sealed record BrevoOutcome(string State, string? MessageId = null, string? ErrorCode = null);

/// <summary>HTTPS transport with explicit activation and allowlisted test mode.
/// Never logs provider bodies, credentials, recipient addresses or reset URLs.</summary>
public sealed class BrevoEmailTransport(IConfiguration config, IHttpClientFactory clients)
{
    private string? Read(string name) => config["MathWorldEmail:Brevo:" + name]?.Trim();
    private string Mode => Read("Mode") ?? "test";
    public bool IsTestMode => Mode == "test";
    public bool IsConfigured => config.GetValue<bool>("MathWorldEmail:Brevo:Enabled") &&
        !string.IsNullOrWhiteSpace(Read("ApiKey")) &&
        MailAddress.TryCreate(Read("From"), out _) && Mode is "test" or "live";
    public bool AllowsRecipient(string recipient) => IsConfigured &&
        (Mode == "live" || (Read("TestRecipients") ?? "").Split(';', StringSplitOptions.TrimEntries |
            StringSplitOptions.RemoveEmptyEntries).Contains(recipient, StringComparer.OrdinalIgnoreCase));

    public async Task<BrevoOutcome> SendAsync(EmailOutboxItem item, TransactionalEmail email, CancellationToken ct)
    {
        if (!AllowsRecipient(item.Recipient)) return new("Cancelled", ErrorCode: "RecipientNotAllowed");
        using var request = new HttpRequestMessage(HttpMethod.Post, "https://api.brevo.com/v3/smtp/email");
        request.Headers.Add("api-key", Read("ApiKey"));
        request.Content = JsonContent.Create(new
        {
            sender = new { email = Read("From"), name = "MathWorld" },
            to = new[] { new { email = item.Recipient } },
            subject = email.Subject,
            htmlContent = email.Html,
            textContent = email.PlainText,
            headers = new Dictionary<string,string> { ["idempotencyKey"] = item.Id.ToString() },
            tags = new[] { "mathworld", item.TemplateKey }
        });
        try
        {
            using var response = await clients.CreateClient("BrevoTransactional").SendAsync(request, ct);
            if (response.StatusCode == HttpStatusCode.TooManyRequests)
                return new("Retry", ErrorCode: "ProviderRateLimited");
            if ((int)response.StatusCode >= 500)
                return new("Unknown", ErrorCode: "ProviderOutcomeUnknown");
            if (!response.IsSuccessStatusCode)
                return new("Failed", ErrorCode: "ProviderRejected");
            // The provider accepted the request. This is not proof of delivery.
            try
            {
                using var body = JsonDocument.Parse(await response.Content.ReadAsStringAsync(ct));
                var id = body.RootElement.TryGetProperty("messageId", out var value) && value.ValueKind == JsonValueKind.String
                    ? value.GetString() : null;
                return new("Accepted", id is { Length: <= 250 } ? id : null);
            }
            catch (JsonException) { return new("Accepted"); }
        }
        catch (Exception error) when (error is HttpRequestException or OperationCanceledException or IOException)
        {
            // Do not repeat an ambiguous network send (the provider may have
            // accepted it). The user can explicitly request a fresh reset.
            return new("Unknown", ErrorCode: "TransportOutcomeUnknown");
        }
    }
}

public sealed class RecoveryEmailQueue(AppDbContext db, IConfiguration config, BrevoEmailTransport transport)
{
    public void AddSecurityNotice(AppUser user, string templateKey, string locale, DateTime now)
    {
        if (!transport.AllowsRecipient(user.Email)) return;
        db.EmailOutbox.Add(new EmailOutboxItem
        {
            Id = Guid.NewGuid(), UserId = user.Id, Recipient = user.Email,
            TemplateKey = templateKey, Locale = locale == "en" ? "en" : "ar", State = "Pending",
            CreatedAtUtc = now, NextRetryAtUtc = now, ExpiresAtUtc = now.AddHours(12)
        });
    }

    public async Task<EmailOutboxItem?> ClaimAsync(CancellationToken ct)
    {
        var now = DateTime.UtcNow;
        await using var tx = await db.Database.BeginTransactionAsync(ct);
        // One durable claim at a time across processes; never re-send an
        // item whose previous process stopped in the middle of transmission.
        await db.Database.ExecuteSqlRawAsync("SELECT pg_advisory_xact_lock(7240162027)", ct);
        await db.EmailOutbox.Where(x => x.State == "Processing" && x.NextRetryAtUtc <= now)
            .ExecuteUpdateAsync(s => s.SetProperty(x => x.State, "Unknown")
                .SetProperty(x => x.LastErrorCode, "InterruptedDelivery")
                .SetProperty(x => x.LeaseId, (Guid?)null), ct);
        await db.EmailOutbox.Where(x => x.State == "Pending" && x.ExpiresAtUtc <= now)
            .ExecuteUpdateAsync(s => s.SetProperty(x => x.State, "Expired"), ct);
        var cap = Math.Clamp(config.GetValue("MathWorldEmail:DailyAttemptLimit", 100), 10, 150);
        // Conservative cap counts attempts on all items created since yesterday
        // because no queued item may survive longer than 12 hours.
        var used = await db.EmailOutbox.Where(x => x.CreatedAtUtc >= now.Date.AddDays(-1))
            .SumAsync(x => (int?)x.Attempts, ct) ?? 0;
        if (used >= cap) { await tx.CommitAsync(ct); return null; }
        var item = await db.EmailOutbox.AsNoTracking()
            .Where(x => x.State == "Pending" && x.NextRetryAtUtc <= now && x.ExpiresAtUtc > now &&
                x.Attempts < 3 && (used < cap * 3 / 4 || (x.TemplateKey == "password-reset" || x.TemplateKey == "supervisor-invite")))
            .OrderByDescending(x => (x.TemplateKey == "password-reset" || x.TemplateKey == "supervisor-invite"))
            .ThenBy(x => x.CreatedAtUtc).FirstOrDefaultAsync(ct);
        if (item is null) { await tx.CommitAsync(ct); return null; }
        var lease = Guid.NewGuid();
        var changed = await db.EmailOutbox.Where(x => x.Id == item.Id && x.State == "Pending")
            .ExecuteUpdateAsync(s => s.SetProperty(x => x.State, "Processing")
                .SetProperty(x => x.LeaseId, lease)
                .SetProperty(x => x.NextRetryAtUtc, now.AddMinutes(2))
                .SetProperty(x => x.Attempts, x => x.Attempts + 1), ct);
        await tx.CommitAsync(ct);
        if (changed != 1) return null;
        item.LeaseId = lease;
        item.Attempts++;
        return item;
    }

    public async Task CompleteAsync(EmailOutboxItem item, BrevoOutcome outcome, CancellationToken ct)
    {
        var next = DateTime.UtcNow.AddMinutes(Math.Pow(2, item.Attempts));
        var state = outcome.State == "Retry"
            ? item.Attempts < 3 && next < item.ExpiresAtUtc ? "Pending" : "Failed"
            : outcome.State;
        await db.EmailOutbox.Where(x => x.Id == item.Id && x.State == "Processing" && x.LeaseId == item.LeaseId)
            .ExecuteUpdateAsync(s => s.SetProperty(x => x.State, state)
                .SetProperty(x => x.ProviderMessageId, outcome.MessageId)
                .SetProperty(x => x.LastErrorCode, outcome.ErrorCode)
                .SetProperty(x => x.NextRetryAtUtc, next)
                .SetProperty(x => x.LeaseId, (Guid?)null), ct);
    }
}

public sealed class RecoveryEmailWorker(IServiceScopeFactory scopes, IConfiguration config,
    ILogger<RecoveryEmailWorker> logger) : BackgroundService
{
    protected override async Task ExecuteAsync(CancellationToken ct)
    {
        // Default off, even if other SMTP settings are present.
        if (!config.GetValue<bool>("MathWorldEmail:OutboxEnabled")) return;
        while (!ct.IsCancellationRequested)
        {
            try
            {
                using var scope = scopes.CreateScope();
                var queue = scope.ServiceProvider.GetRequiredService<RecoveryEmailQueue>();
                var transport = scope.ServiceProvider.GetRequiredService<BrevoEmailTransport>();
                if (transport.IsConfigured)
                {
                    var item = await queue.ClaimAsync(ct);
                    if (item is not null)
                    {
                        var result = await DeliverAsync(scope.ServiceProvider, transport, item, ct);
                        // Finish a known outcome even if application shutdown was requested.
                        await queue.CompleteAsync(item, result, CancellationToken.None);
                    }
                }
            }
            catch (OperationCanceledException) when (ct.IsCancellationRequested) { break; }
            catch (Exception)
            {
                // Do not log exception messages: external providers may echo message contents.
                logger.LogWarning("Transactional email queue iteration failed; no automatic replay of ambiguous sends.");
            }
            await Task.Delay(TimeSpan.FromSeconds(10), ct);
        }
    }

    private async Task<BrevoOutcome> DeliverAsync(IServiceProvider sp, BrevoEmailTransport transport,
        EmailOutboxItem item, CancellationToken ct)
    {
        var db = sp.GetRequiredService<AppDbContext>();
        var user = await db.Users.AsNoTracking().SingleOrDefaultAsync(x => x.Id == item.UserId && x.IsActive, ct);
        if (user is null || user.Email != item.Recipient || item.ExpiresAtUtc <= DateTime.UtcNow)
            return new("Cancelled", ErrorCode: "AccountOrRecipientChanged");
        var brand = await sp.GetRequiredService<PlatformBrandService>().ReadAsync(false, ct);
        var ar = item.Locale == "ar";
        TransactionalEmail email;
        if (item.TemplateKey is "password-reset" or "supervisor-invite")
        {
            var grant = await db.PasswordResetGrants.AsNoTracking().SingleOrDefaultAsync(x => x.Id == item.ResetGrantId &&
                x.UserId == user.Id && x.Email == user.Email && x.Role == user.Role &&
                x.TokenVersion == user.TokenVersion && x.ConsumedAtUtc == null && x.ExpiresAtUtc > DateTime.UtcNow, ct);
            if (grant is null || grant.IsInvitation != (item.TemplateKey == "supervisor-invite") ||
                user.StaffSetupPending != grant.IsInvitation ||
                await db.SocialLogins.AnyAsync(x => x.UserId == user.Id, ct))
                return new("Cancelled", ErrorCode: "RecoveryGrantInvalid");
            var codec = new RecoveryTokenCodec(config);
            if (!codec.IsConfigured) return new("Cancelled", ErrorCode: "RecoveryKeyUnavailable");
            var secret = codec.Derive(grant.Id);
            if (RecoveryTokenCodec.Hash(secret) != grant.TokenHash) return new("Cancelled", ErrorCode: "RecoveryKeyRotated");
            // Fragment does not travel in the HTTP request, server access logs
            // or Referer. The reset page removes it from browser history.
            var url = brand.WebsiteUrl + "/" + item.Locale + "/reset-password#token=" + secret;
            email = MathWorldEmailLayout.Render(brand, item.Locale,
                grant.IsInvitation ? (ar ? "دعوة للانضمام كمشرف" : "Supervisor invitation") :
                    (ar ? "استعادة كلمة المرور" : "Reset your password"),
                grant.IsInvitation ?
                    (ar ? "دعاك مسؤول المنصة لتعيين كلمة مرور حساب المشرف. استخدم الرابط خلال 20 دقيقة." :
                        "The platform administrator invited you to set your supervisor password. Use the link within 20 minutes.") :
                    (ar ? "استخدم الرابط قبل انتهاء صلاحيته خلال 20 دقيقة. إذا لم تطلب الاستعادة فتجاهل الرسالة." :
                        "Use this link before it expires within 20 minutes. Ignore this email if you did not request it."),
                ar ? "تعيين كلمة المرور" : "Reset password", url);
        }
        else if (item.TemplateKey == "password-changed")
        {
            email = MathWorldEmailLayout.Render(brand, item.Locale,
                ar ? "تم تغيير كلمة المرور" : "Password changed",
                ar ? "تم تغيير كلمة مرور حسابك. إذا لم تكن أنت، تواصل مع الدعم." :
                    "Your account password changed. If this was not you, contact support.");
        }
        else if (item.TemplateKey == "test")
        {
            // Test-only messages cannot be replayed after switching to live mode.
            if (!transport.IsTestMode) return new("Cancelled", ErrorCode: "TestModeRequired");
            email = MathWorldEmailLayout.Render(brand, item.Locale,
                ar ? "رسالة اختبار MathWorld" : "MathWorld test email",
                ar ? "هذه رسالة تجريبية من إعدادات الإدارة، ولا تحتوي أي رابط لاستعادة حساب." :
                    "This is a test email from administration settings, with no account recovery link.");
        }
        else return new("Cancelled", ErrorCode: "UnknownTemplate");
        return await transport.SendAsync(item, email, ct);
    }
}
