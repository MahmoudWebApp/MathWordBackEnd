// File: MathWorldAPI/Models/SocialLogin.cs

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MathWorldAPI.Models
{
    /// <summary>
    /// Represents a connection between an application user
    /// and an external social authentication provider.
    /// Provider access tokens are verified during authentication
    /// but are never stored in the application database.
    /// </summary>
    public class SocialLogin
    {
        /// <summary>
        /// Gets or sets the social login record ID.
        /// </summary>
        [Key]
        public int Id { get; set; }

        /// <summary>
        /// Gets or sets the application user ID.
        /// </summary>
        [Required]
        public int UserId { get; set; }

        /// <summary>
        /// Gets or sets the social authentication provider name.
        /// Examples include Google and Facebook.
        /// </summary>
        [Required]
        [MaxLength(50)]
        public string Provider { get; set; } = string.Empty;

        /// <summary>
        /// Gets or sets the unique user identifier returned
        /// by the social authentication provider.
        /// </summary>
        [Required]
        [MaxLength(255)]
        public string ProviderId { get; set; } = string.Empty;

        /// <summary>
        /// Gets or sets the profile picture URL returned
        /// by the social authentication provider.
        /// </summary>
        [MaxLength(1000)]
        public string? ProfilePicture { get; set; }

        /// <summary>
        /// Gets or sets the date when the social login
        /// relationship was created.
        /// </summary>
        public DateTime CreatedAt { get; set; } =
            DateTime.UtcNow;

        /// <summary>
        /// Gets or sets the most recent date when this social
        /// login relationship was used.
        /// </summary>
        public DateTime? LastLoginAt { get; set; }

        /// <summary>
        /// Gets or sets the related application user.
        /// </summary>
        [ForeignKey(nameof(UserId))]
        public AppUser User { get; set; } = null!;
    }
}