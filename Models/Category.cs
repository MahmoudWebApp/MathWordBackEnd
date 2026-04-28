namespace MathWorldAPI.Models
{
    public class Category
    {
        public int Id { get; set; }
        public string NameAr { get; set; } = string.Empty;
        public string NameEn { get; set; } = string.Empty;
        public string Icon { get; set; } = "📐";
        public int Order { get; set; } = 0;

        public List<MathProblem> Problems { get; set; } = new();
    }
}