namespace MathWorldAPI.Models
{
    public class UserProgress
    {
        public int Id { get; set; }
        public bool IsSolved { get; set; } = false;
        public bool IsCorrect { get; set; } = false;
        public int SelectedOptionId { get; set; } = 0;
        public bool IsFavorite { get; set; } = false;
        public int Attempts { get; set; } = 0;
        public int TimeSpentSeconds { get; set; } = 0;
        public DateTime? SolvedAt { get; set; }
        public DateTime LastAttemptAt { get; set; } = DateTime.UtcNow;

        public int UserId { get; set; }
        public int ProblemId { get; set; }

        public AppUser User { get; set; } = null!;
        public MathProblem Problem { get; set; } = null!;
    }
}