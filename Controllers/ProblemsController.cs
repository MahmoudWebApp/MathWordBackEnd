// File: MathWorldAPI/Controllers/ProblemsController.cs

using System.Data;
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
    /// problem details, view counters, and answer submission.
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
            page = Math.Max(1, page);
            pageSize = Math.Clamp(pageSize, 1, 100);

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
                LanguageHelper.GetLanguageFromRequest(Request);

            if (string.IsNullOrWhiteSpace(q))
            {
                var query = _context.Problems
                    .AsNoTracking()
                    .Include(problem => problem.Category)
                    .Include(problem => problem.Stage)
                    .AsQueryable();

                if (categoryId.HasValue)
                {
                    query = query.Where(
                        problem =>
                            problem.CategoryId ==
                            categoryId.Value);
                }

                if (stageId.HasValue)
                {
                    query = query.Where(
                        problem =>
                            problem.StageId ==
                            stageId.Value);
                }

                var total =
                    await query.CountAsync();

                var totalPages =
                    (int)Math.Ceiling(
                        total / (double)pageSize);

                var allProblems = await query
                    .OrderByDescending(problem => problem.Id)
                    .Skip((page - 1) * pageSize)
                    .Take(pageSize)
                    .Select(problem => new ProblemPreviewDto
                    {
                        Id = problem.Id,

                        Title = language == "en"
                            ? problem.TitleEn
                            : problem.TitleAr,

                        StageId = problem.StageId,

                        StageName = language == "en"
                            ? problem.Stage.NameEn
                            : problem.Stage.NameAr,

                        Points = problem.Points,

                        CategoryId = problem.CategoryId,

                        CategoryName = language == "en"
                            ? problem.Category.NameEn
                            : problem.Category.NameAr,

                        ViewsCount = problem.ViewsCount,
                        RequiresLogin = true
                    })
                    .ToListAsync();

                var response = new SearchResponseDto
                {
                    Query = q,
                    Page = page,
                    PageSize = pageSize,
                    Results = allProblems,
                    Total = total,
                    TotalPages = totalPages
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
                            SearchType = "Meilisearch",
                            Query = q,
                            Total = total,
                            Page = page,
                            PageSize = pageSize,
                            TotalPages = totalPages
                        }));
            }

            var (problemIds, totalCount) =
                await _searchService.SearchWithPaginationAsync(
                    q,
                    categoryId,
                    stageId,
                    page,
                    pageSize);

            var totalResultPages =
                (int)Math.Ceiling(
                    totalCount / (double)pageSize);

            if (problemIds == null ||
                problemIds.Count == 0)
            {
                return Ok(
                    LanguageHelper.SuccessResponse(
                        new SearchResponseDto
                        {
                            Query = q,
                            Page = page,
                            PageSize = pageSize,
                            Results = new List<ProblemPreviewDto>(),
                            Total = 0,
                            TotalPages = 0
                        },
                        "NoResultsFound",
                        language,
                        meta: new MetaData
                        {
                            SearchType = "Meilisearch",
                            Query = q,
                            Total = 0,
                            Page = page,
                            PageSize = pageSize,
                            TotalPages = 0
                        }));
            }

            var problems = await _context.Problems
                .AsNoTracking()
                .Include(problem => problem.Category)
                .Include(problem => problem.Stage)
                .Where(problem =>
                    problemIds.Contains(problem.Id))
                .Select(problem => new ProblemPreviewDto
                {
                    Id = problem.Id,

                    Title = language == "en"
                        ? problem.TitleEn
                        : problem.TitleAr,

                    StageId = problem.StageId,

                    StageName = language == "en"
                        ? problem.Stage.NameEn
                        : problem.Stage.NameAr,

                    Points = problem.Points,

                    CategoryId = problem.CategoryId,

                    CategoryName = language == "en"
                        ? problem.Category.NameEn
                        : problem.Category.NameAr,

                    ViewsCount = problem.ViewsCount,
                    RequiresLogin = true
                })
                .ToListAsync();

            // Preserve the result order returned by MeiliSearch.
            var ordered = problemIds
                .Select(id =>
                    problems.FirstOrDefault(
                        problem => problem.Id == id))
                .Where(problem => problem != null)
                .Select(problem => problem!)
                .ToList();

            return Ok(
                LanguageHelper.SuccessResponse(
                    new SearchResponseDto
                    {
                        Query = q,
                        Page = page,
                        PageSize = pageSize,
                        Results = ordered,
                        Total = totalCount,
                        TotalPages = totalResultPages
                    },
                    ordered.Count == 0
                        ? "NoResultsFound"
                        : "Success",
                    language,
                    meta: new MetaData
                    {
                        SearchType = "Meilisearch",
                        Query = q,
                        Total = totalCount,
                        Page = page,
                        PageSize = pageSize,
                        TotalPages = totalResultPages
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
            page = Math.Max(1, page);
            pageSize = Math.Clamp(pageSize, 1, 100);

            var language =
                LanguageHelper.GetLanguageFromRequest(Request);

            var query = _context.Problems
                .AsNoTracking()
                .Include(problem => problem.Category)
                .Include(problem => problem.Stage)
                .AsQueryable();

            if (!string.IsNullOrWhiteSpace(q))
            {
                var normalizedQuery = q.Trim();

                query = query.Where(problem =>
                    problem.TitleAr.Contains(normalizedQuery) ||
                    problem.TitleEn.Contains(normalizedQuery) ||
                    problem.QuestionTextAr.Contains(normalizedQuery) ||
                    problem.QuestionTextEn.Contains(normalizedQuery));
            }

            if (categoryId.HasValue)
            {
                query = query.Where(
                    problem =>
                        problem.CategoryId ==
                        categoryId.Value);
            }

            if (stageId.HasValue)
            {
                query = query.Where(
                    problem =>
                        problem.StageId ==
                        stageId.Value);
            }

            var total =
                await query.CountAsync();

            var totalPages =
                (int)Math.Ceiling(
                    total / (double)pageSize);

            var problems = await query
                .OrderByDescending(problem => problem.Id)
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .Select(problem => new ProblemPreviewDto
                {
                    Id = problem.Id,

                    Title = language == "en"
                        ? problem.TitleEn
                        : problem.TitleAr,

                    StageId = problem.StageId,

                    StageName = language == "en"
                        ? problem.Stage.NameEn
                        : problem.Stage.NameAr,

                    Points = problem.Points,

                    CategoryId = problem.CategoryId,

                    CategoryName = language == "en"
                        ? problem.Category.NameEn
                        : problem.Category.NameAr,

                    ViewsCount = problem.ViewsCount,
                    RequiresLogin = true
                })
                .ToListAsync();

            return Ok(
                LanguageHelper.SuccessResponse(
                    new SearchResponseDto
                    {
                        Query = q,
                        Page = page,
                        PageSize = pageSize,
                        Results = problems,
                        Total = total,
                        TotalPages = totalPages
                    },
                    problems.Count == 0
                        ? "NoResultsFound"
                        : "Success",
                    language,
                    meta: new MetaData
                    {
                        SearchType = "PostgreSQL",
                        Query = q,
                        Total = total,
                        Page = page,
                        PageSize = pageSize,
                        TotalPages = totalPages
                    }));
        }

        /// <summary>
        /// Unified problem search endpoint.
        /// Uses MeiliSearch or PostgreSQL according to configuration.
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
            [FromQuery] string? engine = "meilisearch",
            [FromQuery] int page = 1,
            [FromQuery] int pageSize = 10)
        {
            var usePostgres =
                !_meilisearchEnabled ||
                string.Equals(
                    engine,
                    "postgresql",
                    StringComparison.OrdinalIgnoreCase);

            return usePostgres
                ? await PostgreSqlSearch(
                    q,
                    categoryId,
                    stageId,
                    page,
                    pageSize)
                : await MeiliSearch(
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
                LanguageHelper.GetLanguageFromRequest(Request);

            var userId =
                GetUserId();

            var userRole =
                GetUserRole();

            var problem = await _context.Problems
                .Include(item => item.Category)
                .Include(item => item.Stage)
                .Include(item => item.Options)
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
            _ = BackgroundUpdateAsync(id);

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

                            StageName = language == "en"
                                ? problem.Stage.NameEn
                                : problem.Stage.NameAr,

                            problem.Points,
                            problem.CategoryId,

                            CategoryName = language == "en"
                                ? problem.Category.NameEn
                                : problem.Category.NameAr,

                            CategoryIcon = categoryIcon,
                            problem.YoutubeSolutionUrl,

                            Options = problem.Options
                                .OrderBy(option => option.Order)
                                .Select(option => new AdminOptionDto
                                {
                                    Id = option.Id,
                                    LatexCode = option.LatexCode,
                                    IsCorrect = option.IsCorrect,
                                    Order = option.Order
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
                            progressItem.UserId == userId.Value &&
                            progressItem.ProblemId == id);

                // A favorite-only record has Attempts equal to zero
                // and must not be treated as an answer attempt.
                var hasAttempted =
                    progress != null &&
                    progress.Attempts > 0;

                var correctOptionId =
                    hasAttempted
                        ? problem.Options
                            .FirstOrDefault(option => option.IsCorrect)
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
                                    ? problem.Stage?.NameEn
                                        ?? "Unknown Stage"
                                    : problem.Stage?.NameAr
                                        ?? "مرحلة غير معروفة",

                            Points =
                                problem.Points,

                            ViewsCount =
                                problem.ViewsCount,

                            CategoryId =
                                problem.CategoryId,

                            CategoryName =
                                language == "en"
                                    ? problem.Category.NameEn
                                    : problem.Category.NameAr,

                            CategoryIcon =
                                problem.Category.Icon,

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

                            // Never expose the solution before an answer attempt.
                            DetailedSolution =
                                hasAttempted
                                    ? language == "en"
                                        ? problem.DetailedSolutionEn
                                        : problem.DetailedSolutionAr
                                    : null,

                            YoutubeSolutionUrl =
                                hasAttempted
                                    ? problem.YoutubeSolutionUrl
                                    : null,

                            // Never expose option correctness to students.
                            Options =
                                problem.Options
                                    .OrderBy(option => option.Order)
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
                    Id = problem.Id,

                    Title = language == "en"
                        ? problem.TitleEn
                        : problem.TitleAr,

                    QuestionText = language == "en"
                        ? problem.QuestionTextEn
                        : problem.QuestionTextAr,

                    StageId = problem.StageId,

                    StageName = language == "en"
                        ? problem.Stage.NameEn
                        : problem.Stage.NameAr,

                    CategoryId = problem.CategoryId,

                    CategoryName = language == "en"
                        ? problem.Category.NameEn
                        : problem.Category.NameAr,

                    CategoryIcon = categoryIcon,

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
        /// Submits an answer for a problem.
        /// Only one answer attempt is allowed per user and problem.
        /// A favorite-only progress record may still be converted
        /// into a real answer attempt.
        /// </summary>
        [Authorize]
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
                        ApiResponse<AnswerResultDto>>(
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
                        ApiResponse<AnswerResultDto>>(
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
                        ApiResponse<AnswerResultDto>>(
                        "OptionNotFound",
                        language));
            }

            var progress =
                await _context.UserProgresses
                    .FirstOrDefaultAsync(progressItem =>
                        progressItem.UserId ==
                            userId.Value &&
                        progressItem.ProblemId ==
                            dto.ProblemId);

            // A record with Attempts greater than zero means
            // the student has already submitted an answer.
            if (progress != null &&
                progress.Attempts > 0)
            {
                return BadRequest(
                    LanguageHelper.ErrorResponse<
                        ApiResponse<AnswerResultDto>>(
                        "OnlyOneAttemptAllowed",
                        language));
            }

            var isCorrect =
                selectedOption.IsCorrect;

            var now =
                DateTime.UtcNow;

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
                            false
                    };

                _context.UserProgresses.Add(
                    progress);
            }

            progress.IsSolved =
                isCorrect;

            progress.IsCorrect =
                isCorrect;

            progress.SelectedOptionId =
                dto.SelectedOptionId;

            progress.Attempts =
                1;

            progress.TimeSpentSeconds =
                Math.Clamp(
                    dto.TimeSpentSeconds,
                    1,
                    86400);

            progress.SolvedAt =
                isCorrect
                    ? now
                    : null;

            progress.LastAttemptAt =
                now;

            if (isCorrect)
            {
                problem.SolvedCount++;
            }

            await _context.SaveChangesAsync();

            var correctOption =
                problem.Options.First(
                    option => option.IsCorrect);

            var correctText =
                correctOption.LatexCode;

            var messageKey =
                isCorrect
                    ? "AnswerCorrect"
                    : "AnswerWrong";

            var messageArgs =
                isCorrect
                    ? Array.Empty<object>()
                    : new object[]
                    {
                correctText
                    };

            return Ok(
                LanguageHelper.SuccessResponse(
                    new AnswerResultDto
                    {
                        IsCorrect =
                            isCorrect,

                        IsSolved =
                            isCorrect,

                        SelectedOptionId =
                            dto.SelectedOptionId,

                        CorrectOptionId =
                            correctOption.Id,

                        PointsEarned =
                            isCorrect
                                ? problem.Points
                                : 0,

                        DetailedSolution =
                            language == "en"
                                ? problem.DetailedSolutionEn
                                : problem.DetailedSolutionAr,

                        CorrectOptionText =
                            correctText,

                        YoutubeSolutionUrl =
                            problem.YoutubeSolutionUrl
                    },
                    messageKey,
                    language,
                    args: messageArgs));
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
            return User.Identity?.IsAuthenticated == true
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
                    .GetRequiredService<AppDbContext>();

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

                        await searchService.UpdateProblemAsync(
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