namespace MathWorldAPI.Models;

/// <summary>Immutable content payload with separate explicit editorial approval and publication.</summary>
public sealed class CurriculumDraftBatch
{
    public long Id { get; set; }
    public int SubmittedByAdminId { get; set; }
    public DateTime SubmittedAtUtc { get; set; } = DateTime.UtcNow;
    public string Status { get; set; } = "Pending";
    public string ProblemsJson { get; set; } = "[]";
    public int ProblemCount { get; set; }
    public int? ReviewedByAdminId { get; set; }
    public DateTime? ReviewedAtUtc { get; set; }
    public string? ReviewNote { get; set; }
    public int PublishedCount { get; set; }
    public DateTime? PublishedAtUtc { get; set; }
}
