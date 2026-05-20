// File: MathWorldAPI/Services/SocialAuthService.cs
// Description: Handles social authentication logic for Google and Facebook OAuth

using System.Net.Http.Json;
using System.Text.Json;
using Google.Apis.Auth;
using MathWorldAPI.Data;
using MathWorldAPI.DTOs;
using MathWorldAPI.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

namespace MathWorldAPI.Services
{
    public class SocialAuthService : ISocialAuthService
    {
        private readonly AppDbContext _context;
        private readonly IConfiguration _configuration;
        private readonly IAuthService _authService;
        private readonly IHttpClientFactory _httpClientFactory;
        private readonly ILogger<SocialAuthService> _logger;

        public SocialAuthService(
            AppDbContext context,
            IConfiguration configuration,
            IAuthService authService,
            IHttpClientFactory httpClientFactory,
            ILogger<SocialAuthService> logger)
        {
            _context = context;
            _configuration = configuration;
            _authService = authService;
            _httpClientFactory = httpClientFactory;
            _logger = logger;
        }

        /// <summary>
        /// Authenticates a user using Google ID Token
        /// </summary>
        public async Task<AuthResponseDto?> GoogleLoginAsync(SocialLoginDto dto)
        {
            try
            {
                // Step 1: Verify Google token authenticity
                var googleUser = await VerifyGoogleTokenAsync(dto.AccessToken);
                if (googleUser == null)
                {
                    _logger.LogWarning("Google token verification failed");
                    return null;
                }

                _logger.LogInformation("Google user verified: {Email}", googleUser.Email);

                // Step 2: Find existing user or create new one
                var user = await FindOrCreateUserFromSocial(
                    provider: "Google",
                    providerId: googleUser.GoogleId,
                    email: googleUser.Email,
                    fullName: googleUser.Name,
                    profilePicture: googleUser.Picture
                );

                if (user == null) return null;

                // Step 3: Save or update social login record
                await SaveSocialLogin(
                    userId: user.Id,
                    provider: "Google",
                    providerId: googleUser.GoogleId,
                    accessToken: dto.AccessToken,
                    profilePicture: googleUser.Picture
                );

                // Step 4: Update last login timestamp
                user.LastLoginAt = DateTime.UtcNow;
                await _context.SaveChangesAsync();

                // Step 5: Generate JWT token for the user
                return new AuthResponseDto
                {
                    Id = user.Id,
                    FullName = user.FullName,
                    Email = user.Email,
                    Role = user.Role,
                    SubscriptionType = user.SubscriptionType,
                    Token = _authService.GenerateJwtToken(user),
                    ProfilePicture = user.ProfilePicture
                };
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Google login error: {Message}", ex.Message);
                return null;
            }
        }

        /// <summary>
        /// Authenticates a user using Facebook Access Token
        /// </summary>
        public async Task<AuthResponseDto?> FacebookLoginAsync(SocialLoginDto dto)
        {
            try
            {
                // Step 1: Verify Facebook token authenticity
                var fbUser = await VerifyFacebookTokenAsync(dto.AccessToken);
                if (fbUser == null)
                {
                    _logger.LogWarning("Facebook token verification failed");
                    return null;
                }

                _logger.LogInformation("Facebook user verified: {Email}", fbUser.Email);

                // Step 2: Find existing user or create new one
                var user = await FindOrCreateUserFromSocial(
                    provider: "Facebook",
                    providerId: fbUser.FacebookId,
                    email: fbUser.Email,
                    fullName: fbUser.Name,
                    profilePicture: fbUser.Picture?.Data?.Url
                );

                if (user == null) return null;

                // Step 3: Save or update social login record
                await SaveSocialLogin(
                    userId: user.Id,
                    provider: "Facebook",
                    providerId: fbUser.FacebookId,
                    accessToken: dto.AccessToken,
                    profilePicture: fbUser.Picture?.Data?.Url
                );

                // Step 4: Update last login timestamp
                user.LastLoginAt = DateTime.UtcNow;
                await _context.SaveChangesAsync();

                // Step 5: Generate JWT token for the user
                return new AuthResponseDto
                {
                    Id = user.Id,
                    FullName = user.FullName,
                    Email = user.Email,
                    Role = user.Role,
                    SubscriptionType = user.SubscriptionType,
                    Token = _authService.GenerateJwtToken(user),
                    ProfilePicture = user.ProfilePicture
                };
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Facebook login error: {Message}", ex.Message);
                return null;
            }
        }

        /// <summary>
        /// Verifies Google ID Token using Google.Apis.Auth library
        /// </summary>
        private async Task<GoogleUserInfo?> VerifyGoogleTokenAsync(string idToken)
        {
            try
            {
                var settings = new GoogleJsonWebSignature.ValidationSettings
                {
                    Audience = new[]
                    {
                        _configuration["Google:ClientId"]
                        ?? throw new InvalidOperationException("Google:ClientId not configured")
                    }
                };

                var payload = await GoogleJsonWebSignature.ValidateAsync(idToken, settings);

                return new GoogleUserInfo
                {
                    GoogleId = payload.Subject,
                    Email = payload.Email,
                    Name = payload.Name,
                    FirstName = payload.GivenName,
                    LastName = payload.FamilyName,
                    Picture = payload.Picture,
                    EmailVerified = payload.EmailVerified
                };
            }
            catch (InvalidJwtException ex)
            {
                _logger.LogWarning("Invalid Google JWT: {Message}", ex.Message);
                return null;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Google token verification error");
                return null;
            }
        }

        /// <summary>
        /// Verifies Facebook Access Token using Facebook Graph API
        /// </summary>
        private async Task<FacebookUserInfo?> VerifyFacebookTokenAsync(string accessToken)
        {
            try
            {
                var appId = _configuration["Facebook:AppId"]
                    ?? throw new InvalidOperationException("Facebook:AppId not configured");
                var appSecret = _configuration["Facebook:AppSecret"]
                    ?? throw new InvalidOperationException("Facebook:AppSecret not configured");

                var client = _httpClientFactory.CreateClient();

                // Step 1: Verify token validity with Facebook
                var debugUrl = $"https://graph.facebook.com/debug_token?" +
                               $"input_token={accessToken}&access_token={appId}|{appSecret}";

                var debugResponse = await client.GetFromJsonAsync<JsonElement>(debugUrl);
                var isValid = debugResponse.GetProperty("data").GetProperty("is_valid").GetBoolean();

                if (!isValid)
                {
                    _logger.LogWarning("Facebook token is not valid");
                    return null;
                }

                // Step 2: Fetch user profile data
                var fields = "id,name,email,first_name,last_name,picture.width(200).height(200)";
                var userUrl = $"https://graph.facebook.com/me?fields={fields}&access_token={accessToken}";

                var fbUser = await client.GetFromJsonAsync<FacebookUserInfo>(userUrl);
                return fbUser;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Facebook token verification error");
                return null;
            }
        }

        /// <summary>
        /// Finds existing user by email or creates a new user from social provider data
        /// </summary>
        private async Task<AppUser?> FindOrCreateUserFromSocial(
            string provider, string providerId, string email,
            string fullName, string? profilePicture)
        {
            // First try to find by email
            var user = await _context.Users
                .FirstOrDefaultAsync(u => u.Email == email);

            if (user != null)
            {
                // Update profile picture if provided and user doesn't have one
                if (!string.IsNullOrEmpty(profilePicture) && string.IsNullOrEmpty(user.ProfilePicture))
                {
                    user.ProfilePicture = profilePicture;
                    await _context.SaveChangesAsync();
                }
                return user;
            }

            // Create new user
            user = new AppUser
            {
                FullName = fullName,
                Email = email,
                PasswordHash = BCrypt.Net.BCrypt.HashPassword(Guid.NewGuid().ToString()),
                Role = "Student",
                SubscriptionType = "Free",
                IsActive = true,
                ProfilePicture = profilePicture,
                CreatedAt = DateTime.UtcNow,
                LastLoginAt = DateTime.UtcNow
            };

            _context.Users.Add(user);
            await _context.SaveChangesAsync();

            _logger.LogInformation("New user created from {Provider}: {Email}", provider, email);
            return user;
        }

        /// <summary>
        /// Saves or updates social login record for the user
        /// </summary>
        private async Task SaveSocialLogin(int userId, string provider, string providerId,
            string accessToken, string? profilePicture)
        {
            var existing = await _context.SocialLogins
                .FirstOrDefaultAsync(s => s.UserId == userId && s.Provider == provider);

            if (existing != null)
            {
                // Update existing record
                existing.ProviderId = providerId;
                existing.AccessToken = accessToken;
                existing.ProfilePicture = profilePicture;
                existing.LastLoginAt = DateTime.UtcNow;
            }
            else
            {
                // Create new record
                _context.SocialLogins.Add(new SocialLogin
                {
                    UserId = userId,
                    Provider = provider,
                    ProviderId = providerId,
                    AccessToken = accessToken,
                    ProfilePicture = profilePicture,
                    CreatedAt = DateTime.UtcNow,
                    LastLoginAt = DateTime.UtcNow
                });
            }

            await _context.SaveChangesAsync();
        }
    }

    // ============================================================================
    // Internal Models for Social Provider Responses
    // ============================================================================

    /// <summary>
    /// Google user profile data from ID Token payload
    /// </summary>
    public class GoogleUserInfo
    {
        public string GoogleId { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string Name { get; set; } = string.Empty;
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
        public string? Picture { get; set; }
        public bool EmailVerified { get; set; }
    }

    /// <summary>
    /// Facebook user profile data from Graph API
    /// </summary>
    public class FacebookUserInfo
    {
        public string FacebookId { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string Name { get; set; } = string.Empty;
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
        public FacebookPicture? Picture { get; set; }
    }

    /// <summary>
    /// Facebook picture data wrapper
    /// </summary>
    public class FacebookPicture
    {
        public FacebookPictureData? Data { get; set; }
    }

    /// <summary>
    /// Facebook picture URL data
    /// </summary>
    public class FacebookPictureData
    {
        public string? Url { get; set; }
    }
}