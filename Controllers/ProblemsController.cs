// File: MathWorldAPI/Controllers/ProblemsController.cs

using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.DTOs;
using MathWorldAPI.Helpers;
using MathWorldAPI.Models;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.RateLimiting;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers
{
    /// <summary>
    /// Controller for managing public problem access, problem search,
    /// problem details, view counters, answer submission, and attempt history.
    /// متحكم الوصول للمسائل والبحث والتفاصيل والمشاهدات والإجابات وسجل المحاولات.
    /// </summary>
    [ApiController]
    [Route("api/[controller]")]
    public class ProblemsController : ControllerBase
    {
        private async Task<bool> IsCategoryLockedAsync(int userId, int categoryId, int stageId)
        {
            var subscription = await _context.Users.AsNoTracking()
                .Where(user => user.Id == userId && user.Role == "Student")
                .Select(user => user.SubscriptionType)
                .FirstOrDefaultAsync(HttpContext.RequestAborted);

            if (string.Equals(subscription, "Premium", StringComparison.OrdinalIgnoreCase))
                return false;

            // Deterministic ordering, shared with the mobile category display.
            var freeCategoryIds = await _context.Categories.AsNoTracking()
                .Where(category => category.StageId == stageId)
                .OrderBy(category => category.Order)
                .ThenBy(category => category.Id)
                .Select(category => category.Id)
                .Take(2)
                .ToListAsync(HttpContext.RequestAborted);

            return !freeCategoryIds.Contains(categoryId);
        }

        private async Task<bool> IsFreeStudentAsync()
        {
            var userId = GetUserId();
            if (!userId.HasValue ||
                !string.Equals(GetUserRole(), "Student", StringComparison.OrdinalIgnoreCase))
                return false;

            var subscription = await _context.Users.AsNoTracking()
                .Where(user => user.Id == userId.Value && user.Role == "Student")
                .Select(user => user.SubscriptionType)
                .FirstOrDefaultAsync(HttpContext.RequestAborted);

            return !string.Equals(subscription, "Premium", StringComparison.OrdinalIgnoreCase);
        }

        private async Task<int[]> FreeCategoryIdsAsync()
        {
            // Apply the same deterministic order as category cards and detail access.
            var categories = await _context.Categories.AsNoTracking()
                .OrderBy(category => category.StageId)
                .ThenBy(category => category.Order)
                .ThenBy(category => category.Id)
                .Select(category => new { category.Id, category.StageId })
                .ToListAsync(HttpContext.RequestAborted);

            return categories.GroupBy(category => category.StageId)
                .SelectMany(group => group.Take(2))
                .Select(category => category.Id)
                .ToArray();
        }

        private readonly AppDbContext _context;
        private readonly IMeiliSearchService _searchService;
        private readonly IImgBbStorageService _imgBbStorage;
        private readonly ILogger<ProblemsController> _logger;
        private readonly NotificationStreamBroker _notificationStream;
        private readonly bool _meilisearchEnabled;

        /// <summary>
        /// Initializes a new instance of the ProblemsController.
        /// </summary>
        public ProblemsController(
            AppDbContext context,
            IMeiliSearchService searchService,
            IImgBbStorageService imgBbStorage,
            IConfiguration configuration,
            NotificationStreamBroker notificationStream,
            ILogger<ProblemsController> logger)
        {
            _context = context;
            _searchService = searchService;
            _imgBbStorage = imgBbStorage;
            _logger = logger;
            _notificationStream = notificationStream;

            _meilisearchEnabled =
                configuration.GetValue<bool>(
                    "Meilisearch:Enabled");
        }

        /// <summary>
        /// Searches problems using MeiliSearch.
        /// Falls back to PostgreSQL when MeiliSearch is disabled.
        /// </summary>
        [HttpGet("meilisearch-search")]
        [ProducesResponseType(
            typeof(ApiResponse<SearchResponseDto>),
            StatusCodes.Status200OK)]
        public async Task<
            ActionResult<ApiResponse<SearchResponseDto>>> MeiliSearch(
            [FromQuery] string q = "",
            [FromQuery] int? categoryId = null,
            [FromQuery] int? stageId = null,
            [FromQuery] int page = 1,
            [FromQuery] int pageSize = 10)
        {
            page =
                Math.Max(
                    1,
                    page);

            pageSize =
                Math.Clamp(
                    pageSize,
                    1,
                    100);

            // Category filtering must happen in PostgreSQL; do not expose locked
            // titles or counts from an unfiltered external search index.
            if (!_meilisearchEnabled || !_configurationAllowsUnfilteredSearch())
            {
                _logger.LogInformation(
                    "Category-aware PostgreSQL search enforced.");

                return await PostgreSqlSearch(
                    q,
                    categoryId,
                    stageId,
                    page,
                    pageSize);
            }

            // A learner's solved-last order must be applied BEFORE pagination.
            // External-search ordering cannot safely sort personalized progress.
            // Reuse the PostgreSQL query for any authenticated account.
            if (User.Identity?.IsAuthenticated == true)
                return await PostgreSqlSearch(q, categoryId, stageId, page, pageSize);

            var language =
                LanguageHelper.GetLanguageFromRequest(
                    Request);

            if (string.IsNullOrWhiteSpace(q))
            {
                var query =
                    _context.Problems
                        .AsNoTracking()
                        .Include(problem =>
                            problem.Category)
                        .Include(problem =>
                            problem.Stage)
                        .AsQueryable();

                if (categoryId.HasValue)
                {
                    query =
                        query.Where(problem =>
                            problem.CategoryId ==
                            categoryId.Value);
                }

                if (stageId.HasValue)
                {
                    query =
                        query.Where(problem =>
                            problem.StageId ==
                            stageId.Value);
                }

                var total =
                    await query.CountAsync();

                var totalPages =
                    (int)Math.Ceiling(
                        total /
                        (double)pageSize);

                var allProblems =
                    await query
                        .OrderByDescending(problem =>
                            problem.Id)
                        .Skip(
                            (page - 1) *
                            pageSize)
                        .Take(pageSize)
                        .Select(problem =>
                            new ProblemPreviewDto
                            {
                                Id =
                                    problem.Id,

                                Title =
                                    language == "en"
                                        ? problem.TitleEn
                                        : problem.TitleAr,

                                StageId =
                                    problem.StageId,

                                StageName =
                                    language == "en"
                                        ? problem.Stage.NameEn
                                        : problem.Stage.NameAr,

                                Points =
                                    problem.Points,

                                CategoryId =
                                    problem.CategoryId,

                                CategoryName =
                                    language == "en"
                                        ? problem.Category.NameEn
                                        : problem.Category.NameAr,

                                RequiresLogin =
                                    true
                            })
                        .ToListAsync();

                var response =
                    new SearchResponseDto
                    {
                        Query =
                            q,

                        Page =
                            page,

                        PageSize =
                            pageSize,

                        Results =
                            allProblems,

                        Total =
                            total,

                        TotalPages =
                            totalPages
                    };

                return Ok(
                    LanguageHelper.SuccessResponse(
                        response,
                        allProblems.Count == 0
                            ? "NoResultsFound"
                            : "Success",
                        language,
                        meta: new MetaData
                        {
                            SearchType =
                                "Meilisearch",

                            Query =
                                q,

                            Total =
                                total,

                            Page =
                                page,

                            PageSize =
                                pageSize,

                            TotalPages =
                                totalPages
                        }));
            }

            var (problemIds, totalCount) =
                await _searchService
                    .SearchWithPaginationAsync(
                        q,
                        categoryId,
                        stageId,
                        page,
                        pageSize);

            var totalResultPages =
                (int)Math.Ceiling(
                    totalCount /
                    (double)pageSize);

            if (problemIds.Count == 0)
            {
                return Ok(
                    LanguageHelper.SuccessResponse(
                        new SearchResponseDto
                        {
                            Query =
                                q,

                            Page =
                                page,

                            PageSize =
                                pageSize,

                            Results =
                                new List<ProblemPreviewDto>(),

                            Total =
                                0,

                            TotalPages =
                                0
                        },
                        "NoResultsFound",
                        language,
                        meta: new MetaData
                        {
                            SearchType =
                                "Meilisearch",

                            Query =
                                q,

                            Total =
                                0,

                            Page =
                                page,

                            PageSize =
                                pageSize,

                            TotalPages =
                                0
                        }));
            }

            var problems =
                await _context.Problems
                    .AsNoTracking()
                    .Include(problem =>
                        problem.Category)
                    .Include(problem =>
                        problem.Stage)
                    .Where(problem =>
                        problemIds.Contains(
                            problem.Id))
                    .Select(problem =>
                        new ProblemPreviewDto
                        {
                            Id =
                                problem.Id,

                            Title =
                                language == "en"
                                    ? problem.TitleEn
                                    : problem.TitleAr,

                            StageId =
                                problem.StageId,

                            StageName =
                                language == "en"
                                    ? problem.Stage.NameEn
                                    : problem.Stage.NameAr,

                            Points =
                                problem.Points,

                            CategoryId =
                                problem.CategoryId,

                            CategoryName =
                                language == "en"
                                    ? problem.Category.NameEn
                                    : problem.Category.NameAr,

                            RequiresLogin =
                                true
                        })
                    .ToListAsync();

            // Preserve the result order returned by MeiliSearch.
            var ordered =
                problemIds
                    .Select(id =>
                        problems.FirstOrDefault(
                            problem =>
                                problem.Id == id))
                    .Where(problem =>
                        problem != null)
                    .Select(problem =>
                        problem!)
                    .ToList();

            return Ok(
                LanguageHelper.SuccessResponse(
                    new SearchResponseDto
                    {
                        Query =
                            q,

                        Page =
                            page,

                        PageSize =
                            pageSize,

                        Results =
                            ordered,

                        Total =
                            totalCount,

                        TotalPages =
                            totalResultPages
                    },
                    ordered.Count == 0
                        ? "NoResultsFound"
                        : "Success",
                    language,
                    meta: new MetaData
                    {
                        SearchType =
                            "Meilisearch",

                        Query =
                            q,

                        Total =
                            totalCount,

                        Page =
                            page,

                        PageSize =
                            pageSize,

                        TotalPages =
                            totalResultPages
                    }));
        }

        /// <summary>
        /// Searches problems using PostgreSQL.
        /// </summary>
        [HttpGet("postgresql-search")]
        [ProducesResponseType(
            typeof(ApiResponse<SearchResponseDto>),
            StatusCodes.Status200OK)]
        public async Task<
            ActionResult<ApiResponse<SearchResponseDto>>> PostgreSqlSearch(
            [FromQuery] string q = "",
            [FromQuery] int? categoryId = null,
            [FromQuery] int? stageId = null,
            [FromQuery] int page = 1,
            [FromQuery] int pageSize = 10,
            [FromQuery] bool hideSolved = false)
        {
            page =
                Math.Max(
                    1,
                    page);

            pageSize =
                Math.Clamp(
                    pageSize,
                    1,
                    100);

            var language =
                LanguageHelper.GetLanguageFromRequest(
                    Request);

            // Public catalog search exposes only ProblemPreviewDto metadata (no
            // question text, answer options or solutions). Show every category
            // to guests; enforce Free/Premium restrictions for signed-in users.
            var allowedCategoryIds = User.Identity?.IsAuthenticated == true
                ? await GetAllowedCategoryIdsAsync()
                : null;
            var query =
                _context.Problems
                    .AsNoTracking()
                    .Include(problem =>
                        problem.Category)
                    .Include(problem =>
                        problem.Stage)
                    .Where(problem => problem.Category.StageId == problem.StageId &&
                        (allowedCategoryIds == null || allowedCategoryIds.Contains(problem.CategoryId)))
                    .AsQueryable();

            if (!string.IsNullOrWhiteSpace(q))
            {
                var normalizedQuery =
                    q.Trim();

                query =
                    query.Where(problem =>
                        problem.TitleAr.Contains(
                            normalizedQuery) ||
                        problem.TitleEn.Contains(
                            normalizedQuery) ||
                        problem.QuestionTextAr.Contains(
                            normalizedQuery) ||
                        problem.QuestionTextEn.Contains(
                            normalizedQuery));
            }

            if (categoryId.HasValue)
            {
                query =
                    query.Where(problem =>
                        problem.CategoryId ==
                        categoryId.Value);
            }

            if (stageId.HasValue)
            {
                query =
                    query.Where(problem =>
                        problem.StageId ==
                        stageId.Value);
            }

            var trackService=HttpContext.RequestServices.GetRequiredService<LearningTrackService>();
            var activeTrack=await trackService.ActiveForStudentAsync(User,HttpContext.RequestAborted);
            if(activeTrack is not null)
            {
                var scope=trackService.ValidProblems(activeTrack.Id);
                query=query.Where(p=>scope.Any(q=>q.Id==p.Id));
            }

            // Filter by server-owned progress BEFORE Count/Skip/Take.
            // Filtering only visible cards would strand unsolved questions
            // on later pages and produce misleading empty screens.
            if (hideSolved)
            {
                var authenticatedStudent = User.Identity?.IsAuthenticated == true
                    && User.IsInRole("Student") ? GetUserId() : null;
                if (!authenticatedStudent.HasValue)
                    return Unauthorized(LanguageHelper.ErrorResponse<object>(
                        "Unauthorized", language,
                        StatusCodes.Status401Unauthorized));

                query = query.Where(problem => !_context.UserProgresses.Any(progress =>
                    progress.UserId == authenticatedStudent.Value &&
                    progress.ProblemId == problem.Id && progress.IsSolved));
            }

            var total =
                await query.CountAsync();

            var totalPages =
                (int)Math.Ceiling(
                    total /
                    (double)pageSize);

            // Unsolved questions come first across every page, not only
            // within the current ten results. Never expose another user's
            // progress, and never require login for public preview cards.
            var viewerId = User.Identity?.IsAuthenticated == true
                ? GetUserId()
                : null;
            var orderedQuery = viewerId.HasValue
                ? query.OrderBy(problem => _context.UserProgresses.Any(progress =>
                      progress.UserId == viewerId.Value &&
                      progress.ProblemId == problem.Id && progress.IsSolved))
                    .ThenByDescending(problem => problem.Id)
                : query.OrderByDescending(problem => problem.Id);

            var problems =
                await orderedQuery
                    .Skip(
                        (page - 1) *
                        pageSize)
                    .Take(pageSize)
                    .Select(problem =>
                        new ProblemPreviewDto
                        {
                            IsSolved = viewerId.HasValue &&
                                _context.UserProgresses.Any(progress =>
                                    progress.UserId == viewerId.Value &&
                                    progress.ProblemId == problem.Id && progress.IsSolved),
                            HasAttempted = viewerId.HasValue &&
                                _context.UserProgresses.Any(progress =>
                                    progress.UserId == viewerId.Value &&
                                    progress.ProblemId == problem.Id && progress.Attempts > 0),
                            Id =
                                problem.Id,

                            Title =
                                language == "en"
                                    ? problem.TitleEn
                                    : problem.TitleAr,

                            StageId =
                                problem.StageId,

                            StageName =
                                language == "en"
                                    ? problem.Stage.NameEn
                                    : problem.Stage.NameAr,

                            Points =
                                problem.Points,

                            CategoryId =
                                problem.CategoryId,

                            CategoryName =
                                language == "en"
                                    ? problem.Category.NameEn
                                    : problem.Category.NameAr,

                            RequiresLogin =
                                true
                        })
                    .ToListAsync();

            return Ok(
                LanguageHelper.SuccessResponse(
                    new SearchResponseDto
                    {
                        Query =
                            q,

                        Page =
                            page,

                        PageSize =
                            pageSize,

                        Results =
                            problems,

                        Total =
                            total,

                        TotalPages =
                            totalPages
                    },
                    problems.Count == 0
                        ? "NoResultsFound"
                        : "Success",
                    language,
                    meta: new MetaData
                    {
                        SearchType =
                            "PostgreSQL",

                        Query =
                            q,

                        Total =
                            total,

                        Page =
                            page,

                        PageSize =
                            pageSize,

                        TotalPages =
                            totalPages
                    }));
        }

        /// <summary>
        /// Unified problem search endpoint.
        /// PostgreSQL is used by default.
        /// MeiliSearch is used only when it is enabled and explicitly requested.
        /// </summary>
        [HttpGet("search")]
        [ProducesResponseType(
            typeof(ApiResponse<SearchResponseDto>),
            StatusCodes.Status200OK)]
        public async Task<
            ActionResult<ApiResponse<SearchResponseDto>>> Search(
            [FromQuery] string q = "",
            [FromQuery] int? categoryId = null,
            [FromQuery] int? stageId = null,
            [FromQuery] string? engine = "postgresql",
            [FromQuery] int page = 1,
            [FromQuery] int pageSize = 10,
            [FromQuery] bool hideSolved = false)
        {
            // Personalized filtering always uses PostgreSQL, regardless
            // of a requested external search engine.
            if (hideSolved)
                return await PostgreSqlSearch(
                    q, categoryId, stageId, page, pageSize, hideSolved: true);

            var useMeiliSearch =
                _meilisearchEnabled &&
                string.Equals(
                    engine,
                    "meilisearch",
                    StringComparison.OrdinalIgnoreCase);

            return useMeiliSearch
                ? await MeiliSearch(
                    q,
                    categoryId,
                    stageId,
                    page,
                    pageSize)
                : await PostgreSqlSearch(
                    q,
                    categoryId,
                    stageId,
                    page,
                    pageSize);
        }

        /// <summary>
        /// Gets a single problem by ID.
        /// Administrators receive full bilingual data.
        /// Students receive localized safe options without correctness data.
        /// Public users receive problem information without answer options.
        /// </summary>
        [HttpGet("{id:int}")]
        [ProducesResponseType(
            typeof(ApiResponse<object>),
            StatusCodes.Status200OK)]
        [ProducesResponseType(
            typeof(ApiResponse<object>),
            StatusCodes.Status404NotFound)]
        public async Task<IActionResult> GetProblem(
            int id)
        {
            var language =
                LanguageHelper.GetLanguageFromRequest(
                    Request);

            var userId =
                GetUserId();

            var userRole =
                GetUserRole();

            var problem =
                await _context.Problems
                    .AsNoTracking()
                    .Include(item =>
                        item.Category)
                    .Include(item =>
                        item.Stage)
                    .Include(item =>
                        item.Options)
                    .AsSplitQuery()
                    .FirstOrDefaultAsync(item =>
                        item.Id == id);

            if (problem == null)
            {
                return NotFound(
                    LanguageHelper.ErrorResponse<object>(
                        "ProblemNotFound",
                        language,
                        StatusCodes.Status404NotFound));
            }

            var categoryAccess = HttpContext.RequestServices
                .GetRequiredService<ProblemCategoryAccessService>();
            if (!await categoryAccess.CanReadProblemAsync(User,
                problem.StageId, problem.CategoryId, HttpContext.RequestAborted))
                return StatusCode(StatusCodes.Status403Forbidden,
                    new { Message = "CategoryLocked" });

            if(!await HttpContext.RequestServices.GetRequiredService<LearningTrackService>()
                .CanPracticeAsync(User,problem.Id,HttpContext.RequestAborted))
                return StatusCode(403,new{Message="CurrentTrackOnly"});

            var categoryIcon =
                _imgBbStorage.GetFullUrl(
                    problem.Category.Icon)
                ?? string.Empty;

            if (string.Equals(
                    userRole,
                    "Admin",
                    StringComparison.OrdinalIgnoreCase))
            {
                return Ok(
                    LanguageHelper.SuccessResponse(
                        new
                        {
                            problem.Id,
                            problem.TitleAr,
                            problem.TitleEn,
                            problem.QuestionTextAr,
                            problem.QuestionTextEn,
                            problem.DetailedSolutionAr,
                            problem.DetailedSolutionEn,
                            problem.StageId,

                            StageName =
                                language == "en"
                                    ? problem.Stage.NameEn
                                    : problem.Stage.NameAr,

                            problem.Points,
                            problem.CategoryId,

                            CategoryName =
                                language == "en"
                                    ? problem.Category.NameEn
                                    : problem.Category.NameAr,

                            CategoryIcon =
                                categoryIcon,

                            problem.YoutubeSolutionUrl,

                            Options =
                                problem.Options
                                    .OrderBy(option =>
                                        option.Order)
                                    .Select(option =>
                                        new AdminOptionDto
                                        {
                                            Id =
                                                option.Id,

                                            LatexCode =
                                                option.LatexCode,

                                            IsCorrect =
                                                option.IsCorrect,

                                            Order =
                                                option.Order
                                        })
                                    .ToList()
                        },
                        "Success",
                        language));
            }

            if (userId.HasValue)
            {
                var progress =
                    await _context.UserProgresses
                        .AsNoTracking()
                        .FirstOrDefaultAsync(progressItem =>
                            progressItem.UserId ==
                            userId.Value &&
                            progressItem.ProblemId ==
                            id);

                // A favorite-only progress record has no answer attempts.
                var hasAttempted =
                    progress != null &&
                    progress.Attempts > 0;

                // The correct answer and solution remain hidden after an incorrect attempt.
                var canRevealAnswer =
                    hasAttempted && progress!.IsSolved &&
                    progress.IsCorrect;

                var correctOptionId =
                    canRevealAnswer
                        ? problem.Options
                            .FirstOrDefault(option =>
                                option.IsCorrect)
                            ?.Id
                        : null;

                return Ok(
                    LanguageHelper.SuccessResponse(
                        new ProblemForStudentDto
                        {
                            Id =
                                problem.Id,

                            Title =
                                language == "en"
                                    ? problem.TitleEn
                                    : problem.TitleAr,

                            QuestionText =
                                language == "en"
                                    ? problem.QuestionTextEn
                                    : problem.QuestionTextAr,

                            StageId =
                                problem.StageId,

                            StageName =
                                language == "en"
                                    ? problem.Stage.NameEn
                                    : problem.Stage.NameAr,

                            CategoryId =
                                problem.CategoryId,

                            CategoryName =
                                language == "en"
                                    ? problem.Category.NameEn
                                    : problem.Category.NameAr,

                            CategoryIcon =
                                categoryIcon,

                            Points =
                                problem.Points,

                            IsSolved =
                                progress?.IsSolved
                                ?? false,

                            HasAttempted =
                                hasAttempted,

                            WasCorrect =
                                hasAttempted
                                    ? progress!.IsCorrect
                                    : null,

                            SelectedOptionId =
                                hasAttempted
                                    ? progress!.SelectedOptionId
                                    : null,

                            CorrectOptionId =
                                correctOptionId,

                            IsFavorite =
                                progress?.IsFavorite
                                ?? false,

                            AttemptCount =
                                progress?.Attempts
                                ?? 0,

                            FirstAttemptCorrect =
                                progress?.FirstAttemptCorrect,

                            CanRetry = hasAttempted && progress != null && !progress.IsSolved && progress.IsInErrorNotebook,

                            MasteryStatus =
                                progress?.MasteryStatus
                                ?? MasteryStatuses.New,

                            BestTimeSeconds =
                                progress?.BestTimeSeconds,

                            AverageTimeSeconds =
                                GetAverageTimeSeconds(
                                    progress),

                            IsInErrorNotebook =
                                progress?.IsInErrorNotebook
                                ?? false,

                            IsErrorNotebookArchived =
                                progress?.IsErrorNotebookArchived
                                ?? false,

                            NextReviewAt =
                                progress?.NextReviewAt,

                            // Reveal the solution only after the latest answer is correct.
                            DetailedSolution =
                                canRevealAnswer
                                    ? language == "en"
                                        ? problem.DetailedSolutionEn
                                        : problem.DetailedSolutionAr
                                    : null,

                            YoutubeSolutionUrl =
                                canRevealAnswer
                                    ? problem.YoutubeSolutionUrl
                                    : null,

                            SolutionStructure = canRevealAnswer ? WizardProblemContract.LocalizedSolution(problem.EditorialDetailsJson,language) : null,

                            // Never expose option correctness to students.
                            Options =
                                problem.Options
                                    .OrderBy(option =>
                                        option.Order)
                                    .Select(option =>
                                        new OptionForStudentDto
                                        {
                                            Id =
                                                option.Id,

                                            LatexCode =
                                                option.LatexCode,

                                            Order =
                                                option.Order,

                                            IsCorrect =
                                                null
                                        })
                                    .ToList()
                        },
                        "Success",
                        language));
            }

            var publicResponse =
                new ProblemForPublicDto
                {
                    Id =
                        problem.Id,

                    Title =
                        language == "en"
                            ? problem.TitleEn
                            : problem.TitleAr,

                    QuestionText =
                        language == "en"
                            ? problem.QuestionTextEn
                            : problem.QuestionTextAr,

                    StageId =
                        problem.StageId,

                    StageName =
                        language == "en"
                            ? problem.Stage.NameEn
                            : problem.Stage.NameAr,

                    CategoryId =
                        problem.CategoryId,

                    CategoryName =
                        language == "en"
                            ? problem.Category.NameEn
                            : problem.Category.NameAr,

                    CategoryIcon =
                        categoryIcon,

                    Message =
                        LanguageHelper.GetMessage(
                            "RequiresLogin",
                            language)
                };

            return Ok(
                LanguageHelper.SuccessResponse(
                    publicResponse,
                    "Success",
                    language));
        }

        /// <summary>
        /// Compatibility route for Premium; a correct solve is always required.
        /// No entitlement is read from the client; it is always checked in
        /// the database to support immediate Admin changes.
        /// </summary>
        [Authorize(Roles = "Student")]
        [EnableRateLimiting("solution-preview")]
        [ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
        [HttpGet("{id:int}/solution-preview")]
        public async Task<IActionResult> GetSolutionPreview(
            int id, CancellationToken cancellationToken)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            var userId = GetUserId();
            if (!userId.HasValue)
                return Unauthorized(LanguageHelper.ErrorResponse<object>(
                    "Unauthorized", language, StatusCodes.Status401Unauthorized));

            // The old preview route must use the same expiration/revocation
            // policy as the newer /premium-solution endpoint.
            var learner = await _context.Users.AsNoTracking()
                .FirstOrDefaultAsync(user => user.Id == userId.Value &&
                    user.Role == "Student" && user.IsActive, cancellationToken);
            if (learner is null || !PremiumEntitlement.IsActive(learner))
                return StatusCode(StatusCodes.Status403Forbidden,
                    LanguageHelper.ErrorResponse<object>(
                        "PremiumRequiredForSolution", language,
                        StatusCodes.Status403Forbidden));

            var problem = await _context.Problems.AsNoTracking()
                .Where(item => item.Id == id)
                .Select(item => new
                {
                    item.Id,
                    item.StageId,
                    item.CategoryId,
                    item.DetailedSolutionAr,
                    item.DetailedSolutionEn,
                    item.YoutubeSolutionUrl,
                    CorrectOptionId = item.Options.Where(option => option.IsCorrect)
                        .Select(option => (int?)option.Id).FirstOrDefault()
                }).FirstOrDefaultAsync(cancellationToken);
            if (problem == null)
                return NotFound(LanguageHelper.ErrorResponse<object>(
                    "ProblemNotFound", language, StatusCodes.Status404NotFound));

            var access = HttpContext.RequestServices
                .GetRequiredService<ProblemCategoryAccessService>();
            if (!await access.CanReadProblemAsync(
                    User, problem.StageId, problem.CategoryId, cancellationToken))
                return StatusCode(StatusCodes.Status403Forbidden,
                    LanguageHelper.ErrorResponse<object>(
                        "CategoryLocked", language, StatusCodes.Status403Forbidden));

            if(!await HttpContext.RequestServices.GetRequiredService<LearningTrackService>()
                .CanPracticeAsync(User,problem.Id,cancellationToken))
                return StatusCode(403,new{Message="CurrentTrackOnly"});

            if (!await _context.UserProgresses.AsNoTracking().AnyAsync(p=>p.UserId==userId.Value&&p.ProblemId==id&&p.IsSolved&&p.IsCorrect&&p.Attempts>0,cancellationToken))
                return StatusCode(403,new{Message="SolveBeforeSolution"});
            return Ok(LanguageHelper.SuccessResponse(new
            {
                ProblemId = problem.Id,
                problem.CorrectOptionId,
                DetailedSolution = language == "en"
                    ? problem.DetailedSolutionEn : problem.DetailedSolutionAr,
                problem.YoutubeSolutionUrl
            }, "Success", language));
        }

        /// <summary>
        /// Submits an official or training answer attempt for a problem.
        /// The first attempt remains the official result while later attempts
        /// are stored as training history without replacing the original result.
        /// يرسل محاولة إجابة رسمية أو تدريبية لمسألة، مع الاحتفاظ بالمحاولة
        /// الأولى كنتيجة رسمية وتخزين المحاولات اللاحقة كسجل تدريبي مستقل.
        /// </summary>
        [Authorize(Roles = "Student")]
        [EnableRateLimiting("answers")]
        [HttpPost("submit")]
        [ProducesResponseType(
            typeof(ApiResponse<AnswerResultDto>),
            StatusCodes.Status200OK)]
        [ProducesResponseType(
            typeof(ApiResponse<object>),
            StatusCodes.Status400BadRequest)]
        [ProducesResponseType(
            typeof(ApiResponse<object>),
            StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(
            typeof(ApiResponse<object>),
            StatusCodes.Status404NotFound)]
        public async Task<
            ActionResult<ApiResponse<AnswerResultDto>>> SubmitAnswer(
            [FromBody] SubmitAnswerDto dto)
        {
            var userId =
                GetUserId();

            var language =
                LanguageHelper.GetLanguageFromRequest(
                    Request);

            if (!userId.HasValue)
            {
                return Unauthorized(
                    LanguageHelper.ErrorResponse<
                        AnswerResultDto>(
                        "Unauthorized",
                        language,
                        StatusCodes.Status401Unauthorized));
            }

            // Different learners can answer concurrently, but each learner's
            // submissions to this question are serialized across API instances.
            // Shared question lock prevents concurrent admin deletion/edits.
            await using var transaction =
                await _context.Database.BeginTransactionAsync();

            await ProblemTransactionLocks.LockQuestionForAnswerAsync(
                _context,
                dto.ProblemId,
                HttpContext.RequestAborted);

            // Serialize all first-time solves by this learner so milestone
            // counts cannot race across two different problems.
            await _context.Database.SqlQuery<int>(
                    $"SELECT 1 AS \"Value\" FROM pg_advisory_xact_lock({-987654320}, {userId.Value})")
                .SingleAsync(HttpContext.RequestAborted);

            await ProblemTransactionLocks.LockStudentAttemptAsync(
                _context,
                userId.Value,
                dto.ProblemId,
                HttpContext.RequestAborted);

            var problem =
                await _context.Problems
                    .Include(problemItem =>
                        problemItem.Options)
                    .FirstOrDefaultAsync(problemItem =>
                        problemItem.Id ==
                        dto.ProblemId);

            if (problem == null)
            {
                return NotFound(
                    LanguageHelper.ErrorResponse<
                        AnswerResultDto>(
                        "ProblemNotFound",
                        language,
                        StatusCodes.Status404NotFound));
            }

            // Check category access before looking up answer options or correctness.
            var categoryAccess = HttpContext.RequestServices
                .GetRequiredService<ProblemCategoryAccessService>();
            if (!await categoryAccess.CanReadProblemAsync(User,
                problem.StageId, problem.CategoryId, HttpContext.RequestAborted))
                return StatusCode(StatusCodes.Status403Forbidden,
                    new { Message = "CategoryLocked" });

            if(!await HttpContext.RequestServices.GetRequiredService<LearningTrackService>()
                .CanPracticeAsync(User,problem.Id,HttpContext.RequestAborted))
                return StatusCode(403,new{Message="CurrentTrackOnly"});

            var selectedOption =
                problem.Options
                    .FirstOrDefault(option =>
                        option.Id ==
                        dto.SelectedOptionId);

            if (selectedOption == null)
            {
                return BadRequest(
                    LanguageHelper.ErrorResponse<
                        AnswerResultDto>(
                        "OptionNotFound",
                        language,
                        StatusCodes.Status400BadRequest));
            }

            var correctOption =
                problem.Options
                    .FirstOrDefault(option =>
                        option.IsCorrect);

            if (correctOption == null)
            {
                _logger.LogError(
                    "Problem {ProblemId} has no correct option configured.",
                    problem.Id);

                return StatusCode(
                    StatusCodes.Status500InternalServerError,
                    LanguageHelper.ErrorResponse<
                        AnswerResultDto>(
                        "UnexpectedError",
                        language,
                        StatusCodes.Status500InternalServerError));
            }

            var progress =
                await _context.UserProgresses
                    .FirstOrDefaultAsync(progressItem =>
                        progressItem.UserId ==
                        userId.Value &&
                        progressItem.ProblemId ==
                        dto.ProblemId);

            // A solved question is final for the current practice cycle.
            // To practice it again the student resets the whole stage or topic.
            // Retries are only meaningful for unresolved notebook errors.
            if (progress?.IsSolved == true)
                return Conflict(new { Message = "AlreadySolvedResetTopicOrStage" });
            if (progress != null && progress.Attempts > 0 &&
                !progress.IsInErrorNotebook)
                return Conflict(new { Message = "ProblemNotAvailableForReview" });

            var now =
                DateTime.UtcNow;

            var timeSpentSeconds =
                Math.Clamp(
                    dto.TimeSpentSeconds,
                    0,
                    86400);

            // A favorite can create a progress record before
            // the student answers the problem.
            if (progress == null)
            {
                progress =
                    new UserProgress
                    {
                        UserId =
                            userId.Value,

                        ProblemId =
                            dto.ProblemId,

                        IsFavorite =
                            false,

                        MasteryStatus =
                            MasteryStatuses.New
                    };

                _context.UserProgresses.Add(
                    progress);
            }

            // The first answer is the official attempt; retries are practice.
            var isOfficialAttempt = progress.Attempts == 0;

            // Resetting a training cycle clears UserProgress.Attempts but
            // NEVER deletes immutable ProblemAttempts. Their composite
            // (UserId, ProblemId, AttemptNumber) index is unique, therefore
            // the audit sequence cannot restart at 1 on a new cycle.
            var previousAuditNumber = await _context.ProblemAttempts
                .Where(item => item.UserId == userId.Value &&
                    item.ProblemId == dto.ProblemId)
                .MaxAsync(item => (int?)item.AttemptNumber,
                    HttpContext.RequestAborted) ?? 0;
            var attemptNumber = previousAuditNumber + 1;

            var isCorrect =
                selectedOption.IsCorrect;

            var wasSolved =
                progress.IsSolved;

            var wasInErrorNotebook =
                progress.IsInErrorNotebook;

            var isDueReview =
                wasInErrorNotebook &&
                (!progress.NextReviewAt.HasValue ||
                 progress.NextReviewAt.Value <= now);

            var pointsEarned = isCorrect && !wasSolved
                ? await PermanentAchievementLedger.AwardAsync(_context,userId.Value,problem,now,HttpContext.RequestAborted)
                : 0;

            if (isOfficialAttempt)
            {
                progress.FirstAttemptCorrect =
                    isCorrect;

                progress.FirstSelectedOptionId =
                    dto.SelectedOptionId;

                progress.FirstAttemptAt =
                    now;
            }

            progress.IsCorrect =
                isCorrect;

            progress.SelectedOptionId =
                dto.SelectedOptionId;

            progress.Attempts =
                progress.Attempts + 1;

            progress.TimeSpentSeconds =
                timeSpentSeconds;

            progress.TotalTimeSpentSeconds +=
                timeSpentSeconds;

            progress.LastAttemptAt =
                now;

            if (isCorrect)
            {
                progress.CorrectAttempts++;

                if (timeSpentSeconds > 0 &&
                    (!progress.BestTimeSeconds.HasValue ||
                     timeSpentSeconds <
                     progress.BestTimeSeconds.Value))
                {
                    progress.BestTimeSeconds =
                        timeSpentSeconds;
                }

                if (!wasSolved)
                {
                    progress.IsSolved =
                        true;

                    progress.SolvedAt =
                        now;

                    // SolvedCount is incremented atomically below.
                }
            }
            else
            {
                progress.IncorrectAttempts++;
            }

            UpdateLearningState(
                progress,
                isCorrect,
                wasInErrorNotebook,
                isDueReview,
                now);

            var attempt =
                new ProblemAttempt
                {
                    UserId =
                        userId.Value,

                    ProblemId =
                        problem.Id,

                    SelectedOptionId =
                        selectedOption.Id,

                    SelectedOptionText =
                        selectedOption.LatexCode,

                    CorrectOptionId =
                        correctOption.Id,

                    CorrectOptionText =
                        correctOption.LatexCode,

                    IsCorrect =
                        isCorrect,

                    IsOfficial =
                        isOfficialAttempt,

                    AttemptNumber =
                        attemptNumber,

                    TimeSpentSeconds =
                        timeSpentSeconds,

                    PointsEarned =
                        pointsEarned,

                    UsedHint =
                        progress.HintsRevealed > 0,

                    StartedAt =
                        now.AddSeconds(
                            -timeSpentSeconds),

                    SubmittedAt =
                        now
                };

            _context.ProblemAttempts.Add(
                attempt);

            // Different students may solve the same problem simultaneously.
            // Update directly in SQL to avoid losing count increments.
            if (isCorrect && !wasSolved)
            {
                var affected = await _context.Problems
                    .Where(item => item.Id == problem.Id)
                    .ExecuteUpdateAsync(
                        updates => updates.SetProperty(
                            item => item.SolvedCount,
                            item => item.SolvedCount + 1),
                        HttpContext.RequestAborted);

                if (affected != 1)
                {
                    throw new DbUpdateConcurrencyException(
                        "The problem disappeared during answer submission.");
                }
            }

            // Milestone notices are created only on the first correct solve
            // and committed atomically with the attempt. The learner-wide
            // advisory lock above guarantees milestone uniqueness.
            var createdMilestoneNotice = false;
            if (isCorrect && !wasSolved)
            {
                var solvedBefore = await _context.UserProgresses.AsNoTracking()
                    .CountAsync(p => p.UserId == userId.Value && p.IsSolved,
                        HttpContext.RequestAborted);
                var solvedNow = solvedBefore + 1;
                if (new[] { 1, 10, 25, 50, 100, 250, 500, 1000 }.Contains(solvedNow))
                {
                    createdMilestoneNotice = true;
                    _context.UserNotifications.Add(new UserNotification
                    {
                        UserId = userId.Value,
                        Type = "achievement",
                        TitleAr = "إنجاز جديد في MathWorld!",
                        TitleEn = "New MathWorld milestone!",
                        BodyAr = $"أحسنت! حللت {solvedNow} مسألة بنجاح. واصل التقدم!",
                        BodyEn = $"Well done! You've solved {solvedNow} unique problems. Keep going!",
                        TargetPath = "/dashboard",
                        CreatedAtUtc = now
                    });
                }
            }

            await _context.SaveChangesAsync();
            await transaction.CommitAsync();
            if (createdMilestoneNotice) _notificationStream.Notify(userId.Value);

            var messageKey =
                isOfficialAttempt
                    ? isCorrect
                        ? "AnswerCorrect"
                        : "AnswerWrong"
                    : isCorrect
                        ? "TrainingAnswerCorrect"
                        : "TrainingAnswerWrong";

            var messageArgs =
                Array.Empty<object>();

            return Ok(
                LanguageHelper.SuccessResponse(
                    new AnswerResultDto
                    {
                        IsCorrect =
                            isCorrect,

                        IsSolved =
                            progress.IsSolved,

                        SelectedOptionId =
                            selectedOption.Id,

                        CorrectOptionId =
                            isCorrect
                                ? correctOption.Id
                                : null,

                        PointsEarned =
                            pointsEarned,

                        DetailedSolution =
                            isCorrect
                                ? language == "en"
                                    ? problem.DetailedSolutionEn
                                    : problem.DetailedSolutionAr
                                : null,

                        CorrectOptionText =
                            isCorrect
                                ? correctOption.LatexCode
                                : null,

                        YoutubeSolutionUrl =
                            isCorrect
                                ? problem.YoutubeSolutionUrl
                                : null,

                        AttemptId =
                            attempt.Id,

                        AttemptNumber =
                            attempt.AttemptNumber,

                        SolutionStructure = isCorrect ? WizardProblemContract.LocalizedSolution(problem.EditorialDetailsJson,language) : null,
                        UsedHint = attempt.UsedHint,
                        IsOfficialAttempt =
                            attempt.IsOfficial,

                        FirstAttemptCorrect =
                            progress.FirstAttemptCorrect
                            ?? false,

                        AttemptTimeSeconds =
                            attempt.TimeSpentSeconds,

                        BestTimeSeconds =
                            progress.BestTimeSeconds,

                        TotalAttempts =
                            progress.Attempts,

                        CanRetry =
                            !progress.IsSolved && progress.IsInErrorNotebook,

                        MasteryStatus =
                            progress.MasteryStatus,

                        IsInErrorNotebook =
                            progress.IsInErrorNotebook,

                        NextReviewAt =
                            progress.NextReviewAt
                    },
                    messageKey,
                    language,
                    args: messageArgs));
        }

        /// <summary>
        /// Updates the learning and spaced-review state after an attempt.
        /// يحدث حالة التعلم والمراجعة المتباعدة بعد تسجيل محاولة.
        /// </summary>
        private static void UpdateLearningState(
            UserProgress progress,
            bool isCorrect,
            bool wasInErrorNotebook,
            bool isDueReview,
            DateTime now)
        {
            if (!isCorrect)
            {
                progress.IsInErrorNotebook =
                    true;

                progress.IsErrorNotebookArchived =
                    false;

                progress.MasteryStatus =
                    MasteryStatuses.NeedsReview;

                progress.ConsecutiveCorrectReviews =
                    0;

                progress.NextReviewAt =
                    now.AddDays(1);

                return;
            }

            // One correct answer closes the error immediately; no three-step
            // spaced review and no individual replay of solved problems.
            progress.MasteryStatus = MasteryStatuses.Mastered;
            progress.IsInErrorNotebook = false;
            progress.IsErrorNotebookArchived = false;
            progress.NextReviewAt = null;
            progress.ConsecutiveCorrectReviews = 0;
        }

        /// <summary>
        /// Calculates the rounded average solving time for a progress record.
        /// يحسب متوسط وقت الحل المقرب لسجل تقدم محدد.
        /// </summary>
        private static int? GetAverageTimeSeconds(
            UserProgress? progress)
        {
            if (progress == null ||
                progress.Attempts <= 0)
            {
                return null;
            }

            return (int)Math.Round(
                progress.TotalTimeSpentSeconds /
                (double)progress.Attempts,
                MidpointRounding.AwayFromZero);
        }

        // External MeiliSearch index is not yet entitlement-aware.
        // Keep all search paths on PostgreSQL until a secure filtered index exists.
        private static bool _configurationAllowsUnfilteredSearch() => false;

        private Task<List<int>?> GetAllowedCategoryIdsAsync() =>
            HttpContext.RequestServices
                .GetRequiredService<ProblemCategoryAccessService>()
                .GetAllowedCategoryIdsAsync(User, HttpContext.RequestAborted);

        /// <summary>
        /// Gets the authenticated user ID from JWT claims.
        /// </summary>
        private int? GetUserId()
        {
            var value =
                User.FindFirstValue(
                    ClaimTypes.NameIdentifier);

            return int.TryParse(
                value,
                out var userId)
                    ? userId
                    : null;
        }

        /// <summary>
        /// Gets the authenticated user role from JWT claims.
        /// </summary>
        private string? GetUserRole()
        {
            return User.Identity?.IsAuthenticated ==
                   true
                ? User.FindFirstValue(
                    ClaimTypes.Role)
                : null;
        }

    }
}