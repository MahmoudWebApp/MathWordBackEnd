using MathWorldAPI.Data;
using MathWorldAPI.DTOs;
using MathWorldAPI.Helpers;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers
{
    /// <summary>
    /// Read-only learner management. No admin identities or password hashes
    /// appear in results; all actions require the real Admin JWT role.
    /// Historic points are read from awarded attempt snapshots.
    /// </summary>
    [ApiController]
    [Route("api/admin/learners")]
    [Authorize(Roles = "Admin")]
    public sealed class AdminLearnersController : ControllerBase
    {
        private readonly AppDbContext _db;

        public AdminLearnersController(AppDbContext db) => _db = db;

        [HttpGet]
        public async Task<IActionResult> List(
            [FromQuery] string? search = null,
            [FromQuery] int? stageId = null,
            [FromQuery] bool? isActive = null,
            [FromQuery] string? subscription = null,
            [FromQuery] int page = 1,
            [FromQuery] int pageSize = 20,
            CancellationToken cancellationToken = default)
        {
            if (!ValidPagination(page, pageSize) || search?.Length > 100 ||
                (stageId.HasValue && stageId <= 0) ||
                (!string.IsNullOrWhiteSpace(subscription) &&
                    subscription != "Free" && subscription != "Premium"))
                return BadRequest(Error<AdminLearnerListDto>("InvalidLearnerFilters", 400));

            var query = _db.Users.AsNoTracking()
                .Where(user => user.Role == "Student");
            if (stageId.HasValue)
                query = query.Where(user => user.CurrentStageId == stageId.Value);
            if (isActive.HasValue)
                query = query.Where(user => user.IsActive == isActive.Value);
            var nowUtc = DateTime.UtcNow;
            if (subscription == "Premium")
                query = query.Where(user => user.SubscriptionType == "Premium" &&
                    (user.PremiumExpiresAtUtc == null ||
                     user.PremiumExpiresAtUtc > nowUtc));
            else if (subscription == "Free")
                query = query.Where(user => user.SubscriptionType != "Premium" ||
                    (user.PremiumExpiresAtUtc != null &&
                     user.PremiumExpiresAtUtc <= nowUtc));

            var keyword = search?.Trim();
            if (!string.IsNullOrEmpty(keyword))
            {
                // Escape LIKE metacharacters so a search term stays literal.
                var pattern = "%" + keyword.Replace("\\", "\\\\")
                    .Replace("%", "\\%").Replace("_", "\\_") + "%";
                query = query.Where(user =>
                    EF.Functions.ILike(user.FullName, pattern, "\\") ||
                    EF.Functions.ILike(user.Email, pattern, "\\"));
            }

            var total = await query.CountAsync(cancellationToken);
            var users = await query.OrderByDescending(u => u.CreatedAt)
                .ThenBy(u => u.Id)
                .Skip((page - 1) * pageSize).Take(pageSize)
                .Select(u => new
                {
                    u.Id, u.FullName, u.Email, u.CurrentStageId,
                    u.SubscriptionType, u.PremiumExpiresAtUtc, u.IsActive, u.CreatedAt, u.LastLoginAt
                }).ToListAsync(cancellationToken);
            var ids = users.Select(u => u.Id).ToArray();

            var progress = await _db.UserProgresses.AsNoTracking()
                .Where(p => ids.Contains(p.UserId))
                .GroupBy(p => p.UserId)
                .Select(g => new
                {
                    Id = g.Key,
                    Solved = g.Count(p => p.IsSolved),
                    Attempted = g.Count(p => p.Attempts > 0)
                }).ToDictionaryAsync(x => x.Id, cancellationToken);

            var attempts = await _db.ProblemAttempts.AsNoTracking()
                .Where(a => ids.Contains(a.UserId))
                .GroupBy(a => a.UserId)
                .Select(g => new
                {
                    Id = g.Key,
                    Points = g.Sum(a => a.PointsEarned),
                    LastAttemptAt = (DateTime?)g.Max(a => a.SubmittedAt)
                }).ToDictionaryAsync(x => x.Id, cancellationToken);

            var stages = await _db.EducationalStages.AsNoTracking()
                .Select(s => new { s.Id, s.NameAr, s.NameEn })
                .ToDictionaryAsync(x => x.Id, cancellationToken);
            var response = new AdminLearnerListDto
            {
                Total = total, Page = page, PageSize = pageSize,
                TotalPages = (int)Math.Ceiling(total / (double)pageSize),
                Learners = users.Select(u =>
                {
                    progress.TryGetValue(u.Id, out var p);
                    attempts.TryGetValue(u.Id, out var a);
                    var stage = u.CurrentStageId.HasValue &&
                        stages.TryGetValue(u.CurrentStageId.Value, out var s) ? s : null;
                    return new AdminLearnerSummaryDto
                    {
                        Id = u.Id, FullName = u.FullName, Email = u.Email,
                        CurrentStageId = u.CurrentStageId,
                        StageNameAr = stage?.NameAr, StageNameEn = stage?.NameEn,
                        IsActive = u.IsActive,
                        SubscriptionType = PremiumEntitlement.IsActive(u.SubscriptionType, u.PremiumExpiresAtUtc, nowUtc) ? "Premium" : "Free",
                        PremiumExpiresAtUtc = u.PremiumExpiresAtUtc,
                        CreatedAt = u.CreatedAt, LastLoginAt = u.LastLoginAt,
                        LastAttemptAt = a?.LastAttemptAt,
                        SolvedProblems = p?.Solved ?? 0,
                        AttemptedProblems = p?.Attempted ?? 0,
                        TotalAwardedPoints = a?.Points ?? 0
                    };
                }).ToList()
            };
            return Ok(Success(response));
        }

        [HttpGet("{learnerId:int}")]
        public async Task<IActionResult> Details(
            [FromRoute] int learnerId,
            [FromQuery] int? stageId = null,
            CancellationToken cancellationToken = default)
        {
            var user = await _db.Users.AsNoTracking()
                .Where(u => u.Id == learnerId && u.Role == "Student")
                .Select(u => new
                {
                    u.Id, u.FullName, u.Email, u.CurrentStageId, u.IsActive,
                    u.SubscriptionType, u.PremiumExpiresAtUtc, u.CreatedAt, u.LastLoginAt
                })
                .FirstOrDefaultAsync(cancellationToken);
            if (user == null)
                return NotFound(Error<AdminLearnerDetailDto>("UserNotFound", 404));
            var selectedStageId = stageId ?? user.CurrentStageId;
            var stages = await _db.EducationalStages.AsNoTracking()
                .OrderBy(s => s.Order).ThenBy(s => s.Id)
                .Select(s => new { s.Id, s.NameAr, s.NameEn })
                .ToListAsync(cancellationToken);
            if (selectedStageId.HasValue && !stages.Any(s => s.Id == selectedStageId))
                return NotFound(Error<AdminLearnerDetailDto>("StageNotFound", 404));

            var progressSummary = await _db.UserProgresses.AsNoTracking()
                .Where(p => p.UserId == learnerId)
                .GroupBy(p => p.UserId)
                .Select(g => new
                {
                    Solved = g.Count(p => p.IsSolved),
                    Attempted = g.Count(p => p.Attempts > 0),
                    FirstTry = g.Count(p => p.FirstAttemptCorrect == true),
                    Favorites = g.Count(p => p.IsFavorite),
                    Errors = g.Count(p => p.IsInErrorNotebook && !p.IsErrorNotebookArchived),
                    Time = g.Sum(p => p.TotalTimeSpentSeconds)
                }).FirstOrDefaultAsync(cancellationToken);
            var attemptSummary = await _db.ProblemAttempts.AsNoTracking()
                .Where(a => a.UserId == learnerId)
                .GroupBy(a => a.UserId)
                .Select(g => new
                {
                    Total = g.Count(), Correct = g.Count(a => a.IsCorrect),
                    Points = g.Sum(a => a.PointsEarned),
                    Last = (DateTime?)g.Max(a => a.SubmittedAt)
                }).FirstOrDefaultAsync(cancellationToken);

            var inventory = await _db.Problems.AsNoTracking()
                .GroupBy(p => p.StageId)
                .Select(g => new { Id = g.Key, Count = g.Count() })
                .ToDictionaryAsync(x => x.Id, x => x.Count, cancellationToken);
            var stageProgress = await _db.UserProgresses.AsNoTracking()
                .Where(p => p.UserId == learnerId)
                .GroupBy(p => p.Problem.StageId)
                .Select(g => new
                {
                    Id = g.Key, Solved = g.Count(p => p.IsSolved),
                    Attempted = g.Count(p => p.Attempts > 0),
                    FirstTry = g.Count(p => p.FirstAttemptCorrect == true)
                }).ToDictionaryAsync(x => x.Id, cancellationToken);
            var stagePoints = await _db.ProblemAttempts.AsNoTracking()
                .Where(a => a.UserId == learnerId)
                .GroupBy(a => a.Problem.StageId)
                .Select(g => new { Id = g.Key, Points = g.Sum(a => a.PointsEarned) })
                .ToDictionaryAsync(x => x.Id, x => x.Points, cancellationToken);

            var categoryResults = new List<AdminLearnerCategoryDto>();
            if (selectedStageId.HasValue)
            {
                var id = selectedStageId.Value;
                var categories = await _db.Categories.AsNoTracking()
                    .Where(c => c.StageId == id).OrderBy(c => c.Order)
                    .Select(c => new { c.Id, c.NameAr, c.NameEn, c.StageId })
                    .ToListAsync(cancellationToken);
                var categoryInventory = await _db.Problems.AsNoTracking()
                    .Where(p => p.StageId == id)
                    .GroupBy(p => p.CategoryId)
                    .Select(g => new { Id = g.Key, Count = g.Count() })
                    .ToDictionaryAsync(x => x.Id, x => x.Count, cancellationToken);
                var categoryProgress = await _db.UserProgresses.AsNoTracking()
                    .Where(p => p.UserId == learnerId && p.Problem.StageId == id)
                    .GroupBy(p => p.Problem.CategoryId)
                    .Select(g => new
                    {
                        Id = g.Key, Attempted = g.Count(p => p.Attempts > 0),
                        Solved = g.Count(p => p.IsSolved),
                        FirstTry = g.Count(p => p.FirstAttemptCorrect == true),
                        Errors = g.Count(p => p.IsInErrorNotebook && !p.IsErrorNotebookArchived)
                    }).ToDictionaryAsync(x => x.Id, cancellationToken);
                categoryResults = categories.Select(c =>
                {
                    categoryInventory.TryGetValue(c.Id, out var count);
                    categoryProgress.TryGetValue(c.Id, out var p);
                    return new AdminLearnerCategoryDto
                    {
                        CategoryId = c.Id, StageId = c.StageId,
                        NameAr = c.NameAr, NameEn = c.NameEn,
                        TotalProblems = count, AttemptedProblems = p?.Attempted ?? 0,
                        SolvedProblems = p?.Solved ?? 0,
                        FirstTryCorrect = p?.FirstTry ?? 0,
                        InErrorNotebook = p?.Errors ?? 0
                    };
                }).ToList();
            }

            var selectedStage = selectedStageId.HasValue
                ? stages.FirstOrDefault(s => s.Id == selectedStageId.Value) : null;
            var response = new AdminLearnerDetailDto
            {
                Learner = new AdminLearnerSummaryDto
                {
                    Id = user.Id, FullName = user.FullName, Email = user.Email,
                    CurrentStageId = user.CurrentStageId,
                    StageNameAr = selectedStage?.NameAr,
                    StageNameEn = selectedStage?.NameEn,
                    IsActive = user.IsActive,
                    SubscriptionType = PremiumEntitlement.IsActive(user.SubscriptionType, user.PremiumExpiresAtUtc) ? "Premium" : "Free",
                    PremiumExpiresAtUtc = user.PremiumExpiresAtUtc,
                    CreatedAt = user.CreatedAt, LastLoginAt = user.LastLoginAt,
                    LastAttemptAt = attemptSummary?.Last,
                    SolvedProblems = progressSummary?.Solved ?? 0,
                    AttemptedProblems = progressSummary?.Attempted ?? 0,
                    TotalAwardedPoints = attemptSummary?.Points ?? 0
                },
                TotalAttempts = attemptSummary?.Total ?? 0,
                CorrectAttempts = attemptSummary?.Correct ?? 0,
                WrongAttempts = (attemptSummary?.Total ?? 0) - (attemptSummary?.Correct ?? 0),
                FirstTryCorrect = progressSummary?.FirstTry ?? 0,
                FavoriteProblems = progressSummary?.Favorites ?? 0,
                OpenErrorNotebookProblems = progressSummary?.Errors ?? 0,
                TotalTimeSpentSeconds = progressSummary?.Time ?? 0,
                CorrectRatePercent = attemptSummary == null || attemptSummary.Total == 0
                    ? 0 : Math.Round(100.0 * attemptSummary.Correct / attemptSummary.Total, 1),
                Stages = stages.Select(s =>
                {
                    inventory.TryGetValue(s.Id, out var total);
                    stageProgress.TryGetValue(s.Id, out var p);
                    stagePoints.TryGetValue(s.Id, out var points);
                    return new AdminLearnerStageDto
                    {
                        StageId = s.Id, NameAr = s.NameAr, NameEn = s.NameEn,
                        TotalProblems = total, AttemptedProblems = p?.Attempted ?? 0,
                        SolvedProblems = p?.Solved ?? 0,
                        FirstTryCorrect = p?.FirstTry ?? 0, AwardedPoints = points,
                        CompletionPercent = total == 0 ? 0 :
                            (int)Math.Round(100.0 * (p?.Solved ?? 0) / total)
                    };
                }).ToList(),
                Categories = categoryResults
            };
            return Ok(Success(response));
        }

        [HttpGet("{learnerId:int}/attempts")]
        public async Task<IActionResult> Attempts(
            [FromRoute] int learnerId,
            [FromQuery] int? stageId = null,
            [FromQuery] int page = 1,
            [FromQuery] int pageSize = 20,
            CancellationToken cancellationToken = default)
        {
            if (!ValidPagination(page, pageSize) || (stageId.HasValue && stageId <= 0))
                return BadRequest(Error<AdminLearnerAttemptPageDto>("InvalidLearnerFilters", 400));
            var exists = await _db.Users.AsNoTracking()
                .AnyAsync(u => u.Id == learnerId && u.Role == "Student", cancellationToken);
            if (!exists)
                return NotFound(Error<AdminLearnerAttemptPageDto>("UserNotFound", 404));

            var query = _db.ProblemAttempts.AsNoTracking()
                .Where(a => a.UserId == learnerId);
            if (stageId.HasValue)
                query = query.Where(a => a.Problem.StageId == stageId.Value);

            var total = await query.CountAsync(cancellationToken);
            var attempts = await query
                .OrderByDescending(a => a.SubmittedAt).ThenByDescending(a => a.Id)
                .Skip((page - 1) * pageSize).Take(pageSize)
                .Select(a => new AdminLearnerAttemptDto
                {
                    Id = a.Id, ProblemId = a.ProblemId,
                    TitleAr = a.Problem.TitleAr, TitleEn = a.Problem.TitleEn,
                    StageId = a.Problem.StageId, CategoryId = a.Problem.CategoryId,
                    IsCorrect = a.IsCorrect, IsOfficial = a.IsOfficial,
                    AttemptNumber = a.AttemptNumber,
                    TimeSpentSeconds = a.TimeSpentSeconds, UsedHint = a.UsedHint,
                    PointsEarned = a.PointsEarned, SubmittedAt = a.SubmittedAt
                }).ToListAsync(cancellationToken);

            return Ok(Success(new AdminLearnerAttemptPageDto
            {
                LearnerId = learnerId, StageId = stageId, Total = total,
                Page = page, PageSize = pageSize,
                TotalPages = (int)Math.Ceiling(total / (double)pageSize),
                Attempts = attempts
            }));
        }

        private static bool ValidPagination(int page, int pageSize) =>
            page >= 1 && pageSize >= 1 && pageSize <= 50 &&
            (long)(page - 1) * pageSize <= int.MaxValue;

        private ApiResponse<T> Success<T>(T data) =>
            LanguageHelper.SuccessResponse(
                data, "Success", LanguageHelper.GetLanguageFromRequest(Request));

        private ApiResponse<T> Error<T>(string key, int code) =>
            LanguageHelper.ErrorResponse<T>(
                key, LanguageHelper.GetLanguageFromRequest(Request), code);
    }
}
