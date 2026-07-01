namespace MathWorldAPI.Models
{
    /// <summary>
    /// Represents a single answer option for a math problem.
    /// Only contains LaTeX code, correctness flag, and display order.
    /// </summary>
    public class QuestionOption
    {
        public int Id { get; set; }
        public string LatexCode { get; set; } = string.Empty;
        public bool IsCorrect { get; set; } = false;
        public int Order { get; set; }

        public int ProblemId { get; set; }
        public MathProblem Problem { get; set; } = null!;
    }
}