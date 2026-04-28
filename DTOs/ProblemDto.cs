namespace MathWorldAPI.DTOs
{
    public class CreateProblemDto
    {
        public string TitleAr { get; set; } = string.Empty;
        public string TitleEn { get; set; } = string.Empty;
        public string QuestionTextAr { get; set; } = string.Empty;
        public string QuestionTextEn { get; set; } = string.Empty;
        public string LatexCode { get; set; } = string.Empty;
        public string DetailedSolution { get; set; } = string.Empty;
        public string Difficulty { get; set; } = "Medium";
        public int Points { get; set; } = 10;
        public int CategoryId { get; set; }
        public List<QuestionOptionDto> Options { get; set; } = new();
        public List<int> TagIds { get; set; } = new();
    }

    public class QuestionOptionDto
    {
        public string TextAr { get; set; } = string.Empty;
        public string TextEn { get; set; } = string.Empty;
        public string LatexCode { get; set; } = string.Empty;
        public bool IsCorrect { get; set; } = false;
        public int Order { get; set; }
    }

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

    public class OptionForStudentDto
    {
        public int Id { get; set; }
        public string Text { get; set; } = string.Empty;
        public string LatexCode { get; set; } = string.Empty;
        public int Order { get; set; }
    }

    public class SubmitAnswerDto
    {
        public int ProblemId { get; set; }
        public int SelectedOptionId { get; set; }
        public int TimeSpentSeconds { get; set; }
    }

    public class AnswerResultDto
    {
        public bool IsCorrect { get; set; }
        public int PointsEarned { get; set; }
        public string DetailedSolution { get; set; } = string.Empty;
        public string CorrectOptionText { get; set; } = string.Empty;
        public bool IsSolved { get; set; }
    }

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

    public class ProblemPreviewDto
    {
        public int Id { get; set; }
        public string Title { get; set; } = string.Empty;
        public string Difficulty { get; set; } = string.Empty;
        public string CategoryName { get; set; } = string.Empty;
        public int ViewsCount { get; set; }
        public bool RequiresLogin { get; set; } = true;
    }

    public class SearchResponseDto
    {
        public string Query { get; set; } = string.Empty;
        public int Total { get; set; }
        public List<ProblemPreviewDto> Results { get; set; } = new();
    }
}