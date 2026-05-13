// ================================
// File: Services/IMeiliSearchService.cs
// ================================

using MathWorldAPI.Models;

namespace MathWorldAPI.Services
{
    /// <summary>
    /// Interface for Meilisearch operations.
    /// Handles indexing, updating, deleting, and searching math problems.
    /// </summary>
    public interface IMeiliSearchService
    {
        /// <summary>
        /// Adds a new math problem to the Meilisearch index.
        /// </summary>
        Task IndexProblemAsync(MathProblem problem);

        /// <summary>
        /// Legacy method for backward compatibility.
        /// Returns a list of problem IDs matching the search criteria.
        /// </summary>
        Task<List<int>> SearchAsync(
            string query,
            int? categoryId = null,
            int? stageId = null); // Changed from string? difficulty

        /// <summary>
        /// NEW: Search with pagination support.
        /// Returns a tuple containing the list of matching problem IDs and the total count.
        /// </summary>
        Task<(List<int> Ids, int TotalCount)> SearchWithPaginationAsync(
            string query,
            int? categoryId = null,
            int? stageId = null, // Changed from string? difficulty
            int page = 1,
            int pageSize = 10);

        /// <summary>
        /// Updates an existing math problem in the Meilisearch index.
        /// </summary>
        Task UpdateProblemAsync(MathProblem problem);

        /// <summary>
        /// Deletes a math problem from the Meilisearch index by its ID.
        /// </summary>
        Task DeleteProblemAsync(int id);

        /// <summary>
        /// Clears the existing index and re-indexes all problems from the database.
        /// </summary>
        Task ReindexAllAsync();
    }
}