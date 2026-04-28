namespace MathWorldAPI.Models
{
    public class QuestionOption
    {
        public int Id { get; set; }
        public string TextAr { get; set; } = string.Empty;
        public string TextEn { get; set; } = string.Empty;
        public string LatexCode { get; set; } = string.Empty;
        public bool IsCorrect { get; set; } = false;
        public int Order { get; set; } = 1;

        public int ProblemId { get; set; }
        public MathProblem Problem { get; set; } = null!;
    }
}