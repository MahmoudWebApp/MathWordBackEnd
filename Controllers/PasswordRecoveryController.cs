using System.ComponentModel.DataAnnotations;
using MathWorldAPI.Helpers;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.RateLimiting;

namespace MathWorldAPI.Controllers;

[ApiController]
[Route("api/auth")]
[AllowAnonymous]
[EnableRateLimiting("password-recovery")]
[ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
public sealed class PasswordRecoveryController(PasswordRecoveryService recovery, AuthCaptchaService captcha) : ControllerBase
{
    public sealed record ForgotRequest([Required, StringLength(254)] string Email);
    public sealed record ResetRequest([Required, StringLength(64)] string Token,
        [Required, StringLength(128)] string NewPassword, [Required, StringLength(128)] string ConfirmPassword);

    [HttpPost("forgot-password")]
    public async Task<IActionResult> Forgot(ForgotRequest request, CancellationToken ct)
    {
        var language = LanguageHelper.GetLanguageFromRequest(Request);
        if (!await captcha.VerifyAsync("forgot-password", Request.Headers[AuthCaptchaService.Header].ToString(), ct))
            return BadRequest(LanguageHelper.ErrorResponse<object>("CaptchaVerificationFailed", language, 400, new Dictionary<string,List<string>> { ["Captcha"] = ["CaptchaVerificationFailed"] }));
        var start = System.Diagnostics.Stopwatch.StartNew();
        await recovery.RequestAsync(request.Email, language, ct);
        // Avoid an obvious synchronous delivery or lookup timing signal.
        var remaining = TimeSpan.FromMilliseconds(250) - start.Elapsed;
        if (remaining > TimeSpan.Zero) await Task.Delay(remaining, ct);
        return Accepted(LanguageHelper.SuccessResponse(new { Accepted = true }, "PasswordRecoveryRequested", language, 202));
    }

    [HttpPost("reset-password")]
    [EnableRateLimiting("password-reset")]
    public async Task<IActionResult> Reset(ResetRequest request, CancellationToken ct)
    {
        var language = LanguageHelper.GetLanguageFromRequest(Request);
        if (!await captcha.VerifyAsync("reset-password", Request.Headers[AuthCaptchaService.Header].ToString(), ct))
            return BadRequest(LanguageHelper.ErrorResponse<object>("CaptchaVerificationFailed", language, 400, new Dictionary<string,List<string>> { ["Captcha"] = ["CaptchaVerificationFailed"] }));
        if (!AccountPasswordService.IsValidNewPassword(request.NewPassword) ||
            !string.Equals(request.NewPassword, request.ConfirmPassword, StringComparison.Ordinal))
            return BadRequest(LanguageHelper.ErrorResponse<object>("InvalidNewPassword", language));
        if (!await recovery.ResetAsync(request.Token, request.NewPassword, language, ct))
            return BadRequest(LanguageHelper.ErrorResponse<object>("InvalidResetToken", language));
        return Ok(LanguageHelper.SuccessResponse(new { RequiresSignIn = true }, "PasswordResetSuccess", language));
    }
}
