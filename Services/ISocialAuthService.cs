// File: MathWorldAPI/Services/ISocialAuthService.cs
// Description: Interface for social authentication operations.

using MathWorldAPI.DTOs;

namespace MathWorldAPI.Services
{
    /// <summary>
    /// Defines authentication operations for external
    /// Google and Facebook providers.
    /// </summary>
    public interface ISocialAuthService
    {
        /// <summary>
        /// Authenticates a user using a Google ID token.
        /// </summary>
        /// <param name="dto">
        /// Social authentication data containing the Google ID token.
        /// </param>
        /// <returns>
        /// Authentication information when the token is valid;
        /// otherwise null.
        /// </returns>
        Task<AuthResponseDto?> GoogleLoginAsync(
            SocialLoginDto dto);

        /// <summary>
        /// Authenticates a user using a Facebook access token.
        /// </summary>
        /// <param name="dto">
        /// Social authentication data containing the Facebook access token.
        /// </param>
        /// <returns>
        /// Authentication information when the token is valid;
        /// otherwise null.
        /// </returns>
        Task<AuthResponseDto?> FacebookLoginAsync(
            SocialLoginDto dto);
    }
}