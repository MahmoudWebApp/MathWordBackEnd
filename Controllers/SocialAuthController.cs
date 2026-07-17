// File: MathWorldAPI/Controllers/SocialAuthController.cs
// Description: API endpoints for Google and Facebook authentication.

using MathWorldAPI.DTOs;
using MathWorldAPI.Helpers;
using MathWorldAPI.Services;
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

            var result =
                await _socialAuthService.GoogleLoginAsync(dto);

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

            var result =
                await _socialAuthService.FacebookLoginAsync(dto);

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
    }
}