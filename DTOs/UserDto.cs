namespace MathWorldAPI.DTOs
{
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

    public class FavoriteDto
    {
        public int ProblemId { get; set; }
        public bool IsFavorite { get; set; }
    }
}