// File: MathWorldAPI/DTOs/CategoryDto.cs

using System.ComponentModel;
using Microsoft.AspNetCore.Http;

namespace MathWorldAPI.DTOs
{
    /// <summary>
    /// Data Transfer Object for category responses
    /// </summary>
    public class CategoryDto
    {
        public int Id { get; set; }
        public string NameAr { get; set; } = string.Empty;
        public string NameEn { get; set; } = string.Empty;
        public string Icon { get; set; } = string.Empty;
    }

    /// <summary>
    /// DTO for creating a new category - supports file upload
    /// </summary>
    public class CreateCategoryDto
    {
        [Description("Arabic name for the category (required, max 100 characters)")]
        public string NameAr { get; set; } = string.Empty;

        [Description("English name for the category (required, max 100 characters)")]
        public string NameEn { get; set; } = string.Empty;

        [Description("Category icon image file (JPG, PNG, SVG, WebP - max 2MB)")]
        public IFormFile? Icon { get; set; }

        [Description("Display order - lower numbers appear first")]
        public int Order { get; set; } = 0;
    }

    /// <summary>
    /// DTO for updating an existing category - supports file upload
    /// </summary>
    public class UpdateCategoryDto
    {
        [Description("Arabic name for the category (optional)")]
        public string? NameAr { get; set; }

        [Description("English name for the category (optional)")]
        public string? NameEn { get; set; }

        [Description("New icon image file to upload (optional - replaces existing icon)")]
        public IFormFile? Icon { get; set; }

        [Description("Display order (optional)")]
        public int? Order { get; set; }
    }
}