namespace MathWorldAPI.Models;

// Private snapshot; do not return this persistence entity as an API response.
public sealed class CustomExam
{
    public Guid Id { get; set; }
    public Guid StartRequestId { get; set; }
    public int UserId { get; set; }
    public int StageId { get; set; }
    public int TrackId { get; set; }
    public int? CategoryId { get; set; }
    public string TitleAr { get; set; } = "";
    public string TitleEn { get; set; } = "";
    public string QuestionsJson { get; set; } = "";
    public string AnswersJson { get; set; } = "[]";
    public int Total { get; set; }
    public int PassPercent { get; set; }
    public int PolicyVersion { get; set; } = 1;
    public DateTime CreatedAtUtc { get; set; }
    public DateTime? FinishedAtUtc { get; set; }
    public DateTime? AbandonedAtUtc { get; set; }
    public int? Score { get; set; }
    public string? CertificateStudentName { get; set; }
    public string? VerificationCode { get; set; }
}
