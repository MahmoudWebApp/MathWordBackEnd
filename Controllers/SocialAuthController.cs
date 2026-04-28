using System.Text.Json;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MathWorldAPI.Data;
using MathWorldAPI.DTOs;
using MathWorldAPI.Helpers;
using MathWorldAPI.Models;
using MathWorldAPI.Services;

namespace MathWorldAPI.Controllers
{
    [ApiController]
    [Route("api/auth/social")]
    public class SocialAuthController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly IAuthService _authService;
        private readonly HttpClient _httpClient;

        public SocialAuthController(AppDbContext context, IAuthService authService)
        {
            _context = context;
            _authService = authService;
            _httpClient = new HttpClient();
        }

        [HttpPost("google")]
        public async Task<IActionResult> GoogleLogin([FromBody] SocialLoginDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            try
            {
                var userInfo = await VerifyGoogleToken(dto.AccessToken);
                if (userInfo == null)
                    return Unauthorized(LanguageHelper.ErrorResponse("InvalidGoogleToken", language, 401));

                var user = await _context.Users.FirstOrDefaultAsync(u => u.Email == userInfo.Email);

                if (user == null)
                {
                    user = new AppUser
                    {
                        FullName = userInfo.FullName,
                        Email = userInfo.Email,
                        PasswordHash = BCrypt.Net.BCrypt.HashPassword(Guid.NewGuid().ToString()),
                        Role = "Student",
                        SubscriptionType = "Free",
                        IsActive = true,
                        CreatedAt = DateTime.UtcNow
                    };

                    _context.Users.Add(user);
                    await _context.SaveChangesAsync();

                    _context.SocialLogins.Add(new SocialLogin
                    {
                        UserId = user.Id,
                        Provider = "Google",
                        ProviderId = userInfo.ProviderId,
                        CreatedAt = DateTime.UtcNow
                    });
                    await _context.SaveChangesAsync();
                }

                if (!user.IsActive)
                    return Unauthorized(LanguageHelper.ErrorResponse("AccountDeactivated", language, 401));

                var token = _authService.GenerateJwtToken(user);

                return Ok(new
                {
                    Success = true,
                    Message = $"Successfully logged in via Google",
                    Token = token,
                    User = new { user.Id, user.FullName, user.Email, user.Role }
                });
            }
            catch
            {
                return StatusCode(500, LanguageHelper.ErrorResponse("ServerError", language, 500));
            }
        }

        [HttpPost("facebook")]
        public async Task<IActionResult> FacebookLogin([FromBody] SocialLoginDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            try
            {
                var userInfo = await VerifyFacebookToken(dto.AccessToken);
                if (userInfo == null)
                    return Unauthorized(LanguageHelper.ErrorResponse("InvalidFacebookToken", language, 401));

                var user = await _context.Users.FirstOrDefaultAsync(u => u.Email == userInfo.Email);

                if (user == null)
                {
                    user = new AppUser
                    {
                        FullName = userInfo.FullName,
                        Email = userInfo.Email,
                        PasswordHash = BCrypt.Net.BCrypt.HashPassword(Guid.NewGuid().ToString()),
                        Role = "Student",
                        SubscriptionType = "Free",
                        IsActive = true,
                        CreatedAt = DateTime.UtcNow
                    };

                    _context.Users.Add(user);
                    await _context.SaveChangesAsync();

                    _context.SocialLogins.Add(new SocialLogin
                    {
                        UserId = user.Id,
                        Provider = "Facebook",
                        ProviderId = userInfo.ProviderId,
                        CreatedAt = DateTime.UtcNow
                    });
                    await _context.SaveChangesAsync();
                }

                if (!user.IsActive)
                    return Unauthorized(LanguageHelper.ErrorResponse("AccountDeactivated", language, 401));

                var token = _authService.GenerateJwtToken(user);

                return Ok(new
                {
                    Success = true,
                    Message = $"Successfully logged in via Facebook",
                    Token = token,
                    User = new { user.Id, user.FullName, user.Email, user.Role }
                });
            }
            catch
            {
                return StatusCode(500, LanguageHelper.ErrorResponse("ServerError", language, 500));
            }
        }

        private async Task<SocialUserInfo?> VerifyGoogleToken(string accessToken)
        {
            try
            {
                var url = $"https://www.googleapis.com/oauth2/v3/userinfo?access_token={accessToken}";
                var response = await _httpClient.GetAsync(url);
                if (!response.IsSuccessStatusCode) return null;

                var json = await response.Content.ReadAsStringAsync();
                var data = JsonSerializer.Deserialize<JsonElement>(json);

                return new SocialUserInfo
                {
                    Email = data.GetProperty("email").GetString() ?? string.Empty,
                    FullName = data.GetProperty("name").GetString() ?? string.Empty,
                    ProviderId = data.GetProperty("sub").GetString() ?? string.Empty
                };
            }
            catch { return null; }
        }

        private async Task<SocialUserInfo?> VerifyFacebookToken(string accessToken)
        {
            try
            {
                var url = $"https://graph.facebook.com/me?access_token={accessToken}&fields=id,name,email";
                var response = await _httpClient.GetAsync(url);
                if (!response.IsSuccessStatusCode) return null;

                var json = await response.Content.ReadAsStringAsync();
                var data = JsonSerializer.Deserialize<JsonElement>(json);

                var email = data.TryGetProperty("email", out var emailProp) ? emailProp.GetString() : string.Empty;

                return new SocialUserInfo
                {
                    Email = email ?? string.Empty,
                    FullName = data.GetProperty("name").GetString() ?? string.Empty,
                    ProviderId = data.GetProperty("id").GetString() ?? string.Empty
                };
            }
            catch { return null; }
        }

        private class SocialUserInfo
        {
            public string Email { get; set; } = string.Empty;
            public string FullName { get; set; } = string.Empty;
            public string ProviderId { get; set; } = string.Empty;
        }
    }
}