namespace MathWorldAPI.Models
{
    public class SearchTag
    {
        public int Id { get; set; }
        public string TextAr { get; set; } = string.Empty;
        public string TextEn { get; set; } = string.Empty;

        public List<ProblemTag> ProblemTags { get; set; } = new();
    }
}