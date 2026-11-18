namespace MathWorldAPI.DTOs
{
    /// <summary>Admin-only learner directory, excluding operator identities.</summary>
    public sealed class AdminLearnerListDto
    {
        public List<AdminLearnerSummaryDto> Learners { get; set; } = new();
        public int Total { get; set; }
        public int Page { get; set; }
        public int PageSize { get; set; }
        public int TotalPages { get; set; }
    }

    public sealed class AdminLearnerSummaryDto
    {
        public int Id { get; set; }
        public string FullName { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public int? CurrentStageId { get; set; }
        public string? StageNameAr { get; set; }
        public string? StageNameEn { get; set; }
        public string SubscriptionType { get; set; } = "Free";
        public DateTime? PremiumExpiresAtUtc { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime? LastLoginAt { get; set; }
        public DateTime? LastAttemptAt { get; set; }
        public int SolvedProblems { get; set; }
        public int AttemptedProblems { get; set; }
        public int TotalAwardedPoints { get; set; }
    }

    public sealed class AdminLearnerDetailDto
    {
        public AdminLearnerSummaryDto Learner { get; set; } = new();
        public int TotalAttempts { get; set; }
        public int CorrectAttempts { get; set; }
        public int WrongAttempts { get; set; }
        public int FirstTryCorrect { get; set; }
        public int FavoriteProblems { get; set; }
        public int OpenErrorNotebookProblems { get; set; }
        public long TotalTimeSpentSeconds { get; set; }
        public double CorrectRatePercent { get; set; }
        public List<AdminLearnerStageDto> Stages { get; set; } = new();
        public List<AdminLearnerCategoryDto> Categories { get; set; } = new();
    }

    public sealed class AdminLearnerStageDto
    {
        public int StageId { get; set; }
        public string NameAr { get; set; } = string.Empty;
        public string NameEn { get; set; } = string.Empty;
        public int TotalProblems { get; set; }
        public int AttemptedProblems { get; set; }
        public int SolvedProblems { get; set; }
        public int FirstTryCorrect { get; set; }
        public int AwardedPoints { get; set; }
        public int CompletionPercent { get; set; }
    }

    public sealed class AdminLearnerCategoryDto
    {
        public int CategoryId { get; set; }
        public int StageId { get; set; }
        public string NameAr { get; set; } = string.Empty;
        public string NameEn { get; set; } = string.Empty;
        public int TotalProblems { get; set; }
        public int AttemptedProblems { get; set; }
        public int SolvedProblems { get; set; }
        public int FirstTryCorrect { get; set; }
        public int InErrorNotebook { get; set; }
    }

    public sealed class AdminLearnerAttemptPageDto
    {
        public int LearnerId { get; set; }
        public int? StageId { get; set; }
        public int Total { get; set; }
        public int Page { get; set; }
        public int PageSize { get; set; }
        public int TotalPages { get; set; }
        public List<AdminLearnerAttemptDto> Attempts { get; set; } = new();
    }

    public sealed class AdminLearnerAttemptDto
    {
        public int Id { get; set; }
        public int ProblemId { get; set; }
        public string TitleAr { get; set; } = string.Empty;
        public string TitleEn { get; set; } = string.Empty;
        public int StageId { get; set; }
        public int CategoryId { get; set; }
        public bool IsCorrect { get; set; }
        public bool IsOfficial { get; set; }
        public int AttemptNumber { get; set; }
        public int TimeSpentSeconds { get; set; }
        public bool UsedHint { get; set; }
        public int PointsEarned { get; set; }
        public DateTime SubmittedAt { get; set; }
    }
}
