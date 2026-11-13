using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.Helpers;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.RateLimiting;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers
{
    /// <summary>
    /// Premium-only early solution preview. Free learners can still receive
    /// solutions through the existing post-answer flow.
    /// </summary>
    [ApiController]
    [Route("api/problems")]
    [Authorize(Roles = "Student")]
    public sealed class PremiumProblemSolutionsController : ControllerBase
    {
        private readonly AppDbContext _db;
        public PremiumProblemSolutionsController(AppDbContext db) => _db = db;

        [HttpGet("{problemId:int}/premium-solution")]
        [EnableRateLimiting("answers")]
        [ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
        public async Task<IActionResult> Get(int problemId,
            CancellationToken cancellationToken)
        {
            if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var userId) ||
                userId <= 0)
                return Unauthorized();

            var user = await _db.Users.AsNoTracking().FirstOrDefaultAsync(
                u => u.Id == userId && u.Role == "Student" && u.IsActive,
                cancellationToken);
            if (user == null)
                return Forbid();
            if (!PremiumEntitlement.IsActive(user))
                return StatusCode(StatusCodes.Status403Forbidden,
                    new { Message = "PremiumRequired" });

            var problem = await _db.Problems.AsNoTracking().FirstOrDefaultAsync(
                p => p.Id == problemId, cancellationToken);
            if (problem == null)
                return NotFound(new { Message = "ProblemNotFound" });

            var language = LanguageHelper.GetLanguageFromRequest(Request);
            var correctOptionId = await _db.QuestionOptions
                .AsNoTracking().Where(o => o.ProblemId == problemId && o.IsCorrect)
                .Select(o => (int?)o.Id).FirstOrDefaultAsync(cancellationToken);

            return Ok(LanguageHelper.SuccessResponse(new
            {
                ProblemId = problem.Id,
                CorrectOptionId = correctOptionId,
                DetailedSolution = language == "en"
                    ? problem.DetailedSolutionEn : problem.DetailedSolutionAr,
                problem.YoutubeSolutionUrl
            }, "Success", language));
        }
    }
}
