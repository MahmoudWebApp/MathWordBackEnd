// File: MathWorldAPI/Services/IMeiliSearchService.cs

using MathWorldAPI.Models;

namespace MathWorldAPI.Services
{
    /// <summary>
    /// Defines MeiliSearch indexing, updating, deleting,
    /// searching, pagination, and full reindex operations.
    /// </summary>
    public interface IMeiliSearchService
    {
        /// <summary>
        /// Adds a new math problem to the MeiliSearch index.
        /// </summary>
        /// <param name="problem">
        /// Problem to add to the search index.
        /// </param>
        Task IndexProblemAsync(
            MathProblem problem);

        /// <summary>
        /// Searches for problems and returns matching problem IDs.
        /// This method is kept for backward compatibility.
        /// </summary>
        /// <param name="query">
        /// Search query.
        /// </param>
        /// <param name="categoryId">
        /// Optional category filter.
        /// </param>
        /// <param name="stageId">
        /// Optional stage filter.
        /// </param>
        /// <returns>
        /// Matching problem IDs.
        /// </returns>
        Task<List<int>> SearchAsync(
            string query,
            int? categoryId = null,
            int? stageId = null);

        /// <summary>
        /// Searches for problems with pagination.
        /// </summary>
        /// <param name="query">
        /// Search query.
        /// </param>
        /// <param name="categoryId">
        /// Optional category filter.
        /// </param>
        /// <param name="stageId">
        /// Optional educational stage filter.
        /// </param>
        /// <param name="page">
        /// Current one-based page number.
        /// </param>
        /// <param name="pageSize">
        /// Number of results returned per page.
        /// </param>
        /// <returns>
        /// Matching problem IDs and total matching result count.
        /// </returns>
        Task<(List<int> Ids, int TotalCount)>
            SearchWithPaginationAsync(
                string query,
                int? categoryId = null,
                int? stageId = null,
                int page = 1,
                int pageSize = 10);

        /// <summary>
        /// Updates an existing problem in the MeiliSearch index.
        /// </summary>
        /// <param name="problem">
        /// Problem to update.
        /// </param>
        Task UpdateProblemAsync(
            MathProblem problem);

        /// <summary>
        /// Deletes a problem from the MeiliSearch index.
        /// </summary>
        /// <param name="id">
        /// Problem ID.
        /// </param>
        Task DeleteProblemAsync(
            int id);

        /// <summary>
        /// Rebuilds the complete MeiliSearch problem index
        /// from PostgreSQL.
        /// </summary>
        Task ReindexAllAsync();
    }
}