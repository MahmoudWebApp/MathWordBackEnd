using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.DTOs;
using MathWorldAPI.Helpers;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers
{
    [ApiController]
    [Authorize(Roles = "Student")]
    // Original public contract for existing student clients.
    [Route("api/notifications")]
    public sealed class StudentNotificationsController : ControllerBase
    {
        private readonly AppDbContext _db;
        public StudentNotificationsController(AppDbContext db) => _db = db;

        private int? CurrentStudentId() =>
            int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier),
                out var id) ? id : null;

        [HttpGet]
        public async Task<IActionResult> List(
            [FromQuery] int page = 1,
            [FromQuery] int pageSize = 20,
            CancellationToken cancellationToken = default)
        {
            var userId = CurrentStudentId();
            if (userId == null) return Unauthorized();
            if (page < 1 || pageSize < 1 || pageSize > 50)
                return BadRequest();

            var query = _db.StudentNotifications.AsNoTracking()
                .Where(notification => notification.UserId == userId.Value);
            var total = await query.CountAsync(cancellationToken);
            var unread = await query.CountAsync(notification =>
                notification.ReadAt == null, cancellationToken);
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            var entries = await query
                .OrderByDescending(notification => notification.CreatedAt)
                .ThenByDescending(notification => notification.Id)
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .Select(notification => new StudentNotificationDto
                {
                    Id = notification.Id,
                    Type = notification.Type,
                    Title = language == "en" ? notification.TitleEn
                        : notification.TitleAr,
                    Body = language == "en" ? notification.BodyEn
                        : notification.BodyAr,
                    ActionPath = notification.ActionPath,
                    CreatedAt = notification.CreatedAt,
                    IsRead = notification.ReadAt != null
                }).ToArrayAsync(cancellationToken);

            return Ok(LanguageHelper.SuccessResponse(
                new StudentNotificationPageDto
                {
                    Notifications = entries,
                    Page = page,
                    PageSize = pageSize,
                    Total = total,
                    UnreadCount = unread,
                    HasMore = (long)page * pageSize < total
                }, "Success", language));
        }

        [HttpGet("unread-count")]
        public async Task<IActionResult> UnreadCount(
            CancellationToken cancellationToken)
        {
            var userId = CurrentStudentId();
            if (userId == null) return Unauthorized();
            var unread = await _db.StudentNotifications.AsNoTracking()
                .CountAsync(notification => notification.UserId == userId.Value
                    && notification.ReadAt == null, cancellationToken);
            return Ok(LanguageHelper.SuccessResponse(new { UnreadCount = unread },
                "Success", LanguageHelper.GetLanguageFromRequest(Request)));
        }

        [HttpPut("{notificationId:long}/read")]
        public async Task<IActionResult> MarkRead(
            long notificationId, CancellationToken cancellationToken)
        {
            var userId = CurrentStudentId();
            if (userId == null) return Unauthorized();
            if (notificationId < 1) return NotFound();
            var updated = await _db.StudentNotifications
                .Where(notification => notification.Id == notificationId
                    && notification.UserId == userId.Value)
                .ExecuteUpdateAsync(setter => setter
                    .SetProperty(notification => notification.ReadAt,
                        notification => notification.ReadAt ?? DateTime.UtcNow),
                    cancellationToken);
            if (updated == 0) return NotFound();
            return Ok(LanguageHelper.SuccessResponse(new { IsRead = true },
                "Success", LanguageHelper.GetLanguageFromRequest(Request)));
        }

        [HttpPut("read-all")]
        public async Task<IActionResult> MarkAllRead(
            CancellationToken cancellationToken)
        {
            var userId = CurrentStudentId();
            if (userId == null) return Unauthorized();
            var changed = await _db.StudentNotifications
                .Where(notification => notification.UserId == userId.Value
                    && notification.ReadAt == null)
                .ExecuteUpdateAsync(setter => setter
                    .SetProperty(notification => notification.ReadAt,
                        DateTime.UtcNow), cancellationToken);
            return Ok(LanguageHelper.SuccessResponse(new { Updated = changed },
                "Success", LanguageHelper.GetLanguageFromRequest(Request)));
        }
    }
}