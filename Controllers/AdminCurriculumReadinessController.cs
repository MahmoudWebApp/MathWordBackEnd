using System.Security.Claims;
using MathWorldAPI.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers
{
    /// <summary>
    /// Read-only curriculum coverage and data-quality report for content editors.
    /// Does not create categories, modify IDs or publish unreviewed problems.
    /// </summary>
    [ApiController]
    [Route("api/admin/curriculum")]
    [Authorize(Roles = "Admin")]
    public sealed class AdminCurriculumReadinessController : ControllerBase
    {
        private readonly AppDbContext _db;
        public AdminCurriculumReadinessController(AppDbContext db) => _db = db;

        [HttpGet("readiness")]
        public async Task<IActionResult> Get(CancellationToken cancellationToken)
        {
            var adminId = int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier),
                out var parsed) ? parsed : 0;
            if (adminId <= 0 || !await _db.Users.AsNoTracking().AnyAsync(
                    u => u.Id == adminId && u.Role == "Admin" && u.IsActive,
                    cancellationToken))
                return Forbid();

            // Query real IDs rather than assuming stage names or a fixed curriculum.
            var stages = await _db.EducationalStages.AsNoTracking()
                .OrderBy(s => s.Order).ThenBy(s => s.Id)
                .Select(s => new { s.Id, s.NameAr, s.NameEn, s.Order })
                .ToListAsync(cancellationToken);

            var categories = await _db.Categories.AsNoTracking()
                .OrderBy(c => c.Order).ThenBy(c => c.Id)
                .Select(c => new { c.Id, c.StageId, c.NameAr, c.NameEn, c.Icon, c.Order })
                .ToListAsync(cancellationToken);

            var problems = await _db.Problems.AsNoTracking()
                .Select(p => new
                {
                    p.Id, p.StageId, p.CategoryId,
                    p.QuestionTextAr, p.QuestionTextEn,
                    p.DetailedSolutionAr, p.DetailedSolutionEn,
                    OptionTexts = p.Options.Select(o => o.LatexCode).ToList(),
                    CorrectOptionCount = p.Options.Count(o => o.IsCorrect)
                })
                .ToListAsync(cancellationToken);

            var problemsByStage = problems.GroupBy(p => p.StageId)
                .ToDictionary(g => g.Key, g => g.ToList());
            var result = stages.Select(stage =>
            {
                var stageProblems = problemsByStage.GetValueOrDefault(stage.Id) ?? new();
                var stageCategories = categories.Where(c => c.StageId == stage.Id).ToList();
                var invalidProblems = stageProblems.Count(p =>
                    string.IsNullOrWhiteSpace(p.QuestionTextAr) ||
                    string.IsNullOrWhiteSpace(p.QuestionTextEn) ||
                    string.IsNullOrWhiteSpace(p.DetailedSolutionAr) ||
                    string.IsNullOrWhiteSpace(p.DetailedSolutionEn) ||
                    p.OptionTexts.Count != 4 || p.CorrectOptionCount != 1 ||
                    p.OptionTexts.Any(o => string.IsNullOrWhiteSpace(o)) ||
                    p.OptionTexts.Distinct(StringComparer.Ordinal).Count() != 4 ||
                    !stageCategories.Any(c => c.Id == p.CategoryId));
                return new
                {
                    StageId = stage.Id,
                    stage.NameAr,
                    stage.NameEn,
                    stage.Order,
                    ProblemCount = stageProblems.Count,
                    RequiredMinimum = 10,
                    MissingToMinimum = Math.Max(0, 10 - stageProblems.Count),
                    MeetsMinimum = stageProblems.Count >= 10,
                    InvalidProblemCount = invalidProblems,
                    Categories = stageCategories.Select(c => new
                    {
                        CategoryId = c.Id, c.NameAr, c.NameEn, c.Icon, c.Order,
                        ProblemCount = stageProblems.Count(p => p.CategoryId == c.Id)
                    }).ToList()
                };
            }).ToList();

            return Ok(new
            {
                MinimumProblemsPerStage = 10,
                StageCount = stages.Count,
                TotalProblems = problems.Count,
                StagesBelowMinimum = result.Count(s => !s.MeetsMinimum),
                StagesWithInvalidProblems = result.Count(s => s.InvalidProblemCount > 0),
                Stages = result
            });
        }
    }
}
