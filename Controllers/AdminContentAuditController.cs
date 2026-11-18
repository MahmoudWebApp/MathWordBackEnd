using MathWorldAPI.Data;
using MathWorldAPI.Helpers;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers
{
    /// <summary>
    /// Read-only inventory and data-quality diagnostics for the admin.
    /// Helps explain "no problems" screens without changing learner data.
    /// </summary>
    [ApiController]
    [Authorize(Roles = "Admin")]
    [Route("api/admin/content-audit")]
    public sealed class AdminContentAuditController : ControllerBase
    {
        private readonly AppDbContext _db;

        public AdminContentAuditController(AppDbContext db) => _db = db;

        [HttpGet]
        public async Task<IActionResult> Get(CancellationToken cancellationToken)
        {
            var stages = await _db.EducationalStages.AsNoTracking()
                .OrderBy(stage => stage.Order)
                .ThenBy(stage => stage.Id)
                .Select(stage => new { stage.Id, stage.NameAr, stage.NameEn })
                .ToListAsync(cancellationToken);

            var categories = await _db.Categories.AsNoTracking()
                .OrderBy(category => category.StageId)
                .ThenBy(category => category.Order)
                .ThenBy(category => category.Id)
                .Select(category => new
                {
                    category.Id,
                    category.StageId,
                    category.NameAr,
                    category.NameEn,
                    category.Order,
                    ProblemsCount = category.Problems.Count(),
                    MissingArabicSolutionCount = category.Problems.Count(
                        problem => problem.DetailedSolutionAr == null ||
                            problem.DetailedSolutionAr == ""),
                    MissingEnglishSolutionCount = category.Problems.Count(
                        problem => problem.DetailedSolutionEn == null ||
                            problem.DetailedSolutionEn == ""),
                    InvalidOptionsCount = category.Problems.Count(
                        problem => problem.Options.Count() != 4 ||
                            problem.Options.Count(option => option.IsCorrect) != 1)
                }).ToListAsync(cancellationToken);

            var missingStageCount = await _db.Users.AsNoTracking()
                .CountAsync(user => user.Role == "Student" &&
                    user.CurrentStageId == null, cancellationToken);

            var stageRows = stages.Select(stage => new
            {
                StageId = stage.Id,
                stage.NameAr,
                stage.NameEn,
                CategoriesCount = categories.Count(category =>
                    category.StageId == stage.Id),
                ProblemsCount = categories.Where(category =>
                    category.StageId == stage.Id).Sum(category =>
                        category.ProblemsCount)
            }).ToArray();

            var summary = new
            {
                TotalStages = stages.Count,
                TotalCategories = categories.Count,
                TotalProblems = categories.Sum(category => category.ProblemsCount),
                EmptyCategories = categories.Count(category =>
                    category.ProblemsCount == 0),
                ProblemsWithInvalidOptions = categories.Sum(category =>
                    category.InvalidOptionsCount),
                ProblemsMissingArabicSolution = categories.Sum(category =>
                    category.MissingArabicSolutionCount),
                ProblemsMissingEnglishSolution = categories.Sum(category =>
                    category.MissingEnglishSolutionCount),
                LearnersWithoutStage = missingStageCount
            };

            return Ok(LanguageHelper.SuccessResponse(new
            {
                Summary = summary,
                Stages = stageRows,
                Categories = categories
            }, "Success", LanguageHelper.GetLanguageFromRequest(Request)));
        }
    }
}
