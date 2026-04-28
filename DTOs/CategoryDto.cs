namespace MathWorldAPI.DTOs
{
    public class CategoryDto
    {
        public int Id { get; set; }
        public string NameAr { get; set; } = string.Empty;
        public string NameEn { get; set; } = string.Empty;
        public string Icon { get; set; } = string.Empty;
    }

    public class CreateCategoryDto
    {
        public string NameAr { get; set; } = string.Empty;
        public string NameEn { get; set; } = string.Empty;
        public string Icon { get; set; } = "??";
        public int Order { get; set; } = 0;
    }

    public class UpdateCategoryDto
    {
        public string NameAr { get; set; } = string.Empty;
        public string NameEn { get; set; } = string.Empty;
        public string Icon { get; set; } = string.Empty;
        public int Order { get; set; }
    }
}