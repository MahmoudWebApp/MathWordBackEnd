using System.ComponentModel;
using Microsoft.AspNetCore.Http;

namespace MathWorldAPI.DTOs
{
    public class CategoryDto
    {
        public int Id { get; set; }
        public string NameAr { get; set; } = string.Empty;
        public string NameEn { get; set; } = string.Empty;
        public string Name { get; set; } = string.Empty;
        public string Icon { get; set; } = string.Empty;
        public int StageId { get; set; }
        public int Order { get; set; }
    }

    public class CreateCategoryDto
    {
        [Description("اسم الفئة بالعربي (مطلوب، بحد أقصى 100 حرف)")]
        public string NameAr { get; set; } = string.Empty;

        [Description("اسم الفئة بالإنجليزي (مطلوب، بحد أقصى 100 حرف)")]
        public string NameEn { get; set; } = string.Empty;

        [Description("أيقونة الفئة (JPG, PNG, SVG, WebP - الحد الأقصى 2MB)")]
        public IFormFile? Icon { get; set; }

        [Description("ترتيب العرض - الأرقام الأصغر تظهر أولاً")]
        public int Order { get; set; } = 0;

        [Description("معرف المرحلة الدراسية التي تنتمي لها الفئة")]
        public int StageId { get; set; }
    }

    public class UpdateCategoryDto
    {
        [Description("اسم الفئة بالعربي (اختياري)")]
        public string? NameAr { get; set; }

        [Description("اسم الفئة بالإنجليزي (اختياري)")]
        public string? NameEn { get; set; }

        [Description("أيقونة جديدة لرفعها (اختياري - تستبدل الحالية)")]
        public IFormFile? Icon { get; set; }

        [Description("ترتيب العرض (اختياري)")]
        public int? Order { get; set; }

        [Description("معرف المرحلة الدراسية (اختياري)")]
        public int? StageId { get; set; }
    }
}