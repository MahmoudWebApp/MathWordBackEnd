// File: MathWorldAPI/DTOs/AuthDto.cs

using System.ComponentModel;

namespace MathWorldAPI.DTOs
{
    /// <summary>
    /// DTO for user registration
    /// </summary>
    public class RegisterDto
    {
        [Description("User's full name")]
        public string FullName { get; set; } = string.Empty;

        [Description("User's email address (must be unique)")]
        public string Email { get; set; } = string.Empty;

        [Description("Password (minimum 6 characters)")]
        public string Password { get; set; } = string.Empty;
    }

    /// <summary>
    /// DTO for user login
    /// </summary>
    public class LoginDto
    {
        [Description("User's email address")]
        public string Email { get; set; } = string.Empty;

        [Description("User's password")]
        public string Password { get; set; } = string.Empty;
    }

    /// <summary>
    /// DTO for authentication response
    /// </summary>
    public class AuthResponseDto
    {
        public int Id { get; set; }
        public string FullName { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string Role { get; set; } = string.Empty;
        public string Token { get; set; } = string.Empty;
        public string SubscriptionType { get; set; } = string.Empty;
    }

    /// <summary>
    /// DTO for social login (Google/Facebook)
    /// </summary>
    public class SocialLoginDto
    {
        [Description("OAuth provider name (Google or Facebook)")]
        public string Provider { get; set; } = string.Empty;

        [Description("OAuth access token from the provider")]
        public string AccessToken { get; set; } = string.Empty;
    }
}