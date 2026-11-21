namespace MathWorldAPI.Models;

/// <summary>Mathematical domain: stable, bilingual and independent of arbitrary category counts.</summary>
public sealed class CurriculumDomain
{
    public int Id { get; set; }
    public string StableKey { get; set; } = string.Empty;
    public string NameAr { get; set; } = string.Empty;
    public string NameEn { get; set; } = string.Empty;
    public string DescriptionAr { get; set; } = string.Empty;
    public string DescriptionEn { get; set; } = string.Empty;
    public int SortOrder { get; set; }
    public bool IsPublished { get; set; }
}

/// <summary>A measurable learning objective within an existing stage and category.</summary>
public sealed class CurriculumSkill
{
    public int Id { get; set; }
    public string StableKey { get; set; } = string.Empty;
    public int DomainId { get; set; }
    public int StageId { get; set; }
    public int CategoryId { get; set; }
    public string NameAr { get; set; } = string.Empty;
    public string NameEn { get; set; } = string.Empty;
    public string DescriptionAr { get; set; } = string.Empty;
    public string DescriptionEn { get; set; } = string.Empty;
    public int SortOrder { get; set; }
    public bool IsPublished { get; set; }
    public CurriculumDomain Domain { get; set; } = null!;
    public EducationalStage Stage { get; set; } = null!;
    public Category Category { get; set; } = null!;
}

/// <summary>Traceable curriculum reference; related does not mean accredited.</summary>
public sealed class CurriculumSkillStandard
{
    public int Id { get; set; }
    public int SkillId { get; set; }
    public string Framework { get; set; } = string.Empty;
    public string StandardCode { get; set; } = string.Empty;
    public string MappingType { get; set; } = "related";
    public string? ReferenceUrl { get; set; }
    public CurriculumSkill Skill { get; set; } = null!;
}

/// <summary>Directed prerequisites between skills; cycles validated by editorial service.</summary>
public sealed class CurriculumSkillPrerequisite
{
    public int SkillId { get; set; }
    public int PrerequisiteSkillId { get; set; }
    public CurriculumSkill Skill { get; set; } = null!;
    public CurriculumSkill PrerequisiteSkill { get; set; } = null!;
}

/// <summary>One primary skill per problem, secondary references optional.</summary>
public sealed class CurriculumProblemSkill
{
    public int ProblemId { get; set; }
    public int SkillId { get; set; }
    public bool IsPrimary { get; set; }
    public MathProblem Problem { get; set; } = null!;
    public CurriculumSkill Skill { get; set; } = null!;
}
