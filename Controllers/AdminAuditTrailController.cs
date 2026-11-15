using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.Helpers;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

/// <summary>
/// Admin-only, read-only operational audit. Historical metadata is generated
/// from successful mutations and explicit sign-in/out events: there are no
/// fake offline/logout timestamps or raw submitted answer contents.
/// </summary>
[ApiController]
[Authorize(Roles = "Admin")]
[Route("api/admin/activity-audit")]
[ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
public sealed class AdminAuditTrailController : ControllerBase
{
    private readonly AppDbContext _db;
    public AdminAuditTrailController(AppDbContext db) => _db = db;

    private async Task<bool> IsActiveAdmin(CancellationToken ct)
    {
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var userId))
            return false;
        return await _db.Users.AsNoTracking().AnyAsync(u =>
            u.Id == userId && u.Role == "Admin" && u.IsActive, ct);
    }

    [HttpGet]
    public async Task<IActionResult> List(
        [FromQuery] int page = 1,
        [FromQuery] int pageSize = 30,
        [FromQuery] int? actorId = null,
        [FromQuery] string? role = null,
        [FromQuery] string? action = null,
        [FromQuery] int days = 30,
        CancellationToken ct = default)
    {
        if (!await IsActiveAdmin(ct)) return Forbid();
        if (page is < 1 or > 100000 || pageSize is < 1 or > 100 ||
            actorId is <= 0 || days is < 1 or > 365 ||
            (role is not null && role is not ("Admin" or "Student")) ||
            (action?.Length ?? 0) > 64)
            return BadRequest(new { Message = "InvalidAuditFilter" });

        var start = DateTime.UtcNow.AddDays(-days);
        var query = _db.PlatformActivityEvents.AsNoTracking()
            .Where(e => e.CreatedAtUtc >= start);
        if (actorId.HasValue) query = query.Where(e => e.ActorUserId == actorId.Value);
        if (role is not null) query = query.Where(e => e.ActorRole == role);
        if (!string.IsNullOrWhiteSpace(action))
            query = query.Where(e => e.Action == action);

        var count = await query.CountAsync(ct);
        var entries = await query.OrderByDescending(e => e.CreatedAtUtc)
            .ThenByDescending(e => e.Id)
            .Skip((page - 1) * pageSize).Take(pageSize)
            .Select(e => new
            {
                e.Id, e.ActorUserId, e.ActorRole,
                ActorName = _db.Users.Where(u => u.Id == e.ActorUserId)
                    .Select(u => u.FullName).FirstOrDefault(),
                e.Action, e.Resource, e.ResourceId, e.Origin, e.CreatedAtUtc
            }).ToListAsync(ct);
        return Ok(LanguageHelper.SuccessResponse(new
        {
            Entries = entries, Total = count, Page = page, PageSize = pageSize,
            HasMore = (long)page * pageSize < count,
            WindowDays = days,
            Note = "Successful server-observed commands only; historical events before instrumentation cannot be reconstructed. Closing a browser is not a verified logout."
        }, "Success", LanguageHelper.GetLanguageFromRequest(Request)));
    }

    [HttpGet("summary")]
    public async Task<IActionResult> Summary([FromQuery] int days = 30,
        CancellationToken ct = default)
    {
        if (!await IsActiveAdmin(ct)) return Forbid();
        if (days is < 1 or > 365)
            return BadRequest(new { Message = "InvalidAuditWindow" });
        var from = DateTime.UtcNow.AddDays(-days);
        var events = _db.PlatformActivityEvents.AsNoTracking()
            .Where(e => e.CreatedAtUtc >= from);
        var actionTotals = await events.GroupBy(e => new { e.ActorRole, e.Action })
            .Select(g => new { g.Key.ActorRole, g.Key.Action, Count = g.Count() })
            .OrderByDescending(g => g.Count).Take(20).ToListAsync(ct);
        return Ok(LanguageHelper.SuccessResponse(new
        {
            WindowDays = days,
            RecordedEvents = await events.CountAsync(ct),
            UniqueStudents = await events.Where(e => e.ActorRole == "Student")
                .Select(e => e.ActorUserId).Distinct().CountAsync(ct),
            UniqueAdmins = await events.Where(e => e.ActorRole == "Admin")
                .Select(e => e.ActorUserId).Distinct().CountAsync(ct),
            ByAction = actionTotals
        }, "Success", LanguageHelper.GetLanguageFromRequest(Request)));
    }
}
