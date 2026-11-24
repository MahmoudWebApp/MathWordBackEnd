using System.Text;
using MathWorldAPI.Data;
using MathWorldAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Services;

/// <summary>Authenticated password changes; version, audit and notice commit together.</summary>
public sealed class AccountPasswordService(AppDbContext db, NotificationStreamBroker stream)
{
    public enum ChangeResult { Changed, InvalidCurrentPassword, InvalidNewPassword, PasswordMustDiffer, SessionChanged }

    public static bool IsValidNewPassword(string? password) =>
        password is not null && password.Length >= 12 &&
        !string.IsNullOrWhiteSpace(password) && !password.Any(char.IsControl) &&
        Encoding.UTF8.GetByteCount(password) <= 72;

    public async Task<ChangeResult> ChangeAsync(int userId, string role, int expectedVersion,
        string currentPassword, string newPassword, string confirmation, CancellationToken ct)
    {
        if (!AccountRolePolicy.IsSupportedSessionRole(role) || userId <= 0)
            return ChangeResult.SessionChanged;
        if (!IsValidNewPassword(newPassword) ||
            !string.Equals(newPassword, confirmation, StringComparison.Ordinal))
            return ChangeResult.InvalidNewPassword;
        var user = await db.Users.AsNoTracking()
            .SingleOrDefaultAsync(x => x.Id == userId && x.IsActive &&
                x.Role == role && x.TokenVersion == expectedVersion, ct);
        if (user is null || user.TokenVersion == int.MaxValue)
            return ChangeResult.SessionChanged;
        if (string.IsNullOrEmpty(currentPassword) || currentPassword.Length > 128 ||
            !BCrypt.Net.BCrypt.Verify(currentPassword, user.PasswordHash))
            return ChangeResult.InvalidCurrentPassword;
        if (BCrypt.Net.BCrypt.Verify(newPassword, user.PasswordHash))
            return ChangeResult.PasswordMustDiffer;

        var hash = BCrypt.Net.BCrypt.HashPassword(newPassword, 12);
        var now = DateTime.UtcNow;
        await using var transaction = await db.Database.BeginTransactionAsync(ct);
        // Compare-and-swap prevents a concurrent change, disable or role change
        // from being overwritten after current-password verification.
        var changed = await db.Users.Where(x => x.Id == userId && x.IsActive &&
                x.Role == role && x.TokenVersion == expectedVersion &&
                x.PasswordHash == user.PasswordHash)
            .ExecuteUpdateAsync(setters => setters
                .SetProperty(x => x.PasswordHash, hash)
                .SetProperty(x => x.TokenVersion, x => x.TokenVersion + 1), ct);
        if (changed != 1) return ChangeResult.SessionChanged;
        db.PlatformActivityEvents.Add(new PlatformActivityEvent
        {
            ActorUserId = userId, ActorRole = role, Action = "PasswordChanged",
            Resource = "Authentication", Origin = "api", CreatedAtUtc = now
        });
        db.UserNotifications.Add(new UserNotification
        {
            UserId = userId, Type = "security",
            TitleAr = "تغيير كلمة المرور", TitleEn = "Password changed",
            BodyAr = "تم تغيير كلمة مرور حسابك. إذا لم تكن أنت، تواصل مع الدعم.",
            BodyEn = "Your account password was changed. If this was not you, contact support.",
            CreatedAtUtc = now
        });
        await db.SaveChangesAsync(ct);
        await transaction.CommitAsync(ct);
        stream.Notify(userId);
        return ChangeResult.Changed;
    }
}
