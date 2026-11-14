using System.Globalization;
using System.Security.Claims;
using System.Text;
using MathWorldAPI.Data;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

/// <summary>
/// Private student analytics for an active Premium subscription.
/// Reports aggregate real attempt records, not browser-supplied statistics.
/// </summary>
[ApiController]
[Authorize(Roles = "Student")]
[Route("api/users/premium-analytics")]
public sealed class StudentPremiumAnalyticsController : ControllerBase
{
    private readonly AppDbContext _db;
    public StudentPremiumAnalyticsController(AppDbContext db) => _db = db;

    public sealed record CategoryStatistics(
        int StageId, int CategoryId, string StageNameAr, string StageNameEn,
        string CategoryNameAr, string CategoryNameEn,
        int AttemptedProblems, int SolvedProblems, int ErrorNotebookProblems,
        int Attempts, int CorrectAttempts, int IncorrectAttempts,
        int FirstTryCorrect, int AwardedPoints, long TimeSpentSeconds);

    public sealed record StudentAnalyticsReport(
        DateTime GeneratedAtUtc, int AttemptedProblems, int SolvedProblems,
        int Attempts, int CorrectAttempts, int IncorrectAttempts,
        int FirstTryCorrect, int AwardedPoints, long TimeSpentSeconds,
        IReadOnlyList<CategoryStatistics> Categories);

    [HttpGet]
    [ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
    public async Task<IActionResult> Get(CancellationToken ct)
    {
        var userId = await PremiumStudentId(ct);
        if (userId.Status is not null) return userId.Status;
        return Ok(await BuildReport(userId.Id!.Value, ct));
    }

    [HttpGet("export.csv")]
    [ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
    public async Task<IActionResult> ExportCsv(CancellationToken ct)
    {
        var userId = await PremiumStudentId(ct);
        if (userId.Status is not null) return userId.Status;

        var report = await BuildReport(userId.Id!.Value, ct);
        var csv = new StringBuilder();
        csv.AppendLine("StageId,CategoryId,StageAr,StageEn,CategoryAr,CategoryEn,AttemptedProblems,SolvedProblems,ErrorNotebookProblems,Attempts,CorrectAttempts,IncorrectAttempts,FirstTryCorrect,Points,TimeSpentSeconds");
        foreach (var row in report.Categories)
        {
            csv.Append(row.StageId).Append(',').Append(row.CategoryId).Append(',')
                .Append(Csv(row.StageNameAr)).Append(',').Append(Csv(row.StageNameEn)).Append(',')
                .Append(Csv(row.CategoryNameAr)).Append(',').Append(Csv(row.CategoryNameEn)).Append(',')
                .Append(row.AttemptedProblems).Append(',').Append(row.SolvedProblems).Append(',')
                .Append(row.ErrorNotebookProblems).Append(',').Append(row.Attempts).Append(',')
                .Append(row.CorrectAttempts).Append(',').Append(row.IncorrectAttempts).Append(',')
                .Append(row.FirstTryCorrect).Append(',').Append(row.AwardedPoints).Append(',')
                .Append(row.TimeSpentSeconds).AppendLine();
        }
        csv.Append("TOTAL,,,,,,")
            .Append(report.AttemptedProblems).Append(',').Append(report.SolvedProblems).Append(',')
            .Append(report.Categories.Sum(x => x.ErrorNotebookProblems)).Append(',')
            .Append(report.Attempts).Append(',').Append(report.CorrectAttempts).Append(',')
            .Append(report.IncorrectAttempts).Append(',').Append(report.FirstTryCorrect).Append(',')
            .Append(report.AwardedPoints).Append(',').Append(report.TimeSpentSeconds).AppendLine();

        var text = csv.ToString();
        // Excel requires a UTF-8 BOM to recognize Arabic labels consistently.
        var bytes = Encoding.UTF8.GetPreamble().Concat(Encoding.UTF8.GetBytes(text)).ToArray();
        Response.Headers.CacheControl = "no-store";
        return File(bytes, "text/csv; charset=utf-8", "mathworld-premium-analytics.csv");
    }

    private async Task<(int? Id, IActionResult? Status)> PremiumStudentId(CancellationToken ct)
    {
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var id) || id <= 0)
            return (null, Unauthorized());
        var user = await _db.Users.AsNoTracking().FirstOrDefaultAsync(
            u => u.Id == id && u.Role == "Student" && u.IsActive, ct);
        if (user is null) return (null, Unauthorized());
        if (!PremiumEntitlement.IsActive(user))
            return (null, StatusCode(StatusCodes.Status403Forbidden,
                new { Message = "PremiumRequired" }));
        return (id, null);
    }

    private async Task<StudentAnalyticsReport> BuildReport(int userId, CancellationToken ct)
    {
        // Group on PostgreSQL to avoid returning a student's entire attempt log.
        var attempts = await _db.ProblemAttempts.AsNoTracking()
            .Where(x => x.UserId == userId)
            .GroupBy(x => new { x.Problem.StageId, x.Problem.CategoryId })
            .Select(g => new
            {
                g.Key.StageId, g.Key.CategoryId,
                Attempts = g.Count(),
                Correct = g.Count(x => x.IsCorrect),
                Incorrect = g.Count(x => !x.IsCorrect),
                FirstCorrect = g.Count(x => x.IsOfficial && x.IsCorrect),
                Points = g.Sum(x => x.PointsEarned),
                Seconds = g.Sum(x => (long)x.TimeSpentSeconds)
            }).ToListAsync(ct);

        var progress = await _db.UserProgresses.AsNoTracking()
            .Where(x => x.UserId == userId && x.Attempts > 0)
            .GroupBy(x => new { x.Problem.StageId, x.Problem.CategoryId })
            .Select(g => new
            {
                g.Key.StageId, g.Key.CategoryId,
                Attempted = g.Count(),
                Solved = g.Count(x => x.IsSolved),
                ErrorNotebook = g.Count(x => x.IsInErrorNotebook && !x.IsErrorNotebookArchived)
            }).ToListAsync(ct);

        var categories = await _db.Categories.AsNoTracking().Select(c => new
        {
            c.Id, c.StageId, c.NameAr, c.NameEn,
            StageAr = c.Stage.NameAr, StageEn = c.Stage.NameEn
        }).ToListAsync(ct);
        var rows = new List<CategoryStatistics>();
        foreach (var category in categories)
        {
            var p = progress.FirstOrDefault(x => x.CategoryId == category.Id &&
                x.StageId == category.StageId);
            var a = attempts.FirstOrDefault(x => x.CategoryId == category.Id &&
                x.StageId == category.StageId);
            if (p is null && a is null) continue;
            rows.Add(new CategoryStatistics(
                category.StageId, category.Id, category.StageAr, category.StageEn,
                category.NameAr, category.NameEn, p?.Attempted ?? 0,
                p?.Solved ?? 0, p?.ErrorNotebook ?? 0, a?.Attempts ?? 0,
                a?.Correct ?? 0, a?.Incorrect ?? 0, a?.FirstCorrect ?? 0,
                a?.Points ?? 0, a?.Seconds ?? 0));
        }

        rows = rows.OrderBy(x => x.StageId).ThenBy(x => x.CategoryId).ToList();
        return new StudentAnalyticsReport(
            DateTime.UtcNow,
            rows.Sum(x => x.AttemptedProblems),
            rows.Sum(x => x.SolvedProblems),
            rows.Sum(x => x.Attempts),
            rows.Sum(x => x.CorrectAttempts),
            rows.Sum(x => x.IncorrectAttempts),
            rows.Sum(x => x.FirstTryCorrect),
            rows.Sum(x => x.AwardedPoints),
            rows.Sum(x => x.TimeSpentSeconds),
            rows);
    }

    private static string Csv(string? input)
    {
        var value = (input ?? "").Trim();
        // Disarm Excel formula injection from admin-entered stage/category names.
        if (value.Length > 0 && "=+-@".Contains(value[0])) value = "'" + value;
        return "\"" + value.Replace("\"", "\"\"").Replace("\r", " ").Replace("\n", " ") + "\"";
    }
}
