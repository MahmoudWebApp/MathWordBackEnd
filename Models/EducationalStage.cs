namespace MathWorldAPI.Models
{
    public class EducationalStage
    {
        public int Id { get; set; }
        public string NameAr { get; set; } = string.Empty;
        public string NameEn { get; set; } = string.Empty;
        public int Order { get; set; } 

    
        public ICollection<MathProblem> Problems { get; set; } = new List<MathProblem>();
    }
}