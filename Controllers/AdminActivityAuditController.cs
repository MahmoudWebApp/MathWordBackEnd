using System.Security.Claims;
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
            (role is not null && role != "Admin" && role != "Student") ||
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
