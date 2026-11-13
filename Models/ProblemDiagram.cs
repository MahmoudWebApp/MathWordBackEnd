using System.ComponentModel.DataAnnotations;

namespace MathWorldAPI.Models
{
    /// <summary>
    /// Optional validated geometry scene attached to an existing problem.
    /// Old problems have no row and remain unchanged.
    /// </summary>
    public sealed class ProblemDiagram
    {
        public int ProblemId { get; set; }
        public MathProblem Problem { get; set; } = null!;
        public int SchemaVersion { get; set; } = 1;
        [Required, MaxLength(30000)]
        public string DiagramJson { get; set; } = string.Empty;
        [Required, MaxLength(500)]
        public string AltTextAr { get; set; } = string.Empty;
        [Required, MaxLength(500)]
        public string AltTextEn { get; set; } = string.Empty;
    }
}
