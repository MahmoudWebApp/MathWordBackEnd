using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Services
{
    /// <summary>
    /// Coordinates concurrent answers and destructive admin edits across
    /// API instances via PostgreSQL transaction-scoped advisory locks.
    /// Callers MUST open a transaction before acquiring locks.
    ///
    /// The bigint key (-problemId) is shared by student submissions but
    /// acquired exclusively by administrator update/deletion operations.
    /// The separate (userId, problemId) int-pair key serializes a student's
    /// attempts for the same problem. PostgreSQL keeps both key spaces apart.
    /// All locks release automatically on transaction commit/rollback.
    /// </summary>
    public static class ProblemTransactionLocks
    {
        public static Task LockQuestionForAnswerAsync(
            AppDbContext context,
            int problemId,
            CancellationToken cancellationToken = default)
        {
            return context.Database.ExecuteSqlInterpolatedAsync(
                $"SELECT pg_advisory_xact_lock_shared({-(long)problemId})",
                cancellationToken);
        }

        public static Task LockStudentAttemptAsync(
            AppDbContext context,
            int userId,
            int problemId,
            CancellationToken cancellationToken = default)
        {
            return context.Database.ExecuteSqlInterpolatedAsync(
                $"SELECT pg_advisory_xact_lock({userId}, {problemId})",
                cancellationToken);
        }

        public static Task LockQuestionForAdminMutationAsync(
            AppDbContext context,
            int problemId,
            CancellationToken cancellationToken = default)
        {
            return context.Database.ExecuteSqlInterpolatedAsync(
                $"SELECT pg_advisory_xact_lock({-(long)problemId})",
                cancellationToken);
        }
    }
}
