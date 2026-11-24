namespace MathWorldAPI.Models;

/// <summary>
/// Independently reviewable editorial item. Not an active learner MathProblem.
/// Content is exposed only to active admins via a separate review endpoint.
/// </summary>
public sealed class CurriculumDraftItem
{
    public long Id { get; set; }
    public int? TopicProposalId { get; set; }
    public CurriculumTopicProposal? TopicProposal { get; set; }
    public string? WizardJson { get; set; }
    public int? OwnerUserId { get; set; }
    public int? LastEditorUserId { get; set; }
    public int Revision { get; set; }
    public DateTime? SubmittedAtUtc { get; set; }
    public DateTime? ReviewedAtUtc { get; set; }
    public int? ReviewedByUserId { get; set; }
    public string? ReviewNote { get; set; }
    public DateTime? PublishedAtUtc { get; set; }
    public int? PublishedProblemId { get; set; }
    public string ContentKey { get; set; } = string.Empty;
    public string PrimarySkillKey { get; set; } = string.Empty;
    public string TemplateFamilyKey { get; set; } = string.Empty;
    public int DifficultyLevel { get; set; } = 1;
    public string PisaProcess { get; set; } = string.Empty;
    public string LearningObjectiveAr { get; set; } = string.Empty;
    public string LearningObjectiveEn { get; set; } = string.Empty;
    public string QuestionTextAr { get; set; } = string.Empty;
    public string QuestionTextEn { get; set; } = string.Empty;
    public string DetailedSolutionAr { get; set; } = string.Empty;
    public string DetailedSolutionEn { get; set; } = string.Empty;
    public string OptionsJson { get; set; } = "[]";
    public string EditorialStatus { get; set; } = "Draft";
}
