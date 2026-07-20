namespace MathWorldAPI.Models
{
    /// <summary>
    /// Defines the supported learning mastery states for a problem.
    /// يحدد حالات الإتقان التعليمية المدعومة للمسألة.
    /// </summary>
    public static class MasteryStatuses
    {
        public const string New = "New";
        public const string NeedsReview = "NeedsReview";
        public const string Practicing = "Practicing";
        public const string Mastered = "Mastered";

        /// <summary>
        /// Gets all valid mastery status values.
        /// يعيد جميع قيم حالات الإتقان الصالحة.
        /// </summary>
        public static IReadOnlyCollection<string> All { get; } =
            new[]
            {
                New,
                NeedsReview,
                Practicing,
                Mastered
            };
    }
}
