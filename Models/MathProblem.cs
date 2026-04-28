namespace MathWorldAPI.Models
{
    public class MathProblem
    {
        public int Id { get; set; }
        public string TitleAr { get; set; } = string.Empty;
        public string TitleEn { get; set; } = string.Empty;
        public string QuestionTextAr { get; set; } = string.Empty;
        public string QuestionTextEn { get; set; } = string.Empty;
        public string LatexCode { get; set; } = string.Empty;
        public string DetailedSolution { get; set; } = string.Empty;
        public string Difficulty { get; set; } = "Medium";
        public int Points { get; set; } = 10;
        public int ViewsCount { get; set; } = 0;
        public int SolvedCount { get; set; } = 0;
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

        public int CategoryId { get; set; }
        public Category Category { get; set; } = null!;
        public List<QuestionOption> Options { get; set; } = new();
        public List<ProblemTag> ProblemTags { get; set; } = new();
        public List<UserProgress> UserProgresses { get; set; } = new();
    }
}