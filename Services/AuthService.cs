// File: MathWorldAPI/Services/AuthService.cs

using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using MathWorldAPI.Data;
using MathWorldAPI.DTOs;
using MathWorldAPI.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;

namespace MathWorldAPI.Services
{
    /// <summary>
    /// Provides local authentication, password hashing,
    /// user lookup, and JWT token generation.
    /// </summary>
    public sealed class AuthService : IAuthService
    {
        /// <summary>
        /// BCrypt work factor used when hashing new passwords
        /// and checking whether existing hashes require upgrading.
        /// </summary>
        private const int BCryptWorkFactor = 12;

        private readonly AppDbContext _context;
        private readonly byte[] _jwtKey;
        private readonly string _jwtIssuer;
        private readonly string _jwtAudience;
        private readonly int _expiryMinutes;
        private readonly ILogger<AuthService> _logger;

        /// <summary>
        /// Initializes a new instance of the AuthService.
        /// </summary>
        /// <param name="context">
        /// Application database context.
        /// </param>
        /// <param name="configuration">
        /// Application configuration containing JWT settings.
        /// </param>
        /// <param name="logger">
        /// Application logger.
        /// </param>
        /// <exception cref="InvalidOperationException">
        /// Thrown when required JWT configuration is missing or invalid.
        /// </exception>
        public AuthService(
            AppDbContext context,
            IConfiguration configuration,
            ILogger<AuthService> logger)
        {
            _context = context;
            _logger = logger;

            var jwtKey =
                configuration["Jwt:Key"]
                ?? throw new InvalidOperationException(
                    "Jwt:Key is not configured.");

            _jwtIssuer =
                configuration["Jwt:Issuer"]
                ?? throw new InvalidOperationException(
                    "Jwt:Issuer is not configured.");

            _jwtAudience =
                configuration["Jwt:Audience"]
                ?? throw new InvalidOperationException(
                    "Jwt:Audience is not configured.");

            _expiryMinutes =
                configuration.GetValue<int?>(
                    "Jwt:ExpiryMinutes")
                ?? 10080;

            if (_expiryMinutes <= 0)
            {
                throw new InvalidOperationException(
                    "Jwt:ExpiryMinutes must be greater than zero.");
            }

            _jwtKey =
                Encoding.UTF8.GetBytes(jwtKey);

            if (_jwtKey.Length < 32)
            {
                throw new InvalidOperationException(
                    "Jwt:Key must contain at least 32 UTF-8 bytes.");
            }

            Console.WriteLine(
                $"AuthService initialized. JWT expiry: {_expiryMinutes} minutes.");

            Console.WriteLine(
                $"BCrypt work factor: {BCryptWorkFactor}.");
        }

        /// <summary>
        /// Registers a new local user.
        /// </summary>
        /// <param name="dto">
        /// Registration information containing the full name,
        /// email address, and password.
        /// </param>
        /// <param name="role">
        /// Role assigned to the new user.
        /// </param>
        /// <returns>
        /// Authentication data when registration succeeds;
        /// otherwise null when the email already exists.
        /// </returns>
        public async Task<AuthResponseDto?> RegisterAsync(
            RegisterDto dto,
            string role = "Student")
        {
            ArgumentNullException.ThrowIfNull(dto);

            var normalizedEmail =
                NormalizeEmail(dto.Email);

            var normalizedName =
                dto.FullName.Trim();

            var normalizedRole =
                NormalizeRole(role);

            var emailExists =
                await _context.Users.AnyAsync(
                    user =>
                        user.Email.ToLower() ==
                        normalizedEmail);

            if (emailExists)
            {
                _logger.LogWarning(
                    "Registration rejected because email {Email} already exists.",
                    normalizedEmail);

                return null;
            }

            var user = new AppUser
            {
                FullName = normalizedName,
                Email = normalizedEmail,

                PasswordHash =
                    BCrypt.Net.BCrypt.HashPassword(
                        dto.Password,
                        BCryptWorkFactor),

                Role = normalizedRole,
                SubscriptionType = "Free",
                CreatedAt = DateTime.UtcNow,
                IsActive = true
            };

            _context.Users.Add(user);

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException exception)
            {
                _logger.LogWarning(
                    exception,
                    "Registration failed while saving user {Email}.",
                    normalizedEmail);

                return null;
            }

            _logger.LogInformation(
                "User {UserId} registered successfully.",
                user.Id);

            Console.WriteLine(
                $"User registered successfully. UserId: {user.Id}");

            return BuildAuthResponse(user);
        }

        /// <summary>
        /// Authenticates an existing local user using email and password.
        /// </summary>
        /// <param name="dto">
        /// Login credentials.
        /// </param>
        /// <returns>
        /// A tuple containing authentication information when login succeeds,
        /// and an optional localization error code when login fails.
        /// </returns>
        public async Task<(
            AuthResponseDto? Response,
            string? ErrorCode)> LoginAsync(
            LoginDto dto)
        {
            ArgumentNullException.ThrowIfNull(dto);

            var normalizedEmail =
                NormalizeEmail(dto.Email);

            var user =
                await _context.Users
                    .FirstOrDefaultAsync(
                        item =>
                            item.Email.ToLower() ==
                            normalizedEmail);

            if (user == null)
            {
                _logger.LogWarning(
                    "Login failed because email {Email} was not found.",
                    normalizedEmail);

                return (
                    null,
                    "InvalidCredentials");
            }

            var passwordValid =
                BCrypt.Net.BCrypt.Verify(
                    dto.Password,
                    user.PasswordHash);

            if (!passwordValid)
            {
                _logger.LogWarning(
                    "Login failed because the password was invalid for user {UserId}.",
                    user.Id);

                return (
                    null,
                    "InvalidCredentials");
            }

            if (!user.IsActive)
            {
                _logger.LogWarning(
                    "Login rejected because user {UserId} is deactivated.",
                    user.Id);

                return (
                    null,
                    "AccountDeactivated");
            }

            // Upgrade hashes created with an older or weaker work factor.
            if (BCrypt.Net.BCrypt.PasswordNeedsRehash(
                    user.PasswordHash,
                    BCryptWorkFactor))
            {
                user.PasswordHash =
                    BCrypt.Net.BCrypt.HashPassword(
                        dto.Password,
                        BCryptWorkFactor);

                _logger.LogInformation(
                    "Password hash upgraded for user {UserId}.",
                    user.Id);

                Console.WriteLine(
                    $"Password hash upgraded. UserId: {user.Id}");
            }

            user.LastLoginAt =
                DateTime.UtcNow;

            await _context.SaveChangesAsync();

            _logger.LogInformation(
                "User {UserId} logged in successfully.",
                user.Id);

            Console.WriteLine(
                $"User logged in successfully. UserId: {user.Id}");

            return (
                BuildAuthResponse(user),
                null);
        }

        /// <summary>
        /// Gets a user by ID without enabling entity tracking.
        /// </summary>
        /// <param name="id">
        /// User ID.
        /// </param>
        /// <returns>
        /// The matching user or null.
        /// </returns>
        public Task<AppUser?> GetUserByIdAsync(
            int id)
        {
            if (id <= 0)
            {
                return Task.FromResult<AppUser?>(null);
            }

            return _context.Users
                .AsNoTracking()
                .FirstOrDefaultAsync(
                    user => user.Id == id);
        }

        /// <summary>
        /// Gets a user by normalized email address.
        /// </summary>
        /// <param name="email">
        /// User email address.
        /// </param>
        /// <returns>
        /// The matching user or null.
        /// </returns>
        public Task<AppUser?> GetUserByEmailAsync(
            string email)
        {
            if (string.IsNullOrWhiteSpace(email))
            {
                return Task.FromResult<AppUser?>(null);
            }

            var normalizedEmail =
                NormalizeEmail(email);

            return _context.Users
                .AsNoTracking()
                .FirstOrDefaultAsync(
                    user =>
                        user.Email.ToLower() ==
                        normalizedEmail);
        }

        /// <summary>
        /// Creates a signed JWT token for the supplied user.
        /// </summary>
        /// <param name="user">
        /// Authenticated user.
        /// </param>
        /// <returns>
        /// Serialized JWT token.
        /// </returns>
        public string GenerateJwtToken(
            AppUser user)
        {
            ArgumentNullException.ThrowIfNull(user);

            var now =
                DateTime.UtcNow;

            var claims =
                new List<Claim>
                {
                    new(
                        ClaimTypes.NameIdentifier,
                        user.Id.ToString()),

                    new(
                        ClaimTypes.Email,
                        user.Email),

                    new(
                        ClaimTypes.Name,
                        user.FullName),

                    new(
                        ClaimTypes.Role,
                        user.Role),

                    new(
                        "SubscriptionType",
                        user.SubscriptionType),

                    new(
                        JwtRegisteredClaimNames.Jti,
                        Guid.NewGuid().ToString("N"))
                };

            var tokenDescriptor =
                new SecurityTokenDescriptor
                {
                    Subject =
                        new ClaimsIdentity(claims),

                    Issuer =
                        _jwtIssuer,

                    Audience =
                        _jwtAudience,

                    IssuedAt =
                        now,

                    NotBefore =
                        now,

                    Expires =
                        now.AddMinutes(
                            _expiryMinutes),

                    SigningCredentials =
                        new SigningCredentials(
                            new SymmetricSecurityKey(
                                _jwtKey),
                            SecurityAlgorithms.HmacSha256)
                };

            var tokenHandler =
                new JwtSecurityTokenHandler();

            var token =
                tokenHandler.CreateToken(
                    tokenDescriptor);

            return tokenHandler.WriteToken(token);
        }

        /// <summary>
        /// Maps a user entity to an authentication response.
        /// </summary>
        /// <param name="user">
        /// User entity.
        /// </param>
        /// <returns>
        /// Authentication response containing user information and JWT.
        /// </returns>
        private AuthResponseDto BuildAuthResponse(
            AppUser user)
        {
            return new AuthResponseDto
            {
                Id = user.Id,
                FullName = user.FullName,
                Email = user.Email,
                Role = user.Role,

                SubscriptionType =
                    user.SubscriptionType,

                ProfilePicture =
                    user.ProfilePicture,

                Token =
                    GenerateJwtToken(user)
            };
        }

        /// <summary>
        /// Trims and converts an email address to lowercase.
        /// </summary>
        /// <param name="email">
        /// Raw email address.
        /// </param>
        /// <returns>
        /// Normalized email address.
        /// </returns>
        /// <exception cref="ArgumentException">
        /// Thrown when the email address is empty.
        /// </exception>
        private static string NormalizeEmail(
            string email)
        {
            if (string.IsNullOrWhiteSpace(email))
            {
                throw new ArgumentException(
                    "Email address is required.",
                    nameof(email));
            }

            return email
                .Trim()
                .ToLowerInvariant();
        }

        /// <summary>
        /// Validates and normalizes a supported application role.
        /// Public registration should normally use the Student role.
        /// </summary>
        /// <param name="role">
        /// Requested user role.
        /// </param>
        /// <returns>
        /// Admin or Student.
        /// </returns>
        private static string NormalizeRole(
            string role)
        {
            return string.Equals(
                    role,
                    "Admin",
                    StringComparison.OrdinalIgnoreCase)
                ? "Admin"
                : "Student";
        }
    }
}