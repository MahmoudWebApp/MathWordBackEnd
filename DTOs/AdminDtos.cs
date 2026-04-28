namespace MathWorldAPI.DTOs
{
    public class UpdateUserDto
    {
        public int UserId { get; set; }
        public string? FullName { get; set; }
        public string? Role { get; set; }
        public string? SubscriptionType { get; set; }
        public bool? IsActive { get; set; }
    }

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