// File: MathWorldAPI/DTOs/UserDto.cs

using System.ComponentModel;

namespace MathWorldAPI.DTOs
{
    /// <summary>
    /// DTO for user profile information
    /// </summary>
    public class UserProfileDto
    {
        public int Id { get; set; }
        public string FullName { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string Role { get; set; } = string.Empty;
        public string SubscriptionType { get; set; } = string.Empty;
        public int SolvedProblemsCount { get; set; }
        public int TotalPoints { get; set; }
        public DateTime MemberSince { get; set; }
    }

    /// <summary>
    /// DTO for toggling favorite status
    /// </summary>
    public class FavoriteDto
    {
        [Description("ID of the problem to favorite/unfavorite")]
        public int ProblemId { get; set; }

        [Description("True to add to favorites, false to remove")]
        public bool IsFavorite { get; set; }
    }

    /// <summary>
    /// DTO for updating user information (Admin only)
    /// </summary>
    public class UpdateUserDto
    {
        [Description("User ID to update")]
        public int UserId { get; set; }

        [Description("New full name (optional)")]
        public string? FullName { get; set; }

        [Description("New role: Admin or Student (optional)")]
        public string? Role { get; set; }

        [Description("New subscription type: Free or Premium (optional)")]
        public string? SubscriptionType { get; set; }

        [Description("Account active status (optional)")]
        public bool? IsActive { get; set; }
    }

    /// <summary>
    /// DTO for user list in admin panel
    /// </summary>
    public class UserListDto
    {
        public int Id { get; set; }
        public string FullName { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string Role { get; set; } = string.Empty;
        public string SubscriptionType { get; set; } = string.Empty;
        public bool IsActive { get; set; }
        public int SolvedProblemsCount { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}