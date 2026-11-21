namespace MathWorldAPI.Models;

/// <summary>
/// Editorial-only topic proposal. Never included in public categories or student access.
/// A proposed topic becomes a real Category only through an explicit reviewed
/// publication workflow, after verified questions and icons exist.
/// </summary>
public sealed class CurriculumTopicProposal
{
    public int Id { get; set; }
    public string StableKey { get; set; } = string.Empty;
    public int StageId { get; set; }
    public int DomainId { get; set; }
    public string NameAr { get; set; } = string.Empty;
    public string NameEn { get; set; } = string.Empty;
    public string DescriptionAr { get; set; } = string.Empty;
    public string DescriptionEn { get; set; } = string.Empty;
    public string IconKey { get; set; } = string.Empty;
    public int SortOrder { get; set; }
    public string EditorialStatus { get; set; } = "Draft";
    public int ProposedQuestionCount { get; set; }
    public EducationalStage Stage { get; set; } = null!;
    public CurriculumDomain Domain { get; set; } = null!;
}
