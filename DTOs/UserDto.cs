// File: MathWorldAPI/DTOs/UserDto.cs

using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace MathWorldAPI.DTOs
{
    /// <summary>
    /// DTO for user profile information.
    /// </summary>
    public class UserProfileDto
    {
        /// <summary>
        /// Gets or sets the user ID.
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// Gets or sets the user's full name.
        /// </summary>
        public string FullName { get; set; } = string.Empty;

        /// <summary>
        /// Gets or sets the user's email address.
        /// </summary>
        public string Email { get; set; } = string.Empty;

        /// <summary>
        /// Gets or sets the user's role.
        /// </summary>
        public string Role { get; set; } = string.Empty;

        /// <summary>
        /// Gets or sets the user's subscription type.
        /// </summary>
        public string SubscriptionType { get; set; } = string.Empty;

        /// <summary>
        /// Gets or sets the number of correctly solved problems.
        /// </summary>
        public int SolvedProblemsCount { get; set; }

        /// <summary>
        /// Gets or sets the total points earned by the user.
        /// </summary>
        public int TotalPoints { get; set; }

        /// <summary>
        /// Gets or sets the date when the user joined.
        /// </summary>
        public DateTime MemberSince { get; set; }
    }

    /// <summary>
    /// DTO for the unified user dashboard.
    /// Combines profile information, statistics, and recent activity.
    /// </summary>
    public class UserDashboardDto
    {
        /// <summary>
        /// Gets or sets the user ID.
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// Gets or sets the user's full name.
        /// </summary>
        public string FullName { get; set; } = string.Empty;

        /// <summary>
        /// Gets or sets the user's email address.
        /// </summary>
        public string Email { get; set; } = string.Empty;

        /// <summary>
        /// Gets or sets the user's role.
        /// </summary>
        public string Role { get; set; } = string.Empty;

        /// <summary>
        /// Gets or sets the user's subscription type.
        /// </summary>
        public string SubscriptionType { get; set; } = string.Empty;

        /// <summary>
        /// Gets or sets the number of correctly solved problems.
        /// </summary>
        public int SolvedProblemsCount { get; set; }

        /// <summary>
        /// Gets or sets the number of favorite problems.
        /// </summary>
        public int FavoriteProblemsCount { get; set; }

        /// <summary>
        /// Gets or sets the total points earned by the user.
        /// </summary>
        public int TotalPoints { get; set; }

        /// <summary>
        /// Gets or sets the percentage of correct attempts.
        /// </summary>
        public int SuccessRate { get; set; }

        /// <summary>
        /// Gets or sets the user registration date.
        /// </summary>
        public DateTime MemberSince { get; set; }

        /// <summary>
        /// Gets or sets recently solved problems.
        /// </summary>
        public List<ProblemPreviewDto> RecentSolved { get; set; } = new();

        /// <summary>
        /// Gets or sets recently favorited problems.
        /// </summary>
        public List<ProblemPreviewDto> RecentFavorites { get; set; } = new();

        /// <summary>
        /// Gets or sets recent user activity items.
        /// </summary>
        public List<RecentActivityItemDto> RecentActivities { get; set; } = new();
    }

    /// <summary>
    /// DTO for a single recent dashboard activity item.
    /// </summary>
    public class RecentActivityItemDto
    {
        /// <summary>
        /// Gets or sets the related problem ID.
        /// </summary>
        public int ProblemId { get; set; }

        /// <summary>
        /// Gets or sets the localized problem title.
        /// </summary>
        public string Title { get; set; } = string.Empty;

        /// <summary>
        /// Gets or sets the localized category name.
        /// </summary>
        public string CategoryName { get; set; } = string.Empty;

        /// <summary>
        /// Gets or sets the date when the problem was solved.
        /// </summary>
        public DateTime SolvedAt { get; set; }
    }

    /// <summary>
    /// DTO for toggling or explicitly changing favorite status.
    /// </summary>
    public class FavoriteDto
    {
        /// <summary>
        /// Gets or sets the problem ID.
        /// </summary>
        [Range(1, int.MaxValue)]
        [Description("ID of the problem to favorite or unfavorite.")]
        public int ProblemId { get; set; }

        /// <summary>
        /// Gets or sets the optional favorite state.
        /// When null, the current favorite state is toggled.
        /// </summary>
        [Description(
            "Optional explicit favorite state. When omitted, the state is toggled.")]
        public bool? IsFavorite { get; set; }
    }

    /// <summary>
    /// DTO for updating user information by an administrator.
    /// </summary>
    public class UpdateUserDto
    {
        /// <summary>
        /// Gets or sets the user ID.
        /// </summary>
        [Range(1, int.MaxValue)]
        [Description("User ID to update.")]
        public int UserId { get; set; }

        /// <summary>
        /// Gets or sets the optional new full name.
        /// </summary>
        [StringLength(150, MinimumLength = 2)]
        [Description("New full name.")]
        public string? FullName { get; set; }

        /// <summary>
        /// Gets or sets the optional new role.
        /// </summary>
        [Description("New role: Admin or Student.")]
        public string? Role { get; set; }

        /// <summary>
        /// Gets or sets the optional subscription type.
        /// </summary>
        [Description("New subscription type: Free or Premium.")]
        public string? SubscriptionType { get; set; }

        /// <summary>
        /// Gets or sets the optional account status.
        /// </summary>
        [Description("Account active status.")]
        public bool? IsActive { get; set; }
    }

    /// <summary>
    /// DTO for a user displayed in an administrator user list.
    /// </summary>
    public class UserListDto
    {
        /// <summary>
        /// Gets or sets the user ID.
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// Gets or sets the user's full name.
        /// </summary>
        public string FullName { get; set; } = string.Empty;

        /// <summary>
        /// Gets or sets the user's email address.
        /// </summary>
        public string Email { get; set; } = string.Empty;

        /// <summary>
        /// Gets or sets the user's role.
        /// </summary>
        public string Role { get; set; } = string.Empty;

        /// <summary>
        /// Gets or sets the user's subscription type.
        /// </summary>
        public string SubscriptionType { get; set; } = string.Empty;

        /// <summary>
        /// Gets or sets whether the account is active.
        /// </summary>
        public bool IsActive { get; set; }

        /// <summary>
        /// Gets or sets the number of correctly solved problems.
        /// </summary>
        public int SolvedProblemsCount { get; set; }

        /// <summary>
        /// Gets or sets the account creation date.
        /// </summary>
        public DateTime CreatedAt { get; set; }
    }
}