// =============================================
// File: Services/MeiliSearchService.cs
// =============================================

using Meilisearch;
using Microsoft.EntityFrameworkCore;
using MathWorldAPI.Data;
using MathWorldAPI.Models;
using System.Net;
using System.Text.Json;

namespace MathWorldAPI.Services
{
    public class MeiliSearchService : IMeiliSearchService
    {
        private readonly MeilisearchClient _client;
        private readonly AppDbContext _context;
        private readonly ILogger<MeiliSearchService> _logger;
        private readonly IConfiguration _configuration;
        private readonly string _indexName = "math_problems";
        private readonly string _meiliUrl;
        private readonly int _maxRetries;
        private readonly int _retryDelaySeconds;

        // Initialize index only once per service lifetime (thread-safe)
        private static bool _initialized = false;
        private static readonly SemaphoreSlim _initLock = new SemaphoreSlim(1, 1);

        public MeiliSearchService(
            AppDbContext context,
            IConfiguration configuration,
            ILogger<MeiliSearchService> logger)
        {
            _context = context;
            _logger = logger;
            _configuration = configuration;

            _meiliUrl = configuration["Meilisearch:Url"] ?? "http://localhost:7700";
            var meiliKey = configuration["Meilisearch:ApiKey"] ?? "masterKey";
            _maxRetries = configuration.GetValue<int>("Meilisearch:MaxRetries", 6);
            _retryDelaySeconds = configuration.GetValue<int>("Meilisearch:RetryDelaySeconds", 2);

            _client = new MeilisearchClient(_meiliUrl, meiliKey);
        }

        // -----------------------------------------------
        // Wait for Meilisearch to wake up (Render cold start handling)
        // -----------------------------------------------
        private async Task<bool> WaitForMeilisearchAsync(int maxRetries = -1)
        {
            if (maxRetries == -1) maxRetries = _maxRetries;

            for (int i = 0; i < maxRetries; i++)
            {
                try
                {
                    // Attempt to get health status from Meilisearch
                    var health = await _client.HealthAsync();

                    if (health.Status == "available")
                    {
                        _logger.LogInformation("Meilisearch is available and ready.");
                        return true;
                    }
                }
                catch (HttpRequestException ex) when (ex.StatusCode == HttpStatusCode.ServiceUnavailable)
                {
                    // Render returned 503 - service is sleeping
                    _logger.LogWarning("Meilisearch service is sleeping (HTTP 503). Attempt {Attempt}/{Max}.",
                        i + 1, maxRetries);
                }
                catch (Exception ex)
                {
                    // Handle connection errors, timeouts, or HTML responses
                    var delay = TimeSpan.FromSeconds(Math.Pow(2, Math.Min(i, 5))); // Exponential backoff: 1s, 2s, 4s, 8s, 16s, 32s (cap at 32s)

                    _logger.LogWarning(
                        "Meilisearch not ready (attempt {Attempt}/{Max}). Retrying in {Delay}s... Error: {Error}",
                        i + 1, maxRetries, delay.TotalSeconds, ex.Message);

                    await Task.Delay(delay);
                    continue;
                }
            }

            _logger.LogError("Meilisearch is unavailable after {MaxRetries} retries. Service may still be waking up on Render.", maxRetries);
            return false;
        }

        // -----------------------------------------------
        // Check if response is valid JSON (not HTML sleep page)
        // -----------------------------------------------
        private static bool IsValidJsonResponse(string content)
        {
            if (string.IsNullOrWhiteSpace(content)) return false;

            var trimmed = content.TrimStart();
            return trimmed.StartsWith("{") || trimmed.StartsWith("[");
        }

        // -----------------------------------------------
        // Ensure index is initialized only once (thread-safe)
        // -----------------------------------------------
        private async Task EnsureIndexInitializedAsync()
        {
            if (_initialized) return;

            await _initLock.WaitAsync();
            try
            {
                // Double-check after acquiring lock
                if (_initialized) return;

                // Wait for Meilisearch to be ready before initialization
                bool isReady = await WaitForMeilisearchAsync();
                if (!isReady)
                {
                    throw new InvalidOperationException(
                        "Meilisearch service is not available. Please check your Render deployment or try again later.");
                }

                await InitializeIndexAsync();
                _initialized = true;

                _logger.LogInformation("Meilisearch index '{IndexName}' has been initialized successfully.", _indexName);
            }
            finally
            {
                _initLock.Release();
            }
        }

        // -----------------------------------------------
        // Create index and apply all search settings
        // -----------------------------------------------
        private async Task InitializeIndexAsync()
        {
            try
            {
                // Attempt to create index (ignore if already exists)
                await _client.CreateIndexAsync(_indexName, "id");
            }
            catch (MeilisearchApiError ex) when (ex.Code == "index_already_exists")
            {
                _logger.LogDebug("Index '{IndexName}' already exists. Skipping creation.", _indexName);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Failed to create Meilisearch index '{IndexName}'.", _indexName);
                throw;
            }

            var index = _client.Index(_indexName);

            try
            {
                // Update searchable attributes (fields used for text search)
                var task1 = await index.UpdateSearchableAttributesAsync(new[]
                {
                    "titleAr",
                    "titleEn",
                    "questionTextAr",
                    "questionTextEn",
                    "latexCode"
                });
                await index.WaitForTaskAsync(task1.TaskUid);

                // Update filterable attributes (fields used for filtering)
                var task2 = await index.UpdateFilterableAttributesAsync(new[]
                {
                    "categoryId",
                    "difficulty"
                });
                await index.WaitForTaskAsync(task2.TaskUid);

                // Update sortable attributes (fields used for sorting results)
                var task3 = await index.UpdateSortableAttributesAsync(new[]
                {
                    "viewsCount",
                    "points",
                    "createdAt"
                });
                await index.WaitForTaskAsync(task3.TaskUid);

                _logger.LogInformation("Meilisearch index '{IndexName}' settings have been configured.", _indexName);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Failed to configure settings for Meilisearch index '{IndexName}'.", _indexName);
                throw;
            }
        }

        // -----------------------------------------------
        // Index a single new math problem
        // -----------------------------------------------
        public async Task IndexProblemAsync(MathProblem problem)
        {
            if (problem == null)
            {
                _logger.LogWarning("Attempted to index a null problem.");
                return;
            }

            await EnsureIndexInitializedAsync();

            try
            {
                var index = _client.Index(_indexName);
                var document = BuildDocument(problem);

                var task = await index.AddDocumentsAsync(new[] { document });
                await index.WaitForTaskAsync(task.TaskUid);

                _logger.LogDebug("Problem {ProblemId} has been indexed successfully.", problem.Id);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Failed to index problem {ProblemId}.", problem.Id);
                throw new ServiceException(
                    message: "Failed to index the problem in search service. Please try again.",
                    innerException: ex);
            }
        }

        // -----------------------------------------------
        // Search problems and return matching problem IDs
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

                // Build filter string based on provided parameters
                var filters = new List<string>();

                if (categoryId.HasValue)
                {
                    filters.Add($"categoryId = {categoryId.Value}");
                }

                if (!string.IsNullOrWhiteSpace(difficulty))
                {
                    filters.Add($"difficulty = \"{difficulty}\"");
                }

                var searchQuery = new SearchQuery
                {
                    Limit = 100,
                    Offset = 0,
                    Filter = filters.Any() ? string.Join(" AND ", filters) : null,
                    AttributesToRetrieve = new[] { "id" } // Optimize: only retrieve ID field
                };

                // Execute search with strongly-typed model to avoid casting errors
                var result = await index.SearchAsync<MeiliProblemDocument>(
                    string.IsNullOrWhiteSpace(query) ? "*" : query,
                    searchQuery);

                _logger.LogDebug("Search query '{Query}' returned {Count} results.",
                    query ?? "*", result.Hits.Count);

                return result.Hits.Select(x => x.Id).ToList();
            }
            catch (MeilisearchTimeoutError ex)
            {
                _logger.LogWarning(ex, "Search timed out for query '{Query}'. Meilisearch may be waking up.", query);
                // Return empty list instead of crashing - graceful degradation
                return new List<int>();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Search failed for query '{Query}'.", query);
                // Return empty list to avoid breaking the user experience
                return new List<int>();
            }
        }

        // -----------------------------------------------
        // Update an existing problem (upsert operation)
        // -----------------------------------------------
        public async Task UpdateProblemAsync(MathProblem problem)
        {
            if (problem == null)
            {
                _logger.LogWarning("Attempted to update a null problem.");
                return;
            }

            try
            {
                await EnsureIndexInitializedAsync();

                var index = _client.Index(_indexName);
                var document = BuildDocument(problem);

                var task = await index.UpdateDocumentsAsync(new[] { document });
                await index.WaitForTaskAsync(task.TaskUid);

                _logger.LogDebug("Problem {ProblemId} has been updated in search index.", problem.Id);
            }
            catch (Exception ex)
            {
                // Non-critical: do not break the HTTP response if search update fails
                _logger.LogWarning(ex, "Failed to update problem {ProblemId} in Meilisearch. The problem was saved to database but search may be outdated.", problem.Id);
            }
        }

        // -----------------------------------------------
        // Delete a problem by ID from search index
        // -----------------------------------------------
        public async Task DeleteProblemAsync(int id)
        {
            try
            {
                await EnsureIndexInitializedAsync();

                var index = _client.Index(_indexName);
                var task = await index.DeleteOneDocumentAsync(id.ToString());
                await index.WaitForTaskAsync(task.TaskUid);

                _logger.LogDebug("Problem {ProblemId} has been deleted from search index.", id);
            }
            catch (Exception ex)
            {
                // Non-critical: log warning but do not crash
                _logger.LogWarning(ex, "Failed to delete problem {ProblemId} from Meilisearch.", id);
            }
        }

        // -----------------------------------------------
        // Reindex all problems from database (full sync)
        // -----------------------------------------------
        public async Task ReindexAllAsync()
        {
            // Force re-initialization to reapply settings
            _initialized = false;
            await EnsureIndexInitializedAsync();

            var index = _client.Index(_indexName);

            // Fetch all problems from database
            var problems = await _context.Problems.AsNoTracking().ToListAsync();

            if (!problems.Any())
            {
                _logger.LogInformation("No problems found in database to reindex.");
                return;
            }

            // Convert to Meilisearch documents
            var documents = problems.Select(BuildDocument).ToList();

            try
            {
                // Batch add documents to index
                var task = await index.AddDocumentsAsync(documents);
                await index.WaitForTaskAsync(task.TaskUid);

                _logger.LogInformation("Successfully reindexed {Count} problems into Meilisearch.", documents.Count);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Failed to reindex problems into Meilisearch.");
                throw new ServiceException(
                    message: "Failed to synchronize search index. Please try again later.",
                    innerException: ex);
            }
        }

        // -----------------------------------------------
        // Convert MathProblem entity to Meilisearch document
        // -----------------------------------------------
        private static MeiliProblemDocument BuildDocument(MathProblem problem) => new()
        {
            Id = problem.Id,
            TitleAr = problem.TitleAr ?? string.Empty,
            TitleEn = problem.TitleEn ?? string.Empty,
            QuestionTextAr = problem.QuestionTextAr ?? string.Empty,
            QuestionTextEn = problem.QuestionTextEn ?? string.Empty,
            LatexCode = problem.LatexCode,
            CategoryId = problem.CategoryId,
            Difficulty = problem.Difficulty ?? string.Empty,
            ViewsCount = problem.ViewsCount,
            Points = problem.Points,
            CreatedAt = problem.CreatedAt
        };

        // -----------------------------------------------
        // Strongly-typed document model for Meilisearch
        // Prevents runtime casting errors with dynamic objects
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

    // -----------------------------------------------
    // Custom exception for search service errors
    // Provides localized error messages for API responses
    // -----------------------------------------------
    public class ServiceException : Exception
    {
        public ServiceException(string message, Exception? innerException = null)
            : base(message, innerException) { }

        // Get localized error message based on language preference
        public static string GetLocalizedErrorMessage(string key, string language = "en")
        {
            var messages = new Dictionary<string, Dictionary<string, string>>
            {
                {
                    "SearchUnavailable", new Dictionary<string, string>
                    {
                        { "en", "Search service is temporarily unavailable. Please try again in a moment." },
                        { "ar", "خدمة البحث غير متاحة مؤقتاً. يرجى المحاولة مرة أخرى بعد لحظات." }
                    }
                },
                {
                    "IndexingFailed", new Dictionary<string, string>
                    {
                        { "en", "Failed to update search index. Your data is saved but may not appear in search results immediately." },
                        { "ar", "فشل تحديث فهرس البحث. تم حفظ بياناتك ولكن قد لا تظهر في نتائج البحث فوراً." }
                    }
                },
                {
                    "ReindexFailed", new Dictionary<string, string>
                    {
                        { "en", "Failed to synchronize search index. Please contact support if the issue persists." },
                        { "ar", "فشل مزامنة فهرس البحث. يرجى التواصل مع الدعم إذا استمرت المشكلة." }
                    }
                }
            };

            if (messages.TryGetValue(key, out var translations) &&
                translations.TryGetValue(language, out var message))
            {
                return message;
            }

            // Fallback to English
            return translations?.GetValueOrDefault("en") ?? "An unexpected error occurred.";
        }
    }
}