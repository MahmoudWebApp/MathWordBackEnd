namespace MathWorldAPI.Models
{
    public class ProblemTag
    {
        public int Id { get; set; }
        public int ProblemId { get; set; }
        public int TagId { get; set; }

        public MathProblem Problem { get; set; } = null!;
        public SearchTag Tag { get; set; } = null!;
    }
}