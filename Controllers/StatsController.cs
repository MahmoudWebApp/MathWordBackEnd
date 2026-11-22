// File: Controllers/StatsController.cs

using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Caching.Memory;
using MathWorldAPI.Data;
using MathWorldAPI.DTOs;
using MathWorldAPI.Helpers;

namespace MathWorldAPI.Controllers
{
    /// <summary>
    /// Public controller for platform statistics.
    /// No authentication required.
    /// </summary>
    [ApiController]
    [Route("api/[controller]")]
    public class StatsController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly IMemoryCache _cache;
        private const string CacheKey = "mathworld:public-impact:v2";

        public StatsController(AppDbContext context, IMemoryCache cache)
        {
            _context = context;
            _cache = cache;
        }

        /// <summary>
        /// Gets public platform statistics.
        /// No authentication required.
        /// </summary>
        [HttpGet]
        [ProducesResponseType(typeof(ApiResponse<DashboardStatsDto>), StatusCodes.Status200OK)]
        public async Task<ActionResult<ApiResponse<DashboardStatsDto>>> GetStats()
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            // Public, nonpersonal stats: one short-lived shared cache avoids
            // a fresh DB read whenever a learner revisits the landing page.
            if (!_cache.TryGetValue(CacheKey, out DashboardStatsDto? stats) || stats is null)
            {
                // One PostgreSQL round trip with scalar aggregate subqueries,
                // rather than six serial queries across regions.
                stats = await _context.EducationalStages.AsNoTracking()
                    .OrderBy(x => x.Id)
                    .Select(_ => new DashboardStatsDto
                    {
                        TotalProblems = _context.Problems.Count(),
                        TotalUsers = _context.Users.Count(u => u.Role == "Student" && u.IsActive),
                        TotalSolved = _context.UserProgresses.LongCount(
                            x => x.IsSolved && x.User.Role == "Student" && x.User.IsActive),
                        // Retain legacy API compatibility, but no longer display
                        // view counts in the learner interface.
                        TotalViews = _context.Problems.Sum(x => (long?)x.ViewsCount) ?? 0,
                        TotalCategories = _context.Categories.Count(),
                        // Only published learning skills belong in public impact.
                        TotalSkills = _context.CurriculumSkills.Count(x => x.IsPublished)
                    })
                    .FirstOrDefaultAsync() ?? new DashboardStatsDto();
                _cache.Set(CacheKey, stats, TimeSpan.FromMinutes(2));
            }

            Response.Headers.CacheControl = "public, max-age=120";
            return Ok(LanguageHelper.SuccessResponse(stats, "Success", language));
        }
    }
}