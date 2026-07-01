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
    /// <summary>
    /// Implementation of IMeiliSearchService using the official Meilisearch .NET client.
    /// Handles full-text search, filtering, and pagination for Math Problems.
    /// </summary>
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
        private readonly bool _enabled; // NEW

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

            _enabled = configuration.GetValue<bool>("Meilisearch:Enabled"); // NEW

            if (!_enabled)
            {
                _logger.LogInformation("Meilisearch is disabled. All search operations will be no-ops.");
                return; // NEW - skip initialization if disabled
            }

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
            if (!_enabled) return false; // NEW

            if (maxRetries == -1) maxRetries = _maxRetries;

            for (int i = 0; i < maxRetries; i++)
            {
                try
                {
                    var health = await _client.HealthAsync();

                    if (health.Status == "available")
                    {
                        _logger.LogInformation("Meilisearch is available and ready.");
                        return true;
                    }
                }
                catch (HttpRequestException ex) when (ex.StatusCode == HttpStatusCode.ServiceUnavailable)
                {
                    _logger.LogWarning("Meilisearch service is sleeping (HTTP 503). Attempt {Attempt}/{Max}.",
                        i + 1, maxRetries);
                }
                catch (Exception ex)
                {
                    var delay = TimeSpan.FromSeconds(Math.Pow(2, Math.Min(i, 5)));

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
        // Ensure index is initialized only once (thread-safe)
        // -----------------------------------------------
        private async Task EnsureIndexInitializedAsync()
        {
            if (!_enabled) return; // NEW
            if (_initialized) return;

            await _initLock.WaitAsync();
            try
            {
                if (_initialized) return;

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
            if (!_enabled) return; // NEW

            try
            {
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
                var task1 = await index.UpdateSearchableAttributesAsync(new[]
                {
                    "titleAr",
                    "titleEn",
                    "questionTextAr",
                    "questionTextEn"
                });
                await index.WaitForTaskAsync(task1.TaskUid);

                var task2 = await index.UpdateFilterableAttributesAsync(new[]
                {
                    "categoryId",
                    "stageId"
                });
                await index.WaitForTaskAsync(task2.TaskUid);

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
            if (!_enabled) return; // NEW
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
        // Search problems and return matching problem IDs (Legacy method)
        // -----------------------------------------------
        public async Task<List<int>> SearchAsync(
            string query,
            int? categoryId = null,
            int? stageId = null)
        {
            if (!_enabled) return new List<int>(); // NEW

            var (ids, _) = await SearchWithPaginationAsync(query, categoryId, stageId, 1, 1000);
            return ids;
        }

        // -----------------------------------------------
        // Search problems with pagination support
        // -----------------------------------------------
        public async Task<(List<int> Ids, int TotalCount)> SearchWithPaginationAsync(
            string query,
            int? categoryId = null,
            int? stageId = null,
            int page = 1,
            int pageSize = 10)
        {
            if (!_enabled) return (new List<int>(), 0); // NEW

            try
            {
                await EnsureIndexInitializedAsync();

                var index = _client.Index(_indexName);

                var filters = new List<string>();

                if (categoryId.HasValue)
                {
                    filters.Add($"categoryId = {categoryId.Value}");
                }

                if (stageId.HasValue)
                {
                    filters.Add($"stageId = {stageId.Value}");
                }

                var searchQuery = new SearchQuery
                {
                    HitsPerPage = pageSize,
                    Page = page,
                    Filter = filters.Any() ? string.Join(" AND ", filters) : null,
                    AttributesToRetrieve = new[] { "id" }
                };

                var result = await index.SearchAsync<MeiliProblemDocument>(
                    string.IsNullOrWhiteSpace(query) ? "*" : query,
                    searchQuery);

                if (result is not PaginatedSearchResult<MeiliProblemDocument> paginatedResult)
                {
                    _logger.LogWarning("Search result is not a PaginatedSearchResult. Returning empty results.");
                    return (new List<int>(), 0);
                }

                var ids = paginatedResult.Hits.Select(x => x.Id).ToList();
                var totalCount = (int)paginatedResult.TotalHits;

                _logger.LogDebug("Search query '{Query}' (Page {Page}, Size {PageSize}) returned {Count} of {Total} results.",
                    query ?? "*", page, pageSize, ids.Count, totalCount);

                return (ids, totalCount);
            }
            catch (MeilisearchTimeoutError ex)
            {
                _logger.LogWarning(ex, "Search timed out for query '{Query}'. Meilisearch may be waking up.", query);
                return (new List<int>(), 0);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Search failed for query '{Query}'.", query);
                return (new List<int>(), 0);
            }
        }

        // -----------------------------------------------
        // Update an existing problem (upsert operation)
        // -----------------------------------------------
        public async Task UpdateProblemAsync(MathProblem problem)
        {
            if (!_enabled) return; // NEW
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
                _logger.LogWarning(ex, "Failed to update problem {ProblemId} in Meilisearch. The problem was saved to database but search may be outdated.", problem.Id);
            }
        }

        // -----------------------------------------------
        // Delete a problem by ID from search index
        // -----------------------------------------------
        public async Task DeleteProblemAsync(int id)
        {
            if (!_enabled) return; // NEW

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
                _logger.LogWarning(ex, "Failed to delete problem {ProblemId} from Meilisearch.", id);
            }
        }

        // -----------------------------------------------
        // Reindex all problems from database (full sync)
        // -----------------------------------------------
        public async Task ReindexAllAsync()
        {
            if (!_enabled) return; // NEW

            _initialized = false;
            await EnsureIndexInitializedAsync();

            var index = _client.Index(_indexName);

            var problems = await _context.Problems.AsNoTracking().ToListAsync();

            if (!problems.Any())
            {
                _logger.LogInformation("No problems found in database to reindex.");
                return;
            }

            var documents = problems.Select(BuildDocument).ToList();

            try
            {
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
            CategoryId = problem.CategoryId,
            StageId = problem.StageId,
            ViewsCount = problem.ViewsCount,
            Points = problem.Points,
            CreatedAt = problem.CreatedAt
        };

        // -----------------------------------------------
        // Strongly-typed document model for Meilisearch
        // -----------------------------------------------
        private class MeiliProblemDocument
        {
            public int Id { get; set; }
            public string TitleAr { get; set; } = string.Empty;
            public string TitleEn { get; set; } = string.Empty;
            public string QuestionTextAr { get; set; } = string.Empty;
            public string QuestionTextEn { get; set; } = string.Empty;
            public int CategoryId { get; set; }
            public int StageId { get; set; }
            public int ViewsCount { get; set; }
            public int Points { get; set; }
            public DateTime CreatedAt { get; set; }
        }
    }

    // -----------------------------------------------
    // Custom exception for search service errors
    // -----------------------------------------------
    public class ServiceException : Exception
    {
        public ServiceException(string message, Exception? innerException = null)
            : base(message, innerException) { }

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

            return translations?.GetValueOrDefault("en") ?? "An unexpected error occurred.";
        }
    }
}