using System;

namespace MathWorldAPI.Models
{
    /// <summary>
    /// Immutable competitive solve credit captured at the moment the learner
    /// earns it. Subsequent question edits cannot rewrite awarded points.
    /// </summary>
    public sealed class PointLedger
    {
        public long Id { get; set; }
        public int UserId { get; set; }
        public int ProblemId { get; set; }
        public int StageId { get; set; }
        public int AttemptId { get; set; }
        public string Reason { get; set; } = PointLedgerReasons.SolveCredit;
        public int Points { get; set; }
        public bool FirstTryCorrect { get; set; }
        public DateTime AwardedAt { get; set; } = DateTime.UtcNow;
    }

    public static class PointLedgerReasons
    {
        public const string SolveCredit = "SolveCredit";
    }
}
