namespace MathWorldAPI.DTOs
{
    public class SyncResultDto
    {
        public int Total { get; set; }
    }

    public class ProblemCreatedDto
    {
        public int Id { get; set; }
    }

    public class PagedUserListDto
    {
        public List<UserListDto> Users { get; set; } = new();
        public int Total { get; set; }
        public int Page { get; set; }
        public int PageSize { get; set; }
        public int TotalPages { get; set; }
    }

    public class DashboardStatsDto
    {
        public int TotalProblems { get; set; }
        public int TotalUsers { get; set; }
        public long TotalSolved { get; set; }
        public long TotalViews { get; set; }
    }
}