// File: MathWorldAPI/DTOs/SharedDto.cs

namespace MathWorldAPI.DTOs
{
    /// <summary>
    /// Generic response wrapper for paginated results
    /// </summary>
    public class PagedResult<T>
    {
        public string CategoryName { get; set; } = string.Empty;
        public string CategoryIcon { get; set; } = string.Empty;
        public List<T> Items { get; set; } = new();
    }

    /// <summary>
    /// DTO for favorite operation result
    /// </summary>
    public class FavoriteResultDto
    {
        public bool IsFavorite { get; set; }
    }

    /// <summary>
    /// DTO for favorite check result
    /// </summary>
    public class FavoriteCheckDto
    {
        public bool IsFavorite { get; set; }
    }

    /// <summary>
    /// DTO for search results with metadata
    /// </summary>
    public class SearchResultDto
    {
        public string SearchType { get; set; } = string.Empty;
        public string Query { get; set; } = string.Empty;
        public List<ProblemPreviewDto> Results { get; set; } = new();
    }
}