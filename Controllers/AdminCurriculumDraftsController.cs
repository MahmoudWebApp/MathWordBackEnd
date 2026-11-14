using System.Data;
using System.Security.Claims;
using System.Text.Json;
using System.Text.RegularExpressions;
using MathWorldAPI.Data;
using MathWorldAPI.Helpers;
using MathWorldAPI.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProposedProblem = MathWorldAPI.Controllers.AdminCurriculumImportPreviewController.ProposedProblem;
using PreviewRequest = MathWorldAPI.Controllers.AdminCurriculumImportPreviewController.PreviewRequest;

namespace MathWorldAPI.Controllers;

/// <summary>
/// Explicit three-step content import: submit a frozen draft, record editorial
/// approval/rejection, and only then publish. No automatic publishing.
/// </summary>
[ApiController]
[Route("api/admin/curriculum/drafts")]
[Authorize(Roles = "Admin")]
public sealed class AdminCurriculumDraftsController : ControllerBase
{
    private readonly AppDbContext _db;
    public AdminCurriculumDraftsController(AppDbContext db) => _db = db;

    public sealed class ReviewRequest
    {
        public bool Approve { get; set; }
        public string Note { get; set; } = "";
    }

    public sealed class PublishRequest
    {
        public bool Confirm { get; set; }
    }

    private async Task<int?> ActiveAdminId(CancellationToken ct)
    {
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var id) ||
            id <= 0) return null;
        return await _db.Users.AsNoTracking().AnyAsync(
            u => u.Id == id && u.Role == "Admin" && u.IsActive, ct) ? id : null;
    }

    [HttpPost]
    public async Task<IActionResult> Submit([FromBody] PreviewRequest request,
        CancellationToken ct)
    {
        var adminId = await ActiveAdminId(ct);
        if (adminId is null) return Forbid();
        var errors = await ValidateProblemsAsync(request?.Problems, ct);
        if (errors.Count > 0)
            return BadRequest(new { Message = "CurriculumValidationFailed", Errors = errors });

        var batch = new CurriculumDraftBatch
        {
            SubmittedByAdminId = adminId.Value,
            SubmittedAtUtc = DateTime.UtcNow,
            Status = "Pending",
            ProblemCount = request.Problems.Count,
            ProblemsJson = JsonSerializer.Serialize(request.Problems)
        };
        _db.CurriculumDraftBatches.Add(batch);
        await _db.SaveChangesAsync(ct);
        return Ok(new
        {
            batch.Id, batch.Status, batch.ProblemCount, batch.SubmittedAtUtc,
            Published = false
        });
    }

    [HttpGet]
    public async Task<IActionResult> List([FromQuery] int page = 1,
        [FromQuery] int pageSize = 20,
        [FromQuery] string? status = null,
        CancellationToken ct = default)
    {
        if (await ActiveAdminId(ct) is null) return Forbid();
        if (page < 1 || pageSize < 1 || pageSize > 50 ||
            (long)(page - 1) * pageSize > int.MaxValue ||
            (!string.IsNullOrWhiteSpace(status) &&
             status is not ("Pending" or "Approved" or "Rejected" or "Published")))
            return BadRequest(new { Message = "InvalidFilter" });

        var query = _db.CurriculumDraftBatches.AsNoTracking();
        if (status is not null) query = query.Where(x => x.Status == status);
        var count = await query.CountAsync(ct);
        var batches = await query.OrderByDescending(x => x.SubmittedAtUtc)
            .ThenByDescending(x => x.Id)
            .Skip((page - 1) * pageSize).Take(pageSize)
            .Select(x => new
            {
                x.Id, x.Status, x.ProblemCount, x.SubmittedByAdminId,
                x.SubmittedAtUtc, x.ReviewedByAdminId, x.ReviewedAtUtc,
                x.ReviewNote, x.PublishedAtUtc, x.PublishedCount
            })
            .ToListAsync(ct);
        return Ok(new { Total = count, Page = page, PageSize = pageSize, Batches = batches });
    }

    [HttpGet("{id:long}")]
    public async Task<IActionResult> Detail(long id, CancellationToken ct)
    {
        if (await ActiveAdminId(ct) is null) return Forbid();
        var batch = await _db.CurriculumDraftBatches.AsNoTracking()
            .Where(x => x.Id == id)
            .Select(x => new
            {
                x.Id, x.Status, x.ProblemCount, x.SubmittedByAdminId,
                x.SubmittedAtUtc, x.ReviewedByAdminId, x.ReviewedAtUtc,
                x.ReviewNote, x.PublishedAtUtc, x.PublishedCount, x.ProblemsJson
            }).FirstOrDefaultAsync(ct);
        if (batch is null) return NotFound();
        return Ok(new
        {
            batch.Id, batch.Status, batch.ProblemCount, batch.SubmittedByAdminId,
            batch.SubmittedAtUtc, batch.ReviewedByAdminId, batch.ReviewedAtUtc,
            batch.ReviewNote, batch.PublishedAtUtc, batch.PublishedCount,
            Problems = JsonSerializer.Deserialize<List<ProposedProblem>>(batch.ProblemsJson)
        });
    }

    [HttpPut("{id:long}/review")]
    public async Task<IActionResult> Review(long id, [FromBody] ReviewRequest request,
        CancellationToken ct)
    {
        var adminId = await ActiveAdminId(ct);
        if (adminId is null) return Forbid();
        var note = request?.Note?.Trim() ?? "";
        if (note.Length is < 10 or > 1000)
            return BadRequest(new { Message = "ReviewNoteRequired10To1000" });

        await using var reviewTransaction = await _db.Database.BeginTransactionAsync(ct);
        // Lock the batch so two administrators cannot approve/reject
        // the same pending draft concurrently.
        var batch = await _db.CurriculumDraftBatches
            .FromSqlInterpolated($@"SELECT * FROM ""CurriculumDraftBatches"" WHERE ""Id"" = {id} FOR UPDATE")
            .SingleOrDefaultAsync(ct);
        if (batch is null) return NotFound();
        if (batch.Status != "Pending")
            return Conflict(new { Message = "BatchNotPending" });

        if (request.Approve)
        {
            var problems = JsonSerializer.Deserialize<List<ProposedProblem>>(batch.ProblemsJson);
            var errors = await ValidateProblemsAsync(problems, ct);
            if (errors.Count > 0)
                return Conflict(new { Message = "CurriculumValidationFailed", Errors = errors });
        }

        // A solo-admin launch may review its own work. The recorded note and
        // separate explicit publish action make that review auditable.
        batch.Status = request.Approve ? "Approved" : "Rejected";
        batch.ReviewedByAdminId = adminId.Value;
        batch.ReviewedAtUtc = DateTime.UtcNow;
        batch.ReviewNote = note;
        await _db.SaveChangesAsync(ct);
        await reviewTransaction.CommitAsync(ct);
        return Ok(new { batch.Id, batch.Status, batch.ReviewedByAdminId, batch.ReviewedAtUtc });
    }

    [HttpPost("{id:long}/publish")]
    public async Task<IActionResult> Publish(long id, [FromBody] PublishRequest request,
        CancellationToken ct)
    {
        if (await ActiveAdminId(ct) is null) return Forbid();
        if (request?.Confirm != true)
            return BadRequest(new { Message = "ExplicitPublishConfirmationRequired" });

        await using var transaction = await _db.Database.BeginTransactionAsync(
            IsolationLevel.Serializable, ct);

        // Serialize editorial publication across separate batches, too.
        // Validation then runs in this transaction before any inserts.
        await _db.Database.SqlQuery<int>(
                $"SELECT 1 AS \"Value\" FROM pg_advisory_xact_lock({-987654319})")
            .SingleAsync(ct);

        // Prevent two publish requests from committing the same batch.
        var batch = await _db.CurriculumDraftBatches
            .FromSqlInterpolated($@"SELECT * FROM ""CurriculumDraftBatches"" WHERE ""Id"" = {id} FOR UPDATE")
            .SingleOrDefaultAsync(ct);
        if (batch is null) return NotFound();
        if (batch.Status != "Approved" || batch.ReviewedByAdminId is null)
            return Conflict(new { Message = "BatchNotApproved" });

        var problems = JsonSerializer.Deserialize<List<ProposedProblem>>(batch.ProblemsJson);
        var errors = await ValidateProblemsAsync(problems, ct);
        if (errors.Count > 0)
            return Conflict(new { Message = "CurriculumValidationFailed", Errors = errors });

        foreach (var proposal in problems!)
        {
            _db.Problems.Add(new MathProblem
            {
                TitleAr = MathTextHelper.ExtractTitleFromQuestion(proposal.QuestionTextAr),
                TitleEn = MathTextHelper.ExtractTitleFromQuestion(proposal.QuestionTextEn),
                QuestionTextAr = proposal.QuestionTextAr.Trim(),
                QuestionTextEn = proposal.QuestionTextEn.Trim(),
                DetailedSolutionAr = proposal.DetailedSolutionAr.Trim(),
                DetailedSolutionEn = proposal.DetailedSolutionEn.Trim(),
                StageId = proposal.StageId,
                CategoryId = proposal.CategoryId,
                Points = proposal.Points,
                CreatedAt = DateTime.UtcNow,
                Options = proposal.Options.OrderBy(o => o.Order).Select(o => new QuestionOption
                {
                    LatexCode = o.LatexCode.Trim(),
                    Order = o.Order,
                    IsCorrect = o.IsCorrect
                }).ToList()
            });
        }

        batch.Status = "Published";
        batch.PublishedCount = problems!.Count;
        batch.PublishedAtUtc = DateTime.UtcNow;
        await _db.SaveChangesAsync(ct);
        await transaction.CommitAsync(ct);
        return Ok(new { batch.Id, batch.Status, batch.PublishedCount, batch.PublishedAtUtc });
    }

    /// <summary>Revalidate against live categories and question bank on every state change.</summary>
    private async Task<List<object>> ValidateProblemsAsync(
        List<ProposedProblem>? problems, CancellationToken ct)
    {
        var errors = new List<object>();
        if (problems is null || problems.Count is < 1 or > 100)
        {
            errors.Add(new { ContentKey = "", Errors = new[] { "BatchSizeMustBe1To100" } });
            return errors;
        }

        var stageIds = (await _db.EducationalStages.AsNoTracking()
            .Select(x => x.Id).ToListAsync(ct)).ToHashSet();
        var categoryStage = await _db.Categories.AsNoTracking()
            .Select(x => new { x.Id, x.StageId })
            .ToDictionaryAsync(x => x.Id, x => x.StageId, ct);
        var existing = (await _db.Problems.AsNoTracking().Select(x => new
            { x.StageId, x.QuestionTextAr, x.QuestionTextEn }).ToListAsync(ct))
            .Select(x => QuestionKey(x.StageId, x.QuestionTextAr, x.QuestionTextEn))
            .ToHashSet(StringComparer.OrdinalIgnoreCase);
        var usedKeys = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
        var usedQuestions = new HashSet<string>(StringComparer.OrdinalIgnoreCase);

        for (var index = 0; index < problems.Count; index++)
        {
            var item = problems[index];
            var issues = new List<string>();
            if (item is null)
            {
                errors.Add(new { ContentKey = "", Row = index + 1,
                    Errors = new[] { "NullProblem" } });
                continue;
            }

            var key = item.ContentKey?.Trim() ?? "";
            if (!Regex.IsMatch(key, "^[a-z0-9][a-z0-9_-]{2,79}$"))
                issues.Add("InvalidContentKey");
            else if (!usedKeys.Add(key)) issues.Add("DuplicateContentKey");
            if (!stageIds.Contains(item.StageId)) issues.Add("UnknownStage");
            if (!categoryStage.TryGetValue(item.CategoryId, out var stage))
                issues.Add("UnknownCategory");
            else if (stage != item.StageId) issues.Add("CategoryStageMismatch");
            if (!ValidText(item.QuestionTextAr, 5000) ||
                !ValidText(item.QuestionTextEn, 5000) ||
                !ValidText(item.DetailedSolutionAr, 12000) ||
                !ValidText(item.DetailedSolutionEn, 12000))
                issues.Add("InvalidBilingualContent");

            var questionKey = QuestionKey(item.StageId, item.QuestionTextAr,
                item.QuestionTextEn);
            if (!usedQuestions.Add(questionKey)) issues.Add("DuplicateQuestionInBatch");
            if (existing.Contains(questionKey)) issues.Add("QuestionAlreadyExists");
            if (item.Points is < 1 or > 100000) issues.Add("InvalidPoints");

            if (item.Options is null || item.Options.Count != 4)
                issues.Add("ExactlyFourOptionsRequired");
            else
            {
                if (item.Options.Any(o => o is null || !ValidText(o.LatexCode, 3000)))
                    issues.Add("InvalidOption");
                if (item.Options.Count(o => o is not null && o.IsCorrect) != 1)
                    issues.Add("ExactlyOneCorrectOptionRequired");
                if (item.Options.Any(o => o is null || o.Order is < 1 or > 4) ||
                    item.Options.Select(o => o?.Order).Distinct().Count() != 4)
                    issues.Add("InvalidOptionOrder");
                if (item.Options.Select(o => o?.LatexCode?.Trim())
                    .Distinct(StringComparer.Ordinal).Count() != 4)
                    issues.Add("DuplicateOptions");
            }
            if (issues.Count > 0)
                errors.Add(new { ContentKey = key, Row = index + 1, Errors = issues });
        }
        return errors;
    }

    private static bool ValidText(string? value, int max) =>
        !string.IsNullOrWhiteSpace(value) && value.Trim().Length <= max;

    private static string QuestionKey(int stage, string? ar, string? en) =>
        stage + "|" + (ar ?? "").Trim() + "|" + (en ?? "").Trim();
}
