using MathWorldAPI.Data;
using MathWorldAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Services
{
    /// <summary>
    /// Counts first-ever submissions by a student, attributed to the problem's
    /// educational stage and the UTC date of the original submission.
    /// Relies on existing immutable ProblemAttempts; no new schema required.
    /// </summary>
    public static class StageDailyQuota
    {
        public const int FreeLimit = 10;

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
