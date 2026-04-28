namespace MathWorldAPI.DTOs
{
    public class CreateTagDto
    {
        public string TextAr { get; set; } = string.Empty;
        public string TextEn { get; set; } = string.Empty;
    }

    public class UpdateTagDto
    {
        public string TextAr { get; set; } = string.Empty;
        public string TextEn { get; set; } = string.Empty;
    }

    public class TagResponseDto
    {
        public int Id { get; set; }
        public string TextAr { get; set; } = string.Empty;
        public string TextEn { get; set; } = string.Empty;
        public int ProblemsCount { get; set; }
    }
}