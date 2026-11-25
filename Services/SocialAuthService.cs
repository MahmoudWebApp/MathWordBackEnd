// File: MathWorldAPI/Services/SocialAuthService.cs
// Description: Verifies Google identity and links Google to existing student accounts.

using Google.Apis.Auth;
using MathWorldAPI.Data;
using MathWorldAPI.DTOs;
using MathWorldAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Services
{
    /// <summary>
    /// Provides Google authentication and authorized account linking.
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
        private readonly ILogger<SocialAuthService> _logger;
        private readonly RegistrationWelcomeService _welcome;

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
        /// <param name="logger">
        /// Application logger.
        /// </param>
        public SocialAuthService(
            AppDbContext context,
            IConfiguration configuration,
            IAuthService authService,
            ILogger<SocialAuthService> logger,
            RegistrationWelcomeService welcome)
        {
            _context = context;
            _configuration = configuration;
            _authService = authService;
            _logger = logger;
            _welcome = welcome;

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
            SocialLoginDto dto,string locale="ar")
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

                _logger.LogDebug("Google identity token verified.");

                // Keep creation and provider identity binding atomic. A failed
                // link must not leave an orphan MathWorld account.
                await using var transaction =
                    await _context.Database.BeginTransactionAsync();

                // Step 2: Find an existing user or create a new user.
                var (user,created) =
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

                if (!user.IsActive || user.StaffSetupPending || user.Role == AccountRolePolicy.Supervisor)
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

                // A validated Google identity proves the matching account address.
                // An existing provider binding may have a different address;
                // never mark that unrelated MathWorld mailbox as verified.
                if (user.Role == "Student" && string.Equals(user.Email, NormalizeEmail(googleUser.Email), StringComparison.OrdinalIgnoreCase))
                    user.VerifiedNotificationEmail = user.Email;

                // Step 4: Update the user login timestamp.
                user.LastLoginAt =
                    DateTime.UtcNow;

                await _context.SaveChangesAsync();
                await transaction.CommitAsync();
                if(created)await _welcome.QueueForNewStudentAsync(user.Id,locale);

                _logger.LogInformation(
                    "Google login succeeded for user {UserId}.",
                    user.Id);

                Console.WriteLine(
                    $"Google login succeeded. UserId: {user.Id}");

                // Step 5: Generate an application JWT.
                return BuildAuthResponse(user);
            }
            catch (SocialAccountLinkRequiredException)
            {
                throw;
            }
            catch (SocialAccountConflictException)
            {
                throw;
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
        /// Explicitly links Google to an authenticated MathWorld student.
        /// The caller's valid MathWorld JWT proves ownership of the local user;
        /// a verified Google ID token proves ownership of the provider identity.
        /// </summary>
        public async Task<bool> LinkGoogleAsync(
            int userId,
            SocialLoginDto dto)
        {
            if (string.IsNullOrWhiteSpace(dto.AccessToken))
                return false;
            var identity = await VerifyGoogleTokenAsync(dto.AccessToken);
            if (identity == null ||
                !identity.EmailVerified ||
                string.IsNullOrWhiteSpace(identity.GoogleId))
                return false;

            return await LinkExistingAccountAsync(
                userId, "Google", identity.GoogleId, identity.Picture);
        }

        private async Task<bool> LinkExistingAccountAsync(
            int userId,
            string provider,
            string providerId,
            string? profilePicture)
        {
            var user = await _context.Users
                .FirstOrDefaultAsync(item => item.Id == userId && item.IsActive);
            if (user == null)
                return false;

            // SaveSocialLogin enforces that a provider identity cannot be
            // reassigned to another user or silently swapped on this account.
            await SaveSocialLogin(user.Id, provider, providerId, profilePicture);
            return true;
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
        private async Task<(AppUser? User,bool Created)> FindOrCreateUserFromSocial(
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

            // Provider ID, not an email string, is the binding key.
            // An existing verified provider link remains authoritative even if
            // the provider stops returning an email.
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

                return (linkedUser,false);
            }

            // An unlinked social provider MUST NOT claim an existing MathWorld
            // identity based on the same email address. The learner needs
            // an authenticated and explicit account-linking action.
            if (string.IsNullOrWhiteSpace(email))
            {
                _logger.LogWarning(
                    "Unlinked {Provider} identity has no usable email.",
                    normalizedProvider);
                return (null,false);
            }

            var normalizedEmail = NormalizeEmail(email);
            var emailInUse = await _context.Users
                .AnyAsync(item => item.Email.ToLower() == normalizedEmail);
            if (emailInUse)
            {
                throw new SocialAccountLinkRequiredException();
            }

            // Create a new application user.
            var normalizedName =
                NormalizeFullName(
                    fullName,
                    normalizedEmail);

            var user =
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
                "New user {UserId} was created via {Provider}.",
                user.Id,
                normalizedProvider);

            Console.WriteLine(
                $"New social user created. Provider: {normalizedProvider}, UserId: {user.Id}");

            return (user,true);
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

                    throw new SocialAccountConflictException();
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
                // Never silently replace an account's existing provider ID.
                // A provider change requires an explicit unlink/link workflow.
                if (!string.Equals(
                        existingUserProvider.ProviderId,
                        normalizedProviderId,
                        StringComparison.Ordinal))
                {
                    throw new SocialAccountConflictException();
                }

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
                CurrentStageId = user.CurrentStageId,

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

}
