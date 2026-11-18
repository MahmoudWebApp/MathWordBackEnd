using System.Security.Claims;
using System.Threading.Channels;
using MathWorldAPI.Services;
using MathWorldAPI.Data;
using MathWorldAPI.Helpers;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.RateLimiting;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

[ApiController]
[Authorize]
[Route("api/notifications/v2")]
public sealed class NotificationsController : ControllerBase
{
    private readonly AppDbContext _db;
    private readonly NotificationStreamBroker _stream;
    public NotificationsController(AppDbContext db, NotificationStreamBroker stream)
    {
        _db = db;
        _stream = stream;
    }

    private async Task<int?> ActiveUserId(CancellationToken ct)
    {
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var userId) || userId <= 0)
            return null;
        return await _db.Users.AsNoTracking().AnyAsync(
            x => x.Id == userId && x.IsActive, ct) ? userId : null;
    }

    /// <summary>
    /// Authenticated server-sent invalidation events for foreground clients.
    /// Send only a refresh hint; the private inbox is fetched separately.
    /// Reconnect at least every five minutes to re-check JWT and account.
    /// One process only; periodic inbox polling is required for failover.
    /// </summary>
    [HttpGet("stream")]
    [EnableRateLimiting("notification-stream")]
    [ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
    public async Task Stream(CancellationToken ct)
    {
        var userId = await ActiveUserId(ct);
        if (userId is null)
        {
            Response.StatusCode = StatusCodes.Status401Unauthorized;
            return;
        }

        Response.ContentType = "text/event-stream; charset=utf-8";
        Response.Headers.CacheControl = "no-store, no-transform";
        Response.Headers["X-Accel-Buffering"] = "no";
        using var subscription = _stream.TrySubscribe(userId.Value);
        if (subscription is null)
        {
            Response.StatusCode = StatusCodes.Status429TooManyRequests;
            return;
        }
        try
        {
            await Response.StartAsync(ct);
            await Response.WriteAsync(": connected\n\n", ct);
            await Response.Body.FlushAsync(ct);

            // A long-lived connection must never outlive its JWT. An
            // expired access token is revalidated during the next reconnect.
            var end = DateTime.UtcNow.AddMinutes(5);
            if (long.TryParse(User.FindFirst("exp")?.Value, out var unixExpiry))
            {
                try
                {
                    var jwtEnd = DateTimeOffset.FromUnixTimeSeconds(unixExpiry).UtcDateTime;
                    if (jwtEnd < end) end = jwtEnd;
                }
                catch (ArgumentOutOfRangeException)
                {
                    end = DateTime.UtcNow;
                }
            }
            while (!ct.IsCancellationRequested && DateTime.UtcNow < end)
            {
                using var waiting = CancellationTokenSource.CreateLinkedTokenSource(ct);
                var remaining = end - DateTime.UtcNow;
                if (remaining <= TimeSpan.Zero) break;
                waiting.CancelAfter(remaining < TimeSpan.FromSeconds(20)
                    ? remaining : TimeSpan.FromSeconds(20));
                try
                {
                    await subscription.Reader.ReadAsync(waiting.Token);
                    // Account suspension takes effect even for an open stream.
                    if (await ActiveUserId(ct) != userId) break;
                    await Response.WriteAsync("event: inbox\ndata: {}\n\n", ct);
                }
                catch (OperationCanceledException) when (!ct.IsCancellationRequested)
                {
                    if (await ActiveUserId(ct) != userId) break;
                    await Response.WriteAsync(": keep-alive\n\n", ct);
                }
                await Response.Body.FlushAsync(ct);
            }
        }
        catch (OperationCanceledException) when (ct.IsCancellationRequested)
        {
            // Closing a page or app cancels the stream.
        }
        catch (IOException) when (ct.IsCancellationRequested)
        {
            // Client disconnected.
        }
        catch (ChannelClosedException)
        {
            // A disposed subscriber ends its stream.
        }
    }

    // Lightweight count for clients that only render the student bell.
    [HttpGet("unread-count")]
    [ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
    public async Task<IActionResult> UnreadCount(CancellationToken ct)
    {
        var userId = await ActiveUserId(ct);
        if (userId is null) return Unauthorized();
        var cutoff = DateTime.UtcNow.AddDays(-30);
        var count = await _db.UserNotifications.AsNoTracking()
            .CountAsync(x => x.UserId == userId.Value &&
                             x.ReadAtUtc == null && x.CreatedAtUtc >= cutoff, ct);
        return Ok(LanguageHelper.SuccessResponse(
            new { UnreadCount = count }, "Success",
            LanguageHelper.GetLanguageFromRequest(Request)));
    }

    // The inbox shows the latest 30 days. A read event never deletes a notice.
    [HttpGet]
    [ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
    public async Task<IActionResult> List([FromQuery] int take = 30,
        [FromQuery] int skip = 0, CancellationToken ct = default)
    {
        var userId = await ActiveUserId(ct);
        if (userId is null) return Unauthorized();
        if (take < 1 || take > 50) return BadRequest(new { Message = "InvalidPageSize" });
        if (skip < 0 || skip > 10000) return BadRequest(new { Message = "InvalidPageOffset" });

        var cutoff = DateTime.UtcNow.AddDays(-30);
        var mine = _db.UserNotifications.AsNoTracking()
            .Where(x => x.UserId == userId.Value && x.CreatedAtUtc >= cutoff);
        var totalCount = await mine.CountAsync(ct);
        var items = await mine.OrderByDescending(x => x.CreatedAtUtc)
            .ThenByDescending(x => x.Id).Skip(skip).Take(take)
            .Select(x => new {
                x.Id, x.Type, x.TitleAr, x.TitleEn, x.BodyAr, x.BodyEn,
                x.TargetPath, x.CreatedAtUtc, x.ReadAtUtc
            }).ToListAsync(ct);
        var unread = await mine.CountAsync(x => x.ReadAtUtc == null, ct);

        return Ok(LanguageHelper.SuccessResponse(
            new { Items = items, UnreadCount = unread,
                TotalCount = totalCount, HasMore = skip + items.Count < totalCount,
                Skip = skip, Take = take },
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
            _stream.Notify(userId.Value);
        }
        return NoContent();
    }

    [HttpPut("read-all")]
    public async Task<IActionResult> MarkAllRead(CancellationToken ct)
    {
        var userId = await ActiveUserId(ct);
        if (userId is null) return Unauthorized();
        var cutoff = DateTime.UtcNow.AddDays(-30);
        var changed = await _db.UserNotifications
            .Where(x => x.UserId == userId.Value && x.ReadAtUtc == null && x.CreatedAtUtc >= cutoff)
            .ExecuteUpdateAsync(setters => setters.SetProperty(
                x => x.ReadAtUtc, DateTime.UtcNow), ct);
        if (changed > 0) _stream.Notify(userId.Value);
        return NoContent();
    }
}
