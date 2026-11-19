// File: MathWorldAPI/Controllers/SocialAuthController.cs
// Description: API endpoints for Google and Facebook authentication.

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
    /// Handles social authentication using Google and Facebook.
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
        private readonly IConfiguration _configuration;

        /// <summary>
        /// Initializes a new instance of the SocialAuthController.
        /// </summary>
        public SocialAuthController(
            ISocialAuthService socialAuthService,
            ILogger<SocialAuthController> logger,
            PlatformActivityAuditWriter audit,
            AppDbContext db,
            IConfiguration configuration)
        {
            _socialAuthService = socialAuthService;
            _logger = logger;
            _audit = audit;
            _db = db;
            _configuration = configuration;
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
        /// Authenticates a user using a Facebook OAuth access token.
        /// </summary>
        [ApiExplorerSettings(IgnoreApi = true)]
        [HttpPost("facebook")]
        [ProducesResponseType(
            typeof(ApiResponse<AuthResponseDto>),
            StatusCodes.Status200OK)]
        [ProducesResponseType(
            typeof(ApiResponse<AuthResponseDto>),
            StatusCodes.Status401Unauthorized)]
        public async Task<
            ActionResult<ApiResponse<AuthResponseDto>>> FacebookLogin(
            [FromBody] SocialLoginDto dto)
        {
            // Disabled by default; Google is the only active social provider.
            if (!_configuration.GetValue<bool>("Features:FacebookLoginEnabled", false))
                return NotFound();
            var language =
                LanguageHelper.GetLanguageFromRequest(Request);

            AuthResponseDto? result;
            try
            {
                result = await _socialAuthService.FacebookLoginAsync(dto);
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
                    "Facebook authentication failed.");

                return Unauthorized(
                    LanguageHelper.ErrorResponse<AuthResponseDto>(
                        "InvalidFacebookToken",
                        language,
                        StatusCodes.Status401Unauthorized));
            }

            _logger.LogInformation(
                "Facebook authentication succeeded for user {UserId}.",
                result.Id);
            await _audit.TryRecordAsync(result.Id, "LoggedInFacebook");

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

        /// <summary>
        /// Links Facebook to a signed-in learner, without replacing an
        /// existing provider ID or any of their MathWorld learning data.
        /// </summary>
        [ApiExplorerSettings(IgnoreApi = true)]
        [HttpPost("link/facebook")]
        [Authorize(Roles = "Student")]
        public async Task<ActionResult<ApiResponse<object>>> LinkFacebook(
            [FromBody] SocialLoginDto dto)
        {
            if (!_configuration.GetValue<bool>("Features:FacebookLoginEnabled", false))
                return NotFound();
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            if (!int.TryParse(
                User.FindFirstValue(ClaimTypes.NameIdentifier),
                out var userId))
                return Unauthorized();

            try
            {
                var result = await _socialAuthService.LinkFacebookAsync(userId, dto);
                if (!result)
                    return Unauthorized(LanguageHelper.ErrorResponse<object>(
                        "InvalidFacebookToken", language,
                        StatusCodes.Status401Unauthorized));

                return Ok(LanguageHelper.SuccessResponse(
                    new { Linked = true, Provider = "Facebook" },
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