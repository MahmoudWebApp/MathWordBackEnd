// File: MathWorldAPI/Services/ISocialAuthService.cs
// Description: Interface for social authentication operations

using MathWorldAPI.DTOs;

namespace MathWorldAPI.Services
{
    public interface ISocialAuthService
    {
        /// <summary>
        /// Authenticates a user using Google ID Token
        /// </summary>
        Task<AuthResponseDto?> GoogleLoginAsync(SocialLoginDto dto);

        /// <summary>
        /// Authenticates a user using Facebook Access Token
        /// </summary>
        Task<AuthResponseDto?> FacebookLoginAsync(SocialLoginDto dto);
    }
}