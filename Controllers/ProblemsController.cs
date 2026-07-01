using MathWorldAPI.Data;
using MathWorldAPI.DTOs;
using MathWorldAPI.Helpers;
using MathWorldAPI.Models;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System.Security.Claims;

namespace MathWorldAPI.Controllers
{
    /// <summary>
    /// Controller for managing math problems, search, and answer submission.
    /// </summary>
    [ApiController]
    [Route("api/[controller]")]
    public class ProblemsController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly IMeiliSearchService _searchService;
        private readonly IServiceScopeFactory _scopeFactory;
        private readonly bool _meilisearchEnabled;

        /// <summary>
        /// Initializes a new instance of the ProblemsController.
        /// </summary>
        public ProblemsController(AppDbContext context,
                                  IMeiliSearchService searchService,
                                  IServiceScopeFactory scopeFactory,
                                  IConfiguration configuration)
        {
            _context = context;
            _searchService = searchService;
            _scopeFactory = scopeFactory;
            _meilisearchEnabled = configuration.GetValue<bool>("Meilisearch:Enabled");
        }

        /// <summary>
        /// Searches problems using MeiliSearch engine.
        /// </summary>
        [HttpGet("meilisearch-search")]
        [ProducesResponseType(typeof(ApiResponse<SearchResponseDto>), StatusCodes.Status200OK)]
        public async Task<ActionResult<ApiResponse<SearchResponseDto>>> MeiliSearch(
            [FromQuery] string q = "",
            [FromQuery] int? categoryId = null,
            [FromQuery] int? stageId = null,
            [FromQuery] int page = 1,
            [FromQuery] int pageSize = 10)
        {
            page = Math.Max(1, page);
            pageSize = Math.Clamp(pageSize, 1, 100);

            var language = LanguageHelper.GetLanguageFromRequest(Request);

            if (string.IsNullOrWhiteSpace(q))
            {
                var query = _context.Problems
                    .Include(p => p.Category)
                    .Include(p => p.Stage)
                    .AsQueryable();

                if (categoryId.HasValue) query = query.Where(p => p.CategoryId == categoryId.Value);
                if (stageId.HasValue) query = query.Where(p => p.StageId == stageId.Value);

                var total = await query.CountAsync();

                var allProblems = await query
                    .OrderByDescending(p => p.Id)
                    .Skip((page - 1) * pageSize)
                    .Take(pageSize)
                    .Select(p => new ProblemPreviewDto
                    {
                        Id = p.Id,
                        Title = language == "en" ? p.TitleEn : p.TitleAr,
                        StageId = p.StageId,
                        StageName = language == "en" ? p.Stage.NameEn : p.Stage.NameAr,
                        Points = p.Points,
                        CategoryId = p.CategoryId,
                        CategoryName = language == "en" ? p.Category.NameEn : p.Category.NameAr,
                        ViewsCount = p.ViewsCount,
                        RequiresLogin = true
                    })
                    .ToListAsync();

                return Ok(LanguageHelper.SuccessResponse(
                    new SearchResponseDto
                    {
                        Query = q,
                        Page = page,
                        PageSize = pageSize,
                        Results = allProblems,
                        Total = total,
                        TotalPages = (int)Math.Ceiling((double)total / pageSize)
                    },
                    allProblems.Count == 0 ? "NoResultsFound" : "Success",
                    language, meta: new MetaData { SearchType = "Meilisearch", Query = q, Total = total }));
            }

            (List<int> problemIds, int totalCount) = await _searchService.SearchWithPaginationAsync(q, categoryId, stageId, page, pageSize);

            if (problemIds == null || problemIds.Count == 0)
            {
                return Ok(LanguageHelper.SuccessResponse(
                    new SearchResponseDto
                    {
                        Query = q,
                        Page = page,
                        PageSize = pageSize,
                        Results = new List<ProblemPreviewDto>(),
                        Total = 0
                    },
                    "NoResultsFound", language, meta: new MetaData { SearchType = "Meilisearch", Query = q, Total = 0 }));
            }

            var problems = await _context.Problems
                .Include(p => p.Category)
                .Include(p => p.Stage)
                .Where(p => problemIds.Contains(p.Id))
                .Select(p => new ProblemPreviewDto
                {
                    Id = p.Id,
                    Title = language == "en" ? p.TitleEn : p.TitleAr,
                    StageId = p.StageId,
                    StageName = language == "en" ? p.Stage.NameEn : p.Stage.NameAr,
                    Points = p.Points,
                    CategoryId = p.CategoryId,
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
                new SearchResponseDto
                {
                    Query = q,
                    Page = page,
                    PageSize = pageSize,
                    Results = ordered,
                    Total = totalCount
                },
                "Success", language, meta: new MetaData { SearchType = "Meilisearch", Query = q, Total = totalCount }));
        }

        /// <summary>
        /// Searches problems using PostgreSQL full-text search.
        /// </summary>
        [HttpGet("postgresql-search")]
        [ProducesResponseType(typeof(ApiResponse<SearchResponseDto>), StatusCodes.Status200OK)]
        public async Task<ActionResult<ApiResponse<SearchResponseDto>>> PostgreSqlSearch(
            [FromQuery] string q = "",
            [FromQuery] int? categoryId = null,
            [FromQuery] int? stageId = null,
            [FromQuery] int page = 1,
            [FromQuery] int pageSize = 10)
        {
            page = Math.Max(1, page);
            pageSize = Math.Clamp(pageSize, 1, 100);

            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var query = _context.Problems
                .Include(p => p.Category)
                .Include(p => p.Stage)
                .AsQueryable();

            if (!string.IsNullOrWhiteSpace(q))
            {
                query = query.Where(p => p.TitleAr.Contains(q) || p.TitleEn.Contains(q) ||
                                         p.QuestionTextAr.Contains(q) || p.QuestionTextEn.Contains(q));
            }

            if (categoryId.HasValue) query = query.Where(p => p.CategoryId == categoryId.Value);
            if (stageId.HasValue) query = query.Where(p => p.StageId == stageId.Value);

            var total = await query.CountAsync();

            var problems = await query
                .OrderByDescending(p => p.Id)
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .Select(p => new ProblemPreviewDto
                {
                    Id = p.Id,
                    Title = language == "en" ? p.TitleEn : p.TitleAr,
                    StageId = p.StageId,
                    StageName = language == "en" ? p.Stage.NameEn : p.Stage.NameAr,
                    Points = p.Points,
                    CategoryId = p.CategoryId,
                    CategoryName = language == "en" ? p.Category.NameEn : p.Category.NameAr,
                    ViewsCount = p.ViewsCount,
                    RequiresLogin = true
                })
                .ToListAsync();

            return Ok(LanguageHelper.SuccessResponse(
                new SearchResponseDto
                {
                    Query = q,
                    Page = page,
                    PageSize = pageSize,
                    Results = problems,
                    Total = total
                },
                problems.Count == 0 ? "NoResultsFound" : "Success",
                language, meta: new MetaData { SearchType = "PostgreSQL", Query = q, Total = total }));
        }

        /// <summary>
        /// Unified search endpoint that routes to MeiliSearch or PostgreSQL based on configuration.
        /// </summary>
        [HttpGet("search")]
        [ProducesResponseType(typeof(ApiResponse<SearchResponseDto>), StatusCodes.Status200OK)]
        public async Task<ActionResult<ApiResponse<SearchResponseDto>>> Search(
            [FromQuery] string q = "",
            [FromQuery] int? categoryId = null,
            [FromQuery] int? stageId = null,
            [FromQuery] string? engine = "meilisearch",
            [FromQuery] int page = 1,
            [FromQuery] int pageSize = 10)
        {
            var usePostgres = !_meilisearchEnabled || engine == "postgresql";
            return usePostgres
                ? await PostgreSqlSearch(q, categoryId, stageId, page, pageSize)
                : await MeiliSearch(q, categoryId, stageId, page, pageSize);
        }

        /// <summary>
        /// Gets a single problem by ID. Returns different data based on user role and authentication status.
        /// </summary>
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
                .Include(p => p.Stage)
                .Include(p => p.Options)
                .AsSplitQuery()
                .FirstOrDefaultAsync(p => p.Id == id);

            if (problem == null)
                return NotFound(LanguageHelper.ErrorResponse<ApiResponse<object>>("ProblemNotFound", language, 404));

            _ = BackgroundUpdateAsync(id);

            if (userRole == "Admin")
            {
                return Ok(LanguageHelper.SuccessResponse(new
                {
                    problem.Id,
                    problem.TitleAr,
                    problem.TitleEn,
                    problem.QuestionTextAr,
                    problem.QuestionTextEn,
                    problem.DetailedSolutionAr,
                    problem.DetailedSolutionEn,
                    problem.StageId,
                    StageName = language == "en" ? problem.Stage?.NameEn ?? "Unknown Stage" : problem.Stage?.NameAr ?? "مرحلة غير معروفة",
                    problem.Points,
                    problem.CategoryId,
                    CategoryName = language == "en" ? problem.Category.NameEn : problem.Category.NameAr,
                    Options = problem.Options.OrderBy(o => o.Order).Select(o => new OptionForStudentDto
                    {
                        Id = o.Id,
                        LatexCode = o.LatexCode,
                        Order = o.Order,
                        IsCorrect = o.IsCorrect
                    }).ToList()
                }, "Success", language));
            }

            if (userId.HasValue)
            {
                var progress = await _context.UserProgresses
                    .AsNoTracking()
                    .FirstOrDefaultAsync(up => up.UserId == userId.Value && up.ProblemId == id);

                return Ok(LanguageHelper.SuccessResponse(new ProblemForStudentDto
                {
                    Id = problem.Id,
                    Title = language == "en" ? problem.TitleEn : problem.TitleAr,
                    QuestionText = language == "en" ? problem.QuestionTextEn : problem.QuestionTextAr,
                    StageId = problem.StageId,
                    StageName = language == "en" ? problem.Stage?.NameEn ?? "Unknown Stage" : problem.Stage?.NameAr ?? "مرحلة غير معروفة",
                    Points = problem.Points,
                    CategoryId = problem.CategoryId,
                    CategoryName = language == "en" ? problem.Category.NameEn : problem.Category.NameAr,
                    CategoryIcon = problem.Category.Icon,
                    IsSolved = progress != null,
                    IsFavorite = progress?.IsFavorite ?? false,
                    DetailedSolution = language == "en" ? problem.DetailedSolutionEn : problem.DetailedSolutionAr,
                    YoutubeSolutionUrl = problem.YoutubeSolutionUrl,
                    Options = problem.Options.OrderBy(o => o.Order).Select(o => new OptionForStudentDto
                    {
                        Id = o.Id,
                        LatexCode = o.LatexCode,
                        Order = o.Order,
                        IsCorrect = o.IsCorrect
                    }).ToList()
                }, "Success", language));
            }

            return Ok(LanguageHelper.SuccessResponse(new ProblemForPublicDto
            {
                Id = problem.Id,
                Title = language == "en" ? problem.TitleEn : problem.TitleAr,
                QuestionText = language == "en" ? problem.QuestionTextEn : problem.QuestionTextAr,
                StageId = problem.StageId,
                StageName = language == "en" ? problem.Stage?.NameEn ?? "Unknown Stage" : problem.Stage?.NameAr ?? "مرحلة غير معروفة",
                CategoryId = problem.CategoryId,
                CategoryName = language == "en" ? problem.Category.NameEn : problem.Category.NameAr,
                CategoryIcon = problem.Category.Icon,
                Message = LanguageHelper.GetMessage("RequiresLogin", language)
            }, "Success", language));
        }

        /// <summary>
        /// Submits an answer for a problem. Only one attempt is allowed per user.
        /// </summary>
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

            var existingProgress = await _context.UserProgresses.FirstOrDefaultAsync(up => up.UserId == userId.Value && up.ProblemId == dto.ProblemId);

            if (existingProgress != null)
                return BadRequest(LanguageHelper.ErrorResponse<ApiResponse<AnswerResultDto>>("OnlyOneAttemptAllowed", language));

            var newProgress = new UserProgress
            {
                UserId = userId.Value,
                ProblemId = dto.ProblemId,
                IsSolved = isCorrect,
                IsCorrect = isCorrect,
                SelectedOptionId = dto.SelectedOptionId,
                Attempts = 1,
                TimeSpentSeconds = dto.TimeSpentSeconds,
                SolvedAt = isCorrect ? DateTime.UtcNow : null,
                LastAttemptAt = DateTime.UtcNow,
            };

            _context.UserProgresses.Add(newProgress);

            if (isCorrect)
            {
                problem.SolvedCount++;
            }

            await _context.SaveChangesAsync();

            var correctOption = problem.Options.First(o => o.IsCorrect);
            var correctText = correctOption.LatexCode;
            var messageKey = isCorrect ? "AnswerCorrect" : "AnswerWrong";
            var messageArgs = isCorrect ? null : new object[] { correctText };

            return Ok(LanguageHelper.SuccessResponse(new AnswerResultDto
            {
                IsCorrect = isCorrect,
                PointsEarned = isCorrect ? problem.Points : 0,
                DetailedSolution = language == "en" ? problem.DetailedSolutionEn : problem.DetailedSolutionAr,
                CorrectOptionText = correctText,
                IsSolved = isCorrect,
                YoutubeSolutionUrl = problem.YoutubeSolutionUrl
            }, messageKey, language, args: messageArgs ?? Array.Empty<object>()));
        }

        /// <summary>
        /// Gets the current authenticated user ID from claims.
        /// </summary>
        private int? GetUserId() => User.Identity?.IsAuthenticated == true ? int.Parse(User.FindFirst(ClaimTypes.NameIdentifier)?.Value ?? "0") : null;

        /// <summary>
        /// Gets the current authenticated user role from claims.
        /// </summary>
        private string? GetUserRole() => User.Identity?.IsAuthenticated == true ? User.FindFirst(ClaimTypes.Role)?.Value : null;

        /// <summary>
        /// Background task to update view count and sync with MeiliSearch.
        /// </summary>
        private async Task BackgroundUpdateAsync(int problemId)
        {
            using var scope = _scopeFactory.CreateScope();
            var db = scope.ServiceProvider.GetRequiredService<AppDbContext>();

            try
            {
                var problem = await db.Problems.FindAsync(problemId);
                if (problem != null)
                {
                    problem.ViewsCount++;
                    await db.SaveChangesAsync();
                    if (_meilisearchEnabled)
                    {
                        try
                        {
                            var searchService = scope.ServiceProvider.GetRequiredService<IMeiliSearchService>();
                            await searchService.UpdateProblemAsync(problem);
                        }
                        catch { }
                    }
                }
            }
            catch
            {
                // Non-critical operations - ignore any errors
            }
        }
    }
}