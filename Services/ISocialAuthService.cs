// File: MathWorldAPI/Services/ISocialAuthService.cs
// Description: Interface for social authentication operations.

using MathWorldAPI.DTOs;

namespace MathWorldAPI.Services
{
    /// <summary>
    /// Defines authentication operations for external
    /// Google identity only; historical provider links are retained in storage.
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
            SocialLoginDto dto,string locale="ar");

        Task<bool> LinkGoogleAsync(int userId, SocialLoginDto dto);
    }
}