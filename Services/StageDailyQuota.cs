using MathWorldAPI.Data;
using MathWorldAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Services
{
    /// <summary>
    /// Legacy UTC analytics helper for first-ever submissions.
    /// Daily limits were removed: this helper must not gate solving.
    /// Free access is restricted to two categories per stage, not attempts.
    /// </summary>
    public static class StageDailyQuota
    {
        // Compatibility only; a zero cap is not enforced anywhere.
        [Obsolete("Daily question quotas are disabled. Check category access instead.")]
        public const int FreeLimit = 0;

        public static bool IsUnlimited(AppUser user) =>
            PremiumEntitlement.IsActive(user);

        public static DateTime UtcDayStart(DateTime now) => now.ToUniversalTime().Date;

        public static async Task<int> CountUsedAsync(
            AppDbContext db, int userId, int stageId, DateTime utcDate,
            CancellationToken cancellationToken = default)
        {
            var day = UtcDayStart(utcDate);
            var tomorrow = day.AddDays(1);
            // IsOfficial is set only for the very first user/problem attempt;
            // reviews/retries in any future day never consume quota again.
            return await db.ProblemAttempts.AsNoTracking()
                .CountAsync(a => a.UserId == userId && a.IsOfficial
                    && a.Problem.StageId == stageId
                    && a.SubmittedAt >= day && a.SubmittedAt < tomorrow,
                    cancellationToken);
        }
    }
}
