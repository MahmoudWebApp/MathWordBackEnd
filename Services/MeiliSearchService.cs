// File: MathWorldAPI/Services/MeiliSearchService.cs

using System.Net;
using MathWorldAPI.Data;
using MathWorldAPI.Models;
using Meilisearch;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Services
{
    /// <summary>
    /// Implements IMeiliSearchService using the official MeiliSearch
    /// .NET client. Handles indexing, updating, deleting, full-text
    /// search, filtering, pagination, retries, and complete reindexing.
    /// </summary>
    public sealed class MeiliSearchService : IMeiliSearchService
    {
        private readonly MeilisearchClient? _client;
        private readonly AppDbContext _context;
        private readonly ILogger<MeiliSearchService> _logger;
        private readonly IConfiguration _configuration;

        private readonly string _indexName;
        private readonly string _meiliUrl;
        private readonly int _maxRetries;
        private readonly int _retryDelaySeconds;
        private readonly bool _enabled;

        // Initialize the index only once during the application lifetime.
        private static volatile bool _initialized;

        // Protect index initialization from concurrent requests.
        private static readonly SemaphoreSlim _initLock =
            new(1, 1);

        /// <summary>
        /// Initializes a new instance of the MeiliSearchService.
        /// </summary>
        /// <param name="context">
        /// Application database context.
        /// </param>
        /// <param name="configuration">
        /// Application configuration containing MeiliSearch settings.
        /// </param>
        /// <param name="logger">
        /// Application logger.
        /// </param>
        public MeiliSearchService(
            AppDbContext context,
            IConfiguration configuration,
            ILogger<MeiliSearchService> logger)
        {
            _context = context;
            _configuration = configuration;
            _logger = logger;

            _enabled =
                configuration.GetValue<bool>(
                    "Meilisearch:Enabled");

            _meiliUrl =
                configuration["Meilisearch:Url"]?
                    .Trim()
                ?? string.Empty;

            _indexName =
                configuration["Meilisearch:IndexName"]?
                    .Trim()
                ?? "math_problems";

            _maxRetries =
                Math.Clamp(
                    configuration.GetValue<int?>(
                        "Meilisearch:MaxRetries")
                    ?? 6,
                    1,
                    20);

            _retryDelaySeconds =
                Math.Clamp(
                    configuration.GetValue<int?>(
                        "Meilisearch:RetryDelaySeconds")
                    ?? 2,
                    1,
                    30);

            if (!_enabled)
            {
                _logger.LogInformation(
                    "MeiliSearch is disabled. Search indexing operations will be skipped.");

                Console.WriteLine(
                    "MeiliSearch integration is disabled.");

                return;
            }

            if (string.IsNullOrWhiteSpace(
                    _meiliUrl))
            {
                throw new InvalidOperationException(
                    "Meilisearch:Url is not configured.");
            }

            var meiliKey =
                configuration["Meilisearch:ApiKey"]?
                    .Trim()
                ?? string.Empty;

            _client =
                new MeilisearchClient(
                    _meiliUrl,
                    meiliKey);

            _logger.LogInformation(
                "MeiliSearch client initialized for {MeiliSearchUrl} using index {IndexName}.",
                _meiliUrl,
                _indexName);

            Console.WriteLine(
                $"MeiliSearch initialized: {_meiliUrl}, Index: {_indexName}");
        }

        /// <summary>
        /// Adds a problem to the MeiliSearch index.
        /// </summary>
        /// <param name="problem">
        /// Problem to index.
        /// </param>
        public async Task IndexProblemAsync(
            MathProblem problem)
        {
            if (!_enabled)
            {
                return;
            }

            ArgumentNullException.ThrowIfNull(problem);

            await EnsureIndexInitializedAsync();

            try
            {
                var index =
                    GetRequiredClient().Index(
                        _indexName);

                var document =
                    BuildDocument(problem);

                var task =
                    await index.AddDocumentsAsync(
                        new[]
                        {
                            document
                        });

                await index.WaitForTaskAsync(
                    task.TaskUid);

                _logger.LogInformation(
                    "Problem {ProblemId} was indexed successfully.",
                    problem.Id);
            }
            catch (Exception exception)
            {
                _logger.LogError(
                    exception,
                    "Failed to index problem {ProblemId}.",
                    problem.Id);

                throw new ServiceException(
                    "Failed to index the problem in the search service.",
                    exception);
            }
        }

        /// <summary>
        /// Searches for matching problem IDs.
        /// This method is kept for backward compatibility.
        /// </summary>
        public async Task<List<int>> SearchAsync(
            string query,
            int? categoryId = null,
            int? stageId = null)
        {
            if (!_enabled)
            {
                return new List<int>();
            }

            var (ids, _) =
                await SearchWithPaginationAsync(
                    query,
                    categoryId,
                    stageId,
                    page: 1,
                    pageSize: 1000);

            return ids;
        }

        /// <summary>
        /// Searches for problem IDs with pagination and filtering.
        /// </summary>
        public async Task<(
            List<int> Ids,
            int TotalCount)> SearchWithPaginationAsync(
            string query,
            int? categoryId = null,
            int? stageId = null,
            int page = 1,
            int pageSize = 10)
        {
            if (!_enabled)
            {
                return (
                    new List<int>(),
                    0);
            }

            page =
                Math.Max(1, page);

            pageSize =
                Math.Clamp(
                    pageSize,
                    1,
                    100);

            try
            {
                await EnsureIndexInitializedAsync();

                var index =
                    GetRequiredClient().Index(
                        _indexName);

                var filters =
                    new List<string>();

                if (categoryId.HasValue)
                {
                    filters.Add(
                        $"categoryId = {categoryId.Value}");
                }

                if (stageId.HasValue)
                {
                    filters.Add(
                        $"stageId = {stageId.Value}");
                }

                var searchQuery =
                    new SearchQuery
                    {
                        HitsPerPage =
                            pageSize,

                        Page =
                            page,

                        Filter =
                            filters.Count > 0
                                ? string.Join(
                                    " AND ",
                                    filters)
                                : null,

                        AttributesToRetrieve =
                            new[]
                            {
                                "id"
                            }
                    };

                // An empty query returns all indexed documents.
                var normalizedQuery =
                    string.IsNullOrWhiteSpace(query)
                        ? string.Empty
                        : query.Trim();

                var result =
                    await index.SearchAsync<
                        MeiliProblemDocument>(
                        normalizedQuery,
                        searchQuery);

                if (result is not
                    PaginatedSearchResult<
                        MeiliProblemDocument>
                    paginatedResult)
                {
                    _logger.LogWarning(
                        "MeiliSearch returned a non-paginated result.");

                    return (
                        new List<int>(),
                        0);
                }

                var ids =
                    paginatedResult.Hits
                        .Select(hit => hit.Id)
                        .ToList();

                var totalCount =
                    Convert.ToInt32(
                        paginatedResult.TotalHits);

                _logger.LogInformation(
                    "MeiliSearch query '{Query}' page {Page} returned {Count} of {Total} results.",
                    normalizedQuery,
                    page,
                    ids.Count,
                    totalCount);

                return (
                    ids,
                    totalCount);
            }
            catch (MeilisearchTimeoutError exception)
            {
                _logger.LogWarning(
                    exception,
                    "MeiliSearch timed out for query '{Query}'. The service may be waking up.",
                    query);

                return (
                    new List<int>(),
                    0);
            }
            catch (Exception exception)
            {
                _logger.LogError(
                    exception,
                    "MeiliSearch failed for query '{Query}'.",
                    query);

                return (
                    new List<int>(),
                    0);
            }
        }

        /// <summary>
        /// Updates an existing problem in the MeiliSearch index.
        /// </summary>
        public async Task UpdateProblemAsync(
            MathProblem problem)
        {
            if (!_enabled)
            {
                return;
            }

            ArgumentNullException.ThrowIfNull(problem);

            try
            {
                await EnsureIndexInitializedAsync();

                var index =
                    GetRequiredClient().Index(
                        _indexName);

                var document =
                    BuildDocument(problem);

                var task =
                    await index.UpdateDocumentsAsync(
                        new[]
                        {
                            document
                        });

                await index.WaitForTaskAsync(
                    task.TaskUid);

                _logger.LogInformation(
                    "Problem {ProblemId} was updated in the MeiliSearch index.",
                    problem.Id);
            }
            catch (Exception exception)
            {
                // Search indexing is non-critical. PostgreSQL remains
                // the source of truth for problem information.
                _logger.LogWarning(
                    exception,
                    "Failed to update problem {ProblemId} in MeiliSearch. PostgreSQL remains updated.",
                    problem.Id);
            }
        }

        /// <summary>
        /// Deletes a problem from the MeiliSearch index.
        /// </summary>
        public async Task DeleteProblemAsync(
            int id)
        {
            if (!_enabled)
            {
                return;
            }

            if (id <= 0)
            {
                return;
            }

            try
            {
                await EnsureIndexInitializedAsync();

                var index =
                    GetRequiredClient().Index(
                        _indexName);

                var task =
                    await index.DeleteOneDocumentAsync(
                        id.ToString());

                await index.WaitForTaskAsync(
                    task.TaskUid);

                _logger.LogInformation(
                    "Problem {ProblemId} was deleted from the MeiliSearch index.",
                    id);
            }
            catch (Exception exception)
            {
                _logger.LogWarning(
                    exception,
                    "Failed to delete problem {ProblemId} from MeiliSearch.",
                    id);
            }
        }

        /// <summary>
        /// Deletes the current index documents and rebuilds the complete
        /// problem index from PostgreSQL.
        /// </summary>
        public async Task ReindexAllAsync()
        {
            if (!_enabled)
            {
                return;
            }

            _initialized = false;

            await EnsureIndexInitializedAsync();

            var index =
                GetRequiredClient().Index(
                    _indexName);

            var problems =
                await _context.Problems
                    .AsNoTracking()
                    .ToListAsync();

            try
            {
                var deleteTask =
                    await index.DeleteAllDocumentsAsync();

                await index.WaitForTaskAsync(
                    deleteTask.TaskUid);

                if (problems.Count == 0)
                {
                    _logger.LogInformation(
                        "The MeiliSearch index was cleared. No PostgreSQL problems were available for reindexing.");

                    return;
                }

                var documents =
                    problems
                        .Select(BuildDocument)
                        .ToList();

                var addTask =
                    await index.AddDocumentsAsync(
                        documents);

                await index.WaitForTaskAsync(
                    addTask.TaskUid);

                _logger.LogInformation(
                    "Successfully reindexed {ProblemCount} problems into MeiliSearch.",
                    documents.Count);

                Console.WriteLine(
                    $"MeiliSearch reindex completed. Problems: {documents.Count}");
            }
            catch (Exception exception)
            {
                _logger.LogError(
                    exception,
                    "Failed to reindex problems into MeiliSearch.");

                throw new ServiceException(
                    "Failed to synchronize the search index.",
                    exception);
            }
        }

        /// <summary>
        /// Waits for MeiliSearch to become available.
        /// This supports Render cold-start behavior.
        /// </summary>
        /// <param name="maxRetries">
        /// Optional retry count override.
        /// </param>
        /// <returns>
        /// True when MeiliSearch becomes available.
        /// </returns>
        private async Task<bool> WaitForMeilisearchAsync(
            int maxRetries = -1)
        {
            if (!_enabled)
            {
                return false;
            }

            var client =
                GetRequiredClient();

            var attempts =
                maxRetries > 0
                    ? maxRetries
                    : _maxRetries;

            for (var attempt = 0;
                 attempt < attempts;
                 attempt++)
            {
                try
                {
                    var health =
                        await client.HealthAsync();

                    if (string.Equals(
                            health.Status,
                            "available",
                            StringComparison.OrdinalIgnoreCase))
                    {
                        _logger.LogInformation(
                            "MeiliSearch is available and ready.");

                        return true;
                    }

                    _logger.LogWarning(
                        "MeiliSearch health status is {Status}. Attempt {Attempt}/{MaxAttempts}.",
                        health.Status,
                        attempt + 1,
                        attempts);
                }
                catch (HttpRequestException exception)
                    when (exception.StatusCode ==
                          HttpStatusCode.ServiceUnavailable)
                {
                    _logger.LogWarning(
                        "MeiliSearch is sleeping or unavailable with HTTP 503. Attempt {Attempt}/{MaxAttempts}.",
                        attempt + 1,
                        attempts);
                }
                catch (Exception exception)
                {
                    _logger.LogWarning(
                        exception,
                        "MeiliSearch is not ready. Attempt {Attempt}/{MaxAttempts}.",
                        attempt + 1,
                        attempts);
                }

                if (attempt < attempts - 1)
                {
                    var multiplier =
                        Math.Pow(
                            2,
                            Math.Min(attempt, 4));

                    var delaySeconds =
                        Math.Min(
                            _retryDelaySeconds *
                            multiplier,
                            30);

                    _logger.LogInformation(
                        "Retrying MeiliSearch in {DelaySeconds} seconds.",
                        delaySeconds);

                    await Task.Delay(
                        TimeSpan.FromSeconds(
                            delaySeconds));
                }
            }

            _logger.LogError(
                "MeiliSearch is unavailable after {MaxRetries} attempts.",
                attempts);

            return false;
        }

        /// <summary>
        /// Ensures the search index exists and has the required settings.
        /// Initialization is thread-safe and runs once per application.
        /// </summary>
        private async Task EnsureIndexInitializedAsync()
        {
            if (!_enabled ||
                _initialized)
            {
                return;
            }

            await _initLock.WaitAsync();

            try
            {
                if (_initialized)
                {
                    return;
                }

                var isReady =
                    await WaitForMeilisearchAsync();

                if (!isReady)
                {
                    throw new InvalidOperationException(
                        "MeiliSearch is not currently available.");
                }

                await InitializeIndexAsync();

                _initialized = true;

                _logger.LogInformation(
                    "MeiliSearch index '{IndexName}' was initialized successfully.",
                    _indexName);
            }
            finally
            {
                _initLock.Release();
            }
        }

        /// <summary>
        /// Creates the search index and applies searchable,
        /// filterable, and sortable attributes.
        /// </summary>
        private async Task InitializeIndexAsync()
        {
            if (!_enabled)
            {
                return;
            }

            var client =
                GetRequiredClient();

            try
            {
                await client.CreateIndexAsync(
                    _indexName,
                    "id");
            }
            catch (MeilisearchApiError exception)
                when (exception.Code ==
                      "index_already_exists")
            {
                _logger.LogDebug(
                    "MeiliSearch index '{IndexName}' already exists.",
                    _indexName);
            }
            catch (Exception exception)
            {
                _logger.LogError(
                    exception,
                    "Failed to create MeiliSearch index '{IndexName}'.",
                    _indexName);

                throw;
            }

            var index =
                client.Index(
                    _indexName);

            try
            {
                var searchableTask =
                    await index.UpdateSearchableAttributesAsync(
                        new[]
                        {
                            "titleAr",
                            "titleEn",
                            "questionTextAr",
                            "questionTextEn"
                        });

                await index.WaitForTaskAsync(
                    searchableTask.TaskUid);

                var filterableTask =
                    await index.UpdateFilterableAttributesAsync(
                        new[]
                        {
                            "categoryId",
                            "stageId"
                        });

                await index.WaitForTaskAsync(
                    filterableTask.TaskUid);

                var sortableTask =
                    await index.UpdateSortableAttributesAsync(
                        new[]
                        {
                            "viewsCount",
                            "points",
                            "createdAt"
                        });

                await index.WaitForTaskAsync(
                    sortableTask.TaskUid);

                _logger.LogInformation(
                    "MeiliSearch index '{IndexName}' settings were configured.",
                    _indexName);
            }
            catch (Exception exception)
            {
                _logger.LogError(
                    exception,
                    "Failed to configure MeiliSearch index '{IndexName}'.",
                    _indexName);

                throw;
            }
        }

        /// <summary>
        /// Returns the initialized MeiliSearch client.
        /// </summary>
        /// <exception cref="InvalidOperationException">
        /// Thrown when MeiliSearch is disabled or the client
        /// has not been initialized.
        /// </exception>
        private MeilisearchClient GetRequiredClient()
        {
            if (!_enabled)
            {
                throw new InvalidOperationException(
                    "MeiliSearch integration is disabled.");
            }

            return _client
                ?? throw new InvalidOperationException(
                    "MeiliSearch client is not initialized.");
        }

        /// <summary>
        /// Converts a MathProblem entity to a MeiliSearch document.
        /// </summary>
        private static MeiliProblemDocument BuildDocument(
            MathProblem problem)
        {
            return new MeiliProblemDocument
            {
                Id =
                    problem.Id,

                TitleAr =
                    problem.TitleAr
                    ?? string.Empty,

                TitleEn =
                    problem.TitleEn
                    ?? string.Empty,

                QuestionTextAr =
                    problem.QuestionTextAr
                    ?? string.Empty,

                QuestionTextEn =
                    problem.QuestionTextEn
                    ?? string.Empty,

                CategoryId =
                    problem.CategoryId,

                StageId =
                    problem.StageId,

                ViewsCount =
                    problem.ViewsCount,

                Points =
                    problem.Points,

                CreatedAt =
                    problem.CreatedAt
            };
        }

        /// <summary>
        /// Strongly typed document stored in MeiliSearch.
        /// </summary>
        private sealed class MeiliProblemDocument
        {
            /// <summary>
            /// Gets or sets the problem ID.
            /// </summary>
            public int Id { get; set; }

            /// <summary>
            /// Gets or sets the Arabic title.
            /// </summary>
            public string TitleAr { get; set; } =
                string.Empty;

            /// <summary>
            /// Gets or sets the English title.
            /// </summary>
            public string TitleEn { get; set; } =
                string.Empty;

            /// <summary>
            /// Gets or sets the Arabic question text.
            /// </summary>
            public string QuestionTextAr { get; set; } =
                string.Empty;

            /// <summary>
            /// Gets or sets the English question text.
            /// </summary>
            public string QuestionTextEn { get; set; } =
                string.Empty;

            /// <summary>
            /// Gets or sets the category ID.
            /// </summary>
            public int CategoryId { get; set; }

            /// <summary>
            /// Gets or sets the educational stage ID.
            /// </summary>
            public int StageId { get; set; }

            /// <summary>
            /// Gets or sets the problem view count.
            /// </summary>
            public int ViewsCount { get; set; }

            /// <summary>
            /// Gets or sets the problem points.
            /// </summary>
            public int Points { get; set; }

            /// <summary>
            /// Gets or sets the problem creation date.
            /// </summary>
            public DateTime CreatedAt { get; set; }
        }
    }

    /// <summary>
    /// Represents an error produced by the search integration.
    /// </summary>
    public class ServiceException : Exception
    {
        /// <summary>
        /// Initializes a new instance of the ServiceException.
        /// </summary>
        public ServiceException(
            string message,
            Exception? innerException = null)
            : base(
                message,
                innerException)
        {
        }

        /// <summary>
        /// Gets a localized search service error message.
        /// </summary>
        public static string GetLocalizedErrorMessage(
            string key,
            string language = "en")
        {
            var messages =
                new Dictionary<
                    string,
                    Dictionary<string, string>>
                {
                    {
                        "SearchUnavailable",
                        new Dictionary<string, string>
                        {
                            {
                                "en",
                                "Search service is temporarily unavailable. Please try again in a moment."
                            },
                            {
                                "ar",
                                "خدمة البحث غير متاحة مؤقتاً. يرجى المحاولة مرة أخرى بعد لحظات."
                            }
                        }
                    },
                    {
                        "IndexingFailed",
                        new Dictionary<string, string>
                        {
                            {
                                "en",
                                "Failed to update search index. Your data is saved but may not appear in search results immediately."
                            },
                            {
                                "ar",
                                "فشل تحديث فهرس البحث. تم حفظ بياناتك ولكن قد لا تظهر في نتائج البحث فوراً."
                            }
                        }
                    },
                    {
                        "ReindexFailed",
                        new Dictionary<string, string>
                        {
                            {
                                "en",
                                "Failed to synchronize search index. Please contact support if the issue persists."
                            },
                            {
                                "ar",
                                "فشل مزامنة فهرس البحث. يرجى التواصل مع الدعم إذا استمرت المشكلة."
                            }
                        }
                    }
                };

            var normalizedLanguage =
                language == "ar"
                    ? "ar"
                    : "en";

            if (messages.TryGetValue(
                    key,
                    out var translations) &&
                translations.TryGetValue(
                    normalizedLanguage,
                    out var message))
            {
                return message;
            }

            return "An unexpected search error occurred.";
        }
    }
}