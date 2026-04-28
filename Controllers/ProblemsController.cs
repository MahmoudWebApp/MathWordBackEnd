using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.DTOs;
using MathWorldAPI.Helpers;
using MathWorldAPI.Services;

namespace MathWorldAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ProblemsController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly IMeiliSearchService _searchService;

        public ProblemsController(AppDbContext context, IMeiliSearchService searchService)
        {
            _context = context;
            _searchService = searchService;
        }

        // ========== SEARCH OPTION 1: Using Meilisearch (Advanced Search) ==========
        [HttpGet("meilisearch-search")]
        public async Task<IActionResult> MeiliSearch(
            [FromQuery] string q = "",
            [FromQuery] int? categoryId = null,
            [FromQuery] string? difficulty = null)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            if (string.IsNullOrWhiteSpace(q))
                return BadRequest(LanguageHelper.ErrorResponse("SearchQueryEmpty", language));

            // Search using Meilisearch
            var problemIds = await _searchService.SearchAsync(q, categoryId, difficulty);

            if (problemIds == null || problemIds.Count == 0)
                return Ok(LanguageHelper.SuccessResponse("NoResultsFound", language, new { Query = q, Total = 0, Results = new List<ProblemPreviewDto>() }));

            // Get full problem details from database
            var problems = await _context.Problems
                .Include(p => p.Category)
                .Where(p => problemIds.Contains(p.Id))
                .Select(p => new ProblemPreviewDto
                {
                    Id = p.Id,
                    Title = language == "en" ? p.TitleEn : p.TitleAr,
                    Difficulty = p.Difficulty,
                    CategoryName = language == "en" ? p.Category.NameEn : p.Category.NameAr,
                    ViewsCount = p.ViewsCount,
                    RequiresLogin = true
                })
                .ToListAsync();

            // Order results according to Meilisearch relevance
            var orderedProblems = problemIds
                .Select(id => problems.FirstOrDefault(p => p.Id == id))
                .Where(p => p != null)
                .ToList();

            return Ok(LanguageHelper.SuccessResponse("", language, new
            {
                SearchType = "Meilisearch",
                Query = q,
                Total = orderedProblems.Count,
                Results = orderedProblems
            }));
        }

        // ========== SEARCH OPTION 2: Using PostgreSQL (Direct Database Search) ==========
        [HttpGet("postgresql-search")]
        public async Task<IActionResult> PostgreSqlSearch(
            [FromQuery] string q = "",
            [FromQuery] int? categoryId = null,
            [FromQuery] string? difficulty = null)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            if (string.IsNullOrWhiteSpace(q))
                return BadRequest(LanguageHelper.ErrorResponse("SearchQueryEmpty", language));

            // DIRECT POSTGRESQL SEARCH (Without Meilisearch)
            var query = _context.Problems
                .Include(p => p.Category)
                .AsQueryable();

            // Search in titles and question text (Arabic & English)
            query = query.Where(p =>
                p.TitleAr.Contains(q) ||
                p.TitleEn.Contains(q) ||
                p.QuestionTextAr.Contains(q) ||
                p.QuestionTextEn.Contains(q));

            // Apply category filter if provided
            if (categoryId.HasValue)
                query = query.Where(p => p.CategoryId == categoryId.Value);

            // Apply difficulty filter if provided
            if (!string.IsNullOrEmpty(difficulty))
                query = query.Where(p => p.Difficulty == difficulty);

            // Get results
            var problems = await query
                .Select(p => new ProblemPreviewDto
                {
                    Id = p.Id,
                    Title = language == "en" ? p.TitleEn : p.TitleAr,
                    Difficulty = p.Difficulty,
                    CategoryName = language == "en" ? p.Category.NameEn : p.Category.NameAr,
                    ViewsCount = p.ViewsCount,
                    RequiresLogin = true
                })
                .ToListAsync();

            // Return results or no results message
            if (problems.Count == 0)
                return Ok(LanguageHelper.SuccessResponse("NoResultsFound", language, new
                {
                    SearchType = "PostgreSQL",
                    Query = q,
                    Total = 0,
                    Results = problems
                }));

            return Ok(LanguageHelper.SuccessResponse("", language, new
            {
                SearchType = "PostgreSQL",
                Query = q,
                Total = problems.Count,
                Results = problems
            }));
        }

        // ========== LEGACY SEARCH (Redirects to Meilisearch by default) ==========
        [HttpGet("search")]
        public async Task<IActionResult> Search(
            [FromQuery] string q = "",
            [FromQuery] int? categoryId = null,
            [FromQuery] string? difficulty = null,
            [FromQuery] string? engine = "meilisearch") // Default to meilisearch
        {
            // Redirect to the appropriate search engine based on 'engine' parameter
            if (engine == "postgresql")
                return await PostgreSqlSearch(q, categoryId, difficulty);
            else
                return await MeiliSearch(q, categoryId, difficulty);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetProblem(int id)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            var userId = GetUserId();
            var userRole = GetUserRole();

            var problem = await _context.Problems
                .Include(p => p.Category)
                .Include(p => p.Options)
                .Include(p => p.ProblemTags)
                .ThenInclude(pt => pt.Tag)
                .FirstOrDefaultAsync(p => p.Id == id);

            if (problem == null)
                return NotFound(LanguageHelper.ErrorResponse("ProblemNotFound", language, 404));

            problem.ViewsCount++;
            await _context.SaveChangesAsync();

            // Try to update Meilisearch (won't break if fails)
            try { await _searchService.UpdateProblemAsync(problem); } catch { }

            var tags = problem.ProblemTags.Select(pt => language == "en" ? pt.Tag.TextEn : pt.Tag.TextAr).ToList();

            // Admin view
            if (userRole == "Admin")
            {
                return Ok(new
                {
                    Id = problem.Id,
                    TitleAr = problem.TitleAr,
                    TitleEn = problem.TitleEn,
                    QuestionTextAr = problem.QuestionTextAr,
                    QuestionTextEn = problem.QuestionTextEn,
                    LatexCode = problem.LatexCode,
                    DetailedSolution = problem.DetailedSolution,
                    Difficulty = problem.Difficulty,
                    Points = problem.Points,
                    CategoryId = problem.CategoryId,
                    Options = problem.Options.OrderBy(o => o.Order).Select(o => new
                    {
                        o.Id,
                        o.TextAr,
                        o.TextEn,
                        o.LatexCode,
                        o.IsCorrect,
                        o.Order
                    }),
                    Tags = problem.ProblemTags.Select(pt => new { pt.Tag.Id, pt.Tag.TextAr, pt.Tag.TextEn })
                });
            }

            // Student view
            if (userId.HasValue)
            {
                var progress = await _context.UserProgresses
                    .FirstOrDefaultAsync(up => up.UserId == userId.Value && up.ProblemId == id);

                if (progress?.IsSolved == true)
                {
                    return Ok(new
                    {
                        Id = problem.Id,
                        Title = language == "en" ? problem.TitleEn : problem.TitleAr,
                        QuestionText = language == "en" ? problem.QuestionTextEn : problem.QuestionTextAr,
                        LatexCode = problem.LatexCode,
                        Difficulty = problem.Difficulty,
                        Points = problem.Points,
                        CategoryName = language == "en" ? problem.Category.NameEn : problem.Category.NameAr,
                        CategoryIcon = problem.Category.Icon,
                        IsSolved = true,
                        IsFavorite = progress.IsFavorite,
                        DetailedSolution = problem.DetailedSolution,
                        Tags = tags,
                        Options = problem.Options.OrderBy(o => o.Order).Select(o => new
                        {
                            o.Id,
                            Text = language == "en" ? o.TextEn : o.TextAr,
                            o.LatexCode,
                            o.Order,
                            IsCorrect = o.IsCorrect
                        })
                    });
                }

                return Ok(new ProblemForStudentDto
                {
                    Id = problem.Id,
                    Title = language == "en" ? problem.TitleEn : problem.TitleAr,
                    QuestionText = language == "en" ? problem.QuestionTextEn : problem.QuestionTextAr,
                    LatexCode = problem.LatexCode,
                    Difficulty = problem.Difficulty,
                    Points = problem.Points,
                    CategoryName = language == "en" ? problem.Category.NameEn : problem.Category.NameAr,
                    CategoryIcon = problem.Category.Icon,
                    IsSolved = false,
                    IsFavorite = progress?.IsFavorite ?? false,
                    Tags = tags,
                    Options = problem.Options.OrderBy(o => o.Order).Select(o => new OptionForStudentDto
                    {
                        Id = o.Id,
                        Text = language == "en" ? o.TextEn : o.TextAr,
                        LatexCode = o.LatexCode,
                        Order = o.Order
                    }).ToList()
                });
            }

            // Public view
            return Ok(new ProblemForPublicDto
            {
                Id = problem.Id,
                Title = language == "en" ? problem.TitleEn : problem.TitleAr,
                QuestionText = language == "en" ? problem.QuestionTextEn : problem.QuestionTextAr,
                LatexCode = problem.LatexCode,
                Difficulty = problem.Difficulty,
                CategoryName = language == "en" ? problem.Category.NameEn : problem.Category.NameAr,
                CategoryIcon = problem.Category.Icon,
                Tags = tags,
                Message = LanguageHelper.GetMessage("RequiresLogin", language)
            });
        }

        [Authorize]
        [HttpPost("submit")]
        public async Task<IActionResult> SubmitAnswer([FromBody] SubmitAnswerDto dto)
        {
            var userId = GetUserId();
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            if (!userId.HasValue)
                return Unauthorized(LanguageHelper.ErrorResponse("Unauthorized", language, 401));

            var problem = await _context.Problems
                .Include(p => p.Options)
                .FirstOrDefaultAsync(p => p.Id == dto.ProblemId);

            if (problem == null)
                return NotFound(LanguageHelper.ErrorResponse("ProblemNotFound", language, 404));

            var selectedOption = problem.Options.FirstOrDefault(o => o.Id == dto.SelectedOptionId);
            if (selectedOption == null)
                return BadRequest(LanguageHelper.ErrorResponse("OptionNotFound", language));

            var isCorrect = selectedOption.IsCorrect;
            var progress = await _context.UserProgresses
                .FirstOrDefaultAsync(up => up.UserId == userId.Value && up.ProblemId == dto.ProblemId);

            if (progress?.IsSolved == true)
                return BadRequest(LanguageHelper.ErrorResponse("AlreadySolved", language));

            if (progress == null)
            {
                progress = new Models.UserProgress
                {
                    UserId = userId.Value,
                    ProblemId = dto.ProblemId,
                    IsSolved = isCorrect,
                    IsCorrect = isCorrect,
                    SelectedOptionId = dto.SelectedOptionId,
                    Attempts = 1,
                    TimeSpentSeconds = dto.TimeSpentSeconds,
                    SolvedAt = isCorrect ? DateTime.UtcNow : null,
                    LastAttemptAt = DateTime.UtcNow
                };
                _context.UserProgresses.Add(progress);
            }
            else
            {
                progress.Attempts++;
                progress.TimeSpentSeconds += dto.TimeSpentSeconds;
                progress.LastAttemptAt = DateTime.UtcNow;
                progress.SelectedOptionId = dto.SelectedOptionId;
                progress.IsCorrect = isCorrect;
                if (isCorrect && !progress.IsSolved)
                {
                    progress.IsSolved = true;
                    progress.SolvedAt = DateTime.UtcNow;
                    problem.SolvedCount++;
                }
            }

            await _context.SaveChangesAsync();

            var correctOption = problem.Options.First(o => o.IsCorrect);
            var correctOptionText = language == "en" ? correctOption.TextEn : correctOption.TextAr;

            var messageKey = isCorrect ? "AnswerCorrect" : "AnswerWrong";
            var messageArgs = isCorrect ? null : new object[] { correctOptionText };

            return Ok(LanguageHelper.SuccessResponse(messageKey, language, new AnswerResultDto
            {
                IsCorrect = isCorrect,
                PointsEarned = isCorrect ? problem.Points : 0,
                DetailedSolution = problem.DetailedSolution,
                CorrectOptionText = correctOptionText,
                IsSolved = isCorrect
            }, messageArgs ?? Array.Empty<object>()));
        }

        private int? GetUserId() => User.Identity?.IsAuthenticated == true
            ? int.Parse(User.FindFirst(ClaimTypes.NameIdentifier)?.Value ?? "0") : null;
        private string? GetUserRole() => User.Identity?.IsAuthenticated == true
            ? User.FindFirst(ClaimTypes.Role)?.Value : null;
    }
}