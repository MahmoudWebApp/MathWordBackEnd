// File: MathWorldAPI/Controllers/ProblemsController.cs

using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.DTOs;
using MathWorldAPI.Helpers;
using MathWorldAPI.Services;
using MathWorldAPI.Models;

namespace MathWorldAPI.Controllers
{
    /// <summary>
    /// Controller for managing math problems including search, retrieval, and answer submission.
    /// Supports role-based access control and multilingual responses.
    /// </summary>
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

        // =====================================
// Search using Meilisearch
// =====================================

[HttpGet("meilisearch-search")]
[ProducesResponseType(typeof(ApiResponse<SearchResponseDto>), StatusCodes.Status200OK)]
public async Task<ActionResult<ApiResponse<SearchResponseDto>>> MeiliSearch(
    [FromQuery] string q = "",
    [FromQuery] int? categoryId = null,
    [FromQuery] int? tagId = null,
    [FromQuery] string? difficulty = null)
{
    var language = LanguageHelper.GetLanguageFromRequest(Request);

    // ✅ لو q فارغ، نجيب كل المسائل مع الفلاتر من DB
    if (string.IsNullOrWhiteSpace(q))
    {
        var query = _context.Problems
            .Include(p => p.Category)
            .Include(p => p.ProblemTags)
            .AsQueryable();

        if (categoryId.HasValue) query = query.Where(p => p.CategoryId == categoryId.Value);
        if (tagId.HasValue) query = query.Where(p => p.ProblemTags.Any(pt => pt.TagId == tagId.Value));
        if (!string.IsNullOrWhiteSpace(difficulty)) query = query.Where(p => p.Difficulty == difficulty);

        var allProblems = await query   // ← غيّرنا الاسم هنا
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

        return Ok(LanguageHelper.SuccessResponse(
            new SearchResponseDto { Query = q, Results = allProblems },  // ← وهنا
            allProblems.Count == 0 ? "NoResultsFound" : "Success",
            language, meta: new MetaData { SearchType = "Meilisearch", Query = q, Total = allProblems.Count }));  // ← وهنا
    }

    var problemIds = await _searchService.SearchAsync(q, categoryId, difficulty);

    if (problemIds == null || problemIds.Count == 0)
    {
        return Ok(LanguageHelper.SuccessResponse(
            new SearchResponseDto { Query = q, Results = new List<ProblemPreviewDto>() },
            "NoResultsFound", language, meta: new MetaData { SearchType = "Meilisearch", Query = q, Total = 0 }));
    }

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

    var ordered = problemIds
        .Select(id => problems.FirstOrDefault(p => p.Id == id))
        .Where(p => p != null)
        .Select(p => p!)
        .ToList();

    return Ok(LanguageHelper.SuccessResponse(
        new SearchResponseDto { Query = q, Results = ordered },
        "Success", language, meta: new MetaData { SearchType = "Meilisearch", Query = q, Total = ordered.Count }));
}

        // =====================================
        // Search using PostgreSQL
        // =====================================

        [HttpGet("postgresql-search")]
        [ProducesResponseType(typeof(ApiResponse<SearchResponseDto>), StatusCodes.Status200OK)]
        public async Task<ActionResult<ApiResponse<SearchResponseDto>>> PostgreSqlSearch(
            [FromQuery] string q = "",
            [FromQuery] int? categoryId = null,
            [FromQuery] int? tagId = null,
            [FromQuery] string? difficulty = null)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var query = _context.Problems
                .Include(p => p.Category)
                .Include(p => p.ProblemTags)
                .AsQueryable();

            // ✅ نضيف شرط البحث بس لو q مش فارغ
            if (!string.IsNullOrWhiteSpace(q))
            {
                query = query.Where(p => p.TitleAr.Contains(q) || p.TitleEn.Contains(q) ||
                                         p.QuestionTextAr.Contains(q) || p.QuestionTextEn.Contains(q));
            }

            if (categoryId.HasValue) query = query.Where(p => p.CategoryId == categoryId.Value);
            if (tagId.HasValue) query = query.Where(p => p.ProblemTags.Any(pt => pt.TagId == tagId.Value));
            if (!string.IsNullOrWhiteSpace(difficulty)) query = query.Where(p => p.Difficulty == difficulty);

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

            return Ok(LanguageHelper.SuccessResponse(
                new SearchResponseDto { Query = q, Results = problems },
                problems.Count == 0 ? "NoResultsFound" : "Success",
                language, meta: new MetaData { SearchType = "PostgreSQL", Query = q, Total = problems.Count }));
        }

        // =====================================
        // Main search endpoint (router)
        // =====================================

        [HttpGet("search")]
        [ProducesResponseType(typeof(ApiResponse<SearchResponseDto>), StatusCodes.Status200OK)]
        public async Task<ActionResult<ApiResponse<SearchResponseDto>>> Search(
            [FromQuery] string q = "",
            [FromQuery] int? categoryId = null,
            [FromQuery] int? tagId = null,
            [FromQuery] string? difficulty = null,
            [FromQuery] string? engine = "meilisearch")
        {
            return engine == "postgresql"
                ? await PostgreSqlSearch(q, categoryId, tagId, difficulty)
                : await MeiliSearch(q, categoryId, tagId, difficulty);
        }

        // =====================================
        // Get single problem with role-based content
        // =====================================

        [HttpGet("{id}")]
        [ProducesResponseType(typeof(ApiResponse<object>), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ApiResponse<object>), StatusCodes.Status404NotFound)]
        public async Task<IActionResult> GetProblem(int id)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            var userId = GetUserId();
            var userRole = GetUserRole();

            var problem = await _context.Problems
                .Include(p => p.Category)
                .Include(p => p.Options)
                .Include(p => p.ProblemTags).ThenInclude(pt => pt.Tag)
                .FirstOrDefaultAsync(p => p.Id == id);

            if (problem == null)
                return NotFound(LanguageHelper.ErrorResponse<ApiResponse<object>>("ProblemNotFound", language, 404));

            problem.ViewsCount++;
            await _context.SaveChangesAsync();

            try { await _searchService.UpdateProblemAsync(problem); } catch { }

            var tags = problem.ProblemTags.Select(pt => language == "en" ? pt.Tag.TextEn : pt.Tag.TextAr).ToList();

            if (userRole == "Admin")
            {
                return Ok(LanguageHelper.SuccessResponse(new
                {
                    problem.Id,
                    problem.TitleAr,
                    problem.TitleEn,
                    problem.QuestionTextAr,
                    problem.QuestionTextEn,
                    problem.LatexCode,
                    problem.DetailedSolution,
                    problem.Difficulty,
                    problem.Points,
                    problem.CategoryId,
                    Options = problem.Options.OrderBy(o => o.Order).Select(o => new { o.Id, o.TextAr, o.TextEn, o.LatexCode, o.IsCorrect, o.Order }),
                    Tags = problem.ProblemTags.Select(pt => new { pt.Tag.Id, pt.Tag.TextAr, pt.Tag.TextEn })
                }, "Success", language));
            }

            if (userId.HasValue)
            {
                var progress = await _context.UserProgresses.FirstOrDefaultAsync(up => up.UserId == userId.Value && up.ProblemId == id);

                if (progress?.IsSolved == true)
                {
                    return Ok(LanguageHelper.SuccessResponse(new ProblemForStudentDto
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
                        Options = problem.Options.OrderBy(o => o.Order).Select(o => new OptionForStudentDto
                        { Id = o.Id, Text = language == "en" ? o.TextEn : o.TextAr, LatexCode = o.LatexCode, Order = o.Order }).ToList(),
                        Tags = tags
                    }, "Success", language));
                }

                return Ok(LanguageHelper.SuccessResponse(new ProblemForStudentDto
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
                    Options = problem.Options.OrderBy(o => o.Order).Select(o => new OptionForStudentDto
                    { Id = o.Id, Text = language == "en" ? o.TextEn : o.TextAr, LatexCode = o.LatexCode, Order = o.Order }).ToList(),
                    Tags = tags
                }, "Success", language));
            }

            return Ok(LanguageHelper.SuccessResponse(new ProblemForPublicDto
            {
                Id = problem.Id,
                Title = language == "en" ? problem.TitleEn : problem.TitleAr,
                QuestionText = language == "en" ? problem.QuestionTextEn : problem.QuestionTextAr,
                LatexCode = problem.LatexCode,
                Difficulty = problem.Difficulty,
                CategoryName = language == "en" ? problem.Category.NameEn : problem.Category.NameAr,
                CategoryIcon = problem.Category.Icon,
                Message = LanguageHelper.GetMessage("RequiresLogin", language),
                Tags = tags
            }, "Success", language));
        }

        // =====================================
        // Submit answer endpoint
        // =====================================

        [Authorize]
        [HttpPost("submit")]
        [ProducesResponseType(typeof(ApiResponse<AnswerResultDto>), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ApiResponse<object>), StatusCodes.Status400BadRequest)]
        [ProducesResponseType(typeof(ApiResponse<object>), StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(typeof(ApiResponse<object>), StatusCodes.Status404NotFound)]
        public async Task<ActionResult<ApiResponse<AnswerResultDto>>> SubmitAnswer([FromBody] SubmitAnswerDto dto)
        {
            var userId = GetUserId();
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            if (!userId.HasValue)
                return Unauthorized(LanguageHelper.ErrorResponse<ApiResponse<AnswerResultDto>>("Unauthorized", language, 401));

            var problem = await _context.Problems.Include(p => p.Options).FirstOrDefaultAsync(p => p.Id == dto.ProblemId);
            if (problem == null)
                return NotFound(LanguageHelper.ErrorResponse<ApiResponse<AnswerResultDto>>("ProblemNotFound", language, 404));

            var selectedOption = problem.Options.FirstOrDefault(o => o.Id == dto.SelectedOptionId);
            if (selectedOption == null)
                return BadRequest(LanguageHelper.ErrorResponse<ApiResponse<AnswerResultDto>>("OptionNotFound", language));

            var isCorrect = selectedOption.IsCorrect;
            var progress = await _context.UserProgresses.FirstOrDefaultAsync(up => up.UserId == userId.Value && up.ProblemId == dto.ProblemId);

            if (progress?.IsSolved == true)
                return BadRequest(LanguageHelper.ErrorResponse<ApiResponse<AnswerResultDto>>("AlreadySolved", language));

            if (progress == null)
            {
                progress = new UserProgress
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
            var correctText = language == "en" ? correctOption.TextEn : correctOption.TextAr;
            var messageKey = isCorrect ? "AnswerCorrect" : "AnswerWrong";
            var messageArgs = isCorrect ? null : new object[] { correctText };

            return Ok(LanguageHelper.SuccessResponse(new AnswerResultDto
            {
                IsCorrect = isCorrect,
                PointsEarned = isCorrect ? problem.Points : 0,
                DetailedSolution = problem.DetailedSolution,
                CorrectOptionText = correctText,
                IsSolved = isCorrect
            }, messageKey, language, args: messageArgs ?? Array.Empty<object>()));
        }

        // =====================================
        // Helper methods
        // =====================================

        private int? GetUserId() => User.Identity?.IsAuthenticated == true ? int.Parse(User.FindFirst(ClaimTypes.NameIdentifier)?.Value ?? "0") : null;

        private string? GetUserRole() => User.Identity?.IsAuthenticated == true ? User.FindFirst(ClaimTypes.Role)?.Value : null;
    }
}