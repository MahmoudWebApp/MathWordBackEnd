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
    /// Stage preferences and actual progress. Changing a stage never moves,
    /// resets or deletes any learner attempt or progress record.
    /// </summary>
    [ApiController]
    [Route("api/users")]
    [Authorize(Roles = "Student")]
    public sealed class LearningJourneyController : ControllerBase
    {
        private readonly AppDbContext _context;

        public LearningJourneyController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet("learning-stage")]
        public async Task<ActionResult<ApiResponse<LearningStageDto>>> GetLearningStage(
            CancellationToken cancellationToken)
        {
            var user = await _context.Users.AsNoTracking()
                .FirstOrDefaultAsync(u => u.Id == UserId(), cancellationToken);

            if (user == null)
                return NotFound(Error<LearningStageDto>("UserNotFound", 404));

            var stage = user.CurrentStageId.HasValue
                ? await _context.EducationalStages.AsNoTracking()
                    .FirstOrDefaultAsync(s => s.Id == user.CurrentStageId.Value,
                        cancellationToken)
                : null;

            return Ok(Success(new LearningStageDto
            {
                StageId = stage?.Id,
                NameAr = stage?.NameAr,
                NameEn = stage?.NameEn
            }));
        }

        [HttpPut("learning-stage")]
        public async Task<ActionResult<ApiResponse<LearningStageDto>>> SetLearningStage(
            [FromBody] SelectLearningStageDto dto,
            CancellationToken cancellationToken)
        {
            var stage = await _context.EducationalStages.AsNoTracking()
                .FirstOrDefaultAsync(s => s.Id == dto.StageId, cancellationToken);
            if (stage == null)
                return NotFound(Error<LearningStageDto>("StageNotFound", 404));

            var user = await _context.Users.FirstOrDefaultAsync(
                u => u.Id == UserId(), cancellationToken);
            if (user == null)
                return NotFound(Error<LearningStageDto>("UserNotFound", 404));

            if (user.CurrentStageId != stage.Id)
            {
                user.CurrentStageId = stage.Id;
                await _context.SaveChangesAsync(cancellationToken);
            }

            return Ok(Success(new LearningStageDto
            {
                StageId = stage.Id,
                NameAr = stage.NameAr,
                NameEn = stage.NameEn
            }));
        }

        [HttpGet("journey")]
        public async Task<ActionResult<ApiResponse<LearningJourneyDto>>> GetJourney(
            [FromQuery] int? stageId,
            CancellationToken cancellationToken)
        {
            var userId = UserId();
            var user = await _context.Users.AsNoTracking()
                .FirstOrDefaultAsync(u => u.Id == userId, cancellationToken);
            if (user == null)
                return NotFound(Error<LearningJourneyDto>("UserNotFound", 404));

            // Explicit stage query allows looking at previous stage progress.
            var id = stageId ?? user.CurrentStageId;
            if (!id.HasValue)
                return Conflict(Error<LearningJourneyDto>(
                    "LearningStageRequired", 409));

            var stage = await _context.EducationalStages.AsNoTracking()
                .FirstOrDefaultAsync(s => s.Id == id.Value, cancellationToken);
            if (stage == null)
                return NotFound(Error<LearningJourneyDto>("StageNotFound", 404));

            var categories = await _context.Categories.AsNoTracking()
                .Where(c => c.StageId == stage.Id)
                .OrderBy(c => c.Order)
                .Select(c => new { c.Id, c.NameAr, c.NameEn })
                .ToListAsync(cancellationToken);

            // Count inventory separately: progress records can also be created
            // just for favorites without any submitted attempts.
            var inventory = await _context.Problems.AsNoTracking()
                .Where(p => p.StageId == stage.Id)
                .GroupBy(p => p.CategoryId)
                .Select(g => new { CategoryId = g.Key, Count = g.Count() })
                .ToDictionaryAsync(x => x.CategoryId, x => x.Count,
                    cancellationToken);

            var progress = await _context.UserProgresses.AsNoTracking()
                .Where(p => p.UserId == userId && p.Problem.StageId == stage.Id)
                .GroupBy(p => p.Problem.CategoryId)
                .Select(g => new
                {
                    CategoryId = g.Key,
                    Attempted = g.Count(p => p.Attempts > 0),
                    Solved = g.Count(p => p.IsSolved),
                    FirstTry = g.Count(p => p.FirstAttemptCorrect == true),
                    Mastered = g.Count(p =>
                        p.MasteryStatus == MasteryStatuses.Mastered)
                })
                .ToListAsync(cancellationToken);
            var progressByCategory = progress.ToDictionary(p => p.CategoryId);

            var categoryProgress = categories.Select(category =>
            {
                inventory.TryGetValue(category.Id, out var total);
                progressByCategory.TryGetValue(category.Id, out var stats);
                var solved = stats?.Solved ?? 0;
                return new StageCategoryProgressDto
                {
                    CategoryId = category.Id,
                    NameAr = category.NameAr,
                    NameEn = category.NameEn,
                    TotalProblems = total,
                    AttemptedProblems = stats?.Attempted ?? 0,
                    SolvedProblems = solved,
                    FirstTryCorrect = stats?.FirstTry ?? 0,
                    MasteredProblems = stats?.Mastered ?? 0,
                    CompletionPercent = total == 0 ? 0 :
                        (int)Math.Round(100.0 * solved / total)
                };
            }).ToList();

            var totalPoints = await _context.PointLedgerEntries.AsNoTracking()
                .Where(award => award.UserId == userId &&
                    award.StageId == stage.Id &&
                    award.Reason == PointLedgerReasons.SolveCredit)
                .SumAsync(award => award.Points, cancellationToken);

            var total = categoryProgress.Sum(c => c.TotalProblems);
            var solvedTotal = categoryProgress.Sum(c => c.SolvedProblems);
            return Ok(Success(new LearningJourneyDto
            {
                StageId = stage.Id,
                NameAr = stage.NameAr,
                NameEn = stage.NameEn,
                TotalProblems = total,
                AttemptedProblems = categoryProgress.Sum(c => c.AttemptedProblems),
                SolvedProblems = solvedTotal,
                FirstTryCorrect = categoryProgress.Sum(c => c.FirstTryCorrect),
                MasteredProblems = categoryProgress.Sum(c => c.MasteredProblems),
                TotalPoints = totalPoints,
                CompletionPercent = total == 0 ? 0 :
                    (int)Math.Round(100.0 * solvedTotal / total),
                Categories = categoryProgress
            }));
        }

        private int UserId()
        {
            var claim = User.FindFirstValue(ClaimTypes.NameIdentifier);
            if (!int.TryParse(claim, out var id))
                throw new UnauthorizedAccessException(
                    "Missing authenticated learner ID.");
            return id;
        }

        private ApiResponse<T> Success<T>(T data) =>
            LanguageHelper.SuccessResponse(
                data, "Success", LanguageHelper.GetLanguageFromRequest(Request));

        private ApiResponse<T> Error<T>(string key, int status) =>
            LanguageHelper.ErrorResponse<T>(
                key, LanguageHelper.GetLanguageFromRequest(Request), status);
    }
}
