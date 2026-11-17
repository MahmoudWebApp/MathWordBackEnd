using MathWorldAPI.Data;
using MathWorldAPI.DTOs;
using MathWorldAPI.Helpers;
using MathWorldAPI.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers
{
    /// <summary>Only administrators can send in-app learner announcements.</summary>
    [ApiController]
    [Authorize(Roles = "Admin")]
    [Route("api/admin/notifications")]
    public sealed class AdminNotificationsController : ControllerBase
    {
        private readonly AppDbContext _db;
        private readonly ILogger<AdminNotificationsController> _logger;

        public AdminNotificationsController(
            AppDbContext db, ILogger<AdminNotificationsController> logger)
        {
            _db = db;
            _logger = logger;
        }

        [HttpPost("announce")]
        public async Task<IActionResult> Announce(
            [FromBody] SendStudentAnnouncementDto request,
            CancellationToken cancellationToken)
        {
            // Only internal routes are safe to embed in client notifications.
            var path = request.ActionPath?.Trim();
            if (path != null &&
                (!path.StartsWith("/", StringComparison.Ordinal)
                    || path.StartsWith("//", StringComparison.Ordinal)
                    || path.Contains('\\') || path.Contains('\n')
                    || path.Contains('\r')))
                return BadRequest();

            if (request.StageId is < 1)
                return BadRequest();
            if (request.StageId.HasValue &&
                !await _db.EducationalStages.AsNoTracking().AnyAsync(
                    stage => stage.Id == request.StageId.Value,
                    cancellationToken))
                return BadRequest();

            var recipients = await _db.Users.AsNoTracking()
                .Where(user => user.Role == "Student" && user.IsActive
                    && (!request.StageId.HasValue
                        || user.CurrentStageId == request.StageId.Value))
                .Select(user => user.Id)
                .ToArrayAsync(cancellationToken);
            if (recipients.Length == 0)
                return Ok(LanguageHelper.SuccessResponse(new { Sent = 0 },
                    "Success", LanguageHelper.GetLanguageFromRequest(Request)));

            var timestamp = DateTime.UtcNow;
            var messages = recipients.Select(id => new StudentNotification
            {
                UserId = id,
                TitleAr = request.TitleAr.Trim(),
                TitleEn = request.TitleEn.Trim(),
                BodyAr = request.BodyAr.Trim(),
                BodyEn = request.BodyEn.Trim(),
                ActionPath = path,
                CreatedAt = timestamp,
                Type = "announcement"
            }).ToArray();
            _db.StudentNotifications.AddRange(messages);
            await _db.SaveChangesAsync(cancellationToken);

            _logger.LogInformation(
                "Admin announcement sent to {RecipientCount} students in stage {StageId}",
                recipients.Length, request.StageId);

            return Ok(LanguageHelper.SuccessResponse(
                new { Sent = recipients.Length },
                "Success", LanguageHelper.GetLanguageFromRequest(Request)));
        }
    }
}