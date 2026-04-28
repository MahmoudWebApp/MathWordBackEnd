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

        public UsersController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet("profile")]
        public async Task<IActionResult> GetProfile()
        {
            var userId = GetUserId();
            var user = await _context.Users.FindAsync(userId);

            if (user == null)
                return NotFound();

            var solvedProblemsCount = await _context.UserProgresses
                .CountAsync(up => up.UserId == userId && up.IsSolved);

            var totalPoints = await _context.UserProgresses
                .Where(up => up.UserId == userId && up.IsSolved)
                .Join(_context.Problems, up => up.ProblemId, p => p.Id, (up, p) => p.Points)
                .SumAsync();

            return Ok(new UserProfileDto
            {
                Id = user.Id,
                FullName = user.FullName,
                Email = user.Email,
                Role = user.Role,
                SubscriptionType = user.SubscriptionType,
                SolvedProblemsCount = solvedProblemsCount,
                TotalPoints = totalPoints,
                MemberSince = user.CreatedAt
            });
        }

        [HttpPost("favorite/toggle")]
        public async Task<IActionResult> ToggleFavorite([FromBody] FavoriteDto dto)
        {
            var userId = GetUserId();
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var progress = await _context.UserProgresses
                .FirstOrDefaultAsync(up => up.UserId == userId && up.ProblemId == dto.ProblemId);

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
            return Ok(LanguageHelper.SuccessResponse(messageKey, language, new { IsFavorite = dto.IsFavorite }));
        }

        [HttpGet("favorites")]
        public async Task<IActionResult> GetFavorites()
        {
            var userId = GetUserId();
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var favorites = await _context.UserProgresses
                .Include(up => up.Problem)
                .ThenInclude(p => p.Category)
                .Where(up => up.UserId == userId && up.IsFavorite)
                .Select(up => new ProblemPreviewDto
                {
                    Id = up.Problem.Id,
                    Title = language == "en" ? up.Problem.TitleEn : up.Problem.TitleAr,
                    Difficulty = up.Problem.Difficulty,
                    CategoryName = language == "en" ? up.Problem.Category.NameEn : up.Problem.Category.NameAr,
                    ViewsCount = up.Problem.ViewsCount,
                    RequiresLogin = true
                })
                .ToListAsync();

            return Ok(favorites);
        }

        [HttpGet("solved")]
        public async Task<IActionResult> GetSolvedProblems()
        {
            var userId = GetUserId();
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var solved = await _context.UserProgresses
                .Include(up => up.Problem)
                .ThenInclude(p => p.Category)
                .Where(up => up.UserId == userId && up.IsSolved)
                .OrderByDescending(up => up.SolvedAt)
                .Select(up => new ProblemPreviewDto
                {
                    Id = up.Problem.Id,
                    Title = language == "en" ? up.Problem.TitleEn : up.Problem.TitleAr,
                    Difficulty = up.Problem.Difficulty,
                    CategoryName = language == "en" ? up.Problem.Category.NameEn : up.Problem.Category.NameAr,
                    ViewsCount = up.Problem.ViewsCount,
                    RequiresLogin = true
                })
                .ToListAsync();

            return Ok(solved);
        }

        [HttpGet("favorite/check/{problemId}")]
        public async Task<IActionResult> CheckFavorite(int problemId)
        {
            var userId = GetUserId();
            var isFavorite = await _context.UserProgresses
                .AnyAsync(up => up.UserId == userId && up.ProblemId == problemId && up.IsFavorite);

            return Ok(new { IsFavorite = isFavorite });
        }

        private int GetUserId() => int.Parse(User.FindFirst(ClaimTypes.NameIdentifier)?.Value ?? "0");
    }
}