namespace MathWorldAPI.Models
{
    /// <summary>
    /// Represents one immutable answer attempt made by a student.
    /// يمثل محاولة إجابة واحدة غير قابلة للاستبدال قام بها الطالب.
    /// </summary>
    public class ProblemAttempt
    {
        public int Id { get; set; }

        public int UserId { get; set; }
        public int ProblemId { get; set; }

        // Option IDs and text are stored as snapshots so history remains valid
        // even when an administrator updates the current problem options.
        public int SelectedOptionId { get; set; }
        public string SelectedOptionText { get; set; } = string.Empty;
        public int CorrectOptionId { get; set; }
        public string CorrectOptionText { get; set; } = string.Empty;

        public bool IsCorrect { get; set; }
        public bool IsOfficial { get; set; }
        public int AttemptNumber { get; set; }
        public int TimeSpentSeconds { get; set; }
        public int PointsEarned { get; set; }
        public bool UsedHint { get; set; }

        public DateTime StartedAt { get; set; }
        public DateTime SubmittedAt { get; set; } = DateTime.UtcNow;

        public AppUser User { get; set; } = null!;
        public MathProblem Problem { get; set; } = null!;
    }
}
