namespace MathWorldAPI.Models;

// Additive track identity: no copies of problems or learner progress.
public sealed class LearningTrack
{
    public int Id { get; set; }
    public int StageId { get; set; }
    public string Code { get; set; } = "";
    public string Kind { get; set; } = "grade";
    public string NameAr { get; set; } = "";
    public string NameEn { get; set; } = "";
    public string DescriptionAr { get; set; } = "";
    public string DescriptionEn { get; set; } = "";
    public int SortOrder { get; set; }
    public int Revision { get; set; }
    public bool IsPublished { get; set; }
}
public sealed class LearningTrackCategory
{
    public int TrackId { get; set; }
    public int CategoryId { get; set; }
}

public sealed class LearningTrackSkill
{
    public int TrackId { get; set; }
    public int SkillId { get; set; }
}

public sealed class LearningTrackProblem
{
    public int TrackId { get; set; }
    public int ProblemId { get; set; }
}
