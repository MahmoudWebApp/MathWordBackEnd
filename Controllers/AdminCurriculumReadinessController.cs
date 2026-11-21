using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers
{
    /// <summary>
    /// Read-only curriculum inventory and editorial signals. The number
    /// of topics and questions follows reviewed learning objectives; this
    /// report deliberately contains NO fixed minimum or target quota.
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
                    user => user.Id == adminId && user.Role == "Admin" && user.IsActive,
                    cancellationToken))
                return Forbid();

            var stages = await _db.EducationalStages.AsNoTracking()
                .OrderBy(stage => stage.Order).ThenBy(stage => stage.Id)
                .Select(stage => new { stage.Id, stage.NameAr, stage.NameEn, stage.Order })
                .ToListAsync(cancellationToken);

            var categories = await _db.Categories.AsNoTracking()
                .OrderBy(category => category.StageId)
                .ThenBy(category => category.Order).ThenBy(category => category.Id)
                .Select(category => new
                {
                    category.Id, category.StageId, category.NameAr, category.NameEn,
                    category.Icon, category.Order
                }).ToListAsync(cancellationToken);

            var problems = await _db.Problems.AsNoTracking()
                .Select(problem => new
                {
                    problem.Id, problem.StageId, problem.CategoryId,
                    problem.QuestionTextAr, problem.QuestionTextEn,
                    problem.DetailedSolutionAr, problem.DetailedSolutionEn,
                    Options = problem.Options.Select(option => new
                    {
                        option.LatexCode, option.IsCorrect
                    }).ToList()
                }).ToListAsync(cancellationToken);

            var stageIds = stages.Select(stage => stage.Id).ToHashSet();
            var categoryStages = categories.ToDictionary(category => category.Id,
                category => category.StageId);
            var orphanProblemIds = problems.Where(problem =>
                !stageIds.Contains(problem.StageId) ||
                !categoryStages.TryGetValue(problem.CategoryId, out var categoryStage) ||
                categoryStage != problem.StageId)
                .Select(problem => problem.Id).OrderBy(id => id).ToArray();

            var stageRows = stages.Select(stage =>
            {
                var stageCategories = categories.Where(category => category.StageId == stage.Id)
                    .ToList();
                var stageProblems = problems.Where(problem => problem.StageId == stage.Id)
                    .ToList();

                var invalidProblemIds = stageProblems.Where(problem =>
                    !categoryStages.TryGetValue(problem.CategoryId, out var categoryStage) ||
                    categoryStage != stage.Id ||
                    string.IsNullOrWhiteSpace(problem.QuestionTextAr) ||
                    string.IsNullOrWhiteSpace(problem.QuestionTextEn) ||
                    string.IsNullOrWhiteSpace(problem.DetailedSolutionAr) ||
                    string.IsNullOrWhiteSpace(problem.DetailedSolutionEn) ||
                    problem.Options.Count != 4 ||
                    problem.Options.Count(option => option.IsCorrect) != 1 ||
                    problem.Options.Any(option => string.IsNullOrWhiteSpace(option.LatexCode)) ||
                    problem.Options.Select(option => option.LatexCode.Trim())
                        .Distinct(StringComparer.Ordinal).Count() != 4)
                    .Select(problem => problem.Id).OrderBy(id => id).ToArray();

                var categoryRows = stageCategories.Select(category =>
                {
                    var selected = stageProblems.Where(problem =>
                        problem.CategoryId == category.Id).ToList();

                    // Numeric-template similarities are editorial hints, not
                    // mathematical proof of duplication or a reason to delete rows.
                    var families = selected.GroupBy(problem => CurriculumContentQuality.FamilyKey(
                        stage.Id, category.Id, problem.QuestionTextAr, problem.QuestionTextEn))
                        .ToList();
                    var repeated = families.Where(family => family.Count() > 1).ToList();

                    var exactDuplicateIds = selected.GroupBy(problem => (
                            Ar: problem.QuestionTextAr?.Trim().ToLowerInvariant() ?? "",
                            En: problem.QuestionTextEn?.Trim().ToLowerInvariant() ?? ""))
                        .Where(group => group.Count() > 1)
                        .SelectMany(group => group.Select(problem => problem.Id))
                        .OrderBy(id => id).ToArray();

                    return new
                    {
                        CategoryId = category.Id, category.NameAr, category.NameEn,
                        category.Icon, category.Order, ProblemCount = selected.Count,
                        DistinctTemplateFamilies = families.Count,
                        RepeatedTemplateFamilies = repeated.Count,
                        TemplateVariantProblems = repeated.Sum(group => group.Count()),
                        ExactDuplicateProblemIds = exactDuplicateIds,
                        NeedsEditorialReview = selected.Count == 0 ||
                            exactDuplicateIds.Length > 0 || repeated.Count > 0 ||
                            selected.Any(problem => invalidProblemIds.Contains(problem.Id))
                    };
                }).ToList();

                return new
                {
                    StageId = stage.Id, stage.NameAr, stage.NameEn, stage.Order,
                    CategoryCount = categoryRows.Count,
                    ProblemCount = stageProblems.Count,
                    EmptyCategoryCount = categoryRows.Count(category =>
                        category.ProblemCount == 0),
                    CategoriesWithRepeatedTemplates = categoryRows.Count(category =>
                        category.RepeatedTemplateFamilies > 0),
                    InvalidProblemCount = invalidProblemIds.Length,
                    InvalidProblemIds = invalidProblemIds,
                    Categories = categoryRows
                };
            }).ToList();

            return Ok(new
            {
                CurriculumModel = "adaptive-skill-objectives-v2",
                FixedCategoryOrProblemQuota = false,
                SkillCoverageMeasured = false,
                SkillCoverageExplanation = "Per-skill proficiency and uncovered objectives require reviewed skill tagging before they can be measured.",
                StageCount = stages.Count,
                TotalCategories = categories.Count,
                TotalProblems = problems.Count,
                OrphanProblemCount = orphanProblemIds.Length,
                OrphanProblemIds = orphanProblemIds,
                EmptyCategories = stageRows.Sum(stage => stage.EmptyCategoryCount),
                CategoriesWithRepeatedTemplates = stageRows.Sum(stage =>
                    stage.CategoriesWithRepeatedTemplates),
                StagesWithInvalidProblems = stageRows.Count(stage =>
                    stage.InvalidProblemCount > 0),
                Stages = stageRows
            });
        }
    }
}
