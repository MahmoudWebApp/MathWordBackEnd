using System.ComponentModel.DataAnnotations;
using System.Security.Claims;
using MathWorldAPI.Helpers;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.RateLimiting;

namespace MathWorldAPI.Controllers;

[ApiController]
[Route("api/auth")]
[Authorize]
[ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
public sealed class AccountPasswordController(AccountPasswordService passwords) : ControllerBase
{
    public sealed class ChangePasswordRequest
    {
        [Required, StringLength(128)] public string CurrentPassword { get; set; } = "";
        [Required, StringLength(128)] public string NewPassword { get; set; } = "";
        [Required, StringLength(128)] public string ConfirmPassword { get; set; } = "";
    }

    [HttpPost("change-password")]
    [EnableRateLimiting("account-password")]
    public async Task<IActionResult> Change([FromBody] ChangePasswordRequest request, CancellationToken ct)
    {
        var role = User.FindFirstValue(ClaimTypes.Role);
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var userId) ||
            userId <= 0 || !AccountRolePolicy.IsSupportedSessionRole(role) ||
            !SessionVersionPolicy.TryReadVersion(
                User.FindAll(SessionVersionPolicy.ClaimName).Select(x => x.Value), out var version))
            return Unauthorized();
        var language = LanguageHelper.GetLanguageFromRequest(Request);
        var result = await passwords.ChangeAsync(userId, role!, version,
            request.CurrentPassword, request.NewPassword, request.ConfirmPassword, language, ct);
        if (result == AccountPasswordService.ChangeResult.Changed)
            return Ok(LanguageHelper.SuccessResponse(
                new { RequiresSignIn = true }, "PasswordChanged", language));
        var code = result == AccountPasswordService.ChangeResult.SessionChanged ? 409 : 400;
        return StatusCode(code, LanguageHelper.ErrorResponse<object>(result.ToString(), language, code));
    }
}
