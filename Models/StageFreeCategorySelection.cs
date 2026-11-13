namespace MathWorldAPI.Models;

public sealed class StageFreeCategorySelection
{
    public int StageId { get; set; }
    public int FirstCategoryId { get; set; }
    public int SecondCategoryId { get; set; }
    public int UpdatedByAdminId { get; set; }
    public DateTime UpdatedAtUtc { get; set; }
}
