// File: MathWorldAPI/Controllers/SocialAuthController.cs
// Description: API endpoints for social authentication (Google/Facebook)

using Microsoft.AspNetCore.Mvc;
using MathWorldAPI.DTOs;
using MathWorldAPI.Helpers;
using MathWorldAPI.Services;

namespace MathWorldAPI.Controllers
{
    [ApiController]
    [Route("api/auth/social")]
    public class SocialAuthController : ControllerBase
    {
        private readonly ISocialAuthService _socialAuthService;

        public SocialAuthController(ISocialAuthService socialAuthService)
        {
            _socialAuthService = socialAuthService;
        }

        /// <summary>
        /// Authenticates a user using Google OAuth ID Token
        /// </summary>
        /// <param name="dto">Contains Google ID Token</param>
        /// <returns>JWT token and user data</returns>
        [HttpPost("google")]
        [ProducesResponseType(typeof(ApiResponse<AuthResponseDto>), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ApiResponse<object>), StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(typeof(ApiResponse<object>), StatusCodes.Status500InternalServerError)]
        public async Task<ActionResult<ApiResponse<AuthResponseDto>>> GoogleLogin([FromBody] SocialLoginDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var result = await _socialAuthService.GoogleLoginAsync(dto);

            if (result == null)
                return Unauthorized(LanguageHelper.ErrorResponse<ApiResponse<AuthResponseDto>>("InvalidGoogleToken", language, 401));

            return Ok(LanguageHelper.SuccessResponse(result, "LoginSuccess", language));
        }

        /// <summary>
        /// Authenticates a user using Facebook OAuth Access Token
        /// </summary>
        /// <param name="dto">Contains Facebook Access Token</param>
        /// <returns>JWT token and user data</returns>
        [HttpPost("facebook")]
        [ProducesResponseType(typeof(ApiResponse<AuthResponseDto>), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ApiResponse<object>), StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(typeof(ApiResponse<object>), StatusCodes.Status500InternalServerError)]
        public async Task<ActionResult<ApiResponse<AuthResponseDto>>> FacebookLogin([FromBody] SocialLoginDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var result = await _socialAuthService.FacebookLoginAsync(dto);

            if (result == null)
                return Unauthorized(LanguageHelper.ErrorResponse<ApiResponse<AuthResponseDto>>("InvalidFacebookToken", language, 401));

            return Ok(LanguageHelper.SuccessResponse(result, "LoginSuccess", language));
        }
    }
}