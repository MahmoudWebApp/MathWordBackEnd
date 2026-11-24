// File: MathWorldAPI/Controllers/UsersController.cs

using System.Data;
using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.DTOs;
using MathWorldAPI.Helpers;
using MathWorldAPI.Models;
using MathWorldAPI.Services;
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
        [Authorize(Roles = "Student")]
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

            // Dashboard data is scoped to the learner's ACTIVE stage. Stage
            // changes preserve all progress in UserProgresses and attempts.
            var activeStageId = user.CurrentStageId;
            var allowedCategories = await HttpContext.RequestServices
                .GetRequiredService<ProblemCategoryAccessService>()
                .GetAllowedCategoryIdsAsync(User, HttpContext.RequestAborted);

            var tracks=HttpContext.RequestServices.GetRequiredService<LearningTrackService>();
            var activeTrack=await tracks.ActiveAsync(activeStageId,user.CurrentTrackId,HttpContext.RequestAborted);
            var scopedProblems=activeTrack is null ? _context.Problems.AsNoTracking() : tracks.ValidProblems(activeTrack.Id);
            // Consolidated stage-scoped counters: one DB query rather than
            // five remote trips. Keep original access and progress rules.
            var practiceScope=TrackPractice.Scope(HttpContext.RequestServices.GetRequiredService<IConfiguration>(),activeTrack?.Id);
            var scopedProgress=TrackPractice.For(_context,practiceScope);
            var progressCounts = await scopedProgress
                .AsNoTracking()
                .Where(progress =>
                    progress.UserId == userId &&
                    (allowedCategories == null ||
                     allowedCategories.Contains(progress.Problem.CategoryId)) &&
                    progress.Problem.Category.StageId == progress.Problem.StageId &&
                        scopedProblems.Any(p=>p.Id==progress.ProblemId) &&
                    (!activeStageId.HasValue ||
                     progress.Problem.StageId == activeStageId.Value))
                .GroupBy(_ => 1)
                .Select(group => new
                {
                    SolvedCount = group.Count(progress => progress.IsSolved),
                    FavoriteCount = group.Count(progress => progress.IsFavorite),
                    TotalAttempted = group.Count(progress => progress.Attempts > 0),
                    OfficialCorrect = group.Count(progress =>
                        progress.FirstAttemptCorrect == true),
                    TotalPoints = group.Where(progress => progress.IsSolved)
                        .Sum(progress => progress.Problem.Points)
                })
                .FirstOrDefaultAsync();

            var solvedCount = progressCounts?.SolvedCount ?? 0;
            var favoriteCount = await _context.UserProgresses.CountAsync(p=>p.UserId==userId&&p.IsFavorite&&scopedProblems.Any(q=>q.Id==p.ProblemId)&&(!activeStageId.HasValue||p.Problem.StageId==activeStageId)&&(allowedCategories==null||allowedCategories.Contains(p.Problem.CategoryId)));
            var totalAttempted = progressCounts?.TotalAttempted ?? 0;
            var officialCorrectCount = progressCounts?.OfficialCorrect ?? 0;
            var totalPoints = progressCounts?.TotalPoints ?? 0;
            var successRate = totalAttempted > 0
                ? (int)Math.Round(
                    officialCorrectCount / (double)totalAttempted * 100)
                : 0;

            var recentSolvedData =
                await scopedProgress
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
                        (allowedCategories == null ||
                         allowedCategories.Contains(progress.Problem.CategoryId)) &&
                        progress.Problem.Category.StageId == progress.Problem.StageId &&
                        scopedProblems.Any(p=>p.Id==progress.ProblemId) &&
                        (!activeStageId.HasValue ||
                         progress.Problem.StageId == activeStageId.Value) &&
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
                        (allowedCategories == null ||
                         allowedCategories.Contains(progress.Problem.CategoryId)) &&
                        progress.Problem.Category.StageId == progress.Problem.StageId &&
                        scopedProblems.Any(p=>p.Id==progress.ProblemId) &&
                        (!activeStageId.HasValue ||
                         progress.Problem.StageId == activeStageId.Value) &&
                        progress.IsFavorite)
                    .OrderByDescending(progress =>
                        progress.LastAttemptAt)
                    .Take(5)
                    .ToListAsync();

            var favoriteState=await scopedProgress.Where(p=>p.UserId==userId&&recentFavoritesData.Select(f=>f.ProblemId).ToArray().Contains(p.ProblemId)).AsNoTracking().ToDictionaryAsync(p=>p.ProblemId);
            var dashboard =
                new UserDashboardDto
                {
                    Id = user.Id,
                    FullName = user.FullName,
                    Email = user.Email,
                    Role = user.Role,
                    SubscriptionType =
                        user.SubscriptionType,
                    CurrentStageId = activeStageId,
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
                                    language,
                                    progress.IsSolved,
                                    progress.Attempts > 0))
                            .ToList(),

                    RecentFavorites =
                        recentFavoritesData
                            .Select(progress =>
                                MapToProblemPreview(
                                    progress.Problem,
                                    language,
                                    favoriteState.GetValueOrDefault(progress.ProblemId)?.IsSolved==true,
                                    (favoriteState.GetValueOrDefault(progress.ProblemId)?.Attempts??0)>0))
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
        [MathWorldAPI.Services.SupervisorEndpoint]
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
                    CurrentStageId = await LegacyLearningStage.EffectiveIdForUserAsync(
                        _context, user.CurrentStageId, user.CreatedAt, HttpContext.RequestAborted),
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
        [Authorize(Roles = "Student")]
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

            var problemAccess = await _context.Problems.AsNoTracking()
                .Where(problem => problem.Id == dto.ProblemId)
                .Select(problem => new { problem.CategoryId, problem.StageId })
                .FirstOrDefaultAsync();

            var problemExists = problemAccess != null;
            if (problemExists)
            {
                var access = HttpContext.RequestServices
                    .GetRequiredService<ProblemCategoryAccessService>();
                if (!await access.CanReadProblemAsync(User, problemAccess!.StageId, problemAccess.CategoryId,
                    HttpContext.RequestAborted))
                    return StatusCode(StatusCodes.Status403Forbidden,
                        new { Message = "CategoryLocked" });
            }

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
                         progress.Attempts == 0 && progress.HintsRevealed==0)
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
        [Authorize(Roles = "Student")]
        [HttpGet("favorites")]
        [ProducesResponseType(
            typeof(ApiResponse<List<ProblemPreviewDto>>),
            StatusCodes.Status200OK)]
        public async Task<
            ActionResult<ApiResponse<List<ProblemPreviewDto>>>> GetFavorites()
        {
            var userId =
                GetUserId();

            var learner = await _context.Users.AsNoTracking()
                .Where(user => user.Id == userId)
                .Select(user => new { user.CurrentStageId, user.CreatedAt })
                .FirstOrDefaultAsync();
            if (learner == null)
                return NotFound();
            var activeStageId = await LegacyLearningStage.EffectiveIdForUserAsync(
                _context, learner.CurrentStageId, learner.CreatedAt, HttpContext.RequestAborted);

            var language =
                LanguageHelper.GetLanguageFromRequest(Request);
            if (!activeStageId.HasValue)
                return Ok(LanguageHelper.SuccessResponse(
                    new List<ProblemPreviewDto>(), "Success", language));

            var allowedCategories = await HttpContext.RequestServices
                .GetRequiredService<ProblemCategoryAccessService>()
                .GetAllowedCategoryIdsAsync(User, HttpContext.RequestAborted);

            var tracks=HttpContext.RequestServices.GetRequiredService<LearningTrackService>();
            var track=await tracks.ActiveForStudentAsync(User,HttpContext.RequestAborted);
            var scopedProblems=track is null?_context.Problems.AsNoTracking():tracks.ValidProblems(track.Id);

            var scopedProgress=TrackPractice.For(_context,TrackPractice.Scope(HttpContext.RequestServices.GetRequiredService<IConfiguration>(),track?.Id));
            var favorites =
                await _context.UserProgresses
                    .AsNoTracking()
                    .Where(progress =>
                        (allowedCategories == null ||
                         allowedCategories.Contains(progress.Problem.CategoryId)) &&
                        progress.Problem.Category.StageId == progress.Problem.StageId &&
                        progress.UserId == userId &&
                        progress.Problem.StageId == activeStageId.Value &&
                        scopedProblems.Any(p=>p.Id==progress.ProblemId) &&
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

                            RequiresLogin = true,
                            IsSolved = scopedProgress.Any(p=>p.UserId==userId&&p.ProblemId==progress.ProblemId&&p.IsSolved),
                            HasAttempted = scopedProgress.Any(p=>p.UserId==userId&&p.ProblemId==progress.ProblemId&&p.Attempts>0)
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
        [Authorize(Roles = "Student")]
        [HttpGet("solved")]
        [ProducesResponseType(
            typeof(ApiResponse<List<ProblemPreviewDto>>),
            StatusCodes.Status200OK)]
        public async Task<
            ActionResult<ApiResponse<List<ProblemPreviewDto>>>> GetSolvedProblems()
        {
            var userId =
                GetUserId();

            var selectedStageId = await _context.Users.AsNoTracking()
                .Where(user => user.Id == userId)
                .Select(user => user.CurrentStageId)
                .FirstOrDefaultAsync();
            var activeStageId = await LegacyLearningStage.EffectiveIdAsync(
                _context, selectedStageId, HttpContext.RequestAborted);

            var language =
                LanguageHelper.GetLanguageFromRequest(Request);

            // A new student may not have chosen a stage yet. Do not access
            // the nullable effective stage or query unrelated solved problems.
            if (!activeStageId.HasValue)
                return Ok(LanguageHelper.SuccessResponse(
                    new List<ProblemPreviewDto>(), "Success", language));

            var allowedCategories = await HttpContext.RequestServices
                .GetRequiredService<ProblemCategoryAccessService>()
                .GetAllowedCategoryIdsAsync(User, HttpContext.RequestAborted);

            var tracks=HttpContext.RequestServices.GetRequiredService<LearningTrackService>();
            var track=await tracks.ActiveForStudentAsync(User,HttpContext.RequestAborted);
            var scopedProblems=track is null?_context.Problems.AsNoTracking():tracks.ValidProblems(track.Id);

            var solved =
                await TrackPractice.For(_context,TrackPractice.Scope(HttpContext.RequestServices.GetRequiredService<IConfiguration>(),track?.Id))
                    .AsNoTracking()
                    .Where(progress =>
                        (allowedCategories == null ||
                         allowedCategories.Contains(progress.Problem.CategoryId)) &&
                        progress.Problem.Category.StageId == progress.Problem.StageId &&
                        progress.UserId == userId &&
                        progress.Problem.StageId == activeStageId.Value &&
                        scopedProblems.Any(p=>p.Id==progress.ProblemId) &&
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

                            RequiresLogin = true,
                            IsSolved = true,
                            HasAttempted = progress.Attempts > 0
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
        [Authorize(Roles = "Student")]
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

            // Keep the underlying notebook across all stages and tracks.
            // A selected track narrows its active view without deleting errors.
            // Existing stage-only behavior stays unchanged when tracks are disabled.
            var language =
                LanguageHelper.GetLanguageFromRequest(
                    Request);

            var allowedCategories = await HttpContext.RequestServices
                .GetRequiredService<ProblemCategoryAccessService>()
                .GetAllowedCategoryIdsAsync(User, HttpContext.RequestAborted);

            var practiceScope=await TrackPractice.CurrentAsync(_context,HttpContext,HttpContext.RequestAborted);
            var query =
                TrackPractice.For(_context,practiceScope)
                    .AsNoTracking()
                    .Where(progress =>
                        (allowedCategories == null ||
                         allowedCategories.Contains(progress.Problem.CategoryId)) &&
                        progress.Problem.Category.StageId == progress.Problem.StageId &&
                        progress.UserId == userId &&
                        progress.IsInErrorNotebook);

            var tracks=HttpContext.RequestServices.GetRequiredService<LearningTrackService>();
            var track=await tracks.ActiveForStudentAsync(User,HttpContext.RequestAborted);
            var scopedProblems=track is null?_context.Problems.AsNoTracking():tracks.ValidProblems(track.Id);

            if(track is not null)
                query=query.Where(p=>scopedProblems.Any(q=>q.Id==p.ProblemId));

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
        [Authorize(Roles = "Student")]
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

            var access = HttpContext.RequestServices
                .GetRequiredService<ProblemCategoryAccessService>();
            var problemAccess = await _context.Problems.AsNoTracking()
                .Where(p => p.Id == problemId)
                .Select(p => new { p.StageId, p.CategoryId })
                .FirstOrDefaultAsync();
            if (problemAccess == null)
                return NotFound(new { Message = "ProblemNotFound" });
            if (!await access.CanReadProblemAsync(User, problemAccess.StageId, problemAccess.CategoryId,
                HttpContext.RequestAborted))
                return StatusCode(StatusCodes.Status403Forbidden,
                    new { Message = "CategoryLocked" });

            await using var cycleTx=await _context.Database.BeginTransactionAsync(HttpContext.RequestAborted);
            await _context.Database.SqlQuery<int>($"SELECT 1 AS \"Value\" FROM pg_advisory_xact_lock({-987654320}, {userId})").SingleAsync(HttpContext.RequestAborted);
            var practiceScope=await TrackPractice.CurrentAsync(_context,HttpContext,HttpContext.RequestAborted);
            var progress =
                await TrackPractice.For(_context,practiceScope)
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
            await cycleTx.CommitAsync(HttpContext.RequestAborted);

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
        [Authorize(Roles = "Student")]
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

            var access = HttpContext.RequestServices
                .GetRequiredService<ProblemCategoryAccessService>();
            var problemAccess = await _context.Problems.AsNoTracking()
                .Where(p => p.Id == problemId)
                .Select(p => new { p.StageId, p.CategoryId })
                .FirstOrDefaultAsync();
            if (problemAccess == null)
                return NotFound(new { Message = "ProblemNotFound" });
            if (!await access.CanReadProblemAsync(User, problemAccess.StageId, problemAccess.CategoryId,
                HttpContext.RequestAborted))
                return StatusCode(StatusCodes.Status403Forbidden,
                    new { Message = "CategoryLocked" });

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
            string language,
            bool isSolved,
            bool hasAttempted)
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
                RequiresLogin = true,
                IsSolved = isSolved,
                HasAttempted = hasAttempted
            };
        }
    }
}