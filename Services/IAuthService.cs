// File: MathWorldAPI/Services/IAuthService.cs

using MathWorldAPI.DTOs;
using MathWorldAPI.Models;

namespace MathWorldAPI.Services
{
    /// <summary>
    /// Defines authentication operations for user registration,
    /// login, user lookup, and JWT token generation.
    /// </summary>
    public interface IAuthService
    {
        /// <summary>
        /// Registers a new user.
        /// </summary>
        Task<AuthResponseDto?> RegisterAsync(
            RegisterDto dto,
            string role = "Student");

        /// <summary>
        /// Authenticates an existing user.
        /// </summary>
        Task<(
            AuthResponseDto? Response,
            string? ErrorCode)> LoginAsync(
            LoginDto dto);

        /// <summary>
        /// Gets a user by ID.
        /// </summary>
        Task<AppUser?> GetUserByIdAsync(
            int id);

        /// <summary>
        /// Gets a user by email address.
        /// </summary>
        Task<AppUser?> GetUserByEmailAsync(
            string email);

        /// <summary>
        /// Generates a signed JWT token.
        /// </summary>
        string GenerateJwtToken(
            AppUser user);
    }
}