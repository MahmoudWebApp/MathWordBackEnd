// File: MathWorldAPI/DTOs/ProblemDto.cs

using System.ComponentModel;

namespace MathWorldAPI.DTOs
{
    /// <summary>
    /// DTO for creating a new math problem
    /// </summary>
    public class CreateProblemDto
    {
        [Description("Problem title in Arabic")]
        public string TitleAr { get; set; } = string.Empty;

        [Description("Problem title in English")]
        public string TitleEn { get; set; } = string.Empty;

        [Description("Question text in Arabic")]
        public string QuestionTextAr { get; set; } = string.Empty;

        [Description("Question text in English")]
        public string QuestionTextEn { get; set; } = string.Empty;

        [Description("LaTeX code for mathematical notation")]
        public string LatexCode { get; set; } = string.Empty;

        [Description("Detailed solution explanation")]
        public string DetailedSolution { get; set; } = string.Empty;

        [Description("Difficulty level: Easy, Medium, or Hard")]
        public string Difficulty { get; set; } = "Medium";

        [Description("Points awarded for solving this problem")]
        public int Points { get; set; } = 10;

        [Description("Category ID this problem belongs to")]
        public int CategoryId { get; set; }

        [Description("List of 4 answer options")]
        public List<QuestionOptionDto> Options { get; set; } = new();

        [Description("List of tag IDs associated with this problem")]
        public List<int> TagIds { get; set; } = new();
    }

    /// <summary>
    /// DTO for question options
    /// </summary>
    public class QuestionOptionDto
    {
        [Description("Option text in Arabic")]
        public string TextAr { get; set; } = string.Empty;

        [Description("Option text in English")]
        public string TextEn { get; set; } = string.Empty;

        [Description("LaTeX code for the option")]
        public string LatexCode { get; set; } = string.Empty;

        [Description("Indicates if this is the correct answer")]
        public bool IsCorrect { get; set; } = false;

        [Description("Display order of the option")]
        public int Order { get; set; }
    }

    /// <summary>
    /// DTO for problem details shown to students (without correct answers unless solved)
    /// </summary>
    public class ProblemForStudentDto
    {
        public int Id { get; set; }
        public string Title { get; set; } = string.Empty;
        public string QuestionText { get; set; } = string.Empty;
        public string LatexCode { get; set; } = string.Empty;
        public string Difficulty { get; set; } = string.Empty;
        public int Points { get; set; }
        public string CategoryName { get; set; } = string.Empty;
        public string CategoryIcon { get; set; } = string.Empty;
        public List<OptionForStudentDto> Options { get; set; } = new();
        public bool IsSolved { get; set; }
        public bool IsFavorite { get; set; }
        public List<string> Tags { get; set; } = new();
    }

    /// <summary>
    /// DTO for answer options shown to students (without IsCorrect flag)
    /// </summary>
    public class OptionForStudentDto
    {
        public int Id { get; set; }
        public string Text { get; set; } = string.Empty;
        public string LatexCode { get; set; } = string.Empty;
        public int Order { get; set; }
    }

    /// <summary>
    /// DTO for submitting an answer
    /// </summary>
    public class SubmitAnswerDto
    {
        [Description("ID of the problem being answered")]
        public int ProblemId { get; set; }

        [Description("ID of the selected option")]
        public int SelectedOptionId { get; set; }

        [Description("Time spent on this problem in seconds")]
        public int TimeSpentSeconds { get; set; }
    }

    /// <summary>
    /// DTO for answer submission result
    /// </summary>
    public class AnswerResultDto
    {
        public bool IsCorrect { get; set; }
        public int PointsEarned { get; set; }
        public string DetailedSolution { get; set; } = string.Empty;
        public string CorrectOptionText { get; set; } = string.Empty;
        public bool IsSolved { get; set; }
    }

    /// <summary>
    /// DTO for problem details shown to public users (requires login to solve)
    /// </summary>
    public class ProblemForPublicDto
    {
        public int Id { get; set; }
        public string Title { get; set; } = string.Empty;
        public string QuestionText { get; set; } = string.Empty;
        public string LatexCode { get; set; } = string.Empty;
        public string Difficulty { get; set; } = string.Empty;
        public string CategoryName { get; set; } = string.Empty;
        public string CategoryIcon { get; set; } = string.Empty;
        public string Message { get; set; } = string.Empty;
        public List<string> Tags { get; set; } = new();
    }

    /// <summary>
    /// DTO for problem preview in lists
    /// </summary>
    public class ProblemPreviewDto
    {
        public int Id { get; set; }
        public string Title { get; set; } = string.Empty;
        public string Difficulty { get; set; } = string.Empty;
        public string CategoryName { get; set; } = string.Empty;
        public int ViewsCount { get; set; }
        public bool RequiresLogin { get; set; } = true;
    }

    /// <summary>
    /// DTO for search response
    /// </summary>
    public class SearchResponseDto
    {
        public string Query { get; set; } = string.Empty;
        public int Page { get; set; }
        public int PageSize { get; set; }
        public int Total { get; set; }
        public int TotalPages { get; set; }  
        public List<ProblemPreviewDto> Results { get; set; } = new();
    }
}