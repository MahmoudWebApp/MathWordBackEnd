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
        private readonly AppDbContext _context;
        private readonly IMeiliSearchService _searchService;
        private readonly IServiceScopeFactory _scopeFactory;
        private readonly IImgBbStorageService _imgBbStorage;
        private readonly ILogger<ProblemsController> _logger;
        private readonly bool _meilisearchEnabled;

        /// <summary>
        /// Initializes a new instance of the ProblemsController.
        /// </summary>
        public ProblemsController(
            AppDbContext context,
            IMeiliSearchService searchService,
            IServiceScopeFactory scopeFactory,
            IImgBbStorageService imgBbStorage,
            IConfiguration configuration,
            ILogger<ProblemsController> logger)
        {
            _context = context;
            _searchService = searchService;
            _scopeFactory = scopeFactory;
            _imgBbStorage = imgBbStorage;
            _logger = logger;

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

            if (!_meilisearchEnabled)
            {
                _logger.LogInformation(
                    "MeiliSearch is disabled. Falling back to PostgreSQL.");

                return await PostgreSqlSearch(
                    q,
                    categoryId,
                    stageId,
                    page,
                    pageSize);
            }

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

                                ViewsCount =
                                    problem.ViewsCount,

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

                            ViewsCount =
                                problem.ViewsCount,

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

            var language =
                LanguageHelper.GetLanguageFromRequest(
                    Request);

            var query =
                _context.Problems
                    .AsNoTracking()
                    .Include(problem =>
                        problem.Category)
                    .Include(problem =>
                        problem.Stage)
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

            var total =
                await query.CountAsync();

            var totalPages =
                (int)Math.Ceiling(
                    total /
                    (double)pageSize);

            var problems =
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

                            ViewsCount =
                                problem.ViewsCount,

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
            [FromQuery] int pageSize = 10)
        {
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

            // View updates are non-critical and run in a separate scope.
            _ =
                BackgroundUpdateAsync(id);

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
                    hasAttempted &&
                    progress!.IsCorrect;

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

                            ViewsCount =
                                problem.ViewsCount,

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

                            CanRetry =
                                hasAttempted,

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
        /// Submits an official or training answer attempt for a problem.
        /// The first attempt remains the official result while later attempts
        /// are stored as training history without replacing the original result.
        /// يرسل محاولة إجابة رسمية أو تدريبية لمسألة، مع الاحتفاظ بالمحاولة
        /// الأولى كنتيجة رسمية وتخزين المحاولات اللاحقة كسجل تدريبي مستقل.
        /// </summary>
        [Authorize]
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

            await using var transaction =
                await _context.Database
                    .BeginTransactionAsync();

            var progress =
                await _context.UserProgresses
                    .FirstOrDefaultAsync(progressItem =>
                        progressItem.UserId ==
                        userId.Value &&
                        progressItem.ProblemId ==
                        dto.ProblemId);

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

            var isOfficialAttempt =
                progress.Attempts == 0;

            var attemptNumber =
                progress.Attempts + 1;

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

            var pointsEarned =
                isCorrect &&
                !wasSolved
                    ? problem.Points
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
                attemptNumber;

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

                    problem.SolvedCount++;
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
                        false,

                    StartedAt =
                        now.AddSeconds(
                            -timeSpentSeconds),

                    SubmittedAt =
                        now
                };

            _context.ProblemAttempts.Add(
                attempt);

            await _context.SaveChangesAsync();
            await transaction.CommitAsync();

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
                            true,

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
        /// Gets the authenticated student's complete attempt history for a problem.
        /// يعيد سجل محاولات الطالب المسجل بالكامل لمسألة محددة.
        /// </summary>
        [Authorize]
        [HttpGet("{id:int}/attempts")]
        [ProducesResponseType(
            typeof(ApiResponse<ProblemAttemptHistoryDto>),
            StatusCodes.Status200OK)]
        [ProducesResponseType(
            typeof(ApiResponse<object>),
            StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(
            typeof(ApiResponse<object>),
            StatusCodes.Status404NotFound)]
        public async Task<
            ActionResult<ApiResponse<ProblemAttemptHistoryDto>>>
            GetAttemptHistory(
                int id)
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
                        ProblemAttemptHistoryDto>(
                        "Unauthorized",
                        language,
                        StatusCodes.Status401Unauthorized));
            }

            var problemExists =
                await _context.Problems
                    .AsNoTracking()
                    .AnyAsync(problem =>
                        problem.Id == id);

            if (!problemExists)
            {
                return NotFound(
                    LanguageHelper.ErrorResponse<
                        ProblemAttemptHistoryDto>(
                        "ProblemNotFound",
                        language,
                        StatusCodes.Status404NotFound));
            }

            var progress =
                await _context.UserProgresses
                    .AsNoTracking()
                    .FirstOrDefaultAsync(progressItem =>
                        progressItem.UserId ==
                        userId.Value &&
                        progressItem.ProblemId ==
                        id);

            var attempts =
                await _context.ProblemAttempts
                    .AsNoTracking()
                    .Where(attempt =>
                        attempt.UserId ==
                        userId.Value &&
                        attempt.ProblemId ==
                        id)
                    .OrderBy(attempt =>
                        attempt.AttemptNumber)
                    .Select(attempt =>
                        new ProblemAttemptDto
                        {
                            Id =
                                attempt.Id,

                            AttemptNumber =
                                attempt.AttemptNumber,

                            IsOfficial =
                                attempt.IsOfficial,

                            SelectedOptionId =
                                attempt.SelectedOptionId,

                            SelectedOptionText =
                                attempt.SelectedOptionText,

                            CorrectOptionId =
                                attempt.IsCorrect
                                    ? attempt.CorrectOptionId
                                    : null,

                            CorrectOptionText =
                                attempt.IsCorrect
                                    ? attempt.CorrectOptionText
                                    : null,

                            IsCorrect =
                                attempt.IsCorrect,

                            TimeSpentSeconds =
                                attempt.TimeSpentSeconds,

                            PointsEarned =
                                attempt.PointsEarned,

                            UsedHint =
                                attempt.UsedHint,

                            StartedAt =
                                attempt.StartedAt,

                            SubmittedAt =
                                attempt.SubmittedAt
                        })
                    .ToListAsync();

            var response =
                new ProblemAttemptHistoryDto
                {
                    ProblemId =
                        id,

                    TotalAttempts =
                        progress?.Attempts
                        ?? attempts.Count,

                    FirstAttemptCorrect =
                        progress?.FirstAttemptCorrect,

                    IsSolved =
                        progress?.IsSolved
                        ?? false,

                    BestTimeSeconds =
                        progress?.BestTimeSeconds,

                    AverageTimeSeconds =
                        GetAverageTimeSeconds(
                            progress),

                    MasteryStatus =
                        progress?.MasteryStatus
                        ?? MasteryStatuses.New,

                    IsInErrorNotebook =
                        progress?.IsInErrorNotebook
                        ?? false,

                    IsErrorNotebookArchived =
                        progress?.IsErrorNotebookArchived
                        ?? false,

                    NextReviewAt =
                        progress?.NextReviewAt,

                    Attempts =
                        attempts
                };

            return Ok(
                LanguageHelper.SuccessResponse(
                    response,
                    "AttemptHistoryRetrieved",
                    language));
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

            if (!wasInErrorNotebook)
            {
                progress.MasteryStatus =
                    progress.MasteryStatus ==
                    MasteryStatuses.Mastered
                        ? MasteryStatuses.Mastered
                        : MasteryStatuses.Practicing;

                return;
            }

            progress.MasteryStatus =
                MasteryStatuses.Practicing;

            if (!isDueReview)
            {
                return;
            }

            progress.ConsecutiveCorrectReviews++;

            if (progress.ConsecutiveCorrectReviews >= 3)
            {
                progress.MasteryStatus =
                    MasteryStatuses.Mastered;

                progress.IsInErrorNotebook =
                    false;

                progress.IsErrorNotebookArchived =
                    false;

                progress.NextReviewAt =
                    null;

                return;
            }

            progress.NextReviewAt =
                progress.ConsecutiveCorrectReviews == 1
                    ? now.AddDays(3)
                    : now.AddDays(7);
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

        /// <summary>
        /// Updates the view counter and search index in a separate scope.
        /// Errors in this non-critical operation do not fail the request.
        /// </summary>
        private async Task BackgroundUpdateAsync(
            int problemId)
        {
            using var scope =
                _scopeFactory.CreateScope();

            var database =
                scope.ServiceProvider
                    .GetRequiredService<
                        AppDbContext>();

            try
            {
                var problem =
                    await database.Problems
                        .FindAsync(problemId);

                if (problem == null)
                {
                    return;
                }

                problem.ViewsCount++;

                await database.SaveChangesAsync();

                if (_meilisearchEnabled)
                {
                    try
                    {
                        var searchService =
                            scope.ServiceProvider
                                .GetRequiredService<
                                    IMeiliSearchService>();

                        await searchService
                            .UpdateProblemAsync(
                                problem);
                    }
                    catch (Exception exception)
                    {
                        _logger.LogWarning(
                            exception,
                            "Failed to update problem {ProblemId} in MeiliSearch.",
                            problemId);
                    }
                }
            }
            catch (Exception exception)
            {
                _logger.LogWarning(
                    exception,
                    "Failed to update views for problem {ProblemId}.",
                    problemId);
            }
        }
    }
}