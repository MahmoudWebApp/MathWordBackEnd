using MathWorldAPI.DTOs;
using MathWorldAPI.Models;

namespace MathWorldAPI.Services
{
    public interface IAuthService
    {
        Task<AuthResponseDto?> RegisterAsync(RegisterDto dto, string role = "Student");
        Task<AuthResponseDto?> LoginAsync(LoginDto dto);
        Task<AppUser?> GetUserByIdAsync(int id);
        Task<AppUser?> GetUserByEmailAsync(string email);
        string GenerateJwtToken(AppUser user);
    }
}