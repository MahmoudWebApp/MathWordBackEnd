using System.ComponentModel.DataAnnotations;

namespace MathWorldAPI.DTOs
{
    /// <summary>Validated choice of active educational stage.</summary>
    public sealed class SelectLearningStageDto
    {
        [Range(1, int.MaxValue)]
        public int StageId { get; set; }
    }

    public sealed class LearningStageDto
    {
        public int? StageId { get; set; }
        public string? NameAr { get; set; }
        public string? NameEn { get; set; }
        public bool HasSelectedStage => StageId.HasValue;
    }

    public sealed class StageCategoryProgressDto
    {
        public int CategoryId { get; set; }
        public string NameAr { get; set; } = string.Empty;
        public string NameEn { get; set; } = string.Empty;
        public int TotalProblems { get; set; }
        public int AttemptedProblems { get; set; }
        public int SolvedProblems { get; set; }
        public int FirstTryCorrect { get; set; }
        public int MasteredProblems { get; set; }
        public int CompletionPercent { get; set; }
    }

    public sealed class LearningJourneyDto
    {
        public int StageId { get; set; }
        public string NameAr { get; set; } = string.Empty;
        public string NameEn { get; set; } = string.Empty;
        public int TotalProblems { get; set; }
        public int AttemptedProblems { get; set; }
        public int SolvedProblems { get; set; }
        public int FirstTryCorrect { get; set; }
        public int MasteredProblems { get; set; }
        public int TotalPoints { get; set; }
        public int CompletionPercent { get; set; }
        public List<StageCategoryProgressDto> Categories { get; set; } = new();
    }
}
