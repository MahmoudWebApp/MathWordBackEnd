// File: MathWorldAPI/DTOs/ProblemDto.cs

using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace MathWorldAPI.DTOs
{
    /// <summary>
    /// DTO for creating or updating a math problem.
    /// Question text and detailed solutions can contain LaTeX expressions
    /// wrapped in $...$ for inline math or $$...$$ for block math.
    /// </summary>
    public class CreateProblemDto
    {
        /// <summary>
        /// Gets or sets the Arabic problem text.
        /// The text can contain inline and block LaTeX expressions.
        /// </summary>
        [Required]
        [Description(
            "Arabic question text that can contain LaTeX expressions.")]
        public string QuestionTextAr { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets the English problem text.
        /// The text can contain inline and block LaTeX expressions.
        /// </summary>
        [Required]
        [Description(
            "English question text that can contain LaTeX expressions.")]
        public string QuestionTextEn { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets the detailed Arabic solution.
        /// </summary>
        [Required]
        [Description(
            "Detailed Arabic solution that can contain LaTeX expressions.")]
        public string DetailedSolutionAr { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets the detailed English solution.
        /// </summary>
        [Required]
        [Description(
            "Detailed English solution that can contain LaTeX expressions.")]
        public string DetailedSolutionEn { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets the optional YouTube solution video URL.
        /// </summary>
        [Url]
        [Description(
            "Optional YouTube solution video URL.")]
        public string? YoutubeSolutionUrl { get; set; }

        /// <summary>
        /// Gets or sets the educational stage ID.
        /// </summary>
        [Range(1, int.MaxValue)]
        [Description(
            "Educational stage ID.")]
        public int StageId { get; set; }

        /// <summary>
        /// Gets or sets the number of points awarded for a correct answer.
        /// </summary>
        [Range(1, 100000)]
        [Description(
            "Points awarded for solving the problem.")]
        public int Points { get; set; } = 10;

        /// <summary>
        /// Gets or sets the category ID.
        /// </summary>
        [Range(1, int.MaxValue)]
        [Description(
            "Category ID.")]
        public int CategoryId { get; set; }

        /// <summary>
        /// Gets or sets exactly four answer options.
        /// Exactly one option must be marked as correct.
        /// </summary>
        [Required]
        [MinLength(4)]
        [MaxLength(4)]
        [Description(
            "Exactly four answer options.")]
        public List<QuestionOptionDto> Options { get; set; } =
            new();
    }

    /// <summary>
    /// DTO for creating or updating an answer option.
    /// This DTO is intended for administrative operations and contains
    /// the correctness flag.
    /// </summary>
    public class QuestionOptionDto
    {
        /// <summary>
        /// Gets or sets the LaTeX representation of the answer.
        /// </summary>
        [Required]
        [Description(
            @"LaTeX code for the answer option, such as \frac{x}{y}.")]
        public string LatexCode { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets whether this option is the correct answer.
        /// </summary>
        [Description(
            "Indicates whether this option is correct.")]
        public bool IsCorrect { get; set; }

        /// <summary>
        /// Gets or sets the display order of the option.
        /// </summary>
        [Range(1, 4)]
        [Description(
            "Display order of the option.")]
        public int Order { get; set; }
    }

    /// <summary>
    /// Represents complete problem information returned
    /// to an authenticated student.
    /// </summary>
    public class ProblemForStudentDto
    {
        /// <summary>
        /// Gets or sets the problem ID.
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// Gets or sets the localized problem title.
        /// </summary>
        public string Title { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets the localized question text.
        /// </summary>
        public string QuestionText { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets the educational stage ID.
        /// </summary>
        public int StageId { get; set; }

        /// <summary>
        /// Gets or sets the localized educational stage name.
        /// </summary>
        public string StageName { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets the category ID.
        /// </summary>
        public int CategoryId { get; set; }

        /// <summary>
        /// Gets or sets the localized category name.
        /// </summary>
        public string CategoryName { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets the category icon URL.
        /// </summary>
        public string? CategoryIcon { get; set; }

        /// <summary>
        /// Gets or sets the number of points awarded
        /// for a correct answer.
        /// </summary>
        public int Points { get; set; }

        /// <summary>
        /// Gets or sets the current problem view count.
        /// </summary>
        public int ViewsCount { get; set; }

        /// <summary>
        /// Gets or sets whether the problem was solved correctly.
        /// </summary>
        public bool IsSolved { get; set; }

        /// <summary>
        /// Gets or sets whether the student has already
        /// submitted an answer.
        /// </summary>
        public bool HasAttempted { get; set; }

        /// <summary>
        /// Gets or sets whether the student's previous answer was correct.
        /// This value is returned only after an attempt.
        /// </summary>
        public bool? WasCorrect { get; set; }

        /// <summary>
        /// Gets or sets the option previously selected by the student.
        /// This value is returned only after an attempt.
        /// </summary>
        public int? SelectedOptionId { get; set; }

        /// <summary>
        /// Gets or sets the correct option ID.
        /// This value is returned only after an attempt.
        /// </summary>
        public int? CorrectOptionId { get; set; }

        /// <summary>
        /// Gets or sets whether the problem is in the user's favorites.
        /// </summary>
        public bool IsFavorite { get; set; }

        /// <summary>
        /// Gets or sets the localized detailed solution.
        /// This value is hidden until the student submits an answer.
        /// </summary>
        public string? DetailedSolution { get; set; }

        /// <summary>
        /// Gets or sets the optional video solution URL.
        /// This value is hidden until the student submits an answer.
        /// </summary>
        public string? YoutubeSolutionUrl { get; set; }

        /// <summary>
        /// Gets or sets the available answer options.
        /// </summary>
        public List<OptionForStudentDto> Options { get; set; } =
            new();
    }

    /// <summary>
    /// Represents one answer option returned to a student.
    /// Correctness information is omitted from student responses.
    /// </summary>
    public class OptionForStudentDto
    {
        /// <summary>
        /// Gets or sets the option ID.
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// Gets or sets the option mathematical content.
        /// </summary>
        public string LatexCode { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets the display order.
        /// </summary>
        public int Order { get; set; }

        /// <summary>
        /// Gets or sets whether the option is correct.
        /// Null values are omitted from JSON student responses.
        /// </summary>
        [JsonIgnore(
            Condition =
                JsonIgnoreCondition.WhenWritingNull)]
        public bool? IsCorrect { get; set; }
    }

    /// <summary>
    /// DTO for an answer option returned to an administrator.
    /// Administrators are allowed to see the correctness flag.
    /// </summary>
    public class AdminOptionDto
    {
        /// <summary>
        /// Gets or sets the option ID.
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// Gets or sets the LaTeX representation of the option.
        /// </summary>
        public string LatexCode { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets whether this option is correct.
        /// </summary>
        public bool IsCorrect { get; set; }

        /// <summary>
        /// Gets or sets the display order of the option.
        /// </summary>
        public int Order { get; set; }
    }

    /// <summary>
    /// DTO for submitting an answer to a math problem.
    /// </summary>
    public class SubmitAnswerDto
    {
        /// <summary>
        /// Gets or sets the problem ID.
        /// </summary>
        [Range(1, int.MaxValue)]
        [Description(
            "Problem ID.")]
        public int ProblemId { get; set; }

        /// <summary>
        /// Gets or sets the selected option ID.
        /// </summary>
        [Range(1, int.MaxValue)]
        [Description(
            "Selected option ID.")]
        public int SelectedOptionId { get; set; }

        /// <summary>
        /// Gets or sets the time spent solving the problem in seconds.
        /// </summary>
        [Range(0, 86400)]
        [Description(
            "Time spent solving the problem in seconds.")]
        public int TimeSpentSeconds { get; set; }
    }

    /// <summary>
    /// Represents the result returned after validating
    /// a student's selected answer.
    /// </summary>
    public class AnswerResultDto
    {
        /// <summary>
        /// Gets or sets whether the submitted answer is correct.
        /// </summary>
        public bool IsCorrect { get; set; }

        /// <summary>
        /// Gets or sets whether the problem is considered solved.
        /// </summary>
        public bool IsSolved { get; set; }

        /// <summary>
        /// Gets or sets the option selected by the student.
        /// </summary>
        public int SelectedOptionId { get; set; }

        /// <summary>
        /// Gets or sets the correct option ID.
        /// </summary>
        public int CorrectOptionId { get; set; }

        /// <summary>
        /// Gets or sets the points earned from this answer.
        /// </summary>
        public int PointsEarned { get; set; }

        /// <summary>
        /// Gets or sets the localized detailed solution.
        /// </summary>
        public string DetailedSolution { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets the mathematical content
        /// of the correct option.
        /// </summary>
        public string CorrectOptionText { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets the optional video solution URL.
        /// </summary>
        public string? YoutubeSolutionUrl { get; set; }
    }

    /// <summary>
    /// DTO for problem data returned to public or unauthenticated users.
    /// It excludes answer options, correctness information, and solutions.
    /// </summary>
    public class ProblemForPublicDto
    {
        /// <summary>
        /// Gets or sets the problem ID.
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// Gets or sets the localized problem title.
        /// </summary>
        public string Title { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets the localized problem text.
        /// </summary>
        public string QuestionText { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets the educational stage ID.
        /// </summary>
        public int StageId { get; set; }

        /// <summary>
        /// Gets or sets the localized educational stage name.
        /// </summary>
        public string StageName { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets the category ID.
        /// </summary>
        public int CategoryId { get; set; }

        /// <summary>
        /// Gets or sets the localized category name.
        /// </summary>
        public string CategoryName { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets the category icon or full icon URL.
        /// </summary>
        public string CategoryIcon { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets a localized message asking the user to authenticate.
        /// </summary>
        public string Message { get; set; } =
            string.Empty;
    }

    /// <summary>
    /// DTO for a lightweight problem preview used in lists,
    /// search results, favorites, solved problems, and dashboards.
    /// </summary>
    public class ProblemPreviewDto
    {
        /// <summary>
        /// Gets or sets the problem ID.
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// Gets or sets the localized problem title.
        /// </summary>
        public string Title { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets the educational stage ID.
        /// </summary>
        public int StageId { get; set; }

        /// <summary>
        /// Gets or sets the localized educational stage name.
        /// </summary>
        public string StageName { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets the category ID.
        /// </summary>
        public int CategoryId { get; set; }

        /// <summary>
        /// Gets or sets the localized category name.
        /// </summary>
        public string CategoryName { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets the points awarded for solving the problem.
        /// </summary>
        public int Points { get; set; }

        /// <summary>
        /// Gets or sets the number of problem views.
        /// </summary>
        public int ViewsCount { get; set; }

        /// <summary>
        /// Gets or sets whether authentication is required to solve the problem.
        /// </summary>
        public bool RequiresLogin { get; set; } =
            true;
    }

    /// <summary>
    /// DTO for paginated problem search results.
    /// </summary>
    public class SearchResponseDto
    {
        /// <summary>
        /// Gets or sets the original search query.
        /// </summary>
        public string Query { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets the current page number.
        /// </summary>
        public int Page { get; set; }

        /// <summary>
        /// Gets or sets the number of items per page.
        /// </summary>
        public int PageSize { get; set; }

        /// <summary>
        /// Gets or sets the total number of matching problems.
        /// </summary>
        public int Total { get; set; }

        /// <summary>
        /// Gets or sets the total number of available pages.
        /// </summary>
        public int TotalPages { get; set; }

        /// <summary>
        /// Gets or sets the problems returned for the current page.
        /// </summary>
        public List<ProblemPreviewDto> Results { get; set; } =
            new();
    }

    /// <summary>
    /// DTO for educational stage data.
    /// </summary>
    public class StageDto
    {
        /// <summary>
        /// Gets or sets the educational stage ID.
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// Gets or sets the Arabic educational stage name.
        /// </summary>
        [Required]
        [StringLength(100)]
        public string NameAr { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets the English educational stage name.
        /// </summary>
        [Required]
        [StringLength(100)]
        public string NameEn { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets the display order of the educational stage.
        /// </summary>
        [Range(0, int.MaxValue)]
        public int Order { get; set; }
    }
}