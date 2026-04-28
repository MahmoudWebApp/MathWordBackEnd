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

        public MeiliSearchService(AppDbContext context, IConfiguration configuration)
        {
            _context = context;
            var meiliUrl = configuration["Meilisearch:Url"] ?? "http://localhost:7700";
            var meiliKey = configuration["Meilisearch:ApiKey"] ?? "masterKey";
            _client = new MeilisearchClient(meiliUrl, meiliKey);
            InitializeIndex().Wait();
        }

        private async Task InitializeIndex()
        {
            try
            {
                var index = _client.Index(_indexName);
                await index.UpdateFilterableAttributesAsync(new[] { "categoryId", "difficulty" });
                await index.UpdateSortableAttributesAsync(new[] { "viewsCount", "points", "createdAt" });
                await index.UpdateSearchableAttributesAsync(new[] {
                    "titleAr", "titleEn", "questionTextAr", "questionTextEn", "latexCode"
                });
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Meilisearch warning: {ex.Message}");
            }
        }

        public async Task IndexProblemAsync(MathProblem problem)
        {
            try
            {
                var index = _client.Index(_indexName);
                var searchDocument = new
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
                await index.AddDocumentsAsync(new[] { searchDocument });
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Failed to index problem {problem.Id}: {ex.Message}");
            }
        }

        public async Task<List<int>> SearchAsync(string query, int? categoryId = null, string? difficulty = null)
        {
            try
            {
                var index = _client.Index(_indexName);
                var filters = new List<string>();
                if (categoryId.HasValue) filters.Add($"categoryId = {categoryId.Value}");
                if (!string.IsNullOrEmpty(difficulty)) filters.Add($"difficulty = \"{difficulty}\"");

                var searchQuery = new SearchQuery
                {
                    Limit = 100,
                    Offset = 0,
                    Filter = filters.Any() ? string.Join(" AND ", filters) : null
                };

                var results = await index.SearchAsync<dynamic>(query, searchQuery);
                return results.Hits.Select(h => (int)h.id).ToList();
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Search failed: {ex.Message}");
                return new List<int>();
            }
        }

        public async Task UpdateProblemAsync(MathProblem problem) => await IndexProblemAsync(problem);
        public async Task DeleteProblemAsync(int id)
        {
            try
            {
                var index = _client.Index(_indexName);
                await index.DeleteOneDocumentAsync(id.ToString());
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Failed to delete problem {id}: {ex.Message}");
            }
        }

        public async Task ReindexAllAsync()
        {
            var problems = await _context.Problems.ToListAsync();
            foreach (var problem in problems) await IndexProblemAsync(problem);
        }
    }
}