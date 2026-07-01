// File: Controllers/StatsController.cs

using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
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

        public StatsController(AppDbContext context)
        {
            _context = context;
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

            var stats = new DashboardStatsDto
            {
                TotalProblems = await _context.Problems.CountAsync(),
                TotalUsers = await _context.Users.CountAsync(),
                TotalSolved = await _context.UserProgresses.CountAsync(x => x.IsSolved),
                TotalViews = await _context.Problems.SumAsync(x => (long)x.ViewsCount)
            };

            return Ok(LanguageHelper.SuccessResponse(stats, "Success", language));
        }
    }
}