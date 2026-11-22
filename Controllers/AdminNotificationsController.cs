using System.Security.Claims;
using System.Net;
using System.Net.Mail;
using MathWorldAPI.Data;
using MathWorldAPI.DTOs;
using MathWorldAPI.Helpers;
using MathWorldAPI.Models;
using MathWorldAPI.Services;
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
    private readonly NotificationStreamBroker _stream;
    private readonly IConfiguration _configuration;
    public AdminNotificationsController(AppDbContext db, NotificationStreamBroker stream,
        IConfiguration configuration)
    {
        _db = db;
        _stream = stream;
        _configuration = configuration;
    }

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
        _stream.Notify(learnerId);

        return Ok(LanguageHelper.SuccessResponse(
            new { notification.Id, notification.UserId, notification.CreatedAtUtc },
            "Success", LanguageHelper.GetLanguageFromRequest(Request)));
    }

    // Retain the original admin announcement contract for existing clients.
    // New clients use the versioned inbox; write both stores atomically until
    // historical notices are migrated, so no existing app loses announcements.
    [HttpPost("announce")]
    public async Task<IActionResult> Announce(
        [FromBody] SendStudentAnnouncementDto request, CancellationToken ct)
    {
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var adminId) ||
            !await _db.Users.AsNoTracking().AnyAsync(
                u => u.Id == adminId && u.Role == "Admin" && u.IsActive, ct))
            return Forbid();

        var path = request.ActionPath?.Trim();
        if (request.StageId is < 1 || !ValidPath(path))
            return BadRequest();
        if (request.StageId.HasValue &&
            !await _db.EducationalStages.AsNoTracking().AnyAsync(
                x => x.Id == request.StageId.Value, ct))
            return BadRequest();

        var recipients = await _db.Users.AsNoTracking()
            .Where(u => u.Role == "Student" && u.IsActive &&
                        (!request.StageId.HasValue ||
                         u.CurrentStageId == request.StageId.Value))
            .Select(u => u.Id).ToArrayAsync(ct);

        var when = DateTime.UtcNow;
        foreach (var id in recipients)
        {
            _db.StudentNotifications.Add(new StudentNotification
            {
                UserId = id,
                TitleAr = request.TitleAr.Trim(),
                TitleEn = request.TitleEn.Trim(),
                BodyAr = request.BodyAr.Trim(),
                BodyEn = request.BodyEn.Trim(),
                ActionPath = path,
                CreatedAt = when,
                Type = "announcement"
            });
            _db.UserNotifications.Add(new UserNotification
            {
                UserId = id,
                TitleAr = request.TitleAr.Trim(),
                TitleEn = request.TitleEn.Trim(),
                BodyAr = request.BodyAr.Trim(),
                BodyEn = request.BodyEn.Trim(),
                TargetPath = path,
                CreatedAtUtc = when,
                Type = "announcement"
            });
        }
        await _db.SaveChangesAsync(ct);
        foreach (var id in recipients) _stream.Notify(id);
        return Ok(LanguageHelper.SuccessResponse(
            new { Sent = recipients.Length },
            "Success", LanguageHelper.GetLanguageFromRequest(Request)));
    }

    [HttpGet("email-status")]
    public async Task<IActionResult> EmailStatus(CancellationToken ct)
    {
        if (!await AuthorizedAdmin(ct)) return Forbid();
        return Ok(new { IsConfigured = ReadMailSettings() is not null });
    }

    /// <summary>
    /// Explicit, single-student email only. No SMTP configuration means
    /// no email attempt, no success claim, no surprise bulk delivery.
    /// In-app notifications remain a separate backward-compatible action.
    /// </summary>
    [HttpPost("email/learners/{learnerId:int}")]
    public async Task<IActionResult> SendEmailToLearner(int learnerId,
        [FromBody] SendLearnerNoticeRequest request, CancellationToken ct)
    {
        if (!await AuthorizedAdmin(ct)) return Forbid();
        if (learnerId <= 0 || request == null ||
            !ValidText(request.TitleAr, 160) || !ValidText(request.TitleEn, 160) ||
            !ValidText(request.BodyAr, 1000) || !ValidText(request.BodyEn, 1000))
            return BadRequest(new { Message = "InvalidNotification" });

        var settings = ReadMailSettings();
        if (settings is null)
            return StatusCode(StatusCodes.Status503ServiceUnavailable,
                new { Message = "EmailNotConfigured" });

        var student = await _db.Users.AsNoTracking()
            .Where(u => u.Id == learnerId && u.Role == "Student" && u.IsActive)
            .Select(u => new { u.Id, u.Email }).FirstOrDefaultAsync(ct);
        if (student is null) return NotFound(new { Message = "LearnerNotFound" });

        MailAddress recipient;
        try { recipient = new MailAddress(student.Email); }
        catch (FormatException) { return BadRequest(new { Message = "LearnerEmailInvalid" }); }
        try
        {
            using var message = new MailMessage
            {
                From = new MailAddress(settings.From, "MathWorld"),
                Subject = SanitizeSubject(request.TitleAr) + " | " +
                          SanitizeSubject(request.TitleEn),
                Body = request.BodyAr.Trim() + Environment.NewLine +
                       Environment.NewLine + "--- MathWorld / English ---" +
                       Environment.NewLine + request.BodyEn.Trim(),
                IsBodyHtml = false
            };
            message.To.Add(recipient);
            using var client = new SmtpClient(settings.Host, settings.Port)
            {
                Credentials = new NetworkCredential(settings.User, settings.Password),
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                Timeout = 15000
            };
            await client.SendMailAsync(message, ct);
            return Ok(new { EmailSent = true, UserId = student.Id });
        }
        catch (Exception ex) when (ex is SmtpException or InvalidOperationException or
                                   System.IO.IOException)
        {
            // Never return SMTP credentials, server details or recipient email.
            return StatusCode(StatusCodes.Status502BadGateway,
                new { Message = "EmailDeliveryFailed" });
        }
    }

    private async Task<bool> AuthorizedAdmin(CancellationToken ct) =>
        int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var adminId) &&
        await _db.Users.AsNoTracking().AnyAsync(
            u => u.Id == adminId && u.Role == "Admin" && u.IsActive, ct);

    private sealed record MailSettings(string Host, int Port, string From,
        string User, string Password);

    private MailSettings? ReadMailSettings()
    {
        var host = _configuration["MathWorldEmail:Host"]?.Trim();
        var from = _configuration["MathWorldEmail:From"]?.Trim();
        var user = _configuration["MathWorldEmail:User"]?.Trim();
        var password = _configuration["MathWorldEmail:Password"];
        if (string.IsNullOrWhiteSpace(host) || string.IsNullOrWhiteSpace(from) ||
            string.IsNullOrWhiteSpace(user) || string.IsNullOrWhiteSpace(password))
            return null;
        if (!int.TryParse(_configuration["MathWorldEmail:Port"] ?? "587", out var port) ||
            port < 1 || port > 65535)
            return null;
        try { _ = new MailAddress(from); }
        catch (FormatException) { return null; }
        return new MailSettings(host, port, from, user, password);
    }

    private static string SanitizeSubject(string value) =>
        value.Trim().Replace('\r', ' ').Replace('\n', ' ');

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
