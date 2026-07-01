using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.EntityFrameworkCore;
using MathWorldAPI.Data;
using MathWorldAPI.DTOs;
using MathWorldAPI.Helpers;
using MathWorldAPI.Models;
using MathWorldAPI.Services;

namespace MathWorldAPI.Controllers
{
    /// <summary>
    /// Admin controller for managing problems, categories, stages, users, and system operations.
    /// Requires Admin role authorization.
    /// </summary>
    [ApiController]
    [Route("api/admin")]
    [Authorize(Roles = "Admin")]
    public class AdminController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly IMeiliSearchService _searchService;
        private readonly IImgBbStorageService _imgBbStorage;

        /// <summary>
        /// Initializes a new instance of the AdminController.
        /// </summary>
        public AdminController(AppDbContext context, IMeiliSearchService searchService, IImgBbStorageService imgBbStorage)
        {
            _context = context;
            _searchService = searchService;
            _imgBbStorage = imgBbStorage;
        }

        /// <summary>
        /// Reindexes all problems in MeiliSearch.
        /// </summary>
        [HttpPost("reindex")]
        public async Task<IActionResult> ReindexAll()
        {
            try
            {
                await _searchService.ReindexAllAsync();
                return Ok(LanguageHelper.SuccessResponse<object>(null, "Success", LanguageHelper.GetLanguageFromRequest(Request)));
            }
            catch (Exception)
            {
                return StatusCode(500, LanguageHelper.ErrorResponse<ApiResponse<object>>("ServerError", LanguageHelper.GetLanguageFromRequest(Request), 500));
            }
        }

        /// <summary>
        /// Syncs all problems from PostgreSQL to MeiliSearch.
        /// </summary>
        [HttpPost("sync-meilisearch")]
        public async Task<IActionResult> SyncMeiliSearch()
        {
            try
            {
                var problems = await _context.Problems.Include(p => p.Category).ToListAsync();
                foreach (var problem in problems) await _searchService.UpdateProblemAsync(problem);
                return Ok(LanguageHelper.SuccessResponse(new SyncResultDto { Total = problems.Count }, "Success", LanguageHelper.GetLanguageFromRequest(Request)));
            }
            catch (Exception)
            {
                return StatusCode(500, LanguageHelper.ErrorResponse<ApiResponse<SyncResultDto>>("ServerError", LanguageHelper.GetLanguageFromRequest(Request), 500));
            }
        }

        /// <summary>
        /// Gets all problems with optional filtering and pagination.
        /// </summary>
        [HttpGet("problems")]
        public async Task<IActionResult> GetAllProblems(
            [FromQuery] string? q = null,
            [FromQuery] int? categoryId = null,
            [FromQuery] int? stageId = null,
            [FromQuery] int page = 1,
            [FromQuery] int pageSize = 10)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            page = Math.Max(1, page);
            pageSize = Math.Clamp(pageSize, 1, 100);

            var query = _context.Problems
                .Include(p => p.Options)
                .Include(p => p.Stage)
                .AsQueryable();

            if (!string.IsNullOrWhiteSpace(q))
            {
                query = query.Where(p => p.TitleAr.Contains(q) || p.TitleEn.Contains(q) ||
                                         p.QuestionTextAr.Contains(q) || p.QuestionTextEn.Contains(q));
            }

            if (categoryId.HasValue)
                query = query.Where(p => p.CategoryId == categoryId.Value);

            if (stageId.HasValue)
                query = query.Where(p => p.StageId == stageId.Value);

            var total = await query.CountAsync();

            var problems = await query
                .OrderByDescending(p => p.Id)
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .Select(p => new
                {
                    p.Id,
                    p.TitleAr,
                    p.TitleEn,
                    p.QuestionTextAr,
                    p.QuestionTextEn,
                    p.DetailedSolutionAr,
                    p.DetailedSolutionEn,
                    p.StageId,
                    StageName = language == "en" ? p.Stage.NameEn : p.Stage.NameAr,
                    p.Points,
                    p.CategoryId,
                    p.YoutubeSolutionUrl,
                    Options = p.Options.OrderBy(o => o.Order).Select(o => new { o.LatexCode, o.IsCorrect, o.Order }).ToList()
                })
                .ToListAsync();

            var responseData = new
            {
                Results = problems,
                Total = total,
                Page = page,
                PageSize = pageSize,
                TotalPages = (int)Math.Ceiling((double)total / pageSize)
            };

            return Ok(LanguageHelper.SuccessResponse(responseData, problems.Count == 0 ? "NoResultsFound" : "Success", language));
        }

        /// <summary>
        /// Creates a new math problem. Title is auto-extracted from question text.
        /// </summary>
        [HttpPost("problems")]
        public async Task<ActionResult<ApiResponse<ProblemCreatedDto>>> CreateProblem([FromBody] CreateProblemDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            if (dto.Options == null || dto.Options.Count != 4)
                return BadRequest(LanguageHelper.ErrorResponse<ApiResponse<ProblemCreatedDto>>("OptionsCountError", language));
            if (dto.Options.Count(x => x.IsCorrect) != 1)
                return BadRequest(LanguageHelper.ErrorResponse<ApiResponse<ProblemCreatedDto>>("CorrectOptionError", language));

            var problem = new MathProblem
            {
                TitleAr = MathTextHelper.ExtractTitleFromQuestion(dto.QuestionTextAr),
                TitleEn = MathTextHelper.ExtractTitleFromQuestion(dto.QuestionTextEn),
                QuestionTextAr = dto.QuestionTextAr,
                QuestionTextEn = dto.QuestionTextEn,
                DetailedSolutionAr = dto.DetailedSolutionAr,
                DetailedSolutionEn = dto.DetailedSolutionEn,
                YoutubeSolutionUrl = dto.YoutubeSolutionUrl,
                StageId = dto.StageId,
                Points = dto.Points,
                CategoryId = dto.CategoryId,
                CreatedAt = DateTime.UtcNow,
                Options = dto.Options.Select(o => new QuestionOption
                {
                    LatexCode = o.LatexCode,
                    IsCorrect = o.IsCorrect,
                    Order = o.Order
                }).ToList()
            };

            _context.Problems.Add(problem);
            await _context.SaveChangesAsync();

            try { await _searchService.IndexProblemAsync(problem); } catch { }

            return CreatedAtAction("GetProblem", "Problems", new { id = problem.Id }, LanguageHelper.SuccessResponse(new ProblemCreatedDto { Id = problem.Id }, "ProblemCreated", language, 201));
        }

        /// <summary>
        /// Updates an existing problem.
        /// </summary>
        [HttpPut("problems/{id}")]
        public async Task<IActionResult> UpdateProblem(int id, [FromBody] CreateProblemDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            var problem = await _context.Problems.Include(p => p.Options).FirstOrDefaultAsync(p => p.Id == id);
            if (problem == null) return NotFound(LanguageHelper.ErrorResponse<ApiResponse<object>>("ProblemNotFound", language, 404));

            problem.TitleAr = MathTextHelper.ExtractTitleFromQuestion(dto.QuestionTextAr);
            problem.TitleEn = MathTextHelper.ExtractTitleFromQuestion(dto.QuestionTextEn);
            problem.QuestionTextAr = dto.QuestionTextAr;
            problem.QuestionTextEn = dto.QuestionTextEn;
            problem.DetailedSolutionAr = dto.DetailedSolutionAr;
            problem.DetailedSolutionEn = dto.DetailedSolutionEn;
            problem.StageId = dto.StageId;
            problem.Points = dto.Points;
            problem.CategoryId = dto.CategoryId;
            problem.YoutubeSolutionUrl = dto.YoutubeSolutionUrl;

            _context.QuestionOptions.RemoveRange(problem.Options);
            problem.Options = dto.Options.Select(o => new QuestionOption
            {
                LatexCode = o.LatexCode,
                IsCorrect = o.IsCorrect,
                Order = o.Order
            }).ToList();

            await _context.SaveChangesAsync();
            try { await _searchService.UpdateProblemAsync(problem); } catch { }
            return Ok(LanguageHelper.SuccessResponse<object>(null, "ProblemUpdated", language));
        }

        /// <summary>
        /// Deletes a problem by ID.
        /// </summary>
        [HttpDelete("problems/{id}")]
        public async Task<IActionResult> DeleteProblem(int id)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            var problem = await _context.Problems.FindAsync(id);
            if (problem == null) return NotFound(LanguageHelper.ErrorResponse<ApiResponse<object>>("ProblemNotFound", language, 404));

            _context.Problems.Remove(problem);
            await _context.SaveChangesAsync();
            try { await _searchService.DeleteProblemAsync(id); } catch { };
            return Ok(LanguageHelper.SuccessResponse<object>(null, "ProblemDeleted", language));
        }

        /// <summary>
        /// Gets all categories ordered by stage and order.
        /// </summary>
        [HttpGet("categories")]
        public async Task<IActionResult> GetAllCategories()
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            var categories = await _context.Categories
                .OrderBy(c => c.StageId)
                .ThenBy(c => c.Order)
                .Select(c => new CategoryDto { Id = c.Id, NameAr = c.NameAr, NameEn = c.NameEn, Icon = c.Icon ?? string.Empty, StageId = c.StageId, Order = c.Order })
                .ToListAsync();

            foreach (var cat in categories)
                cat.Icon = _imgBbStorage.GetFullUrl(cat.Icon) ?? string.Empty;

            return Ok(LanguageHelper.SuccessResponse(categories, "Success", language));
        }

        /// <summary>
        /// Creates a new category with optional icon upload.
        /// </summary>
        [HttpPost("categories")]
        [Consumes("multipart/form-data")]
        public async Task<IActionResult> CreateCategory([FromForm] CreateCategoryDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            var category = new Category { NameAr = dto.NameAr, NameEn = dto.NameEn, Order = dto.Order, StageId = dto.StageId };

            if (dto.Icon != null && dto.Icon.Length > 0)
            {
                if (!UploadHelper.IsValidImageExtension(dto.Icon.FileName, out _))
                    return BadRequest(LanguageHelper.ErrorResponse<ApiResponse<object>>("BadRequest", language, 400));

                category.Icon = await _imgBbStorage.UploadFileAsync(dto.Icon);
            }

            _context.Categories.Add(category);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetAllCategories), LanguageHelper.SuccessResponse(new CategoryDto { Id = category.Id, NameAr = category.NameAr, NameEn = category.NameEn, Icon = _imgBbStorage.GetFullUrl(category.Icon) ?? string.Empty, StageId = category.StageId, Order = category.Order }, "CategoryCreated", language, 201));
        }

        /// <summary>
        /// Updates an existing category.
        /// </summary>
        [HttpPut("categories/{id}")]
        [Consumes("multipart/form-data")]
        public async Task<IActionResult> UpdateCategory(int id, [FromForm] UpdateCategoryDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            var category = await _context.Categories.FindAsync(id);
            if (category == null) return NotFound(LanguageHelper.ErrorResponse<ApiResponse<object>>("CategoryNotFound", language, 404));

            if (!string.IsNullOrWhiteSpace(dto.NameAr)) category.NameAr = dto.NameAr;
            if (!string.IsNullOrWhiteSpace(dto.NameEn)) category.NameEn = dto.NameEn;
            if (dto.Order.HasValue) category.Order = dto.Order.Value;
            if (dto.StageId.HasValue) category.StageId = dto.StageId.Value;

            if (dto.Icon != null && dto.Icon.Length > 0)
            {
                if (!UploadHelper.IsValidImageExtension(dto.Icon.FileName, out _))
                    return BadRequest(LanguageHelper.ErrorResponse<ApiResponse<object>>("BadRequest", language, 400));

                category.Icon = await _imgBbStorage.UploadFileAsync(dto.Icon);
            }

            await _context.SaveChangesAsync();
            return Ok(LanguageHelper.SuccessResponse(new CategoryDto { Id = category.Id, NameAr = category.NameAr, NameEn = category.NameEn, Icon = _imgBbStorage.GetFullUrl(category.Icon) ?? string.Empty, StageId = category.StageId, Order = category.Order }, "CategoryUpdated", language));
        }

        /// <summary>
        /// Deletes a category by ID.
        /// </summary>
        [HttpDelete("categories/{id}")]
        public async Task<IActionResult> DeleteCategory(int id)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            var category = await _context.Categories.FindAsync(id);
            if (category == null) return NotFound(LanguageHelper.ErrorResponse<ApiResponse<object>>("CategoryNotFound", language, 404));
            if (await _context.Problems.AnyAsync(x => x.CategoryId == id))
                return BadRequest(LanguageHelper.ErrorResponse<ApiResponse<object>>("CategoryHasProblems", language));

            _context.Categories.Remove(category);
            await _context.SaveChangesAsync();
            return Ok(LanguageHelper.SuccessResponse<object>(null, "CategoryDeleted", language));
        }

        /// <summary>
        /// Gets paginated list of users.
        /// </summary>
        [HttpGet("users")]
        public async Task<IActionResult> GetUsers([FromQuery] int page = 1, [FromQuery] int pageSize = 20)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            var users = await _context.Users.OrderByDescending(x => x.CreatedAt).Skip((page - 1) * pageSize).Take(pageSize)
                .Select(u => new UserListDto { Id = u.Id, FullName = u.FullName, Email = u.Email, Role = u.Role, SubscriptionType = u.SubscriptionType, IsActive = u.IsActive, CreatedAt = u.CreatedAt, SolvedProblemsCount = _context.UserProgresses.Count(p => p.UserId == u.Id && p.IsSolved) }).ToListAsync();

            var total = await _context.Users.CountAsync();
            var meta = new MetaData { Total = total, Page = page, PageSize = pageSize, TotalPages = (int)Math.Ceiling(total / (double)pageSize) };

            return Ok(LanguageHelper.SuccessResponse(new PagedUserListDto { Users = users, Total = total, Page = page, PageSize = pageSize, TotalPages = meta.TotalPages ?? 0 }, "Success", language, meta: meta));
        }

        /// <summary>
        /// Gets dashboard statistics.
        /// </summary>
        [HttpGet("stats")]
        public async Task<IActionResult> Stats()
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            var stats = new DashboardStatsDto { TotalProblems = await _context.Problems.CountAsync(), TotalUsers = await _context.Users.CountAsync(), TotalSolved = await _context.UserProgresses.CountAsync(x => x.IsSolved), TotalViews = await _context.Problems.SumAsync(x => (long)x.ViewsCount) };
            return Ok(LanguageHelper.SuccessResponse(stats, "Success", language));
        }

        /// <summary>
        /// Gets all educational stages ordered by order.
        /// </summary>
        [HttpGet("stages")]
        public async Task<IActionResult> GetAllStages()
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            var stages = await _context.EducationalStages
                .OrderBy(s => s.Order)
                .Select(s => new StageDto { Id = s.Id, NameAr = s.NameAr, NameEn = s.NameEn, Order = s.Order })
                .ToListAsync();

            return Ok(LanguageHelper.SuccessResponse(stages, "Success", language));
        }

        /// <summary>
        /// Creates a new educational stage.
        /// </summary>
        [HttpPost("stages")]
        public async Task<IActionResult> CreateStage([FromBody] StageDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            var stage = new EducationalStage { NameAr = dto.NameAr, NameEn = dto.NameEn, Order = dto.Order };

            _context.EducationalStages.Add(stage);
            await _context.SaveChangesAsync();

            return Ok(LanguageHelper.SuccessResponse(new { stage.Id }, "StageCreated", language));
        }

        /// <summary>
        /// Updates an existing stage.
        /// </summary>
        [HttpPut("stages/{id}")]
        public async Task<IActionResult> UpdateStage(int id, [FromBody] StageDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            var stage = await _context.EducationalStages.FindAsync(id);
            if (stage == null) return NotFound(LanguageHelper.ErrorResponse<object>("StageNotFound", language, 404));

            stage.NameAr = dto.NameAr;
            stage.NameEn = dto.NameEn;
            stage.Order = dto.Order;

            await _context.SaveChangesAsync();
            return Ok(LanguageHelper.SuccessResponse<object>(null, "StageUpdated", language));
        }

        /// <summary>
        /// Deletes a stage by ID.
        /// </summary>
        [HttpDelete("stages/{id}")]
        public async Task<IActionResult> DeleteStage(int id)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            var stage = await _context.EducationalStages.FindAsync(id);
            if (stage == null) return NotFound();

            if (await _context.Problems.AnyAsync(p => p.StageId == id))
                return BadRequest(LanguageHelper.ErrorResponse<object>("StageHasProblems", language));

            _context.EducationalStages.Remove(stage);
            await _context.SaveChangesAsync();
            return Ok(LanguageHelper.SuccessResponse<object>(null, "StageDeleted", language));
        }


        // في AdminController، أضف endpoint مؤقت:
        [HttpPost("fix-titles")]
        public async Task<IActionResult> FixTitles()
        {
            var problems = await _context.Problems.ToListAsync();
            foreach (var p in problems)
            {
                p.TitleAr = MathTextHelper.ExtractTitleFromQuestion(p.QuestionTextAr);
                p.TitleEn = MathTextHelper.ExtractTitleFromQuestion(p.QuestionTextEn);
            }
            await _context.SaveChangesAsync();
            return Ok(new { count = problems.Count });
        }
    }

}