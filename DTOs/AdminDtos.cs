// File: MathWorldAPI/DTOs/AdminDtos.cs

namespace MathWorldAPI.DTOs
{
    /// <summary>
    /// DTO for sync/reindex operations result
    /// </summary>
    public class SyncResultDto
    {
        public int Total { get; set; }
    }

    /// <summary>
    /// DTO for problem creation result
    /// </summary>
    public class ProblemCreatedDto
    {
        public int Id { get; set; }
    }

    /// <summary>
    /// DTO for tag creation result
    /// </summary>
    public class TagCreatedDto
    {
        public int Id { get; set; }
    }

    /// <summary>
    /// DTO for paginated user list response
    /// </summary>
    public class PagedUserListDto
    {
        public List<UserListDto> Users { get; set; } = new();
        public int Total { get; set; }
        public int Page { get; set; }
        public int PageSize { get; set; }
        public int TotalPages { get; set; }
    }

    /// <summary>
    /// DTO for dashboard statistics
    /// </summary>
    public class DashboardStatsDto
    {
        public int TotalProblems { get; set; }
        public int TotalUsers { get; set; }
        public long TotalSolved { get; set; }
        public long TotalViews { get; set; }
    }
}