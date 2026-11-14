using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.Helpers;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

[ApiController]
[Authorize]
[Route("api/notifications")]
public sealed class NotificationsController : ControllerBase
{
    private readonly AppDbContext _db;
    public NotificationsController(AppDbContext db) => _db = db;

    private async Task<int?> ActiveUserId(CancellationToken ct)
    {
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var userId) || userId <= 0)
            return null;
        return await _db.Users.AsNoTracking().AnyAsync(
            x => x.Id == userId && x.IsActive, ct) ? userId : null;
    }

    // The inbox shows the latest 30 days. A read event never deletes a notice.
    [HttpGet]
    [ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
    public async Task<IActionResult> List([FromQuery] int take = 30, CancellationToken ct = default)
    {
        var userId = await ActiveUserId(ct);
        if (userId is null) return Unauthorized();
        if (take < 1 || take > 50) return BadRequest(new { Message = "InvalidPageSize" });

        var cutoff = DateTime.UtcNow.AddDays(-30);
        var mine = _db.UserNotifications.AsNoTracking()
            .Where(x => x.UserId == userId.Value && x.CreatedAtUtc >= cutoff);
        var items = await mine.OrderByDescending(x => x.CreatedAtUtc)
            .ThenByDescending(x => x.Id).Take(take)
            .Select(x => new {
                x.Id, x.Type, x.TitleAr, x.TitleEn, x.BodyAr, x.BodyEn,
                x.TargetPath, x.CreatedAtUtc, x.ReadAtUtc
            }).ToListAsync(ct);
        var unread = await mine.CountAsync(x => x.ReadAtUtc == null, ct);

        return Ok(LanguageHelper.SuccessResponse(
            new { Items = items, UnreadCount = unread },
            "Success", LanguageHelper.GetLanguageFromRequest(Request)));
    }

    [HttpPut("{id:long}/read")]
    public async Task<IActionResult> MarkRead(long id, CancellationToken ct)
    {
        var userId = await ActiveUserId(ct);
        if (userId is null) return Unauthorized();
        var notice = await _db.UserNotifications.FirstOrDefaultAsync(
            x => x.Id == id && x.UserId == userId.Value, ct);
        if (notice is null) return NotFound(new { Message = "NotificationNotFound" });
        if (notice.ReadAtUtc is null)
        {
            notice.ReadAtUtc = DateTime.UtcNow;
            await _db.SaveChangesAsync(ct);
        }
        return NoContent();
    }

    [HttpPut("read-all")]
    public async Task<IActionResult> MarkAllRead(CancellationToken ct)
    {
        var userId = await ActiveUserId(ct);
        if (userId is null) return Unauthorized();
        var cutoff = DateTime.UtcNow.AddDays(-30);
        await _db.UserNotifications
            .Where(x => x.UserId == userId.Value && x.ReadAtUtc == null && x.CreatedAtUtc >= cutoff)
            .ExecuteUpdateAsync(setters => setters.SetProperty(
                x => x.ReadAtUtc, DateTime.UtcNow), ct);
        return NoContent();
    }
}
