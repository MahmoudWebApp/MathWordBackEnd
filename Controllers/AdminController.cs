// File: MathWorldAPI/Controllers/AdminController.cs

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
    /// Admin-only controller for system management operations.
    /// All endpoints require Admin role authorization.
    /// </summary>
    [ApiController]
    [Route("api/admin")]
    [Authorize(Roles = "Admin")]
    public class AdminController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly IMeiliSearchService _searchService;
        private readonly IImgBbStorageService _imgBbStorage;

        public AdminController(AppDbContext context, IMeiliSearchService searchService, IImgBbStorageService imgBbStorage)
        {
            _context = context;
            _searchService = searchService;
            _imgBbStorage = imgBbStorage;
        }

        // =========================================
        // Meilisearch Management
        // =========================================

        /// <summary>
        /// Triggers a full reindex of all problems in Meilisearch.
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
        /// Syncs all problems from database to Meilisearch index.
        /// </summary>
        [HttpPost("sync-meilisearch")]
        public async Task<IActionResult> SyncMeiliSearch()
        {
            try
            {
                var problems = await _context.Problems.Include(p => p.Category).Include(p => p.ProblemTags).ThenInclude(pt => pt.Tag).ToListAsync();
                foreach (var problem in problems) await _searchService.UpdateProblemAsync(problem);
                return Ok(LanguageHelper.SuccessResponse(new SyncResultDto { Total = problems.Count }, "Success", LanguageHelper.GetLanguageFromRequest(Request)));
            }
            catch (Exception)
            {
                return StatusCode(500, LanguageHelper.ErrorResponse<ApiResponse<SyncResultDto>>("ServerError", LanguageHelper.GetLanguageFromRequest(Request), 500));
            }
        }

        // =========================================
        // Problems Management
        // =========================================

        /// <summary>
        /// Creates a new math problem with options and optional tags.
        /// </summary>
        [HttpPost("problems")]
        [ProducesResponseType(typeof(ApiResponse<ProblemCreatedDto>), StatusCodes.Status201Created)]
        public async Task<ActionResult<ApiResponse<ProblemCreatedDto>>> CreateProblem([FromBody] CreateProblemDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            if (dto.Options == null || dto.Options.Count != 4)
                return BadRequest(LanguageHelper.ErrorResponse<ApiResponse<ProblemCreatedDto>>("OptionsCountError", language));
            if (dto.Options.Count(x => x.IsCorrect) != 1)
                return BadRequest(LanguageHelper.ErrorResponse<ApiResponse<ProblemCreatedDto>>("CorrectOptionError", language));

            var problem = new MathProblem
            {
                TitleAr = dto.TitleAr,
                TitleEn = dto.TitleEn,
                QuestionTextAr = dto.QuestionTextAr,
                QuestionTextEn = dto.QuestionTextEn,
                LatexCode = dto.LatexCode,
                DetailedSolution = dto.DetailedSolution,
                Difficulty = dto.Difficulty,
                Points = dto.Points,
                CategoryId = dto.CategoryId,
                CreatedAt = DateTime.UtcNow,
                Options = dto.Options.Select(o => new QuestionOption { TextAr = o.TextAr, TextEn = o.TextEn, LatexCode = o.LatexCode, IsCorrect = o.IsCorrect, Order = o.Order }).ToList()
            };

            _context.Problems.Add(problem);
            await _context.SaveChangesAsync();

            if (dto.TagIds != null && dto.TagIds.Any())
            {
                foreach (var tagId in dto.TagIds) _context.ProblemTags.Add(new ProblemTag { ProblemId = problem.Id, TagId = tagId });
                await _context.SaveChangesAsync();
            }

            await _searchService.IndexProblemAsync(problem);
            return CreatedAtAction("GetProblem", "Problems", new { id = problem.Id }, LanguageHelper.SuccessResponse(new ProblemCreatedDto { Id = problem.Id }, "ProblemCreated", language, 201));
        }

        /// <summary>
        /// Updates an existing problem with new data.
        /// </summary>
        [HttpPut("problems/{id}")]
        public async Task<IActionResult> UpdateProblem(int id, [FromBody] CreateProblemDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            var problem = await _context.Problems.Include(p => p.Options).Include(p => p.ProblemTags).FirstOrDefaultAsync(p => p.Id == id);
            if (problem == null) return NotFound(LanguageHelper.ErrorResponse<ApiResponse<object>>("ProblemNotFound", language, 404));

            problem.TitleAr = dto.TitleAr; problem.TitleEn = dto.TitleEn;
            problem.QuestionTextAr = dto.QuestionTextAr; problem.QuestionTextEn = dto.QuestionTextEn;
            problem.LatexCode = dto.LatexCode; problem.DetailedSolution = dto.DetailedSolution;
            problem.Difficulty = dto.Difficulty; problem.Points = dto.Points; problem.CategoryId = dto.CategoryId;

            _context.QuestionOptions.RemoveRange(problem.Options);
            problem.Options = dto.Options.Select(o => new QuestionOption { TextAr = o.TextAr, TextEn = o.TextEn, LatexCode = o.LatexCode, IsCorrect = o.IsCorrect, Order = o.Order }).ToList();

            _context.ProblemTags.RemoveRange(problem.ProblemTags);
            if (dto.TagIds != null && dto.TagIds.Any())
                foreach (var tagId in dto.TagIds) _context.ProblemTags.Add(new ProblemTag { ProblemId = problem.Id, TagId = tagId });

            await _context.SaveChangesAsync();
            await _searchService.UpdateProblemAsync(problem);
            return Ok(LanguageHelper.SuccessResponse<object>(null, "ProblemUpdated", language));
        }

        /// <summary>
        /// Deletes a problem and removes it from Meilisearch index.
        /// </summary>
        [HttpDelete("problems/{id}")]
        public async Task<IActionResult> DeleteProblem(int id)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            var problem = await _context.Problems.FindAsync(id);
            if (problem == null) return NotFound(LanguageHelper.ErrorResponse<ApiResponse<object>>("ProblemNotFound", language, 404));

            _context.Problems.Remove(problem);
            await _context.SaveChangesAsync();
            await _searchService.DeleteProblemAsync(id);
            return Ok(LanguageHelper.SuccessResponse<object>(null, "ProblemDeleted", language));
        }

        // =========================================
        // Categories Management (Using ImgBB)
        // =========================================

        /// <summary>
        /// Retrieves all categories ordered by display order.
        /// </summary>
        [HttpGet("categories")]
        public async Task<IActionResult> GetAllCategories()
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            var categories = await _context.Categories.OrderBy(x => x.Order).Select(c => new CategoryDto { Id = c.Id, NameAr = c.NameAr, NameEn = c.NameEn, Icon = c.Icon ?? string.Empty }).ToListAsync();

            foreach (var cat in categories)
                cat.Icon = _imgBbStorage.GetFullUrl(cat.Icon) ?? string.Empty;

            return Ok(LanguageHelper.SuccessResponse(categories, "Success", language));
        }

        /// <summary>
        /// Creates a new category with optional icon upload via multipart/form-data.
        /// </summary>
        [HttpPost("categories")]
        [Consumes("multipart/form-data")]
        public async Task<IActionResult> CreateCategory([FromForm] CreateCategoryDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            var category = new Category { NameAr = dto.NameAr, NameEn = dto.NameEn, Order = dto.Order };

            if (dto.Icon != null && dto.Icon.Length > 0)
            {
                if (!UploadHelper.IsValidImageExtension(dto.Icon.FileName, out _))
                    return BadRequest(LanguageHelper.ErrorResponse<ApiResponse<object>>("BadRequest", language, 400));

                category.Icon = await _imgBbStorage.UploadFileAsync(dto.Icon);
            }

            _context.Categories.Add(category);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetAllCategories), LanguageHelper.SuccessResponse(new CategoryDto { Id = category.Id, NameAr = category.NameAr, NameEn = category.NameEn, Icon = _imgBbStorage.GetFullUrl(category.Icon) ?? string.Empty }, "CategoryCreated", language, 201));
        }

        /// <summary>
        /// Updates an existing category with optional icon replacement via multipart/form-data.
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

            if (dto.Icon != null && dto.Icon.Length > 0)
            {
                if (!UploadHelper.IsValidImageExtension(dto.Icon.FileName, out _))
                    return BadRequest(LanguageHelper.ErrorResponse<ApiResponse<object>>("BadRequest", language, 400));

                category.Icon = await _imgBbStorage.UploadFileAsync(dto.Icon);
            }

            await _context.SaveChangesAsync();
            return Ok(LanguageHelper.SuccessResponse(new CategoryDto { Id = category.Id, NameAr = category.NameAr, NameEn = category.NameEn, Icon = _imgBbStorage.GetFullUrl(category.Icon) ?? string.Empty }, "CategoryUpdated", language));
        }

        /// <summary>
        /// Deletes a category. Fails if any problems are linked to it.
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

        // =========================================
        // Tags Management
        // =========================================

        /// <summary>
        /// Retrieves all tags with their associated problem counts.
        /// </summary>
        [HttpGet("tags")]
        public async Task<IActionResult> GetAllTags()
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            var data = await _context.SearchTags.Select(t => new TagResponseDto { Id = t.Id, TextAr = t.TextAr, TextEn = t.TextEn, ProblemsCount = t.ProblemTags.Count }).ToListAsync();
            return Ok(LanguageHelper.SuccessResponse(data, "Success", language));
        }

        /// <summary>
        /// Creates a new searchable tag.
        /// </summary>
        [HttpPost("tags")]
        public async Task<IActionResult> CreateTag([FromBody] CreateTagDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            var tag = new SearchTag { TextAr = dto.TextAr, TextEn = dto.TextEn };
            _context.SearchTags.Add(tag);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetAllTags), LanguageHelper.SuccessResponse(new TagCreatedDto { Id = tag.Id }, "TagCreated", language, 201));
        }

        /// <summary>
        /// Deletes a tag and removes all its associations with problems.
        /// </summary>
        [HttpDelete("tags/{id}")]
        public async Task<IActionResult> DeleteTag(int id)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            var tag = await _context.SearchTags.Include(x => x.ProblemTags).FirstOrDefaultAsync(x => x.Id == id);
            if (tag == null) return NotFound(LanguageHelper.ErrorResponse<ApiResponse<object>>("TagNotFound", language, 404));

            _context.ProblemTags.RemoveRange(tag.ProblemTags);
            _context.SearchTags.Remove(tag);
            await _context.SaveChangesAsync();
            return Ok(LanguageHelper.SuccessResponse<object>(null, "TagDeleted", language));
        }

        // =========================================
        // Users Management
        // =========================================

        /// <summary>
        /// Retrieves a paginated list of all registered users with their solved problem counts.
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

        // =========================================
        // Statistics
        // =========================================

        /// <summary>
        /// Retrieves overall dashboard statistics including totals for problems, users, solved counts, and views.
        /// </summary>
        [HttpGet("stats")]
        public async Task<IActionResult> Stats()
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            var stats = new DashboardStatsDto { TotalProblems = await _context.Problems.CountAsync(), TotalUsers = await _context.Users.CountAsync(), TotalSolved = await _context.UserProgresses.CountAsync(x => x.IsSolved), TotalViews = await _context.Problems.SumAsync(x => (long)x.ViewsCount) };
            return Ok(LanguageHelper.SuccessResponse(stats, "Success", language));
        }
    }
}