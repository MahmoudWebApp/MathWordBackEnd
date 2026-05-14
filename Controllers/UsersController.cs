// File: MathWorldAPI/Controllers/UsersController.cs

using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.DTOs;
using MathWorldAPI.Helpers;

namespace MathWorldAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class UsersController : ControllerBase
    {
        private readonly AppDbContext _context;

        public UsersController(AppDbContext context) => _context = context;

        /// <summary>
        /// Gets the unified dashboard data for the current user (Profile, Stats, Recent Activities)
        /// </summary>
        [HttpGet("dashboard")]
        [ProducesResponseType(typeof(ApiResponse<UserDashboardDto>), StatusCodes.Status200OK)]
        public async Task<ActionResult<ApiResponse<UserDashboardDto>>> GetDashboard()
        {
            var userId = GetUserId();
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var user = await _context.Users.AsNoTracking()
                .FirstOrDefaultAsync(u => u.Id == userId);

            if (user == null)
                return NotFound(LanguageHelper.ErrorResponse<ApiResponse<UserDashboardDto>>("UserNotFound", language, 404));

            // Fetch Stats efficiently
            var solvedCount = await _context.UserProgresses
                .CountAsync(up => up.UserId == userId && up.IsSolved);

            var favoriteCount = await _context.UserProgresses
                .CountAsync(up => up.UserId == userId && up.IsFavorite);

            var totalAttempted = await _context.UserProgresses
                .CountAsync(up => up.UserId == userId);

            var successRate = totalAttempted > 0
                ? (int)Math.Round((double)solvedCount / totalAttempted * 100)
                : 0;

            var totalPoints = await _context.UserProgresses
                .Where(up => up.UserId == userId && up.IsSolved)
                .Join(_context.Problems, up => up.ProblemId, p => p.Id, (up, p) => p.Points) // Fixed: _context.Problems
                .SumAsync();

            // Fetch recent solved problems (Take 5 to cover both recent solved list and activity feed)
            var recentSolvedData = await _context.UserProgresses
                .Include(up => up.Problem).ThenInclude(p => p.Category)
                .Include(up => up.Problem).ThenInclude(p => p.Stage)
                .AsNoTracking()
                .Where(up => up.UserId == userId && up.IsSolved)
                .OrderByDescending(up => up.SolvedAt)
                .Take(5)
                .ToListAsync();

            // Fetch recent favorite problems
            var recentFavoritesData = await _context.UserProgresses
                .Include(up => up.Problem).ThenInclude(p => p.Category)
                .Include(up => up.Problem).ThenInclude(p => p.Stage)
                .AsNoTracking()
                .Where(up => up.UserId == userId && up.IsFavorite)
                .OrderByDescending(up => up.LastAttemptAt)
                .Take(5)
                .ToListAsync();

            // Build the response
            var dashboard = new UserDashboardDto
            {
                Id = user.Id,
                FullName = user.FullName,
                Email = user.Email,
                Role = user.Role,
                SubscriptionType = user.SubscriptionType,
                SolvedProblemsCount = solvedCount,
                FavoriteProblemsCount = favoriteCount,
                TotalPoints = totalPoints,
                SuccessRate = successRate,
                MemberSince = user.CreatedAt,
                RecentSolved = recentSolvedData.Take(3)
                    .Select(up => MapToProblemPreview(up.Problem, language)).ToList(),
                RecentFavorites = recentFavoritesData
                    .Select(up => MapToProblemPreview(up.Problem, language)).ToList(),
                RecentActivities = recentSolvedData
                    .Select(up => new RecentActivityItemDto
                    {
                        ProblemId = up.Problem.Id,
                        Title = language == "en" ? up.Problem.TitleEn : up.Problem.TitleAr,
                        CategoryName = language == "en" ? up.Problem.Category.NameEn : up.Problem.Category.NameAr,
                        SolvedAt = up.SolvedAt ?? DateTime.UtcNow
                    }).ToList()
            };

            return Ok(LanguageHelper.SuccessResponse(dashboard, "Success", language));
        }

        [HttpGet("profile")]
        [ProducesResponseType(typeof(ApiResponse<UserProfileDto>), StatusCodes.Status200OK)]
        public async Task<ActionResult<ApiResponse<UserProfileDto>>> GetProfile()
        {
            var userId = GetUserId();
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var user = await _context.Users.FindAsync(userId);
            if (user == null)
                return NotFound(LanguageHelper.ErrorResponse<ApiResponse<UserProfileDto>>("UserNotFound", language, 404));

            var solvedCount = await _context.UserProgresses.CountAsync(up => up.UserId == userId && up.IsSolved);
            var totalPoints = await _context.UserProgresses
                .Where(up => up.UserId == userId && up.IsSolved)
                .Join(_context.Problems, up => up.ProblemId, p => p.Id, (up, p) => p.Points) // Fixed: _context.Problems
                .SumAsync();

            return Ok(LanguageHelper.SuccessResponse(new UserProfileDto
            {
                Id = user.Id,
                FullName = user.FullName,
                Email = user.Email,
                Role = user.Role,
                SubscriptionType = user.SubscriptionType,
                SolvedProblemsCount = solvedCount,
                TotalPoints = totalPoints,
                MemberSince = user.CreatedAt
            }, "Success", language));
        }

        [HttpPost("favorite/toggle")]
        [ProducesResponseType(typeof(ApiResponse<FavoriteResultDto>), StatusCodes.Status200OK)]
        public async Task<ActionResult<ApiResponse<FavoriteResultDto>>> ToggleFavorite([FromBody] FavoriteDto dto)
        {
            var userId = GetUserId();
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var progress = await _context.UserProgresses.FirstOrDefaultAsync(up => up.UserId == userId && up.ProblemId == dto.ProblemId);

            if (progress == null)
            {
                progress = new Models.UserProgress
                {
                    UserId = userId,
                    ProblemId = dto.ProblemId,
                    IsFavorite = dto.IsFavorite,
                    LastAttemptAt = DateTime.UtcNow
                };
                _context.UserProgresses.Add(progress);
            }
            else
            {
                progress.IsFavorite = dto.IsFavorite;
                progress.LastAttemptAt = DateTime.UtcNow;
            }

            await _context.SaveChangesAsync();
            var messageKey = dto.IsFavorite ? "AddedToFavorites" : "RemovedFromFavorites";
            return Ok(LanguageHelper.SuccessResponse(new FavoriteResultDto { IsFavorite = dto.IsFavorite }, messageKey, language));
        }

        [HttpGet("favorites")]
        [ProducesResponseType(typeof(ApiResponse<List<ProblemPreviewDto>>), StatusCodes.Status200OK)]
        public async Task<ActionResult<ApiResponse<List<ProblemPreviewDto>>>> GetFavorites()
        {
            var userId = GetUserId();
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var favorites = await _context.UserProgresses
                .Include(up => up.Problem).ThenInclude(p => p.Category)
                .Include(up => up.Problem).ThenInclude(p => p.Stage)
                .AsNoTracking()
                .Where(up => up.UserId == userId && up.IsFavorite)
                .Select(up => new ProblemPreviewDto
                {
                    Id = up.Problem.Id,
                    Title = language == "en" ? up.Problem.TitleEn : up.Problem.TitleAr,
                    StageId = up.Problem.StageId,
                    StageName = language == "en" ? up.Problem.Stage.NameEn : up.Problem.Stage.NameAr,
                    CategoryName = language == "en" ? up.Problem.Category.NameEn : up.Problem.Category.NameAr,
                    ViewsCount = up.Problem.ViewsCount,
                    RequiresLogin = true
                }).ToListAsync();

            return Ok(LanguageHelper.SuccessResponse(favorites, "Success", language));
        }

        [HttpGet("solved")]
        [ProducesResponseType(typeof(ApiResponse<List<ProblemPreviewDto>>), StatusCodes.Status200OK)]
        public async Task<ActionResult<ApiResponse<List<ProblemPreviewDto>>>> GetSolvedProblems()
        {
            var userId = GetUserId();
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var solved = await _context.UserProgresses
                .Include(up => up.Problem).ThenInclude(p => p.Category)
                .Include(up => up.Problem).ThenInclude(p => p.Stage)
                .AsNoTracking()
                .Where(up => up.UserId == userId && up.IsSolved)
                .OrderByDescending(up => up.SolvedAt)
                .Select(up => new ProblemPreviewDto
                {
                    Id = up.Problem.Id,
                    Title = language == "en" ? up.Problem.TitleEn : up.Problem.TitleAr,
                    StageId = up.Problem.StageId,
                    StageName = language == "en" ? up.Problem.Stage.NameEn : up.Problem.Stage.NameAr,
                    CategoryName = language == "en" ? up.Problem.Category.NameEn : up.Problem.Category.NameAr,
                    ViewsCount = up.Problem.ViewsCount,
                    RequiresLogin = true
                }).ToListAsync();

            return Ok(LanguageHelper.SuccessResponse(solved, "Success", language));
        }

        [HttpGet("favorite/check/{problemId}")]
        [ProducesResponseType(typeof(ApiResponse<FavoriteCheckDto>), StatusCodes.Status200OK)]
        public async Task<ActionResult<ApiResponse<FavoriteCheckDto>>> CheckFavorite(int problemId)
        {
            var userId = GetUserId();
            var isFavorite = await _context.UserProgresses.AnyAsync(up => up.UserId == userId && up.ProblemId == problemId && up.IsFavorite);
            return Ok(LanguageHelper.SuccessResponse(new FavoriteCheckDto { IsFavorite = isFavorite }, "Success", LanguageHelper.GetLanguageFromRequest(Request)));
        }

        private int GetUserId() => int.Parse(User.FindFirst(ClaimTypes.NameIdentifier)?.Value ?? "0");

        /// <summary>
        /// Helper method to map Problem entity to ProblemPreviewDto
        /// </summary>
        private ProblemPreviewDto MapToProblemPreview(Models.MathProblem problem, string language)
        {
            return new ProblemPreviewDto
            {
                Id = problem.Id,
                Title = language == "en" ? problem.TitleEn : problem.TitleAr,
                StageId = problem.StageId,
                StageName = language == "en" ? problem.Stage.NameEn : problem.Stage.NameAr,
                CategoryName = language == "en" ? problem.Category.NameEn : problem.Category.NameAr,
                ViewsCount = problem.ViewsCount,
                RequiresLogin = true
            };
        }
    }
}