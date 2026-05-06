// ================================
// File: Services/IMeiliSearchService.cs
// ================================

using MathWorldAPI.Models;

namespace MathWorldAPI.Services
{
    public interface IMeiliSearchService
    {
        Task IndexProblemAsync(MathProblem problem);

        // Legacy method for backward compatibility
        Task<List<int>> SearchAsync(
            string query,
            int? categoryId = null,
            string? difficulty = null);

        // NEW: Search with pagination support
        Task<(List<int> Ids, int TotalCount)> SearchWithPaginationAsync(
            string query,
            int? categoryId = null,
            string? difficulty = null,
            int page = 1,
            int pageSize = 10);

        Task UpdateProblemAsync(MathProblem problem);

        Task DeleteProblemAsync(int id);

        Task ReindexAllAsync();
    }
}