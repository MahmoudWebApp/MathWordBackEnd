using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.Helpers;
using MathWorldAPI.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

/// <summary>Manual in-app messaging to one learner. Bulk messaging is deliberately not enabled.</summary>
[ApiController]
[Route("api/admin/notifications")]
[Authorize(Roles = "Admin")]
public sealed class AdminNotificationsController : ControllerBase
{
    private readonly AppDbContext _db;
    public AdminNotificationsController(AppDbContext db) => _db = db;

    public sealed class SendLearnerNoticeRequest
    {
        public string TitleAr { get; set; } = "";
        public string TitleEn { get; set; } = "";
        public string BodyAr { get; set; } = "";
        public string BodyEn { get; set; } = "";
        public string? TargetPath { get; set; }
    }

    [HttpPost("learners/{learnerId:int}")]
    public async Task<IActionResult> SendToLearner(int learnerId,
        [FromBody] SendLearnerNoticeRequest request, CancellationToken ct)
    {
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var adminId) ||
            !await _db.Users.AsNoTracking().AnyAsync(
                u => u.Id == adminId && u.Role == "Admin" && u.IsActive, ct))
            return Forbid();

        if (learnerId <= 0 || request == null ||
            !ValidText(request.TitleAr, 160) || !ValidText(request.TitleEn, 160) ||
            !ValidText(request.BodyAr, 1000) || !ValidText(request.BodyEn, 1000) ||
            !ValidPath(request.TargetPath))
            return BadRequest(new { Message = "InvalidNotification" });

        if (!await _db.Users.AsNoTracking().AnyAsync(
            u => u.Id == learnerId && u.Role == "Student" && u.IsActive, ct))
            return NotFound(new { Message = "LearnerNotFound" });

        var notification = new UserNotification
        {
            UserId = learnerId,
            Type = "admin",
            TitleAr = request.TitleAr.Trim(),
            TitleEn = request.TitleEn.Trim(),
            BodyAr = request.BodyAr.Trim(),
            BodyEn = request.BodyEn.Trim(),
            TargetPath = string.IsNullOrWhiteSpace(request.TargetPath)
                ? null : request.TargetPath.Trim(),
            CreatedAtUtc = DateTime.UtcNow
        };
        _db.UserNotifications.Add(notification);
        await _db.SaveChangesAsync(ct);

        return Ok(LanguageHelper.SuccessResponse(
            new { notification.Id, notification.UserId, notification.CreatedAtUtc },
            "Success", LanguageHelper.GetLanguageFromRequest(Request)));
    }

    private static bool ValidText(string? value, int max) =>
        !string.IsNullOrWhiteSpace(value) && value.Trim().Length <= max;

    private static bool ValidPath(string? value)
    {
        if (string.IsNullOrWhiteSpace(value)) return true;
        var path = value.Trim();
        return path.Length <= 300 && path.StartsWith("/", StringComparison.Ordinal) &&
            !path.StartsWith("//", StringComparison.Ordinal) &&
            !path.Contains('\u005c') &&
            !path.Contains("://", StringComparison.Ordinal) &&
            !path.Any(char.IsControl);
    }
}
