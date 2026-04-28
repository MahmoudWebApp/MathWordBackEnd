using Microsoft.AspNetCore.Mvc;
using MathWorldAPI.DTOs;
using MathWorldAPI.Helpers;
using MathWorldAPI.Services;

namespace MathWorldAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly IAuthService _authService;

        public AuthController(IAuthService authService)
        {
            _authService = authService;
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] RegisterDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var result = await _authService.RegisterAsync(dto, "Student");
            if (result == null)
                return BadRequest(LanguageHelper.ErrorResponse("EmailAlreadyExists", language));

            return Ok(LanguageHelper.SuccessResponse("RegistrationSuccess", language, result));
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var result = await _authService.LoginAsync(dto);
            if (result == null)
                return Unauthorized(LanguageHelper.ErrorResponse("InvalidCredentials", language, 401));

            var user = await _authService.GetUserByEmailAsync(dto.Email);
            if (user != null && !user.IsActive)
                return Unauthorized(LanguageHelper.ErrorResponse("AccountDeactivated", language, 401));

            return Ok(LanguageHelper.SuccessResponse("LoginSuccess", language, result));
        }
    }
}