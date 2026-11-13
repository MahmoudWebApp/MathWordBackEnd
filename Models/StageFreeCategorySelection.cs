namespace MathWorldAPI.Models;

/// <summary>Per-stage audited Free access selection. Exactly two IDs are validated by the admin endpoint.</summary>
public sealed class StageFreeCategorySelection
{
    public int StageId { get; set; }
    public int FirstCategoryId { get; set; }
    public int SecondCategoryId { get; set; }
    public int UpdatedByAdminId { get; set; }
    public DateTime UpdatedAtUtc { get; set; }
}
