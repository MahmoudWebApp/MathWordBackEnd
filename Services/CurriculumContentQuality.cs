using System.Text;
using System.Text.RegularExpressions;

namespace MathWorldAPI.Services;

/// <summary>
/// Advisory template similarity for MathWorld's read-only editorial preview.
/// Not a proof of mathematical equivalence: the maths editor must decide
/// whether the repeated format teaches a genuinely different skill.
/// </summary>
public static class CurriculumContentQuality
{
    private static readonly Regex Digits = new(
        @"\p{Nd}+(?:[.,]\p{Nd}+)?", RegexOptions.Compiled);
    private static readonly Regex Spacing = new(
        @"\s+", RegexOptions.Compiled);

    public static string TemplateSignature(string? question)
    {
        var normalized = (question ?? string.Empty)
            .Normalize(NormalizationForm.FormKC).Trim().ToLowerInvariant();
        normalized = Digits.Replace(normalized, "#");
        return Spacing.Replace(normalized, " ");
    }

    public static string FamilyKey(
        int stageId, int categoryId, string? arabic, string? english) =>
        $"{stageId}|{categoryId}|{TemplateSignature(arabic)}|{TemplateSignature(english)}";
}
