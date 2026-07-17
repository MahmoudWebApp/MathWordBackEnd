// File: MathWorldAPI/DTOs/AuthDto.cs

using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace MathWorldAPI.DTOs
{
    /// <summary>
    /// DTO for user registration.
    /// </summary>
    public class RegisterDto
    {
        /// <summary>
        /// Gets or sets the user's full name.
        /// </summary>
        [Required]
        [StringLength(150, MinimumLength = 2)]
        [Description("User's full name.")]
        public string FullName { get; set; } = string.Empty;

        /// <summary>
        /// Gets or sets the user's unique email address.
        /// </summary>
        [Required]
        [EmailAddress]
        [StringLength(256)]
        [Description("User's unique email address.")]
        public string Email { get; set; } = string.Empty;

        /// <summary>
        /// Gets or sets the user's password.
        /// </summary>
        [Required]
        [StringLength(128, MinimumLength = 8)]
        [Description("Password with at least 8 characters.")]
        public string Password { get; set; } = string.Empty;
    }

    /// <summary>
    /// DTO for user login.
    /// </summary>
    public class LoginDto
    {
        /// <summary>
        /// Gets or sets the user's email address.
        /// </summary>
        [Required]
        [EmailAddress]
        [StringLength(256)]
        public string Email { get; set; } = string.Empty;

        /// <summary>
        /// Gets or sets the user's password.
        /// </summary>
        [Required]
        [StringLength(128, MinimumLength = 1)]
        public string Password { get; set; } = string.Empty;
    }

    /// <summary>
    /// DTO for an authentication response.
    /// </summary>
    public class AuthResponseDto
    {
        public int Id { get; set; }
        public string FullName { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string Role { get; set; } = string.Empty;
        public string Token { get; set; } = string.Empty;
        public string SubscriptionType { get; set; } = string.Empty;
        public string? ProfilePicture { get; set; }
    }

    /// <summary>
    /// DTO for social authentication.
    /// </summary>
    public class SocialLoginDto
    {
        /// <summary>
        /// Gets or sets the OAuth provider name.
        /// </summary>
        [Required]
        public string Provider { get; set; } = string.Empty;

        /// <summary>
        /// Gets or sets the OAuth token returned by the provider.
        /// </summary>
        [Required]
        public string AccessToken { get; set; } = string.Empty;
    }
}