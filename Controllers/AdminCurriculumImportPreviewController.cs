using System.ComponentModel.DataAnnotations;
using System.Security.Claims;
using MathWorldAPI.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers
{
    /// <summary>
    /// Validates a proposed bilingual curriculum batch against live stage/category IDs.
    /// Preview is intentionally read-only: no database writes or publication.
    /// </summary>
    [ApiController]
    [Route("api/admin/curriculum/import")]
    [Authorize(Roles = "Admin")]
    public sealed class AdminCurriculumImportPreviewController : ControllerBase
    {
        private readonly AppDbContext _db;
        public AdminCurriculumImportPreviewController(AppDbContext db) => _db = db;

        public sealed class ProposedOption
        {
            public string LatexCode { get; set; } = "";
            public bool IsCorrect { get; set; }
            public int Order { get; set; }
        }

        public sealed class ProposedProblem
        {
            public string ContentKey { get; set; } = "";
            public int StageId { get; set; }
            public int CategoryId { get; set; }
            public string QuestionTextAr { get; set; } = "";
            public string QuestionTextEn { get; set; } = "";
            public string DetailedSolutionAr { get; set; } = "";
            public string DetailedSolutionEn { get; set; } = "";
            public int Points { get; set; } = 10;
            public List<ProposedOption> Options { get; set; } = new();
        }

        public sealed class PreviewRequest
        {
            [Required] public List<ProposedProblem> Problems { get; set; } = new();
        }

        [HttpPost("preview")]
        public async Task<IActionResult> Preview([FromBody] PreviewRequest request,
            CancellationToken cancellationToken)
        {
            var adminId = int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier),
                out var parsed) ? parsed : 0;
            if (adminId <= 0 || !await _db.Users.AsNoTracking().AnyAsync(
                u => u.Id == adminId && u.Role == "Admin" && u.IsActive,
                cancellationToken))
                return Forbid();

            if (request.Problems == null || request.Problems.Count is < 1 or > 100)
                return BadRequest(new { Message = "BatchSizeMustBeBetween1And100" });

            var stages = await _db.EducationalStages.AsNoTracking()
                .Select(s => s.Id).ToListAsync(cancellationToken);
            var categories = await _db.Categories.AsNoTracking()
                .Select(c => new { c.Id, c.StageId }).ToListAsync(cancellationToken);
            var stageIds = stages.ToHashSet();
            var categoryStages = categories.ToDictionary(c => c.Id, c => c.StageId);
            var usedKeys = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
            var usedQuestions = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
            var existingQuestions = await _db.Problems.AsNoTracking()
                .Select(p => new { p.StageId, p.QuestionTextAr, p.QuestionTextEn })
                .ToListAsync(cancellationToken);
            var existingQuestionKeys = existingQuestions.Select(p =>
                QuestionKey(p.StageId, p.QuestionTextAr, p.QuestionTextEn))
                .ToHashSet(StringComparer.OrdinalIgnoreCase);
            var results = new List<object>();
            var validCount = 0;

            foreach (var item in request.Problems)
            {
                var errors = new List<string>();
                if (item == null)
                {
                    results.Add(new { ContentKey = "", Valid = false,
                        Errors = new[] { "NullProblem" } });
                    continue;
                }

                var key = item.ContentKey?.Trim() ?? "";
                if (!System.Text.RegularExpressions.Regex.IsMatch(key,
                        "^[a-z0-9][a-z0-9_-]{2,79}$"))
                    errors.Add("InvalidContentKey");
                else if (!usedKeys.Add(key))
                    errors.Add("DuplicateContentKeyInBatch");

                if (!stageIds.Contains(item.StageId)) errors.Add("UnknownStage");
                if (!categoryStages.TryGetValue(item.CategoryId, out var categoryStage))
                    errors.Add("UnknownCategory");
                else if (categoryStage != item.StageId)
                    errors.Add("CategoryStageMismatch");

                if (string.IsNullOrWhiteSpace(item.QuestionTextAr) ||
                    string.IsNullOrWhiteSpace(item.QuestionTextEn) ||
                    string.IsNullOrWhiteSpace(item.DetailedSolutionAr) ||
                    string.IsNullOrWhiteSpace(item.DetailedSolutionEn))
                    errors.Add("MissingBilingualContent");

                if (!string.IsNullOrWhiteSpace(item.QuestionTextAr) &&
                    !string.IsNullOrWhiteSpace(item.QuestionTextEn))
                {
                    var questionKey = QuestionKey(item.StageId, item.QuestionTextAr, item.QuestionTextEn);
                    if (!usedQuestions.Add(questionKey))
                        errors.Add("DuplicateQuestionInBatch");
                    if (existingQuestionKeys.Contains(questionKey))
                        errors.Add("QuestionAlreadyExistsInStage");
                }

                if (item.Points is < 1 or > 100000) errors.Add("InvalidPoints");
                var options = item.Options;
                if (options == null || options.Count != 4)
                    errors.Add("ExactlyFourOptionsRequired");
                else
                {
                    if (options.Any(o => o == null || string.IsNullOrWhiteSpace(o.LatexCode)))
                        errors.Add("EmptyOption");
                    if (options.Count(o => o != null && o.IsCorrect) != 1)
                        errors.Add("ExactlyOneCorrectOptionRequired");
                    if (options.Select(o => o?.Order).Distinct().Count() != 4 ||
                        options.Any(o => o == null || o.Order is < 1 or > 4))
                        errors.Add("InvalidOptionOrder");
                    if (options.Select(o => o?.LatexCode?.Trim())
                        .Distinct(StringComparer.Ordinal).Count() != 4)
                        errors.Add("DuplicateOptions");
                }

                if (errors.Count == 0) validCount++;
                results.Add(new { ContentKey = key, Valid = errors.Count == 0, Errors = errors });
            }

            return Ok(new
            {
                DryRun = true,
                Published = false,
                Total = request.Problems.Count,
                ValidCount = validCount,
                InvalidCount = request.Problems.Count - validCount,
                CanProceedToEditorialReview = validCount == request.Problems.Count,
                Results = results
            });
        }

        private static string QuestionKey(int stageId, string? ar, string? en) =>
            stageId + "|" + (ar ?? "").Trim() + "|" + (en ?? "").Trim();
    }
}
