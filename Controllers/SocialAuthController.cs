// File: MathWorldAPI/Controllers/SocialAuthController.cs
// Description: Google authentication and linked Google accounts only.

using System.Security.Claims;
using MathWorldAPI.DTOs;
using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore;
using MathWorldAPI.Helpers;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.RateLimiting;

namespace MathWorldAPI.Controllers
{
    /// <summary>
    /// Handles Google sign-in and Google account linking.
    /// </summary>
    [ApiController]
    [Route("api/auth/social")]
    [EnableRateLimiting("auth")]
    public class SocialAuthController : ControllerBase
    {
        private readonly ISocialAuthService _socialAuthService;
        private readonly ILogger<SocialAuthController> _logger;
        private readonly PlatformActivityAuditWriter _audit;
        private readonly AppDbContext _db;

        /// <summary>
        /// Initializes a new instance of the SocialAuthController.
        /// </summary>
        public SocialAuthController(
            ISocialAuthService socialAuthService,
            ILogger<SocialAuthController> logger,
            PlatformActivityAuditWriter audit,
            AppDbContext db)
        {
            _socialAuthService = socialAuthService;
            _logger = logger;
            _audit = audit;
            _db = db;
        }

        /// <summary>
        /// Authenticates a user using a Google OAuth ID token.
        /// </summary>
        [HttpPost("google")]
        [ProducesResponseType(
            typeof(ApiResponse<AuthResponseDto>),
            StatusCodes.Status200OK)]
        [ProducesResponseType(
            typeof(ApiResponse<AuthResponseDto>),
            StatusCodes.Status401Unauthorized)]
        public async Task<
            ActionResult<ApiResponse<AuthResponseDto>>> GoogleLogin(
            [FromBody] SocialLoginDto dto)
        {
            var language =
                LanguageHelper.GetLanguageFromRequest(Request);

            AuthResponseDto? result;
            try
            {
                result = await _socialAuthService.GoogleLoginAsync(dto);
            }
            catch (SocialAccountLinkRequiredException)
            {
                return Conflict(LanguageHelper.ErrorResponse<AuthResponseDto>(
                    "SocialAccountLinkRequired", language,
                    StatusCodes.Status409Conflict));
            }
            catch (SocialAccountConflictException)
            {
                return Conflict(LanguageHelper.ErrorResponse<AuthResponseDto>(
                    "SocialAccountAlreadyLinked", language,
                    StatusCodes.Status409Conflict));
            }

            if (result == null)
            {
                _logger.LogWarning(
                    "Google authentication failed.");

                return Unauthorized(
                    LanguageHelper.ErrorResponse<AuthResponseDto>(
                        "InvalidGoogleToken",
                        language,
                        StatusCodes.Status401Unauthorized));
            }

            _logger.LogInformation(
                "Google authentication succeeded for user {UserId}.",
                result.Id);
            await _audit.TryRecordAsync(result.Id, "LoggedInGoogle");

            return Ok(
                LanguageHelper.SuccessResponse(
                    result,
                    "LoginSuccess",
                    language));
        }

        /// <summary>
        /// Current student account-link status. Never expose provider IDs or tokens.
        /// </summary>
        [HttpGet("link-status")]
        [Authorize(Roles = "Student")]
        [ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
        public async Task<IActionResult> GetLinkStatus(CancellationToken ct)
        {
            if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var userId) ||
                userId <= 0) return Unauthorized();
            if (!await _db.Users.AsNoTracking().AnyAsync(
                u => u.Id == userId && u.Role == "Student" && u.IsActive, ct))
                return Unauthorized();

            var googleLinked = await _db.SocialLogins.AsNoTracking().AnyAsync(
                x => x.UserId == userId && x.Provider == "Google", ct);
            return Ok(LanguageHelper.SuccessResponse(
                new { GoogleLinked = googleLinked }, "Success",
                LanguageHelper.GetLanguageFromRequest(Request)));
        }

        /// <summary>
        /// Links Google with an existing signed-in student, only after
        /// validating both the MathWorld JWT and the Google identity token.
        /// </summary>
        [HttpPost("link/google")]
        [Authorize(Roles = "Student")]
        public async Task<ActionResult<ApiResponse<object>>> LinkGoogle(
            [FromBody] SocialLoginDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            if (!int.TryParse(
                User.FindFirstValue(ClaimTypes.NameIdentifier),
                out var userId))
                return Unauthorized();

            try
            {
                var result = await _socialAuthService.LinkGoogleAsync(userId, dto);
                if (!result)
                    return Unauthorized(LanguageHelper.ErrorResponse<object>(
                        "InvalidGoogleToken", language,
                        StatusCodes.Status401Unauthorized));

                return Ok(LanguageHelper.SuccessResponse(
                    new { Linked = true, Provider = "Google" },
                    "SocialAccountLinked", language));
            }
            catch (SocialAccountConflictException)
            {
                return Conflict(LanguageHelper.ErrorResponse<object>(
                    "SocialAccountAlreadyLinked", language,
                    StatusCodes.Status409Conflict));
            }
        }


    }
}