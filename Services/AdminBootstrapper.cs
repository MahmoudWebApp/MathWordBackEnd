// File: MathWorldAPI/Services/AdminBootstrapper.cs

using MathWorldAPI.Data;
using MathWorldAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Services
{
    /// <summary>
    /// Creates the initial administrator from environment variables.
    /// </summary>
    public sealed class AdminBootstrapper
    {
        private readonly AppDbContext _context;
        private readonly IConfiguration _configuration;
        private readonly ILogger<AdminBootstrapper> _logger;

        /// <summary>
        /// Initializes a new instance of the AdminBootstrapper.
        /// </summary>
        public AdminBootstrapper(
            AppDbContext context,
            IConfiguration configuration,
            ILogger<AdminBootstrapper> logger)
        {
            _context = context;
            _configuration = configuration;
            _logger = logger;
        }

        /// <summary>
        /// Creates an administrator only when bootstrapping is enabled
        /// and no administrator currently exists.
        /// </summary>
        public async Task EnsureAdminAsync()
        {
            if (!_configuration.GetValue<bool>(
                    "BootstrapAdmin:Enabled"))
            {
                Console.WriteLine(
                    "Administrator bootstrapping is disabled.");

                return;
            }

            if (await _context.Users.AnyAsync(
                    user => user.Role == "Admin"))
            {
                Console.WriteLine(
                    "An administrator account already exists.");

                return;
            }

            var email =
                _configuration["BootstrapAdmin:Email"]?
                    .Trim()
                    .ToLowerInvariant();

            var password =
                _configuration["BootstrapAdmin:Password"];

            var fullName =
                _configuration["BootstrapAdmin:FullName"]?
                    .Trim()
                ?? "System Admin";

            if (string.IsNullOrWhiteSpace(email) ||
                string.IsNullOrWhiteSpace(password))
            {
                throw new InvalidOperationException(
                    "Bootstrap administrator credentials are incomplete.");
            }

            if (password.Length < 12)
            {
                throw new InvalidOperationException(
                    "Bootstrap administrator password must contain at least 12 characters.");
            }

            var admin = new AppUser
            {
                FullName = fullName,
                Email = email,
                PasswordHash =
                    BCrypt.Net.BCrypt.HashPassword(
                        password),
                Role = "Admin",
                SubscriptionType = "Premium",
                CreatedAt = DateTime.UtcNow,
                IsActive = true
            };

            _context.Users.Add(admin);

            await _context.SaveChangesAsync();

            _logger.LogWarning(
                "The initial administrator account was created. Disable BootstrapAdmin immediately.");

            Console.WriteLine(
                "Initial administrator account created successfully.");
        }
    }
}