using System;
using System.Collections.Generic;

namespace MathWorldAPI.DTOs
{
    // All analytics are server-calculated and available only to Admin.
    // "SelectedStudents" counts the student's current stage preference.
    // Activity is scoped to the rolling UTC window; saved solves are all-time.
    public sealed class AdminAnalyticsOverviewDto
    {
        public DateTime GeneratedAtUtc { get; set; }
        public int WindowDays { get; set; }
        public int TotalStudents { get; set; }
        public int ActiveStudentsInWindow { get; set; }
        public int TotalProblems { get; set; }
        public int TotalUniqueSolved { get; set; }
        public int AttemptsInWindow { get; set; }
        public int CorrectAttemptsInWindow { get; set; }
        public double CorrectRatePercent { get; set; }
        public List<AdminStageAnalyticsDto> Stages { get; set; } = new();
        // Activity metrics are from real Student attempts during WindowDays.
        // Empty on quiet test environments; do not fabricate chart points.
        public List<AdminActivityDayDto> DailyActivity { get; set; } = new();
        public List<AdminWeakCategoryDto> MostMissedCategories { get; set; } = new();
        public List<AdminMissedProblemDto> MostMissedProblems { get; set; } = new();
    }

    public sealed class AdminStageAnalyticsDto
    {
        public int StageId { get; set; }
        public string NameAr { get; set; } = string.Empty;
        public string NameEn { get; set; } = string.Empty;
        public int Categories { get; set; }
        public int Problems { get; set; }
        public int SelectedStudents { get; set; }
        public int ActiveStudentsInWindow { get; set; }
        public int UniqueSolved { get; set; }
        public int AttemptsInWindow { get; set; }
        public int CorrectAttemptsInWindow { get; set; }
        public double CorrectRatePercent { get; set; }
    }

    public sealed class AdminStageDetailDto
    {
        public AdminStageAnalyticsDto Summary { get; set; } = new();
        public int WindowDays { get; set; }
        public List<AdminCategoryAnalyticsDto> Categories { get; set; } = new();
        public List<AdminLearnerAnalyticsDto> TopLearners { get; set; } = new();
        public List<AdminActivityDayDto> DailyActivity { get; set; } = new();
    }

    public sealed class AdminCategoryAnalyticsDto
    {
        public int CategoryId { get; set; }
        public string NameAr { get; set; } = string.Empty;
        public string NameEn { get; set; } = string.Empty;
        public int Problems { get; set; }
        public int UniqueSolved { get; set; }
        public int AttemptsInWindow { get; set; }
        public int CorrectAttemptsInWindow { get; set; }
    }

    public sealed class AdminLearnerAnalyticsDto
    {
        public int Rank { get; set; }
        public int UserId { get; set; }
        public string FullName { get; set; } = string.Empty;
        public int UniqueSolved { get; set; }
        public int FirstTryCorrect { get; set; }
        // This is the original award snapshot on stored attempts, not
        // the current editable question point value.
        public int AwardedPoints { get; set; }
    }

    /// <summary>
    /// Relative mistake activity, not a formal statement about a student's ability.
    /// Rankings require at least one incorrect attempt in the selected window.
    /// </summary>
    public sealed class AdminWeakCategoryDto
    {
        public int CategoryId { get; set; }
        public int StageId { get; set; }
        public string NameAr { get; set; } = string.Empty;
        public string NameEn { get; set; } = string.Empty;
        public string StageNameAr { get; set; } = string.Empty;
        public string StageNameEn { get; set; } = string.Empty;
        public int AttemptsInWindow { get; set; }
        public int IncorrectAttemptsInWindow { get; set; }
        public int CorrectAttemptsInWindow { get; set; }
        public double IncorrectRatePercent { get; set; }
        public double AverageAttemptSeconds { get; set; }
    }

    public sealed class AdminMissedProblemDto
    {
        public int ProblemId { get; set; }
        public int StageId { get; set; }
        public int CategoryId { get; set; }
        public string TitleAr { get; set; } = string.Empty;
        public string TitleEn { get; set; } = string.Empty;
        public int AttemptsInWindow { get; set; }
        public int IncorrectAttemptsInWindow { get; set; }
        public int CorrectAttemptsInWindow { get; set; }
    }

    public sealed class AdminActivityDayDto
    {
        public DateTime DayUtc { get; set; }
        public int Attempts { get; set; }
        public int CorrectAttempts { get; set; }
        public int UniqueStudents { get; set; }
    }
}
