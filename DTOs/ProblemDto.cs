using System.ComponentModel;

namespace MathWorldAPI.DTOs
{
    /// <summary>
    /// DTO for creating a new math problem.
    /// Question text and solution can contain LaTeX expressions wrapped in $...$ or $$...$$.
    /// </summary>
    public class CreateProblemDto
    {
        [Description("Arabic question text (can contain $LaTeX$)")]
        public string QuestionTextAr { get; set; } = string.Empty;

        [Description("English question text (can contain $LaTeX$)")]
        public string QuestionTextEn { get; set; } = string.Empty;

        [Description("Detailed Arabic solution (can contain $LaTeX$)")]
        public string DetailedSolutionAr { get; set; } = string.Empty;

        [Description("Detailed English solution (can contain $LaTeX$)")]
        public string DetailedSolutionEn { get; set; } = string.Empty;

        [Description("YouTube solution video URL (optional)")]
        public string? YoutubeSolutionUrl { get; set; }

        [Description("Educational stage ID")]
        public int StageId { get; set; }

        [Description("Points assigned to the problem")]
        public int Points { get; set; } = 10;

        [Description("Category ID")]
        public int CategoryId { get; set; }

        [Description("List of four answer options (LaTeX only)")]
        public List<QuestionOptionDto> Options { get; set; } = new();
    }

    /// <summary>
    /// DTO for a question option. Only LaTeX code, correctness, and order.
    /// </summary>
    public class QuestionOptionDto
    {
        [Description("LaTeX code for the answer option (example: \\frac{x}{y})")]
        public string LatexCode { get; set; } = string.Empty;

        [Description("Indicates if this is the correct answer")]
        public bool IsCorrect { get; set; } = false;

        [Description("Display order of the option")]
        public int Order { get; set; }
    }

    public class ProblemForStudentDto
    {
        public int Id { get; set; }
        public string Title { get; set; } = string.Empty;
        public string QuestionText { get; set; } = string.Empty;
        public int StageId { get; set; }
        public string StageName { get; set; } = string.Empty;
        public int Points { get; set; }
        public int CategoryId { get; set; }
        public string CategoryName { get; set; } = string.Empty;
        public string CategoryIcon { get; set; } = string.Empty;
        public List<OptionForStudentDto> Options { get; set; } = new();
        public bool IsSolved { get; set; }
        public bool IsFavorite { get; set; }
        public string? DetailedSolution { get; internal set; }
        public string? YoutubeSolutionUrl { get; set; }
    }

    public class OptionForStudentDto
    {
        public int Id { get; set; }
        public string Text { get; set; } = string.Empty;
        public string LatexCode { get; set; } = string.Empty;
        public int Order { get; set; }
        public bool? IsCorrect { get; set; }
    }

    public class SubmitAnswerDto
    {
        [Description("معرف المسألة")]
        public int ProblemId { get; set; }

        [Description("معرف الخيار المختار")]
        public int SelectedOptionId { get; set; }

        [Description("الوقت المستغرق بالثواني")]
        public int TimeSpentSeconds { get; set; }
    }

    public class AnswerResultDto
    {
        public bool IsCorrect { get; set; }
        public int PointsEarned { get; set; }
        public string DetailedSolution { get; set; } = string.Empty;
        public string CorrectOptionText { get; set; } = string.Empty;
        public bool IsSolved { get; set; }
        public string? YoutubeSolutionUrl { get; set; }
    }

    /// <summary>
    /// DTO for problem data returned to public/unauthenticated users.
    /// </summary>
    public class ProblemForPublicDto
    {
        public int Id { get; set; }
        public string Title { get; set; } = string.Empty;
        public string QuestionText { get; set; } = string.Empty;
        public int StageId { get; set; }
        public string StageName { get; set; } = string.Empty;

        public int CategoryId { get; set; }
        public string CategoryName { get; set; } = string.Empty;
        public string CategoryIcon { get; set; } = string.Empty;
        public string Message { get; set; } = string.Empty;
    }

    /// <summary>
    /// DTO for problem preview in search results.
    /// </summary>
    public class ProblemPreviewDto
    {
        public int Id { get; set; }
        public string Title { get; set; } = string.Empty;
        public int StageId { get; set; }
        public string StageName { get; set; } = string.Empty;
        public int CategoryId { get; set; }
        public string CategoryName { get; set; } = string.Empty;
        public int Points { get; set; }
        public int ViewsCount { get; set; }
        public bool RequiresLogin { get; set; } = true;
    }

    public class SearchResponseDto
    {
        public string Query { get; set; } = string.Empty;
        public int Page { get; set; }
        public int PageSize { get; set; }
        public int Total { get; set; }
        public int TotalPages { get; set; }
        public List<ProblemPreviewDto> Results { get; set; } = new();
    }

    public class StageDto
    {
        public int Id { get; set; }
        public string NameAr { get; set; } = string.Empty;
        public string NameEn { get; set; } = string.Empty;
        public int Order { get; set; }
    }
}