using System;
using System.Collections.Generic;

namespace MathWorldAPI.DTOs
{
    /// <summary>Stage-only results: retries never add another solve credit.</summary>
    public sealed class LeaderboardDto
    {
        public int StageId { get; set; }
        public string NameAr { get; set; } = string.Empty;
        public string NameEn { get; set; } = string.Empty;
        public string Period { get; set; } = "all";
        public int Page { get; set; }
        public int PageSize { get; set; }
        public int TotalLearners { get; set; }
        public int? MyRank { get; set; }
        public List<LeaderboardEntryDto> Entries { get; set; } = new();
    }

    public sealed class LeaderboardEntryDto
    {
        public int Rank { get; set; }
        public string DisplayName { get; set; } = string.Empty;
        // Only populated on the Admin endpoint. Never expose learner identifiers publicly.
        public int? UserId { get; set; }
        public int SolvedProblems { get; set; }
        public int Points { get; set; }
        public int FirstTryCorrect { get; set; }
        public bool IsCurrentUser { get; set; }
    }
}
