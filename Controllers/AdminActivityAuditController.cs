using System.Security.Claims;
using System.Text;
using System.Globalization;
using MathWorldAPI.Data;
using MathWorldAPI.Helpers;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

/// <summary>
/// Searchable audit trail of successful operations. Event history begins only
/// after the schema and instrumentation are explicitly deployed; it cannot
/// reconstruct historical logouts or past unrecorded actions.
/// </summary>
[ApiController]
[Authorize(Roles = "Admin")]
[Route("api/admin/activity-audit")]
[ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
public sealed class AdminActivityAuditController : ControllerBase
{
    private readonly AppDbContext _db;
    public AdminActivityAuditController(AppDbContext db) => _db = db;

    /// <summary>
    /// Download a bounded, read-only audit snapshot. CSV contains action and
    /// timestamps, never request bodies, JWTs, provider credentials or IPs.
    /// Up to 10000 rows are emitted; if exceeded, the CSV includes a clear
    /// truncation marker rather than pretending it is a full audit export.
    /// </summary>
    [HttpGet("export.csv")]
    public async Task<IActionResult> ExportCsv(
        [FromQuery] int days = 30,
        [FromQuery] string? role = null,
        [FromQuery] int? actorId = null,
        [FromQuery] string? action = null,
        CancellationToken ct = default)
    {
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var callerId) ||
            !await _db.Users.AsNoTracking().AnyAsync(
                x => x.Id == callerId && x.IsActive && x.Role == "Admin", ct))
            return Forbid();

        if (days is not (7 or 30 or 90 or 180) ||
            (role is not null && role is not ("Admin" or "Student" or "Supervisor")) ||
            actorId is <= 0 ||
            (action is not null && (action.Length is < 1 or > 64 ||
                action.Any(c => !char.IsAsciiLetterOrDigit(c)))))
            return BadRequest(new { Message = "InvalidAuditFilter" });

        const int exportLimit = 10000;
        var cutoff = DateTime.UtcNow.AddDays(-days);
        var query = _db.PlatformActivityEvents.AsNoTracking()
            .Where(e => e.CreatedAtUtc >= cutoff);
        if (role is not null) query = query.Where(e => e.ActorRole == role);
        if (action is not null) query = query.Where(e => e.Action == action);
        if (actorId is int id) query = query.Where(e => e.ActorUserId == id);

        var records = await (from e in query
                join user in _db.Users.AsNoTracking()
                    on e.ActorUserId equals user.Id into users
                from user in users.DefaultIfEmpty()
                orderby e.CreatedAtUtc descending, e.Id descending
                select new
                {
                    e.Id, e.ActorUserId,
                    ActorName = user == null ? "" : user.FullName,
                    e.ActorRole, e.Action, e.Resource, e.ResourceId,
                    e.Origin, e.CreatedAtUtc
                })
            .Take(exportLimit + 1)
            .ToListAsync(ct);

        var truncated = records.Count > exportLimit;
        var csv = new StringBuilder();
        csv.AppendLine("EventId,ActorUserId,ActorName,ActorRole,Action,Resource,ResourceId,Origin,CreatedAtUtc");
        foreach (var e in records.Take(exportLimit))
        {
            csv.Append(e.Id).Append(',').Append(e.ActorUserId).Append(',')
                .Append(CsvCell(e.ActorName)).Append(',')
                .Append(CsvCell(e.ActorRole)).Append(',')
                .Append(CsvCell(e.Action)).Append(',')
                .Append(CsvCell(e.Resource)).Append(',')
                .Append(CsvCell(e.ResourceId)).Append(',')
                .Append(CsvCell(e.Origin)).Append(',')
                .Append(CsvCell(e.CreatedAtUtc.ToString("O", CultureInfo.InvariantCulture)))
                .AppendLine();
        }

        if (truncated)
        {
            csv.Append("TRUNCATED,,,,,,")
                .Append(CsvCell("Export capped at 10000 events; narrow the days, user or action filters."))
                .Append(",,").AppendLine();
        }
        var bytes = Encoding.UTF8.GetPreamble()
            .Concat(Encoding.UTF8.GetBytes(csv.ToString())).ToArray();
        Response.Headers.CacheControl = "no-store";
        Response.Headers["X-Content-Type-Options"] = "nosniff";
        Response.Headers["X-Audit-Export-Truncated"] = truncated ? "true" : "false";
        return File(bytes, "text/csv; charset=utf-8", "mathworld-activity-audit.csv");
    }

    /// <summary>Neutralize spreadsheet formula injection from user names.</summary>
    internal static string CsvCell(string? value)
    {
        var clean = (value ?? "").Replace('\r', ' ').Replace('\n', ' ');
        if (clean.TrimStart().Length > 0 &&
            "=+-@".Contains(clean.TrimStart()[0]))
            clean = "'" + clean;
        return "\"" + clean.Replace("\"", "\"\"") + "\"";
    }

    [HttpGet("summary")]
    public async Task<IActionResult> Summary([FromQuery] int days = 30,
        CancellationToken ct = default)
    {
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var callerId) ||
            !await _db.Users.AsNoTracking().AnyAsync(
                x => x.Id == callerId && x.IsActive && x.Role == "Admin", ct))
            return Forbid();
        if (days is not (7 or 30 or 90 or 180))
            return BadRequest(new { Message = "InvalidAuditWindow" });
        var cutoff = DateTime.UtcNow.AddDays(-days);
        var events = _db.PlatformActivityEvents.AsNoTracking()
            .Where(e => e.CreatedAtUtc >= cutoff);
        var byAction = await events.GroupBy(e => new { e.ActorRole, e.Action })
            .Select(g => new { g.Key.ActorRole, g.Key.Action, Count = g.Count() })
            .OrderByDescending(x => x.Count).Take(30).ToListAsync(ct);
        return Ok(LanguageHelper.SuccessResponse(new
        {
            WindowDays = days, RecordedEvents = await events.CountAsync(ct),
            UniqueStudents = await events.Where(x => x.ActorRole == "Student")
                .Select(x => x.ActorUserId).Distinct().CountAsync(ct),
            UniqueAdmins = await events.Where(x => x.ActorRole == "Admin")
                .Select(x => x.ActorUserId).Distinct().CountAsync(ct),
            UniqueSupervisors = await events.Where(x => x.ActorRole == "Supervisor")
                .Select(x => x.ActorUserId).Distinct().CountAsync(ct),
            ByAction = byAction
        }, "Success", LanguageHelper.GetLanguageFromRequest(Request)));
    }

    [HttpGet]
    public async Task<IActionResult> List([FromQuery] int page = 1,
        [FromQuery] int days = 30, [FromQuery] string? role = null,
        [FromQuery] int? userId = null, [FromQuery] int? actorId = null,
        [FromQuery] string? action = null, CancellationToken ct = default)
    {
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var callerId) ||
            !await _db.Users.AsNoTracking().AnyAsync(
                x => x.Id == callerId && x.IsActive && x.Role == "Admin", ct))
            return Forbid();
        if (page is < 1 or > 50000 || days is not (7 or 30 or 90 or 180) ||
            (role is not null && role != "Admin" && role != "Student" && role != "Supervisor") ||
            userId is <= 0 || actorId is <= 0 ||
            (action is not null && (action.Length is < 1 or > 64 ||
                action.Any(c => !char.IsAsciiLetterOrDigit(c)))))
            return BadRequest(new { Message = "InvalidAuditFilter" });
        const int pageSize = 30;
        var cutoff = DateTime.UtcNow.AddDays(-days);
        var query = _db.PlatformActivityEvents.AsNoTracking()
            .Where(x => x.CreatedAtUtc >= cutoff);
        if (role is not null) query = query.Where(x => x.ActorRole == role);
        if (action is not null) query = query.Where(x => x.Action == action);
        if (userId.HasValue && actorId.HasValue && userId != actorId)
            return BadRequest(new { Message = "InconsistentActorFilter" });
        var filteredId = userId ?? actorId;
        if (filteredId is int id) query = query.Where(x => x.ActorUserId == id);
        var total = await query.CountAsync(ct);
        var entries = await (from e in query
                join u in _db.Users.AsNoTracking() on e.ActorUserId equals u.Id
                orderby e.CreatedAtUtc descending, e.Id descending
                select new
                {
                    e.Id, e.ActorUserId, ActorName = u.FullName,
                    e.ActorRole, e.Action, e.Resource, e.ResourceId,
                    e.Origin, e.CreatedAtUtc
                })
            .Skip((page - 1) * pageSize).Take(pageSize)
            .ToListAsync(ct);
        return Ok(LanguageHelper.SuccessResponse(new
        {
            Page = page, PageSize = pageSize, Total = total,
            Entries = entries,
            HasMore = page * pageSize < total,
            WindowDays = days,
            Note = "Audit starts at deployment. Explicit sign-out is recorded only when the authenticated client request succeeds; closing a browser or force-quitting an app does not confirm logout."
        }, "Success", LanguageHelper.GetLanguageFromRequest(Request)));
    }
}
