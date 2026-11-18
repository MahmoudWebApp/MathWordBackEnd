using System.Security.Claims;
using System.Text.RegularExpressions;
using MathWorldAPI.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

/// <summary>
/// Read-only import preview for new stage categories. Existing category IDs,
/// Free selections, learner progress and question links are never modified.
/// Icon keys are suggestions for a future unified visual-asset system, not
/// image URLs or values that can be published into the current Icon column.
/// </summary>
[ApiController]
[Route("api/admin/curriculum/categories")]
[Authorize(Roles = "Admin")]
public sealed class AdminCategoryImportPreviewController : ControllerBase
{
    private readonly AppDbContext _db;

    public AdminCategoryImportPreviewController(AppDbContext db) => _db = db;

    public sealed class ProposedCategory
    {
        public string ContentKey { get; set; } = "";
        public int StageId { get; set; }
        public int Order { get; set; }
        public string NameAr { get; set; } = "";
        public string NameEn { get; set; } = "";
        public string SuggestedIconKey { get; set; } = "";
        public string ReviewStatus { get; set; } = "Proposed";
        public string NotesAr { get; set; } = "";
        public string NotesEn { get; set; } = "";
    }

    public sealed class PreviewRequest
    {
        public List<ProposedCategory> Categories { get; set; } = new();
    }

    [HttpPost("preview")]
    [RequestSizeLimit(512 * 1024)]
    public async Task<IActionResult> Preview([FromBody] PreviewRequest? request,
        CancellationToken ct)
    {
        var adminId = int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var id)
            ? id : 0;
        if (adminId <= 0 || !await _db.Users.AsNoTracking().AnyAsync(
            u => u.Id == adminId && u.Role == "Admin" && u.IsActive, ct))
            return Forbid();

        if (request?.Categories is null || request.Categories.Count is < 1 or > 50)
            return BadRequest(new { Message = "CategoriesBatchMustBe1To50" });

        var stageIds = (await _db.EducationalStages.AsNoTracking()
            .Select(x => x.Id).ToListAsync(ct)).ToHashSet();
        var existing = await _db.Categories.AsNoTracking()
            .Select(x => new { x.StageId, x.NameAr, x.NameEn })
            .ToListAsync(ct);
        var usedKeys = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
        var usedAr = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
        var usedEn = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
        var rows = new List<object>();
        var validCount = 0;

        for (var i = 0; i < request.Categories.Count; i++)
        {
            var item = request.Categories[i];
            var errors = new List<string>();
            if (item is null)
            {
                rows.Add(new { Row = i + 1, ContentKey = "", Valid = false,
                    Errors = new[] { "NullCategory" } });
                continue;
            }

            var key = item.ContentKey?.Trim() ?? "";
            var ar = item.NameAr?.Trim() ?? "";
            var en = item.NameEn?.Trim() ?? "";
            if (!Regex.IsMatch(key, "^[a-z0-9][a-z0-9_-]{2,79}$"))
                errors.Add("InvalidContentKey");
            else if (!usedKeys.Add(key))
                errors.Add("DuplicateContentKey");

            if (!stageIds.Contains(item.StageId)) errors.Add("UnknownStage");
            if (item.Order is < 0 or > 999) errors.Add("InvalidOrder");
            if (ar.Length is < 2 or > 160 || en.Length is < 2 or > 160)
                errors.Add("InvalidBilingualName");

            if (!Regex.IsMatch(item.SuggestedIconKey ?? "",
                "^[a-z][a-z0-9-]{0,49}$"))
                errors.Add("InvalidSuggestedIconKey");

            if (item.ReviewStatus != "Proposed")
                errors.Add("ReviewStatusMustBeProposed");
            if ((item.NotesAr?.Length ?? 0) > 500 || (item.NotesEn?.Length ?? 0) > 500)
                errors.Add("NotesTooLong");

            // A name colliding in either language is considered a conflict,
            // even if the other translation differs.
            if (ar.Length > 0 && !usedAr.Add(item.StageId + "|" + ar))
                errors.Add("DuplicateArabicNameInBatch");
            if (en.Length > 0 && !usedEn.Add(item.StageId + "|" + en))
                errors.Add("DuplicateEnglishNameInBatch");
            if (existing.Any(x => x.StageId == item.StageId &&
                string.Equals(x.NameAr?.Trim(), ar, StringComparison.OrdinalIgnoreCase)))
                errors.Add("ArabicNameAlreadyExists");
            if (existing.Any(x => x.StageId == item.StageId &&
                string.Equals(x.NameEn?.Trim(), en, StringComparison.OrdinalIgnoreCase)))
                errors.Add("EnglishNameAlreadyExists");

            if (errors.Count == 0) validCount++;
            rows.Add(new { Row = i + 1, ContentKey = key,
                Valid = errors.Count == 0, Errors = errors });
        }

        return Ok(new
        {
            DryRun = true,
            Published = false,
            ExistingCategoriesUnchanged = true,
            Total = request.Categories.Count,
            ValidCount = validCount,
            InvalidCount = request.Categories.Count - validCount,
            RequiresEditorialApproval = true,
            SupportsAutomaticCategoryPublishing = false,
            Results = rows
        });
    }
}
