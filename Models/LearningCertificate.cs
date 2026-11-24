namespace MathWorldAPI.Models;

// Issued evidence is a snapshot, not a live reference to a mutable curriculum.
// Deleting a learner removes their personal certificate data.
public sealed class LearningCertificate
{
    public Guid Id { get; set; }
    public int UserId { get; set; }
    public int StageId { get; set; }
    public int? TrackId { get; set; }
    public int? CategoryId { get; set; }
    public string ScopeKey { get; set; } = "";
    public string Kind { get; set; } = "";
    public string StudentName { get; set; } = "";
    public string TitleAr { get; set; } = "";
    public string TitleEn { get; set; } = "";
    public string VerificationCode { get; set; } = "";
    public int PolicyVersion { get; set; }
    public int TotalProblems { get; set; }
    public int RequiredSkills { get; set; }
    public DateTime IssuedAtUtc { get; set; }
}
