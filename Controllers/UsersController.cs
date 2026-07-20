// File: MathWorldAPI/Controllers/UsersController.cs

using System.Data;
using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.DTOs;
using MathWorldAPI.Helpers;
using MathWorldAPI.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers
{
    /// <summary>
    /// Controller for authenticated user profile, dashboard,
    /// favorites, solved problems, error notebook, and favorite status operations.
    /// متحكم ملف المستخدم ولوحة المعلومات والمفضلة والمسائل المحلولة ودفتر الأخطاء.
    /// </summary>
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class UsersController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly ILogger<UsersController> _logger;

        /// <summary>
        /// Initializes a new instance of the UsersController.
        /// </summary>
        public UsersController(
            AppDbContext context,
            ILogger<UsersController> logger)
        {
            _context = context;
            _logger = logger;
        }

        /// <summary>
        /// Gets unified dashboard data for the current user.
        /// Includes profile, statistics, recent solved problems,
        /// recent favorites, and recent activity.
        /// </summary>
        [HttpGet("dashboard")]
        [ProducesResponseType(
            typeof(ApiResponse<UserDashboardDto>),
            StatusCodes.Status200OK)]
        [ProducesResponseType(
            typeof(ApiResponse<UserDashboardDto>),
            StatusCodes.Status404NotFound)]
        public async Task<
            ActionResult<ApiResponse<UserDashboardDto>>> GetDashboard()
        {
            var userId =
                GetUserId();

            var language =
                LanguageHelper.GetLanguageFromRequest(Request);

            var user = await _context.Users
                .AsNoTracking()
                .FirstOrDefaultAsync(item =>
                    item.Id == userId);

            if (user == null)
            {
                return NotFound(
                    LanguageHelper.ErrorResponse<UserDashboardDto>(
                        "UserNotFound",
                        language,
                        StatusCodes.Status404NotFound));
            }

            // Count only correctly solved problems.
            var solvedCount =
                await _context.UserProgresses
                    .CountAsync(progress =>
                        progress.UserId == userId &&
                        progress.IsSolved);

            var favoriteCount =
                await _context.UserProgresses
                    .CountAsync(progress =>
                        progress.UserId == userId &&
                        progress.IsFavorite);

            // Favorite-only records do not count as attempts.
            var totalAttempted =
                await _context.UserProgresses
                    .CountAsync(progress =>
                        progress.UserId == userId &&
                        progress.Attempts > 0);

            // The success rate uses only official first attempts.
            var officialCorrectCount =
                await _context.UserProgresses
                    .CountAsync(progress =>
                        progress.UserId == userId &&
                        progress.FirstAttemptCorrect == true);

            var successRate =
                totalAttempted > 0
                    ? (int)Math.Round(
                        officialCorrectCount /
                        (double)totalAttempted *
                        100)
                    : 0;

            var totalPoints =
                await _context.UserProgresses
                    .Where(progress =>
                        progress.UserId == userId &&
                        progress.IsSolved)
                    .Join(
                        _context.Problems,
                        progress => progress.ProblemId,
                        problem => problem.Id,
                        (_, problem) => problem.Points)
                    .SumAsync();

            var recentSolvedData =
                await _context.UserProgresses
                    .Include(progress =>
                        progress.Problem)
                    .ThenInclude(problem =>
                        problem.Category)
                    .Include(progress =>
                        progress.Problem)
                    .ThenInclude(problem =>
                        problem.Stage)
                    .AsNoTracking()
                    .Where(progress =>
                        progress.UserId == userId &&
                        progress.IsSolved)
                    .OrderByDescending(progress =>
                        progress.SolvedAt)
                    .Take(5)
                    .ToListAsync();

            var recentFavoritesData =
                await _context.UserProgresses
                    .Include(progress =>
                        progress.Problem)
                    .ThenInclude(problem =>
                        problem.Category)
                    .Include(progress =>
                        progress.Problem)
                    .ThenInclude(problem =>
                        problem.Stage)
                    .AsNoTracking()
                    .Where(progress =>
                        progress.UserId == userId &&
                        progress.IsFavorite)
                    .OrderByDescending(progress =>
                        progress.LastAttemptAt)
                    .Take(5)
                    .ToListAsync();

            var dashboard =
                new UserDashboardDto
                {
                    Id = user.Id,
                    FullName = user.FullName,
                    Email = user.Email,
                    Role = user.Role,
                    SubscriptionType =
                        user.SubscriptionType,
                    SolvedProblemsCount =
                        solvedCount,
                    FavoriteProblemsCount =
                        favoriteCount,
                    TotalPoints =
                        totalPoints,
                    SuccessRate =
                        successRate,
                    MemberSince =
                        user.CreatedAt,

                    RecentSolved =
                        recentSolvedData
                            .Take(3)
                            .Select(progress =>
                                MapToProblemPreview(
                                    progress.Problem,
                                    language))
                            .ToList(),

                    RecentFavorites =
                        recentFavoritesData
                            .Select(progress =>
                                MapToProblemPreview(
                                    progress.Problem,
                                    language))
                            .ToList(),

                    RecentActivities =
                        recentSolvedData
                            .Select(progress =>
                                new RecentActivityItemDto
                                {
                                    ProblemId =
                                        progress.Problem.Id,

                                    Title = language == "en"
                                        ? progress.Problem.TitleEn
                                        : progress.Problem.TitleAr,

                                    CategoryName =
                                        language == "en"
                                            ? progress.Problem
                                                .Category.NameEn
                                            : progress.Problem
                                                .Category.NameAr,

                                    SolvedAt =
                                        progress.SolvedAt
                                        ?? progress.LastAttemptAt
                                })
                            .ToList()
                };

            return Ok(
                LanguageHelper.SuccessResponse(
                    dashboard,
                    "Success",
                    language));
        }

        /// <summary>
        /// Gets the current authenticated user profile.
        /// </summary>
        [HttpGet("profile")]
        [ProducesResponseType(
            typeof(ApiResponse<UserProfileDto>),
            StatusCodes.Status200OK)]
        [ProducesResponseType(
            typeof(ApiResponse<UserProfileDto>),
            StatusCodes.Status404NotFound)]
        public async Task<
            ActionResult<ApiResponse<UserProfileDto>>> GetProfile()
        {
            var userId =
                GetUserId();

            var language =
                LanguageHelper.GetLanguageFromRequest(Request);

            var user = await _context.Users
                .AsNoTracking()
                .FirstOrDefaultAsync(item =>
                    item.Id == userId);

            if (user == null)
            {
                return NotFound(
                    LanguageHelper.ErrorResponse<UserProfileDto>(
                        "UserNotFound",
                        language,
                        StatusCodes.Status404NotFound));
            }

            var solvedCount =
                await _context.UserProgresses
                    .CountAsync(progress =>
                        progress.UserId == userId &&
                        progress.IsSolved);

            var totalPoints =
                await _context.UserProgresses
                    .Where(progress =>
                        progress.UserId == userId &&
                        progress.IsSolved)
                    .Join(
                        _context.Problems,
                        progress => progress.ProblemId,
                        problem => problem.Id,
                        (_, problem) => problem.Points)
                    .SumAsync();

            var profile =
                new UserProfileDto
                {
                    Id = user.Id,
                    FullName = user.FullName,
                    Email = user.Email,
                    Role = user.Role,
                    SubscriptionType =
                        user.SubscriptionType,
                    SolvedProblemsCount =
                        solvedCount,
                    TotalPoints =
                        totalPoints,
                    MemberSince =
                        user.CreatedAt
                };

            return Ok(
                LanguageHelper.SuccessResponse(
                    profile,
                    "Success",
                    language));
        }

        /// <summary>
        /// Toggles or explicitly updates favorite status.
        /// A favorite-only record keeps Attempts equal to zero.
        /// </summary>
        [HttpPost("favorite/toggle")]
        [ProducesResponseType(
            typeof(ApiResponse<FavoriteResultDto>),
            StatusCodes.Status200OK)]
        [ProducesResponseType(
            typeof(ApiResponse<FavoriteResultDto>),
            StatusCodes.Status404NotFound)]
        public async Task<
            ActionResult<ApiResponse<FavoriteResultDto>>> ToggleFavorite(
            [FromBody] FavoriteDto dto)
        {
            var userId =
                GetUserId();

            var language =
                LanguageHelper.GetLanguageFromRequest(Request);

            var problemExists =
                await _context.Problems
                    .AnyAsync(problem =>
                        problem.Id == dto.ProblemId);

            if (!problemExists)
            {
                return NotFound(
                    LanguageHelper.ErrorResponse<FavoriteResultDto>(
                        "ProblemNotFound",
                        language,
                        StatusCodes.Status404NotFound));
            }

            await using var transaction =
                await _context.Database.BeginTransactionAsync(
                    IsolationLevel.Serializable);

            try
            {
                var progress =
                    await _context.UserProgresses
                        .FirstOrDefaultAsync(item =>
                            item.UserId == userId &&
                            item.ProblemId == dto.ProblemId);

                var currentValue =
                    progress?.IsFavorite ?? false;

                var targetValue =
                    dto.IsFavorite ?? !currentValue;

                if (progress == null)
                {
                    if (!targetValue)
                    {
                        await transaction.CommitAsync();

                        return Ok(
                            LanguageHelper.SuccessResponse(
                                new FavoriteResultDto
                                {
                                    IsFavorite = false
                                },
                                "RemovedFromFavorites",
                                language));
                    }

                    progress = new UserProgress
                    {
                        UserId = userId,
                        ProblemId = dto.ProblemId,
                        IsFavorite = true,
                        IsSolved = false,
                        IsCorrect = false,
                        Attempts = 0,
                        TimeSpentSeconds = 0,
                        LastAttemptAt =
                            DateTime.UtcNow
                    };

                    _context.UserProgresses.Add(progress);
                }
                else if (!targetValue &&
                         progress.Attempts == 0)
                {
                    // Remove empty favorite-only records completely.
                    _context.UserProgresses.Remove(progress);
                }
                else
                {
                    // Preserve attempt and solution information.
                    progress.IsFavorite = targetValue;
                    progress.LastAttemptAt =
                        DateTime.UtcNow;
                }

                await _context.SaveChangesAsync();
                await transaction.CommitAsync();

                _logger.LogInformation(
                    "User {UserId} changed favorite status for problem {ProblemId} to {IsFavorite}.",
                    userId,
                    dto.ProblemId,
                    targetValue);

                return Ok(
                    LanguageHelper.SuccessResponse(
                        new FavoriteResultDto
                        {
                            IsFavorite = targetValue
                        },
                        targetValue
                            ? "AddedToFavorites"
                            : "RemovedFromFavorites",
                        language));
            }
            catch (DbUpdateException exception)
            {
                await transaction.RollbackAsync();

                _logger.LogWarning(
                    exception,
                    "Concurrent favorite update detected for user {UserId} and problem {ProblemId}.",
                    userId,
                    dto.ProblemId);

                throw;
            }
        }

        /// <summary>
        /// Gets favorite problems for the current user.
        /// </summary>
        [HttpGet("favorites")]
        [ProducesResponseType(
            typeof(ApiResponse<List<ProblemPreviewDto>>),
            StatusCodes.Status200OK)]
        public async Task<
            ActionResult<ApiResponse<List<ProblemPreviewDto>>>> GetFavorites()
        {
            var userId =
                GetUserId();

            var language =
                LanguageHelper.GetLanguageFromRequest(Request);

            var favorites =
                await _context.UserProgresses
                    .AsNoTracking()
                    .Where(progress =>
                        progress.UserId == userId &&
                        progress.IsFavorite)
                    .OrderByDescending(progress =>
                        progress.LastAttemptAt)
                    .Select(progress =>
                        new ProblemPreviewDto
                        {
                            Id =
                                progress.Problem.Id,

                            Title = language == "en"
                                ? progress.Problem.TitleEn
                                : progress.Problem.TitleAr,

                            StageId =
                                progress.Problem.StageId,

                            StageName = language == "en"
                                ? progress.Problem.Stage.NameEn
                                : progress.Problem.Stage.NameAr,

                            CategoryId =
                                progress.Problem.CategoryId,

                            CategoryName = language == "en"
                                ? progress.Problem.Category.NameEn
                                : progress.Problem.Category.NameAr,

                            Points =
                                progress.Problem.Points,

                            ViewsCount =
                                progress.Problem.ViewsCount,

                            RequiresLogin = true
                        })
                    .ToListAsync();

            return Ok(
                LanguageHelper.SuccessResponse(
                    favorites,
                    "Success",
                    language));
        }

        /// <summary>
        /// Gets correctly solved problems for the current user.
        /// </summary>
        [HttpGet("solved")]
        [ProducesResponseType(
            typeof(ApiResponse<List<ProblemPreviewDto>>),
            StatusCodes.Status200OK)]
        public async Task<
            ActionResult<ApiResponse<List<ProblemPreviewDto>>>> GetSolvedProblems()
        {
            var userId =
                GetUserId();

            var language =
                LanguageHelper.GetLanguageFromRequest(Request);

            var solved =
                await _context.UserProgresses
                    .AsNoTracking()
                    .Where(progress =>
                        progress.UserId == userId &&
                        progress.IsSolved)
                    .OrderByDescending(progress =>
                        progress.SolvedAt)
                    .Select(progress =>
                        new ProblemPreviewDto
                        {
                            Id =
                                progress.Problem.Id,

                            Title = language == "en"
                                ? progress.Problem.TitleEn
                                : progress.Problem.TitleAr,

                            StageId =
                                progress.Problem.StageId,

                            StageName = language == "en"
                                ? progress.Problem.Stage.NameEn
                                : progress.Problem.Stage.NameAr,

                            CategoryId =
                                progress.Problem.CategoryId,

                            CategoryName = language == "en"
                                ? progress.Problem.Category.NameEn
                                : progress.Problem.Category.NameAr,

                            Points =
                                progress.Problem.Points,

                            ViewsCount =
                                progress.Problem.ViewsCount,

                            RequiresLogin = true
                        })
                    .ToListAsync();

            return Ok(
                LanguageHelper.SuccessResponse(
                    solved,
                    "Success",
                    language));
        }

        /// <summary>
        /// Gets the current student's error notebook problems.
        /// يعيد مسائل دفتر الأخطاء الخاصة بالطالب الحالي.
        /// </summary>
        [HttpGet("error-notebook")]
        [ProducesResponseType(
            typeof(ApiResponse<List<ErrorNotebookProblemDto>>),
            StatusCodes.Status200OK)]
        public async Task<
            ActionResult<ApiResponse<List<ErrorNotebookProblemDto>>>>
            GetErrorNotebook(
                [FromQuery] bool includeArchived = false)
        {
            var userId =
                GetUserId();

            var language =
                LanguageHelper.GetLanguageFromRequest(
                    Request);

            var query =
                _context.UserProgresses
                    .AsNoTracking()
                    .Where(progress =>
                        progress.UserId == userId &&
                        progress.IsInErrorNotebook);

            if (!includeArchived)
            {
                query =
                    query.Where(progress =>
                        !progress.IsErrorNotebookArchived);
            }

            var problems =
                await query
                    .OrderBy(progress =>
                        progress.NextReviewAt == null)
                    .ThenBy(progress =>
                        progress.NextReviewAt)
                    .ThenByDescending(progress =>
                        progress.LastAttemptAt)
                    .Select(progress =>
                        new ErrorNotebookProblemDto
                        {
                            Id =
                                progress.Problem.Id,

                            Title =
                                language == "en"
                                    ? progress.Problem.TitleEn
                                    : progress.Problem.TitleAr,

                            StageId =
                                progress.Problem.StageId,

                            StageName =
                                language == "en"
                                    ? progress.Problem.Stage.NameEn
                                    : progress.Problem.Stage.NameAr,

                            CategoryId =
                                progress.Problem.CategoryId,

                            CategoryName =
                                language == "en"
                                    ? progress.Problem.Category.NameEn
                                    : progress.Problem.Category.NameAr,

                            AttemptCount =
                                progress.Attempts,

                            IncorrectAttempts =
                                progress.IncorrectAttempts,

                            CorrectAttempts =
                                progress.CorrectAttempts,

                            MasteryStatus =
                                progress.MasteryStatus,

                            IsArchived =
                                progress.IsErrorNotebookArchived,

                            NextReviewAt =
                                progress.NextReviewAt,

                            LastAttemptAt =
                                progress.LastAttemptAt
                        })
                    .ToListAsync();

            return Ok(
                LanguageHelper.SuccessResponse(
                    problems,
                    "ErrorNotebookRetrieved",
                    language));
        }

        /// <summary>
        /// Archives or restores a problem in the current student's error notebook.
        /// يؤرشف أو يستعيد مسألة في دفتر أخطاء الطالب الحالي.
        /// </summary>
        [HttpPut("error-notebook/{problemId:int}/archive")]
        [ProducesResponseType(
            typeof(ApiResponse<ErrorNotebookArchiveResultDto>),
            StatusCodes.Status200OK)]
        [ProducesResponseType(
            typeof(ApiResponse<object>),
            StatusCodes.Status404NotFound)]
        public async Task<
            ActionResult<ApiResponse<ErrorNotebookArchiveResultDto>>>
            SetErrorNotebookArchive(
                int problemId,
                [FromBody] SetErrorNotebookArchiveDto dto)
        {
            var userId =
                GetUserId();

            var language =
                LanguageHelper.GetLanguageFromRequest(
                    Request);

            var progress =
                await _context.UserProgresses
                    .FirstOrDefaultAsync(progressItem =>
                        progressItem.UserId == userId &&
                        progressItem.ProblemId == problemId &&
                        progressItem.IsInErrorNotebook);

            if (progress == null)
            {
                return NotFound(
                    LanguageHelper.ErrorResponse<
                        ErrorNotebookArchiveResultDto>(
                        "ProblemNotInErrorNotebook",
                        language,
                        StatusCodes.Status404NotFound));
            }

            progress.IsErrorNotebookArchived =
                dto.IsArchived;

            await _context.SaveChangesAsync();

            var messageKey =
                dto.IsArchived
                    ? "ProblemArchivedFromErrorNotebook"
                    : "ProblemRestoredToErrorNotebook";

            return Ok(
                LanguageHelper.SuccessResponse(
                    new ErrorNotebookArchiveResultDto
                    {
                        ProblemId =
                            problemId,

                        IsArchived =
                            progress.IsErrorNotebookArchived
                    },
                    messageKey,
                    language));
        }

        /// <summary>
        /// Checks whether a problem is currently in the user's favorites.
        /// </summary>
        [HttpGet("favorite/check/{problemId:int}")]
        [ProducesResponseType(
            typeof(ApiResponse<FavoriteCheckDto>),
            StatusCodes.Status200OK)]
        public async Task<
            ActionResult<ApiResponse<FavoriteCheckDto>>> CheckFavorite(
            int problemId)
        {
            var userId =
                GetUserId();

            var language =
                LanguageHelper.GetLanguageFromRequest(Request);

            var isFavorite =
                await _context.UserProgresses
                    .AnyAsync(progress =>
                        progress.UserId == userId &&
                        progress.ProblemId == problemId &&
                        progress.IsFavorite);

            return Ok(
                LanguageHelper.SuccessResponse(
                    new FavoriteCheckDto
                    {
                        IsFavorite = isFavorite
                    },
                    "Success",
                    language));
        }

        /// <summary>
        /// Gets the authenticated user ID from JWT claims.
        /// </summary>
        private int GetUserId()
        {
            var value =
                User.FindFirstValue(
                    ClaimTypes.NameIdentifier);

            if (!int.TryParse(
                    value,
                    out var userId))
            {
                throw new UnauthorizedAccessException(
                    "The authenticated user ID is invalid.");
            }

            return userId;
        }

        /// <summary>
        /// Maps a problem entity to a localized problem preview.
        /// </summary>
        private static ProblemPreviewDto MapToProblemPreview(
            MathProblem problem,
            string language)
        {
            return new ProblemPreviewDto
            {
                Id = problem.Id,

                Title = language == "en"
                    ? problem.TitleEn
                    : problem.TitleAr,

                StageId = problem.StageId,

                StageName = language == "en"
                    ? problem.Stage.NameEn
                    : problem.Stage.NameAr,

                CategoryId = problem.CategoryId,

                CategoryName = language == "en"
                    ? problem.Category.NameEn
                    : problem.Category.NameAr,

                Points = problem.Points,
                ViewsCount = problem.ViewsCount,
                RequiresLogin = true
            };
        }
    }
}