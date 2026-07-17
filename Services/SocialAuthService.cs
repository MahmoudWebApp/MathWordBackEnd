// File: MathWorldAPI/Services/SocialAuthService.cs
// Description: Handles social authentication logic for Google and Facebook OAuth.

using System.Net.Http.Json;
using System.Text.Json.Serialization;
using Google.Apis.Auth;
using MathWorldAPI.Data;
using MathWorldAPI.DTOs;
using MathWorldAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Services
{
    /// <summary>
    /// Provides Google and Facebook authentication.
    /// Provider tokens are validated for each request but are never
    /// persisted in the application database.
    /// </summary>
    public sealed class SocialAuthService : ISocialAuthService
    {
        /// <summary>
        /// BCrypt work factor used for the generated password
        /// of accounts created through a social provider.
        /// </summary>
        private const int BCryptWorkFactor = 12;

        private readonly AppDbContext _context;
        private readonly IConfiguration _configuration;
        private readonly IAuthService _authService;
        private readonly IHttpClientFactory _httpClientFactory;
        private readonly ILogger<SocialAuthService> _logger;

        /// <summary>
        /// Initializes a new instance of the SocialAuthService.
        /// </summary>
        /// <param name="context">
        /// Application database context.
        /// </param>
        /// <param name="configuration">
        /// Application configuration containing provider settings.
        /// </param>
        /// <param name="authService">
        /// Local authentication service used to generate JWT tokens.
        /// </param>
        /// <param name="httpClientFactory">
        /// HTTP client factory used for Facebook Graph API requests.
        /// </param>
        /// <param name="logger">
        /// Application logger.
        /// </param>
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

            Console.WriteLine(
                "SocialAuthService initialized successfully.");
        }

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
        public async Task<AuthResponseDto?> GoogleLoginAsync(
            SocialLoginDto dto)
        {
            ArgumentNullException.ThrowIfNull(dto);

            if (string.IsNullOrWhiteSpace(dto.AccessToken))
            {
                _logger.LogWarning(
                    "Google authentication was requested without a token.");

                return null;
            }

            try
            {
                // Step 1: Verify Google token authenticity.
                var googleUser =
                    await VerifyGoogleTokenAsync(
                        dto.AccessToken);

                if (googleUser == null)
                {
                    _logger.LogWarning(
                        "Google token verification failed.");

                    return null;
                }

                if (!googleUser.EmailVerified)
                {
                    _logger.LogWarning(
                        "Google login rejected because the email is not verified.");

                    return null;
                }

                if (string.IsNullOrWhiteSpace(
                        googleUser.GoogleId) ||
                    string.IsNullOrWhiteSpace(
                        googleUser.Email))
                {
                    _logger.LogWarning(
                        "Google login rejected because required user information is missing.");

                    return null;
                }

                _logger.LogInformation(
                    "Google user verified: {Email}",
                    googleUser.Email);

                // Step 2: Find an existing user or create a new user.
                var user =
                    await FindOrCreateUserFromSocial(
                        provider: "Google",
                        providerId: googleUser.GoogleId,
                        email: googleUser.Email,
                        fullName: googleUser.Name,
                        profilePicture: googleUser.Picture);

                if (user == null)
                {
                    return null;
                }

                if (!user.IsActive)
                {
                    _logger.LogWarning(
                        "Google login rejected because user {UserId} is inactive.",
                        user.Id);

                    return null;
                }

                // Step 3: Create or update the social login relationship.
                // The Google token is intentionally not stored.
                await SaveSocialLogin(
                    userId: user.Id,
                    provider: "Google",
                    providerId: googleUser.GoogleId,
                    profilePicture: googleUser.Picture);

                // Step 4: Update the user login timestamp.
                user.LastLoginAt =
                    DateTime.UtcNow;

                await _context.SaveChangesAsync();

                _logger.LogInformation(
                    "Google login succeeded for user {UserId}.",
                    user.Id);

                Console.WriteLine(
                    $"Google login succeeded. UserId: {user.Id}");

                // Step 5: Generate an application JWT.
                return BuildAuthResponse(user);
            }
            catch (Exception exception)
            {
                _logger.LogError(
                    exception,
                    "Google login error: {Message}",
                    exception.Message);

                return null;
            }
        }

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
        public async Task<AuthResponseDto?> FacebookLoginAsync(
            SocialLoginDto dto)
        {
            ArgumentNullException.ThrowIfNull(dto);

            if (string.IsNullOrWhiteSpace(dto.AccessToken))
            {
                _logger.LogWarning(
                    "Facebook authentication was requested without a token.");

                return null;
            }

            try
            {
                // Step 1: Verify the Facebook token and fetch user data.
                var facebookUser =
                    await VerifyFacebookTokenAsync(
                        dto.AccessToken);

                if (facebookUser == null)
                {
                    _logger.LogWarning(
                        "Facebook token verification failed.");

                    return null;
                }

                if (string.IsNullOrWhiteSpace(
                        facebookUser.FacebookId) ||
                    string.IsNullOrWhiteSpace(
                        facebookUser.Email))
                {
                    _logger.LogWarning(
                        "Facebook login rejected because ID or email information is missing.");

                    return null;
                }

                _logger.LogInformation(
                    "Facebook user verified: {Email}",
                    facebookUser.Email);

                // Step 2: Find an existing user or create a new user.
                var user =
                    await FindOrCreateUserFromSocial(
                        provider: "Facebook",
                        providerId: facebookUser.FacebookId,
                        email: facebookUser.Email,
                        fullName: facebookUser.Name,
                        profilePicture:
                            facebookUser.Picture?.Data?.Url);

                if (user == null)
                {
                    return null;
                }

                if (!user.IsActive)
                {
                    _logger.LogWarning(
                        "Facebook login rejected because user {UserId} is inactive.",
                        user.Id);

                    return null;
                }

                // Step 3: Create or update the social login relationship.
                // The Facebook token is intentionally not stored.
                await SaveSocialLogin(
                    userId: user.Id,
                    provider: "Facebook",
                    providerId: facebookUser.FacebookId,
                    profilePicture:
                        facebookUser.Picture?.Data?.Url);

                // Step 4: Update the user login timestamp.
                user.LastLoginAt =
                    DateTime.UtcNow;

                await _context.SaveChangesAsync();

                _logger.LogInformation(
                    "Facebook login succeeded for user {UserId}.",
                    user.Id);

                Console.WriteLine(
                    $"Facebook login succeeded. UserId: {user.Id}");

                // Step 5: Generate an application JWT.
                return BuildAuthResponse(user);
            }
            catch (Exception exception)
            {
                _logger.LogError(
                    exception,
                    "Facebook login error: {Message}",
                    exception.Message);

                return null;
            }
        }

        /// <summary>
        /// Verifies a Google ID token using the Google.Apis.Auth library.
        /// </summary>
        /// <param name="idToken">
        /// Google ID token received from the client application.
        /// </param>
        /// <returns>
        /// Verified Google user information or null.
        /// </returns>
        private async Task<GoogleUserInfo?> VerifyGoogleTokenAsync(
            string idToken)
        {
            try
            {
                var googleClientId =
                    _configuration["Google:ClientId"]?
                        .Trim();

                if (string.IsNullOrWhiteSpace(
                        googleClientId))
                {
                    throw new InvalidOperationException(
                        "Google:ClientId is not configured.");
                }

                var settings =
                    new GoogleJsonWebSignature.ValidationSettings
                    {
                        Audience =
                            new[]
                            {
                                googleClientId
                            }
                    };

                var payload =
                    await GoogleJsonWebSignature.ValidateAsync(
                        idToken,
                        settings);

                return new GoogleUserInfo
                {
                    GoogleId =
                        payload.Subject ?? string.Empty,

                    Email =
                        payload.Email ?? string.Empty,

                    Name =
                        payload.Name ?? string.Empty,

                    FirstName =
                        payload.GivenName,

                    LastName =
                        payload.FamilyName,

                    Picture =
                        payload.Picture,

                    EmailVerified =
                        payload.EmailVerified
                };
            }
            catch (InvalidJwtException exception)
            {
                _logger.LogWarning(
                    "Invalid Google JWT: {Message}",
                    exception.Message);

                return null;
            }
            catch (Exception exception)
            {
                _logger.LogError(
                    exception,
                    "Google token verification error.");

                return null;
            }
        }

        /// <summary>
        /// Verifies a Facebook access token and retrieves
        /// Facebook profile information.
        /// </summary>
        /// <param name="accessToken">
        /// Facebook access token received from the client application.
        /// </param>
        /// <returns>
        /// Verified Facebook user information or null.
        /// </returns>
        private async Task<FacebookUserInfo?> VerifyFacebookTokenAsync(
            string accessToken)
        {
            try
            {
                var appId =
                    _configuration["Facebook:AppId"]?
                        .Trim();

                var appSecret =
                    _configuration["Facebook:AppSecret"]?
                        .Trim();

                if (string.IsNullOrWhiteSpace(appId))
                {
                    throw new InvalidOperationException(
                        "Facebook:AppId is not configured.");
                }

                if (string.IsNullOrWhiteSpace(appSecret))
                {
                    throw new InvalidOperationException(
                        "Facebook:AppSecret is not configured.");
                }

                var client =
                    _httpClientFactory.CreateClient(
                        "FacebookAuth");

                // Step 1: Verify token validity with Facebook.
                var encodedUserToken =
                    Uri.EscapeDataString(accessToken);

                var appAccessToken =
                    Uri.EscapeDataString(
                        $"{appId}|{appSecret}");

                var debugUrl =
                    $"debug_token?input_token={encodedUserToken}" +
                    $"&access_token={appAccessToken}";

                var debugResponse =
                    await client.GetFromJsonAsync<
                        FacebookDebugTokenResponse>(
                        debugUrl);

                var debugData =
                    debugResponse?.Data;

                if (debugData == null ||
                    !debugData.IsValid)
                {
                    _logger.LogWarning(
                        "Facebook token is not valid.");

                    return null;
                }

                if (!string.Equals(
                        debugData.AppId,
                        appId,
                        StringComparison.Ordinal))
                {
                    _logger.LogWarning(
                        "Facebook token was issued for a different application.");

                    return null;
                }

                // Step 2: Fetch user profile data.
                var fields =
                    "id,name,email,first_name,last_name," +
                    "picture.width(200).height(200)";

                var userUrl =
                    $"me?fields={Uri.EscapeDataString(fields)}" +
                    $"&access_token={encodedUserToken}";

                var facebookUser =
                    await client.GetFromJsonAsync<
                        FacebookUserInfo>(
                        userUrl);

                if (facebookUser == null)
                {
                    return null;
                }

                if (!string.IsNullOrWhiteSpace(
                        debugData.UserId) &&
                    !string.Equals(
                        debugData.UserId,
                        facebookUser.FacebookId,
                        StringComparison.Ordinal))
                {
                    _logger.LogWarning(
                        "Facebook debug token user ID does not match the profile user ID.");

                    return null;
                }

                return facebookUser;
            }
            catch (HttpRequestException exception)
            {
                _logger.LogError(
                    exception,
                    "Facebook Graph API request failed.");

                return null;
            }
            catch (Exception exception)
            {
                _logger.LogError(
                    exception,
                    "Facebook token verification error.");

                return null;
            }
        }

        /// <summary>
        /// Finds an existing social provider relationship,
        /// finds a user by verified email, or creates a new user.
        /// </summary>
        /// <param name="provider">
        /// Social provider name.
        /// </param>
        /// <param name="providerId">
        /// Unique provider user identifier.
        /// </param>
        /// <param name="email">
        /// Verified provider email.
        /// </param>
        /// <param name="fullName">
        /// Provider display name.
        /// </param>
        /// <param name="profilePicture">
        /// Optional profile picture URL.
        /// </param>
        /// <returns>
        /// Existing or newly created application user.
        /// </returns>
        private async Task<AppUser?> FindOrCreateUserFromSocial(
            string provider,
            string providerId,
            string email,
            string fullName,
            string? profilePicture)
        {
            var normalizedProvider =
                NormalizeProvider(provider);

            var normalizedProviderId =
                providerId.Trim();

            var normalizedEmail =
                NormalizeEmail(email);

            // First try to find the user through the existing
            // provider relationship.
            var linkedLogin =
                await _context.SocialLogins
                    .Include(login => login.User)
                    .FirstOrDefaultAsync(login =>
                        login.Provider ==
                            normalizedProvider &&
                        login.ProviderId ==
                            normalizedProviderId);

            if (linkedLogin != null)
            {
                var linkedUser =
                    linkedLogin.User;

                if (!string.IsNullOrWhiteSpace(
                        profilePicture) &&
                    string.IsNullOrWhiteSpace(
                        linkedUser.ProfilePicture))
                {
                    linkedUser.ProfilePicture =
                        profilePicture.Trim();
                }

                return linkedUser;
            }

            // Next try to find the user by verified email.
            var user =
                await _context.Users
                    .FirstOrDefaultAsync(item =>
                        item.Email.ToLower() ==
                        normalizedEmail);

            if (user != null)
            {
                if (!string.IsNullOrWhiteSpace(
                        profilePicture) &&
                    string.IsNullOrWhiteSpace(
                        user.ProfilePicture))
                {
                    user.ProfilePicture =
                        profilePicture.Trim();

                    await _context.SaveChangesAsync();
                }

                return user;
            }

            // Create a new application user.
            var normalizedName =
                NormalizeFullName(
                    fullName,
                    normalizedEmail);

            user =
                new AppUser
                {
                    FullName =
                        normalizedName,

                    Email =
                        normalizedEmail,

                    PasswordHash =
                        BCrypt.Net.BCrypt.HashPassword(
                            Guid.NewGuid().ToString("N"),
                            BCryptWorkFactor),

                    Role =
                        "Student",

                    SubscriptionType =
                        "Free",

                    IsActive =
                        true,

                    ProfilePicture =
                        NormalizeOptionalText(
                            profilePicture),

                    CreatedAt =
                        DateTime.UtcNow,

                    LastLoginAt =
                        DateTime.UtcNow
                };

            _context.Users.Add(user);

            await _context.SaveChangesAsync();

            _logger.LogInformation(
                "New user {UserId} was created from {Provider}: {Email}",
                user.Id,
                normalizedProvider,
                normalizedEmail);

            Console.WriteLine(
                $"New social user created. Provider: {normalizedProvider}, UserId: {user.Id}");

            return user;
        }

        /// <summary>
        /// Creates or updates a social login relationship.
        /// Provider access tokens are not stored.
        /// </summary>
        /// <param name="userId">
        /// Application user ID.
        /// </param>
        /// <param name="provider">
        /// Social provider name.
        /// </param>
        /// <param name="providerId">
        /// Unique user identifier returned by the provider.
        /// </param>
        /// <param name="profilePicture">
        /// Optional profile picture URL.
        /// </param>
        private async Task SaveSocialLogin(
            int userId,
            string provider,
            string providerId,
            string? profilePicture)
        {
            var normalizedProvider =
                NormalizeProvider(provider);

            var normalizedProviderId =
                providerId.Trim();

            var normalizedPicture =
                NormalizeOptionalText(
                    profilePicture);

            // Check whether the provider identity already exists.
            var providerIdentity =
                await _context.SocialLogins
                    .FirstOrDefaultAsync(login =>
                        login.Provider ==
                            normalizedProvider &&
                        login.ProviderId ==
                            normalizedProviderId);

            if (providerIdentity != null)
            {
                if (providerIdentity.UserId != userId)
                {
                    _logger.LogWarning(
                        "Provider identity {Provider}/{ProviderId} is already linked to another user.",
                        normalizedProvider,
                        normalizedProviderId);

                    throw new InvalidOperationException(
                        "The social provider account is already connected to another user.");
                }

                providerIdentity.ProfilePicture =
                    normalizedPicture
                    ?? providerIdentity.ProfilePicture;

                providerIdentity.LastLoginAt =
                    DateTime.UtcNow;

                await _context.SaveChangesAsync();

                return;
            }

            // Check whether this user already has a relationship
            // for the same provider.
            var existingUserProvider =
                await _context.SocialLogins
                    .FirstOrDefaultAsync(login =>
                        login.UserId == userId &&
                        login.Provider ==
                            normalizedProvider);

            if (existingUserProvider != null)
            {
                existingUserProvider.ProviderId =
                    normalizedProviderId;

                existingUserProvider.ProfilePicture =
                    normalizedPicture
                    ?? existingUserProvider.ProfilePicture;

                existingUserProvider.LastLoginAt =
                    DateTime.UtcNow;
            }
            else
            {
                _context.SocialLogins.Add(
                    new SocialLogin
                    {
                        UserId =
                            userId,

                        Provider =
                            normalizedProvider,

                        ProviderId =
                            normalizedProviderId,

                        ProfilePicture =
                            normalizedPicture,

                        CreatedAt =
                            DateTime.UtcNow,

                        LastLoginAt =
                            DateTime.UtcNow
                    });
            }

            await _context.SaveChangesAsync();

            _logger.LogInformation(
                "Social login relationship saved for user {UserId} and provider {Provider}.",
                userId,
                normalizedProvider);
        }

        /// <summary>
        /// Maps an application user to an authentication response.
        /// </summary>
        /// <param name="user">
        /// Authenticated application user.
        /// </param>
        /// <returns>
        /// Authentication information with an application JWT.
        /// </returns>
        private AuthResponseDto BuildAuthResponse(
            AppUser user)
        {
            return new AuthResponseDto
            {
                Id =
                    user.Id,

                FullName =
                    user.FullName,

                Email =
                    user.Email,

                Role =
                    user.Role,

                SubscriptionType =
                    user.SubscriptionType,

                Token =
                    _authService.GenerateJwtToken(
                        user),

                ProfilePicture =
                    user.ProfilePicture
            };
        }

        /// <summary>
        /// Normalizes a provider name to the application format.
        /// </summary>
        private static string NormalizeProvider(
            string provider)
        {
            if (string.Equals(
                    provider,
                    "Google",
                    StringComparison.OrdinalIgnoreCase))
            {
                return "Google";
            }

            if (string.Equals(
                    provider,
                    "Facebook",
                    StringComparison.OrdinalIgnoreCase))
            {
                return "Facebook";
            }

            throw new ArgumentException(
                "Unsupported social authentication provider.",
                nameof(provider));
        }

        /// <summary>
        /// Normalizes an email address.
        /// </summary>
        private static string NormalizeEmail(
            string email)
        {
            if (string.IsNullOrWhiteSpace(email))
            {
                throw new ArgumentException(
                    "A verified email address is required.",
                    nameof(email));
            }

            return email
                .Trim()
                .ToLowerInvariant();
        }

        /// <summary>
        /// Normalizes a social provider display name.
        /// </summary>
        private static string NormalizeFullName(
            string fullName,
            string normalizedEmail)
        {
            if (!string.IsNullOrWhiteSpace(fullName))
            {
                return fullName.Trim();
            }

            var emailName =
                normalizedEmail.Split('@')[0];

            return string.IsNullOrWhiteSpace(emailName)
                ? "MathWorld User"
                : emailName;
        }

        /// <summary>
        /// Trims optional text and converts empty text to null.
        /// </summary>
        private static string? NormalizeOptionalText(
            string? value)
        {
            return string.IsNullOrWhiteSpace(value)
                ? null
                : value.Trim();
        }
    }

    // =========================================================================
    // Internal models for social provider responses
    // =========================================================================

    /// <summary>
    /// Google user profile data returned by a validated ID token.
    /// </summary>
    public class GoogleUserInfo
    {
        /// <summary>
        /// Gets or sets the Google user ID.
        /// </summary>
        public string GoogleId { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets the Google account email.
        /// </summary>
        public string Email { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets the Google display name.
        /// </summary>
        public string Name { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets the first name.
        /// </summary>
        public string? FirstName { get; set; }

        /// <summary>
        /// Gets or sets the last name.
        /// </summary>
        public string? LastName { get; set; }

        /// <summary>
        /// Gets or sets the profile picture URL.
        /// </summary>
        public string? Picture { get; set; }

        /// <summary>
        /// Gets or sets whether Google verified the email.
        /// </summary>
        public bool EmailVerified { get; set; }
    }

    /// <summary>
    /// Facebook user profile data returned by Graph API.
    /// </summary>
    public class FacebookUserInfo
    {
        /// <summary>
        /// Gets or sets the Facebook user ID.
        /// </summary>
        [JsonPropertyName("id")]
        public string FacebookId { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets the Facebook account email.
        /// </summary>
        [JsonPropertyName("email")]
        public string Email { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets the Facebook display name.
        /// </summary>
        [JsonPropertyName("name")]
        public string Name { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets the first name.
        /// </summary>
        [JsonPropertyName("first_name")]
        public string? FirstName { get; set; }

        /// <summary>
        /// Gets or sets the last name.
        /// </summary>
        [JsonPropertyName("last_name")]
        public string? LastName { get; set; }

        /// <summary>
        /// Gets or sets the Facebook picture wrapper.
        /// </summary>
        [JsonPropertyName("picture")]
        public FacebookPicture? Picture { get; set; }
    }

    /// <summary>
    /// Facebook picture data wrapper.
    /// </summary>
    public class FacebookPicture
    {
        /// <summary>
        /// Gets or sets the Facebook picture data.
        /// </summary>
        [JsonPropertyName("data")]
        public FacebookPictureData? Data { get; set; }
    }

    /// <summary>
    /// Facebook picture URL data.
    /// </summary>
    public class FacebookPictureData
    {
        /// <summary>
        /// Gets or sets the profile picture URL.
        /// </summary>
        [JsonPropertyName("url")]
        public string? Url { get; set; }

        /// <summary>
        /// Gets or sets whether the image is a default silhouette.
        /// </summary>
        [JsonPropertyName("is_silhouette")]
        public bool IsSilhouette { get; set; }
    }

    /// <summary>
    /// Wrapper returned by the Facebook debug_token endpoint.
    /// </summary>
    internal sealed class FacebookDebugTokenResponse
    {
        /// <summary>
        /// Gets or sets the token verification data.
        /// </summary>
        [JsonPropertyName("data")]
        public FacebookDebugTokenData? Data { get; set; }
    }

    /// <summary>
    /// Token verification data returned by Facebook.
    /// </summary>
    internal sealed class FacebookDebugTokenData
    {
        /// <summary>
        /// Gets or sets the Facebook application ID.
        /// </summary>
        [JsonPropertyName("app_id")]
        public string AppId { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets whether the token is valid.
        /// </summary>
        [JsonPropertyName("is_valid")]
        public bool IsValid { get; set; }

        /// <summary>
        /// Gets or sets the Facebook user ID associated with the token.
        /// </summary>
        [JsonPropertyName("user_id")]
        public string UserId { get; set; } =
            string.Empty;

        /// <summary>
        /// Gets or sets the token expiration timestamp.
        /// </summary>
        [JsonPropertyName("expires_at")]
        public long ExpiresAt { get; set; }
    }
}