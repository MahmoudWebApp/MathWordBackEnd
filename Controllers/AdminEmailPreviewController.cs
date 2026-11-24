using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace MathWorldAPI.Controllers;

[ApiController]
[Authorize(Policy = "AdminOnly")]
[Route("api/admin/platform/email-preview")]
[ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
public sealed class AdminEmailPreviewController(PlatformBrandService brand) : ControllerBase
{
    // Fixed non-sensitive preview samples only; no sending and no live reset token.
    [HttpGet]
    public async Task<IActionResult> Preview([FromQuery] string template = "password-changed",
        [FromQuery] string language = "ar", CancellationToken ct = default)
    {
        if (language is not ("ar" or "en")) return BadRequest();
        var ar = language == "ar";
        var settings = await brand.ReadAsync(false, ct);
        var sample = template switch
        {
            "password-changed" => (
                ar ? "تم تغيير كلمة المرور" : "Password changed",
                ar ? "تم تغيير كلمة مرور حسابك. إذا لم تكن أنت، تواصل مع الدعم." :
                    "Your account password was changed. If this was not you, contact support."),
            "password-reset" => (
                ar ? "استعادة كلمة المرور" : "Reset your password",
                ar ? "استخدم الرابط خلال 20 دقيقة. تجاهل الرسالة إذا لم تطلب الاستعادة." :
                    "Use the link within 20 minutes. Ignore this email if you did not request a reset."),
            "welcome" => (
                ar ? "أهلاً بك في MathWorld" : "Welcome to MathWorld",
                ar ? "ابدأ رحلتك التعليمية واختر المرحلة المناسبة." : "Start your learning journey and choose your educational stage."),
            "announcement" => (
                ar ? "إشعار من المنصة" : "Platform announcement",
                ar ? "هذا مثال لمعاينة الإشعارات البريدية." : "This is a preview of a platform announcement."),
            _ => ("", "")
        };
        if (sample.Item1.Length == 0) return BadRequest(new { Message = "UnknownEmailTemplate" });
        return Ok(MathWorldEmailLayout.Render(settings, language, sample.Item1, sample.Item2,
            template == "password-reset" ? (ar ? "تعيين كلمة المرور" : "Reset password") : (ar ? "زيارة المنصة" : "Visit MathWorld"),
            settings.WebsiteUrl + "/" + language + (template == "password-reset" ? "/reset-password" : "")));
    }
}
