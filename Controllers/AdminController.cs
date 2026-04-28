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
    [ApiController]
    [Route("api/admin")]
    [Authorize(Roles = "Admin")]
    public class AdminController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly IMeiliSearchService _searchService;

        public AdminController(AppDbContext context, IMeiliSearchService searchService)
        {
            _context = context;
            _searchService = searchService;
        }

        // ========== Meilisearch Management ==========

        [HttpPost("reindex")]
        public async Task<IActionResult> ReindexAll()
        {
            await _searchService.ReindexAllAsync();
            return Ok(new { Message = "Reindexing completed successfully" });
        }

        [HttpPost("sync-meilisearch")]
        public async Task<IActionResult> SyncMeiliSearch()
        {
            try
            {
                var allProblems = await _context.Problems
                    .Include(p => p.Category)
                    .Include(p => p.ProblemTags)
                    .ThenInclude(pt => pt.Tag)
                    .ToListAsync();

                if (allProblems.Count == 0)
                {
                    return Ok(new { message = "No problems found in the database to sync." });
                }

                int successCount = 0;
                foreach (var problem in allProblems)
                {
                    await _searchService.UpdateProblemAsync(problem);
                    successCount++;
                }

                return Ok(new
                {
                    message = "Sync completed successfully",
                    totalSynced = successCount
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = "An error occurred during sync", error = ex.Message });
            }
        }

        // ========== Problems Management ==========

        [HttpPost("problems")]
        public async Task<IActionResult> CreateProblem([FromBody] CreateProblemDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            if (dto.Options.Count != 4)
                return BadRequest(LanguageHelper.ErrorResponse("OptionsCountError", language));

            if (dto.Options.Count(o => o.IsCorrect) != 1)
                return BadRequest(LanguageHelper.ErrorResponse("CorrectOptionError", language));

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
                Options = dto.Options.Select(o => new QuestionOption
                {
                    TextAr = o.TextAr,
                    TextEn = o.TextEn,
                    LatexCode = o.LatexCode,
                    IsCorrect = o.IsCorrect,
                    Order = o.Order
                }).ToList()
            };

            _context.Problems.Add(problem);
            await _context.SaveChangesAsync();

            foreach (var tagId in dto.TagIds)
            {
                _context.ProblemTags.Add(new ProblemTag { ProblemId = problem.Id, TagId = tagId });
            }
            await _context.SaveChangesAsync();
            await _searchService.IndexProblemAsync(problem);

            return Ok(LanguageHelper.SuccessResponse("ProblemCreated", language, new { Id = problem.Id }));
        }

        [HttpPut("problems/{id}")]
        public async Task<IActionResult> UpdateProblem(int id, [FromBody] CreateProblemDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var problem = await _context.Problems
                .Include(p => p.Options)
                .Include(p => p.ProblemTags)
                .FirstOrDefaultAsync(p => p.Id == id);

            if (problem == null)
                return NotFound(LanguageHelper.ErrorResponse("ProblemNotFound", language, 404));

            problem.TitleAr = dto.TitleAr;
            problem.TitleEn = dto.TitleEn;
            problem.QuestionTextAr = dto.QuestionTextAr;
            problem.QuestionTextEn = dto.QuestionTextEn;
            problem.LatexCode = dto.LatexCode;
            problem.DetailedSolution = dto.DetailedSolution;
            problem.Difficulty = dto.Difficulty;
            problem.Points = dto.Points;
            problem.CategoryId = dto.CategoryId;

            _context.QuestionOptions.RemoveRange(problem.Options);
            problem.Options = dto.Options.Select(o => new QuestionOption
            {
                TextAr = o.TextAr,
                TextEn = o.TextEn,
                LatexCode = o.LatexCode,
                IsCorrect = o.IsCorrect,
                Order = o.Order
            }).ToList();

            _context.ProblemTags.RemoveRange(problem.ProblemTags);
            foreach (var tagId in dto.TagIds)
            {
                _context.ProblemTags.Add(new ProblemTag { ProblemId = problem.Id, TagId = tagId });
            }

            await _context.SaveChangesAsync();
            await _searchService.UpdateProblemAsync(problem);

            return Ok(LanguageHelper.SuccessResponse("ProblemUpdated", language));
        }

        [HttpDelete("problems/{id}")]
        public async Task<IActionResult> DeleteProblem(int id)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var problem = await _context.Problems.FindAsync(id);
            if (problem == null)
                return NotFound(LanguageHelper.ErrorResponse("ProblemNotFound", language, 404));

            _context.Problems.Remove(problem);
            await _context.SaveChangesAsync();
            await _searchService.DeleteProblemAsync(id);

            return Ok(LanguageHelper.SuccessResponse("ProblemDeleted", language));
        }

        // ========== Categories Management ==========

        [HttpGet("categories")]
        public async Task<IActionResult> GetAllCategories()
        {
            var categories = await _context.Categories
                .OrderBy(c => c.Order)
                .Select(c => new CategoryDto
                {
                    Id = c.Id,
                    NameAr = c.NameAr,
                    NameEn = c.NameEn,
                    Icon = c.Icon
                })
                .ToListAsync();

            return Ok(categories);
        }

        [HttpGet("categories/{id}")]
        public async Task<IActionResult> GetCategoryById(int id)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var category = await _context.Categories.FindAsync(id);
            if (category == null)
                return NotFound(LanguageHelper.ErrorResponse("CategoryNotFound", language, 404));

            return Ok(category);
        }

        [HttpPost("categories")]
        public async Task<IActionResult> CreateCategory([FromBody] CreateCategoryDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var category = new Category
            {
                NameAr = dto.NameAr,
                NameEn = dto.NameEn,
                Icon = dto.Icon,
                Order = dto.Order
            };

            _context.Categories.Add(category);
            await _context.SaveChangesAsync();

            return Ok(LanguageHelper.SuccessResponse("CategoryCreated", language, new { Id = category.Id }));
        }

        [HttpPut("categories/{id}")]
        public async Task<IActionResult> UpdateCategory(int id, [FromBody] UpdateCategoryDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var category = await _context.Categories.FindAsync(id);
            if (category == null)
                return NotFound(LanguageHelper.ErrorResponse("CategoryNotFound", language, 404));

            category.NameAr = dto.NameAr;
            category.NameEn = dto.NameEn;
            category.Icon = dto.Icon;
            category.Order = dto.Order;

            await _context.SaveChangesAsync();

            return Ok(LanguageHelper.SuccessResponse("CategoryUpdated", language));
        }

        [HttpDelete("categories/{id}")]
        public async Task<IActionResult> DeleteCategory(int id)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var category = await _context.Categories.FindAsync(id);
            if (category == null)
                return NotFound(LanguageHelper.ErrorResponse("CategoryNotFound", language, 404));

            var hasProblems = await _context.Problems.AnyAsync(p => p.CategoryId == id);
            if (hasProblems)
                return BadRequest(LanguageHelper.ErrorResponse("CategoryHasProblems", language));

            _context.Categories.Remove(category);
            await _context.SaveChangesAsync();

            return Ok(LanguageHelper.SuccessResponse("CategoryDeleted", language));
        }

        // ========== Tags Management ==========

        [HttpGet("tags")]
        public async Task<IActionResult> GetAllTagsAdmin()
        {
            var tags = await _context.SearchTags
                .Select(t => new TagResponseDto
                {
                    Id = t.Id,
                    TextAr = t.TextAr,
                    TextEn = t.TextEn,
                    ProblemsCount = t.ProblemTags.Count
                })
                .ToListAsync();

            return Ok(tags);
        }

        [HttpGet("tags/{id}")]
        public async Task<IActionResult> GetTagById(int id)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var tag = await _context.SearchTags
                .Include(t => t.ProblemTags)
                .FirstOrDefaultAsync(t => t.Id == id);

            if (tag == null)
                return NotFound(LanguageHelper.ErrorResponse("TagNotFound", language, 404));

            return Ok(tag);
        }

        [HttpPost("tags")]
        public async Task<IActionResult> CreateTag([FromBody] CreateTagDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var tag = new SearchTag
            {
                TextAr = dto.TextAr,
                TextEn = dto.TextEn
            };

            _context.SearchTags.Add(tag);
            await _context.SaveChangesAsync();

            return Ok(LanguageHelper.SuccessResponse("TagCreated", language, new { Id = tag.Id }));
        }

        [HttpPut("tags/{id}")]
        public async Task<IActionResult> UpdateTag(int id, [FromBody] UpdateTagDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var tag = await _context.SearchTags.FindAsync(id);
            if (tag == null)
                return NotFound(LanguageHelper.ErrorResponse("TagNotFound", language, 404));

            tag.TextAr = dto.TextAr;
            tag.TextEn = dto.TextEn;

            await _context.SaveChangesAsync();

            var affectedProblemIds = await _context.ProblemTags
                .Where(pt => pt.TagId == id)
                .Select(pt => pt.ProblemId)
                .ToListAsync();

            foreach (var problemId in affectedProblemIds)
            {
                var problem = await _context.Problems.FindAsync(problemId);
                if (problem != null) await _searchService.UpdateProblemAsync(problem);
            }

            return Ok(LanguageHelper.SuccessResponse("TagUpdated", language));
        }

        [HttpDelete("tags/{id}")]
        public async Task<IActionResult> DeleteTag(int id)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var tag = await _context.SearchTags
                .Include(t => t.ProblemTags)
                .FirstOrDefaultAsync(t => t.Id == id);

            if (tag == null)
                return NotFound(LanguageHelper.ErrorResponse("TagNotFound", language, 404));

            _context.ProblemTags.RemoveRange(tag.ProblemTags);
            _context.SearchTags.Remove(tag);
            await _context.SaveChangesAsync();

            return Ok(LanguageHelper.SuccessResponse("TagDeleted", language));
        }

        // ========== User Management ==========

        [HttpGet("users")]
        public async Task<IActionResult> GetAllUsers([FromQuery] int page = 1, [FromQuery] int pageSize = 20)
        {
            var users = await _context.Users
                .OrderByDescending(u => u.CreatedAt)
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .Select(u => new UserListDto
                {
                    Id = u.Id,
                    FullName = u.FullName,
                    Email = u.Email,
                    Role = u.Role,
                    SubscriptionType = u.SubscriptionType,
                    IsActive = u.IsActive,
                    SolvedProblemsCount = _context.UserProgresses.Count(up => up.UserId == u.Id && up.IsSolved),
                    CreatedAt = u.CreatedAt
                })
                .ToListAsync();

            var total = await _context.Users.CountAsync();

            return Ok(new { Total = total, Page = page, PageSize = pageSize, Users = users });
        }

        [HttpGet("users/{id}")]
        public async Task<IActionResult> GetUserById(int id)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var user = await _context.Users.FindAsync(id);
            if (user == null)
                return NotFound(LanguageHelper.ErrorResponse("UserNotFound", language, 404));

            var solvedCount = await _context.UserProgresses.CountAsync(up => up.UserId == id && up.IsSolved);

            return Ok(new { user, SolvedProblemsCount = solvedCount });
        }

        [HttpPut("users/{id}")]
        public async Task<IActionResult> UpdateUser(int id, [FromBody] UpdateUserDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var user = await _context.Users.FindAsync(id);
            if (user == null)
                return NotFound(LanguageHelper.ErrorResponse("UserNotFound", language, 404));

            if (!string.IsNullOrEmpty(dto.FullName)) user.FullName = dto.FullName;
            if (!string.IsNullOrEmpty(dto.Role)) user.Role = dto.Role;
            if (!string.IsNullOrEmpty(dto.SubscriptionType)) user.SubscriptionType = dto.SubscriptionType;
            if (dto.IsActive.HasValue) user.IsActive = dto.IsActive.Value;

            await _context.SaveChangesAsync();

            return Ok(LanguageHelper.SuccessResponse("UserUpdated", language));
        }

        [HttpDelete("users/{id}")]
        public async Task<IActionResult> DeleteUser(int id)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var user = await _context.Users.FindAsync(id);
            if (user == null)
                return NotFound(LanguageHelper.ErrorResponse("UserNotFound", language, 404));

            if (user.Email == "admin@mathworld.com")
                return BadRequest(LanguageHelper.ErrorResponse("CannotDeleteAdmin", language));

            _context.Users.Remove(user);
            await _context.SaveChangesAsync();

            return Ok(LanguageHelper.SuccessResponse("UserDeleted", language));
        }

        [HttpPost("users/{id}/activate")]
        public async Task<IActionResult> ActivateUser(int id)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var user = await _context.Users.FindAsync(id);
            if (user == null)
                return NotFound(LanguageHelper.ErrorResponse("UserNotFound", language, 404));

            user.IsActive = true;
            await _context.SaveChangesAsync();

            return Ok(LanguageHelper.SuccessResponse("UserActivated", language));
        }

        [HttpPost("users/{id}/deactivate")]
        public async Task<IActionResult> DeactivateUser(int id)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var user = await _context.Users.FindAsync(id);
            if (user == null)
                return NotFound(LanguageHelper.ErrorResponse("UserNotFound", language, 404));

            if (user.Email == "admin@mathworld.com")
                return BadRequest(LanguageHelper.ErrorResponse("CannotDeleteAdmin", language));

            user.IsActive = false;
            await _context.SaveChangesAsync();

            return Ok(LanguageHelper.SuccessResponse("UserDeactivated", language));
        }

        // ========== Statistics ==========

        [HttpGet("stats")]
        public async Task<IActionResult> GetStatistics()
        {
            var totalProblems = await _context.Problems.CountAsync();
            var totalUsers = await _context.Users.CountAsync();
            var totalSolved = await _context.UserProgresses.CountAsync(up => up.IsSolved);
            var totalViews = await _context.Problems.SumAsync(p => p.ViewsCount);

            var problemsByCategory = await _context.Categories
                .Select(c => new { Category = c.NameAr, Count = c.Problems.Count })
                .ToListAsync();

            var topProblems = await _context.Problems
                .OrderByDescending(p => p.SolvedCount)
                .Take(10)
                .Select(p => new { p.Id, Title = p.TitleAr, p.SolvedCount, p.ViewsCount })
                .ToListAsync();

            return Ok(new
            {
                TotalProblems = totalProblems,
                TotalUsers = totalUsers,
                TotalSolved = totalSolved,
                TotalViews = totalViews,
                ProblemsByCategory = problemsByCategory,
                TopProblems = topProblems
            });
        }
    }
}