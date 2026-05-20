using Microsoft.AspNetCore.Mvc;
using MathWorldAPI.DTOs;
using MathWorldAPI.Helpers;
using MathWorldAPI.Services;

namespace MathWorldAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    // Handles local authentication (register/login) with JWT tokens
    public class AuthController : ControllerBase
    {
        private readonly IAuthService _authService;

        public AuthController(IAuthService authService) => _authService = authService;

        /// <summary>
        /// Registers a new user with Student role
        /// </summary>
        /// <param name="dto">Registration data (name, email, password)</param>
        /// <returns>Created user with JWT token</returns>
        [HttpPost("register")]
        [ProducesResponseType(typeof(ApiResponse<AuthResponseDto>), StatusCodes.Status201Created)]
        [ProducesResponseType(typeof(ApiResponse<object>), StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<ApiResponse<AuthResponseDto>>> Register([FromBody] RegisterDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            var result = await _authService.RegisterAsync(dto, "Student");

            if (result == null)
                return BadRequest(LanguageHelper.ErrorResponse<ApiResponse<AuthResponseDto>>(
                    "EmailAlreadyExists", language));

            return CreatedAtAction(nameof(Login),
                LanguageHelper.SuccessResponse(result, "RegistrationSuccess", language, 201));
        }

        /// <summary>
        /// Authenticates a user with email and password
        /// </summary>
        /// <param name="dto">Login credentials (email, password)</param>
        /// <returns>Authenticated user with JWT token</returns>
        [HttpPost("login")]
        [ProducesResponseType(typeof(ApiResponse<AuthResponseDto>), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ApiResponse<object>), StatusCodes.Status401Unauthorized)]
        public async Task<ActionResult<ApiResponse<AuthResponseDto>>> Login([FromBody] LoginDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            var (result, errorCode) = await _authService.LoginAsync(dto);

            if (result == null)
                return Unauthorized(LanguageHelper.ErrorResponse<ApiResponse<AuthResponseDto>>(
                    errorCode ?? "InvalidCredentials", language, 401));

            return Ok(LanguageHelper.SuccessResponse(result, "LoginSuccess", language));
        }
    }
}