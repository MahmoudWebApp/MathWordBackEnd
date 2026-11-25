using System.ComponentModel.DataAnnotations;
using System.Security.Claims;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.RateLimiting;

namespace MathWorldAPI.Controllers;

[ApiController]
[Route("api/auth/email-verification")]
[EnableRateLimiting("email-verification")]
[ResponseCache(NoStore=true,Location=ResponseCacheLocation.None)]
public sealed class EmailVerificationController(EmailVerificationService verification):ControllerBase
{
    public sealed record RequestInput(string Language="ar");
    public sealed record ConfirmInput([Required,StringLength(64)] string Token);
    public sealed record ConfirmCodeInput([Required, RegularExpression("^[0-9]{6}$")] string Code);

    [Authorize(Roles = "Student")]
    [HttpPost("confirm-code")]
    public async Task<IActionResult> ConfirmCode(ConfirmCodeInput input, CancellationToken ct)
    {
        if (!TryGetStudentSession(out var id, out var version)) return Unauthorized();
        return await verification.ConfirmCodeAsync(id, version, input.Code, ct)
            ? Ok(new { EmailVerified = true })
            : BadRequest(new { Message = "InvalidEmailVerificationCode" });
    }

    private bool TryGetStudentSession(out int id, out int version)
    {
        version = 0;
        return int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out id) && id > 0 &&
            SessionVersionPolicy.TryReadVersion(User.FindAll(SessionVersionPolicy.ClaimName).Select(x => x.Value), out version);
    }

    [Authorize(Roles="Student")]
    [HttpPost("request")]
    public async Task<IActionResult> RequestLink(RequestInput input,CancellationToken ct)
    {
        if(input.Language is not ("ar" or "en"))return BadRequest(new{Message="InvalidEmailLanguage"});
        if (!TryGetStudentSession(out var id, out var version))
            return Unauthorized();
        return (await verification.RequestAsync(id,version,input.Language,ct)) switch {
            EmailVerificationService.RequestResult.Queued=>Accepted(new{Queued=true}),
            EmailVerificationService.RequestResult.AlreadyVerified=>Ok(new{AlreadyVerified=true}),
            EmailVerificationService.RequestResult.Cooldown=>StatusCode(429,new{Message="EmailVerificationLimit"}),
            EmailVerificationService.RequestResult.SessionChanged=>Conflict(new{Message="AccountChanged"}),
            _=>StatusCode(503,new{Message="EmailVerificationUnavailable"})
        };
    }
    [AllowAnonymous]
    [HttpPost("confirm")]
    public async Task<IActionResult> Confirm(ConfirmInput input,CancellationToken ct)
    {
        // Explicit POST, not automatic confirmation from a link scanner.
        return await verification.ConfirmAsync(input.Token,ct)?Ok(new{EmailVerified=true}):BadRequest(new{Message="InvalidEmailVerificationToken"});
    }
}
