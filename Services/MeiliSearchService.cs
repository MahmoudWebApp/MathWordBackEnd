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
        private readonly ILogger<MeiliSearchService> _logger;
        private readonly string _indexName = "math_problems";
        private readonly string _meiliUrl;

        // Initialize index only once per service lifetime
        private static bool _initialized = false;
        private static readonly SemaphoreSlim _initLock = new SemaphoreSlim(1, 1);

        public MeiliSearchService(
            AppDbContext context,
            IConfiguration configuration,
            ILogger<MeiliSearchService> logger)
        {
            _context = context;
            _logger = logger;

            _meiliUrl = configuration["Meilisearch:Url"] ?? "http://localhost:7700";

            var meiliKey = configuration["Meilisearch:ApiKey"] ?? "masterKey";

            _client = new MeilisearchClient(_meiliUrl, meiliKey);
        }

        // -----------------------------------------------
        // Wait for Meilisearch to wake up (Render cold start)
        // -----------------------------------------------
        private async Task WaitForMeilisearchAsync(int maxRetries = 6)
        {
            for (int i = 0; i < maxRetries; i++)
            {
                try
                {
                    var health = await _client.HealthAsync();
                    if (health.Status == "available")
                    {
                        _logger.LogInformation("Meilisearch is available.");
                        return;
                    }
                }
                catch (Exception ex)
                {
                    var delay = TimeSpan.FromSeconds(Math.Pow(2, i)); // 1s, 2s, 4s, 8s...
                    _logger.LogWarning(
                        "Meilisearch not ready (attempt {Attempt}/{Max}). Retrying in {Delay}s... Error: {Error}",
                        i + 1, maxRetries, delay.TotalSeconds, ex.Message);

                    await Task.Delay(delay);
                }
            }

            throw new Exception("Meilisearch is unavailable after multiple retries. It may still be waking up on Render.");
        }

        // -----------------------------------------------
        // Ensure index is initialized only once
        // -----------------------------------------------
        private async Task EnsureIndexInitializedAsync()
        {
            if (_initialized) return;

            await _initLock.WaitAsync();
            try
            {
                if (_initialized) return;

                // Wait for Meilisearch to be ready before doing anything
                await WaitForMeilisearchAsync();
                await InitializeIndexAsync();
                _initialized = true;
            }
            finally
            {
                _initLock.Release();
            }
        }

        // -----------------------------------------------
        // Create index and apply all settings
        // -----------------------------------------------
        private async Task InitializeIndexAsync()
        {
            try
            {
                await _client.CreateIndexAsync(_indexName, "id");
            }
            catch (MeilisearchApiError ex) when (ex.Code == "index_already_exists")
            {
                _logger.LogDebug("Index '{Index}' already exists, skipping creation.", _indexName);
            }

            var index = _client.Index(_indexName);

            // Wait for each settings task to fully apply before continuing
            var t1 = await index.UpdateSearchableAttributesAsync(new[]
            {
                "titleAr",
                "titleEn",
                "questionTextAr",
                "questionTextEn",
                "latexCode"
            });
            await index.WaitForTaskAsync(t1.TaskUid);

            var t2 = await index.UpdateFilterableAttributesAsync(new[]
            {
                "categoryId",
                "difficulty"
            });
            await index.WaitForTaskAsync(t2.TaskUid);

            var t3 = await index.UpdateSortableAttributesAsync(new[]
            {
                "viewsCount",
                "points",
                "createdAt"
            });
            await index.WaitForTaskAsync(t3.TaskUid);

            _logger.LogInformation("Meilisearch index '{Index}' initialized.", _indexName);
        }

        // -----------------------------------------------
        // Index a single new problem
        // -----------------------------------------------
        public async Task IndexProblemAsync(MathProblem problem)
        {
            await EnsureIndexInitializedAsync();

            var index = _client.Index(_indexName);
            var task = await index.AddDocumentsAsync(new[] { BuildDocument(problem) });
            await index.WaitForTaskAsync(task.TaskUid);
        }

        // -----------------------------------------------
        // Search problems and return matching IDs
        // -----------------------------------------------
        public async Task<List<int>> SearchAsync(
            string query,
            int? categoryId = null,
            string? difficulty = null)
        {
            try
            {
                await EnsureIndexInitializedAsync();

                var index = _client.Index(_indexName);

                var filters = new List<string>();

                if (categoryId.HasValue)
                    filters.Add($"categoryId = {categoryId.Value}");

                if (!string.IsNullOrWhiteSpace(difficulty))
                    filters.Add($"difficulty = \"{difficulty}\"");

                var searchQuery = new SearchQuery
                {
                    Limit = 100,
                    Offset = 0,
                    Filter = filters.Any()
                        ? string.Join(" AND ", filters)
                        : null
                };

                // Use strongly-typed model instead of dynamic to avoid cast errors
                var result = await index.SearchAsync<MeiliProblemDocument>(query, searchQuery);

                return result.Hits.Select(x => x.Id).ToList();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Search failed for query '{Query}'.", query);
                return new List<int>();
            }
        }

        // -----------------------------------------------
        // Update an existing problem (upsert)
        // -----------------------------------------------
        public async Task UpdateProblemAsync(MathProblem problem)
        {
            try
            {
                await EnsureIndexInitializedAsync();

                var index = _client.Index(_indexName);
                var task = await index.UpdateDocumentsAsync(new[] { BuildDocument(problem) });
                await index.WaitForTaskAsync(task.TaskUid);
            }
            catch (Exception ex)
            {
                // Non-critical: do not break the HTTP response if update fails
                _logger.LogWarning(ex, "Failed to update problem {Id} in Meilisearch.", problem.Id);
            }
        }

        // -----------------------------------------------
        // Delete a problem by ID
        // -----------------------------------------------
        public async Task DeleteProblemAsync(int id)
        {
            await EnsureIndexInitializedAsync();

            var index = _client.Index(_indexName);
            var task = await index.DeleteOneDocumentAsync(id.ToString());
            await index.WaitForTaskAsync(task.TaskUid);
        }

        // -----------------------------------------------
        // Reindex all problems from the database
        // -----------------------------------------------
        public async Task ReindexAllAsync()
        {
            // Force re-initialization so settings are reapplied
            _initialized = false;
            await EnsureIndexInitializedAsync();

            var index = _client.Index(_indexName);

            var problems = await _context.Problems.ToListAsync();

            if (!problems.Any())
            {
                _logger.LogInformation("No problems found to reindex.");
                return;
            }

            var documents = problems.Select(BuildDocument).ToList();

            var task = await index.AddDocumentsAsync(documents);
            await index.WaitForTaskAsync(task.TaskUid);

            _logger.LogInformation("Reindexed {Count} problems.", documents.Count);
        }

        // -----------------------------------------------
        // Build Meilisearch document from MathProblem model
        // -----------------------------------------------
        private static MeiliProblemDocument BuildDocument(MathProblem problem) => new()
        {
            Id = problem.Id,
            TitleAr = problem.TitleAr,
            TitleEn = problem.TitleEn,
            QuestionTextAr = problem.QuestionTextAr,
            QuestionTextEn = problem.QuestionTextEn,
            LatexCode = problem.LatexCode,
            CategoryId = problem.CategoryId,
            Difficulty = problem.Difficulty,
            ViewsCount = problem.ViewsCount,
            Points = problem.Points,
            CreatedAt = problem.CreatedAt
        };

        // -----------------------------------------------
        // Strongly-typed document model (avoids dynamic cast errors)
        // -----------------------------------------------
        private class MeiliProblemDocument
        {
            public int Id { get; set; }
            public string TitleAr { get; set; } = string.Empty;
            public string TitleEn { get; set; } = string.Empty;
            public string QuestionTextAr { get; set; } = string.Empty;
            public string QuestionTextEn { get; set; } = string.Empty;
            public string? LatexCode { get; set; }
            public int CategoryId { get; set; }
            public string Difficulty { get; set; } = string.Empty;
            public int ViewsCount { get; set; }
            public int Points { get; set; }
            public DateTime CreatedAt { get; set; }
        }
    }
}