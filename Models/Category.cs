namespace MathWorldAPI.Models
{
    public class Category
    {
        public int Id { get; set; }
        public string NameAr { get; set; } = string.Empty;
        public string NameEn { get; set; } = string.Empty;
        public string Icon { get; set; } = "📐";
        public int Order { get; set; } = 0;
        public int StageId { get; set; }
        public EducationalStage Stage { get; set; } = null!;
        public List<MathProblem> Problems { get; set; } = new();
    }
}