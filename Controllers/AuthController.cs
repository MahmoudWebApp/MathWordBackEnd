// File: MathWorldAPI/Controllers/AuthController.cs

using MathWorldAPI.DTOs;
using MathWorldAPI.Helpers;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.RateLimiting;

namespace MathWorldAPI.Controllers
{
    /// <summary>
    /// Handles local authentication operations including
    /// user registration and login using JWT tokens.
    /// </summary>
    [ApiController]
    [Route("api/[controller]")]
    [EnableRateLimiting("auth")]
    public class AuthController : ControllerBase
    {
        private readonly IAuthService _authService;
        private readonly ILogger<AuthController> _logger;

        /// <summary>
        /// Initializes a new instance of the AuthController.
        /// </summary>
        /// <param name="authService">
        /// Authentication service used for registration and login.
        /// </param>
        /// <param name="logger">
        /// Application logger.
        /// </param>
        public AuthController(
            IAuthService authService,
            ILogger<AuthController> logger)
        {
            _authService = authService;
            _logger = logger;
        }

        /// <summary>
        /// Registers a new user with the Student role.
        /// </summary>
        /// <param name="dto">
        /// Registration data containing the user's full name,
        /// email address, and password.
        /// </param>
        /// <returns>
        /// The registered user information and a JWT token.
        /// </returns>
        [HttpPost("register")]
        [ProducesResponseType(
            typeof(ApiResponse<AuthResponseDto>),
            StatusCodes.Status201Created)]
        [ProducesResponseType(
            typeof(ApiResponse<AuthResponseDto>),
            StatusCodes.Status400BadRequest)]
        [ProducesResponseType(
            typeof(ApiResponse<object>),
            StatusCodes.Status429TooManyRequests)]
        public async Task<
            ActionResult<ApiResponse<AuthResponseDto>>> Register(
            [FromBody] RegisterDto dto)
        {
            var language =
                LanguageHelper.GetLanguageFromRequest(Request);

            var result =
                await _authService.RegisterAsync(
                    dto,
                    "Student");

            if (result == null)
            {
                _logger.LogWarning(
                    "Registration failed because email {Email} already exists.",
                    dto.Email);

                return BadRequest(
                    LanguageHelper.ErrorResponse<AuthResponseDto>(
                        "EmailAlreadyExists",
                        language,
                        StatusCodes.Status400BadRequest));
            }

            _logger.LogInformation(
                "User {UserId} registered successfully.",
                result.Id);

            Console.WriteLine(
                $"User registered successfully. UserId: {result.Id}");

            return StatusCode(
                StatusCodes.Status201Created,
                LanguageHelper.SuccessResponse(
                    result,
                    "RegistrationSuccess",
                    language,
                    StatusCodes.Status201Created));
        }

        /// <summary>
        /// Authenticates a user using email and password.
        /// </summary>
        /// <param name="dto">
        /// Login credentials.
        /// </param>
        /// <returns>
        /// The authenticated user information and a JWT token.
        /// </returns>
        [HttpPost("login")]
        [ProducesResponseType(
            typeof(ApiResponse<AuthResponseDto>),
            StatusCodes.Status200OK)]
        [ProducesResponseType(
            typeof(ApiResponse<AuthResponseDto>),
            StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(
            typeof(ApiResponse<object>),
            StatusCodes.Status429TooManyRequests)]
        public async Task<
            ActionResult<ApiResponse<AuthResponseDto>>> Login(
            [FromBody] LoginDto dto)
        {
            var language =
                LanguageHelper.GetLanguageFromRequest(Request);

            var (result, errorCode) =
                await _authService.LoginAsync(dto);

            if (result == null)
            {
                _logger.LogWarning(
                    "Login failed for email {Email}. Error code: {ErrorCode}",
                    dto.Email,
                    errorCode ?? "InvalidCredentials");

                return Unauthorized(
                    LanguageHelper.ErrorResponse<AuthResponseDto>(
                        errorCode ?? "InvalidCredentials",
                        language,
                        StatusCodes.Status401Unauthorized));
            }

            _logger.LogInformation(
                "User {UserId} logged in successfully.",
                result.Id);

            Console.WriteLine(
                $"User logged in successfully. UserId: {result.Id}");

            return Ok(
                LanguageHelper.SuccessResponse(
                    result,
                    "LoginSuccess",
                    language));
        }
    }
}