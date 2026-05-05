// File: MathWorldAPI/DTOs/TagDto.cs

using System.ComponentModel;

namespace MathWorldAPI.DTOs
{
    /// <summary>
    /// DTO for creating a new search tag
    /// </summary>
    public class CreateTagDto
    {
        [Description("Tag text in Arabic")]
        public string TextAr { get; set; } = string.Empty;

        [Description("Tag text in English")]
        public string TextEn { get; set; } = string.Empty;
    }

    /// <summary>
    /// DTO for updating an existing tag
    /// </summary>
    public class UpdateTagDto
    {
        [Description("New tag text in Arabic (optional)")]
        public string? TextAr { get; set; }

        [Description("New tag text in English (optional)")]
        public string? TextEn { get; set; }
    }

    /// <summary>
    /// DTO for tag response with problem count
    /// </summary>
    public class TagResponseDto
    {
        public int Id { get; set; }
        public string TextAr { get; set; } = string.Empty;
        public string TextEn { get; set; } = string.Empty;
        public int ProblemsCount { get; set; }
    }
}