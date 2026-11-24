namespace MathWorldAPI.Models;

// Independent training/challenge state. Legacy UserProgress and immutable
// ProblemAttempts remain unchanged until the coordinated progress integration.
public sealed class LearningSession
{
    public Guid Id { get; set; }
    public int UserId { get; set; }
    public int StageId { get; set; }
    public int? TrackId { get; set; }
    public int? CategoryId { get; set; }
    public string Kind { get; set; } = "";
    public string ScopeKey { get; set; } = "";
    public Guid StartRequestId { get; set; }
    public string QuestionsJson { get; set; } = "";
    public int Total { get; set; }
    public int Completed { get; set; }
    public int HintsRevealed { get; set; }
    public DateTime CreatedAtUtc { get; set; }
    public DateTime? CompletedAtUtc { get; set; }
    public DateTime? AbandonedAtUtc { get; set; }
}

public sealed class LearningSessionAttempt
{
    public Guid SessionId { get; set; }
    public Guid RequestId { get; set; }
    public int Position { get; set; }
    public int ProblemId { get; set; }
    public int SelectedOptionId { get; set; }
    public string SelectedOptionText { get; set; } = "";
    public bool IsCorrect { get; set; }
    public int AttemptNumber { get; set; }
    public bool UsedHint { get; set; }
    public int PointsEarned { get; set; }
    public DateTime SubmittedAtUtc { get; set; }
}

// One lifetime achievement per learner/problem, shared by both answer flows.
public sealed class PermanentProblemAchievement
{
    public int UserId { get; set; }
    public int ProblemId { get; set; }
    public int StageId { get; set; }
    public int CategoryId { get; set; }
    public int Points { get; set; }
    public DateTime EarnedAtUtc { get; set; }
}
