// =============================================
// File: Services/MeiliSearchService.cs
// =============================================

using Meilisearch;
using Microsoft.EntityFrameworkCore;
using MathWorldAPI.Data;
using MathWorldAPI.Models;

namespace MathWorldAPI.Services
{
    public class MeiliSearchService : IMeiliSearchService
    {
        private readonly MeilisearchClient _client;
        private readonly AppDbContext _context;
        private readonly string _indexName = "math_problems";

        public MeiliSearchService(
            AppDbContext context,
            IConfiguration configuration)
        {
            _context = context;

            var meiliUrl =
                configuration["Meilisearch:Url"]
                ?? "http://localhost:7700";

            var meiliKey =
                configuration["Meilisearch:ApiKey"]
                ?? "masterKey";

            _client = new MeilisearchClient(
                meiliUrl,
                meiliKey);
        }

        // Create index and apply settings
        private async Task InitializeIndexAsync()
        {
            try
            {
                await _client.CreateIndexAsync(
                    _indexName,
                    "id");
            }
            catch
            {
                // Index already exists
            }

            var index = _client.Index(_indexName);

            await index.UpdateSearchableAttributesAsync(
                new[]
                {
                    "titleAr",
                    "titleEn",
                    "questionTextAr",
                    "questionTextEn",
                    "latexCode"
                });

            await index.UpdateFilterableAttributesAsync(
                new[]
                {
                    "categoryId",
                    "difficulty"
                });

            await index.UpdateSortableAttributesAsync(
                new[]
                {
                    "viewsCount",
                    "points",
                    "createdAt"
                });
        }

        // Add problem
        public async Task IndexProblemAsync(
            MathProblem problem)
        {
            await InitializeIndexAsync();

            var index = _client.Index(_indexName);

            var document = new
            {
                id = problem.Id,
                titleAr = problem.TitleAr,
                titleEn = problem.TitleEn,
                questionTextAr = problem.QuestionTextAr,
                questionTextEn = problem.QuestionTextEn,
                latexCode = problem.LatexCode,
                categoryId = problem.CategoryId,
                difficulty = problem.Difficulty,
                viewsCount = problem.ViewsCount,
                points = problem.Points,
                createdAt = problem.CreatedAt
            };

            var task =
                await index.AddDocumentsAsync(
                    new[] { document });

            await index.WaitForTaskAsync(
                task.TaskUid);
        }

        // Search
        public async Task<List<int>> SearchAsync(
            string query,
            int? categoryId = null,
            string? difficulty = null)
        {
            try
            {
                await InitializeIndexAsync();

                var index =
                    _client.Index(_indexName);

                var filters =
                    new List<string>();

                if (categoryId.HasValue)
                {
                    filters.Add(
                        $"categoryId = {categoryId.Value}");
                }

                if (!string.IsNullOrWhiteSpace(
                    difficulty))
                {
                    filters.Add(
                        $"difficulty = \"{difficulty}\"");
                }

                var searchQuery =
                    new SearchQuery
                    {
                        Limit = 100,
                        Offset = 0,
                        Filter =
                            filters.Any()
                            ? string.Join(
                                " AND ",
                                filters)
                            : null
                    };

                var result =
                    await index.SearchAsync<dynamic>(
                        query,
                        searchQuery);

                return result.Hits
                    .Select(x => (int)x.id)
                    .ToList();
            }
            catch
            {
                return new List<int>();
            }
        }

        // Update
        public async Task UpdateProblemAsync(
            MathProblem problem)
        {
            await IndexProblemAsync(problem);
        }

        // Delete
        public async Task DeleteProblemAsync(
            int id)
        {
            await InitializeIndexAsync();

            var index =
                _client.Index(_indexName);

            var task =
                await index.DeleteOneDocumentAsync(
                    id.ToString());

            await index.WaitForTaskAsync(
                task.TaskUid);
        }

        // Reindex all
        public async Task ReindexAllAsync()
        {
            await InitializeIndexAsync();

            var index =
                _client.Index(_indexName);

            var problems =
                await _context.Problems
                    .ToListAsync();

            var documents =
                problems.Select(problem => new
                {
                    id = problem.Id,
                    titleAr = problem.TitleAr,
                    titleEn = problem.TitleEn,
                    questionTextAr =
                        problem.QuestionTextAr,
                    questionTextEn =
                        problem.QuestionTextEn,
                    latexCode =
                        problem.LatexCode,
                    categoryId =
                        problem.CategoryId,
                    difficulty =
                        problem.Difficulty,
                    viewsCount =
                        problem.ViewsCount,
                    points =
                        problem.Points,
                    createdAt =
                        problem.CreatedAt
                }).ToList();

            var task =
                await index.AddDocumentsAsync(
                    documents);

            await index.WaitForTaskAsync(
                task.TaskUid);
        }
    }
}