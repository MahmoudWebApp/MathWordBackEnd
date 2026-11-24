using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using MathWorldAPI.Data;
using MathWorldAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Services;

public sealed class RecoveryTokenCodec(IConfiguration config)
{
    private byte[]? Key
    {
        get
        {
            try { var key = Convert.FromBase64String(config["MathWorldRecovery:TokenKey"] ?? ""); return key.Length >= 32 ? key : null; }
            catch (FormatException) { return null; }
        }
    }
    public bool IsConfigured => Key is not null;
    // Random grant identifier plus domain-separated HMAC. The bearer secret
    // can be rederived only with the independent server-side secret, not
    // from database rows. Only its SHA-256 digest is stored.
    public string Derive(Guid id) => Convert.ToHexString(HMACSHA256.HashData(
        Key ?? throw new InvalidOperationException("Recovery key is not configured."),
        Encoding.UTF8.GetBytes("MathWorld/password-reset/v1/" + id.ToString("N")))).ToLowerInvariant();
    public static string? Hash(string? token)
    {
        if (token is null || token.Length != 64 ||
            token.Any(c => !(c is >= '0' and <= '9' or >= 'a' and <= 'f'))) return null;
        return Convert.ToHexString(SHA256.HashData(Encoding.ASCII.GetBytes(token))).ToLowerInvariant();
    }
}

public sealed class PasswordRecoveryService(AppDbContext db, IConfiguration config, BrevoEmailTransport transport,
    RecoveryEmailQueue queue, NotificationStreamBroker stream)
{
    private readonly RecoveryTokenCodec codec = new(config);
    public bool Enabled => config.GetValue<bool>("MathWorldRecovery:Enabled") && codec.IsConfigured && transport.IsConfigured;
    // A configured provider is not sufficient to issue a new short-lived link.
    // Offline inspection of pending grants is an explicit CI-only test-mode
    // capability; it must never enable issuance in live mode.
    public bool CanIssue => Enabled && (config.GetValue<bool>("MathWorldEmail:OutboxEnabled") ||
        (transport.IsTestMode && config.GetValue<bool>("MathWorldRecovery:AllowOfflineTestQueue")));
    private bool Eligible(AppUser user)
    {
        if (!user.IsActive || user.TokenVersion == int.MaxValue ||
            !AccountRolePolicy.IsSupportedSessionRole(user.Role) || !MailAddress.TryCreate(user.Email, out _)) return false;
        // Staff recovery is opt-in for an explicitly verified address until
        // the managed staff invitation/email-verification flow is released.
        if (user.Role == AccountRolePolicy.LegacyAdmin &&
            !string.Equals(config["MathWorldRecovery:VerifiedAdminEmail"]?.Trim(), user.Email, StringComparison.OrdinalIgnoreCase)) return false;
        return transport.AllowsRecipient(user.Email);
    }

    public async Task RequestAsync(string email, string locale, CancellationToken ct)
    {
        if (!CanIssue || !MailAddress.TryCreate(email.Trim(), out var address) ||
            !string.Equals(address.Address, email.Trim(), StringComparison.OrdinalIgnoreCase)) return;
        var normalized = address.Address.ToLowerInvariant();
        var candidates = await db.Users.AsNoTracking().Where(x => x.Email.ToLower() == normalized).Take(2).ToListAsync(ct);
        if (candidates.Count != 1 || !Eligible(candidates[0]) || candidates[0].StaffSetupPending) return;
        var id = candidates[0].Id;
        await using var tx = await db.Database.BeginTransactionAsync(ct);
        // Lock the account before reading issuance state; change/reset uses
        // the same row lock. Never issue two concurrent links for one account.
        await db.Users.Where(x => x.Id == id).ExecuteUpdateAsync(s => s.SetProperty(x => x.TokenVersion, x => x.TokenVersion), ct);
        var user = await db.Users.AsNoTracking().SingleOrDefaultAsync(x => x.Id == id, ct);
        if (user is null || !Eligible(user) || user.StaffSetupPending || !string.Equals(user.Email, normalized, StringComparison.OrdinalIgnoreCase) ||
            await db.SocialLogins.AnyAsync(x => x.UserId == id, ct)) return;
        var now = DateTime.UtcNow;
        if (await db.PasswordResetGrants.AnyAsync(x => x.UserId == id && x.CreatedAtUtc > now.AddMinutes(-2), ct)) return;
        // Shared daily reservation cap across instances. Recovery is given
        // priority by the worker. No mail is sent inline with the public API.
        await db.Database.ExecuteSqlRawAsync("SELECT pg_advisory_xact_lock(7240162026)", ct);
        var cap = Math.Clamp(config.GetValue("MathWorldRecovery:DailyRequestLimit", 60), 1, 100);
        if (await db.PasswordResetGrants.CountAsync(x => x.CreatedAtUtc >= now.Date, ct) >= cap) return;
        await db.PasswordResetGrants.Where(x => x.UserId == id && x.ConsumedAtUtc == null)
            .ExecuteUpdateAsync(s => s.SetProperty(x => x.ConsumedAtUtc, now), ct);
        var grant = new PasswordResetGrant
        {
            Id = Guid.NewGuid(), UserId = id, Email = user.Email, Role = user.Role, TokenVersion = user.TokenVersion,
            CreatedAtUtc = now, ExpiresAtUtc = now.AddMinutes(20)
        };
        grant.TokenHash = RecoveryTokenCodec.Hash(codec.Derive(grant.Id))!;
        db.PasswordResetGrants.Add(grant);
        db.EmailOutbox.Add(new EmailOutboxItem
        {
            Id = Guid.NewGuid(), UserId = id, ResetGrantId = grant.Id, Recipient = user.Email,
            TemplateKey = "password-reset", Locale = locale == "en" ? "en" : "ar", State = "Pending",
            CreatedAtUtc = now, NextRetryAtUtc = now, ExpiresAtUtc = grant.ExpiresAtUtc
        });
        await db.SaveChangesAsync(ct);
        await tx.CommitAsync(ct);
    }

    public async Task<bool> ResetAsync(string token, string password, string locale, CancellationToken ct)
    {
        var hash = RecoveryTokenCodec.Hash(token);
        if (!Enabled || hash is null) return false;
        var now = DateTime.UtcNow;
        var grant = await db.PasswordResetGrants.AsNoTracking()
            .SingleOrDefaultAsync(x => x.TokenHash == hash && x.ConsumedAtUtc == null && x.ExpiresAtUtc > now, ct);
        if (grant is null || grant.TokenVersion == int.MaxValue) return false;
        var user = await db.Users.AsNoTracking().SingleOrDefaultAsync(x => x.Id == grant.UserId, ct);
        if (user is null || !Eligible(user) || user.Role != grant.Role || user.Email != grant.Email ||
            user.TokenVersion != grant.TokenVersion || user.StaffSetupPending != grant.IsInvitation ||
            (grant.IsInvitation && user.Role != AccountRolePolicy.Supervisor) ||
            await db.SocialLogins.AnyAsync(x => x.UserId == user.Id, ct)) return false;
        var newHash = BCrypt.Net.BCrypt.HashPassword(password, 12);
        await using var tx = await db.Database.BeginTransactionAsync(ct);
        var updated = await db.Users.Where(x => x.Id == grant.UserId && x.IsActive &&
                x.Role == grant.Role && x.Email == grant.Email && x.TokenVersion == grant.TokenVersion &&
                x.StaffSetupPending == grant.IsInvitation &&
                !db.SocialLogins.Any(link => link.UserId == x.Id))
            .ExecuteUpdateAsync(s => s.SetProperty(x => x.PasswordHash, newHash)
                .SetProperty(x => x.StaffSetupPending, false)
                .SetProperty(x => x.TokenVersion, x => x.TokenVersion + 1), ct);
        if (updated != 1) return false;
        now = DateTime.UtcNow;
        var consumed = await db.PasswordResetGrants.Where(x => x.Id == grant.Id &&
                x.ConsumedAtUtc == null && x.ExpiresAtUtc > now)
            .ExecuteUpdateAsync(s => s.SetProperty(x => x.ConsumedAtUtc, now), ct);
        if (consumed != 1) return false;
        await db.PasswordResetGrants.Where(x => x.UserId == user.Id && x.ConsumedAtUtc == null)
            .ExecuteUpdateAsync(s => s.SetProperty(x => x.ConsumedAtUtc, now), ct);
        db.PlatformActivityEvents.Add(new PlatformActivityEvent { ActorUserId = user.Id, ActorRole = user.Role,
            Action = grant.IsInvitation ? "SupervisorInvitationAccepted" : "PasswordReset", Resource = "Authentication", CreatedAtUtc = now, Origin = "api" });
        db.UserNotifications.Add(new UserNotification { UserId = user.Id, Type = "security",
            TitleAr = "استعادة كلمة المرور", TitleEn = "Password reset",
            BodyAr = "تم تعيين كلمة مرور جديدة. إذا لم تكن أنت، تواصل مع الدعم.",
            BodyEn = "Your password was reset. If this was not you, contact support.", CreatedAtUtc = now });
        queue.AddSecurityNotice(user, "password-changed", locale, now);
        await db.SaveChangesAsync(ct);
        await tx.CommitAsync(ct);
        stream.Notify(user.Id);
        return true;
    }
}
