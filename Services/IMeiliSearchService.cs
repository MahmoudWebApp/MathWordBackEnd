// ================================
// File: Services/IMeiliSearchService.cs
// ================================
// No changes — keeping for reference

using MathWorldAPI.Models;

namespace MathWorldAPI.Services
{
    public interface IMeiliSearchService
    {
        Task IndexProblemAsync(MathProblem problem);

        Task<List<int>> SearchAsync(
            string query,
            int? categoryId = null,
            string? difficulty = null);

        Task UpdateProblemAsync(MathProblem problem);

        Task DeleteProblemAsync(int id);

        Task ReindexAllAsync();
    }
}