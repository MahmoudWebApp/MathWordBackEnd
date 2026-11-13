// File: MathWorldAPI/Controllers/SocialAuthController.cs
// Description: API endpoints for Google and Facebook authentication.

using System.Security.Claims;
using MathWorldAPI.DTOs;
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

        /// <summary>
        /// Initializes a new instance of the SocialAuthController.
        /// </summary>
        public SocialAuthController(
            ISocialAuthService socialAuthService,
            ILogger<SocialAuthController> logger)
        {
            _socialAuthService = socialAuthService;
            _logger = logger;
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

            return Ok(
                LanguageHelper.SuccessResponse(
                    result,
                    "LoginSuccess",
                    language));
        }

        /// <summary>
        /// Authenticates a user using a Facebook OAuth access token.
        /// </summary>
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

            return Ok(
                LanguageHelper.SuccessResponse(
                    result,
                    "LoginSuccess",
                    language));
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
        [HttpPost("link/facebook")]
        [Authorize(Roles = "Student")]
        public async Task<ActionResult<ApiResponse<object>>> LinkFacebook(
            [FromBody] SocialLoginDto dto)
        {
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