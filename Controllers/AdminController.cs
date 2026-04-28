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

        // =========================================
        // Meilisearch Management
        // =========================================

        [HttpPost("reindex")]
        public async Task<IActionResult> ReindexAll()
        {
            try
            {
                await _searchService.ReindexAllAsync();

                return Ok(new
                {
                    success = true,
                    message = "Reindex completed successfully."
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new
                {
                    success = false,
                    message = "Reindex failed.",
                    error = ex.Message
                });
            }
        }

        [HttpPost("sync-meilisearch")]
        public async Task<IActionResult> SyncMeiliSearch()
        {
            try
            {
                var problems = await _context.Problems
                    .Include(p => p.Category)
                    .Include(p => p.ProblemTags)
                    .ThenInclude(pt => pt.Tag)
                    .ToListAsync();

                if (!problems.Any())
                {
                    return Ok(new
                    {
                        success = true,
                        message = "No problems found."
                    });
                }

                foreach (var problem in problems)
                {
                    await _searchService.UpdateProblemAsync(problem);
                }

                return Ok(new
                {
                    success = true,
                    message = "Sync completed successfully.",
                    total = problems.Count
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new
                {
                    success = false,
                    message = "Sync failed.",
                    error = ex.Message
                });
            }
        }

        // =========================================
        // Problems Management
        // =========================================

        [HttpPost("problems")]
        public async Task<IActionResult> CreateProblem([FromBody] CreateProblemDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            if (dto.Options == null || dto.Options.Count != 4)
                return BadRequest(LanguageHelper.ErrorResponse("OptionsCountError", language));

            if (dto.Options.Count(x => x.IsCorrect) != 1)
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

            if (dto.TagIds != null && dto.TagIds.Any())
            {
                foreach (var tagId in dto.TagIds)
                {
                    _context.ProblemTags.Add(new ProblemTag
                    {
                        ProblemId = problem.Id,
                        TagId = tagId
                    });
                }

                await _context.SaveChangesAsync();
            }

            await _searchService.IndexProblemAsync(problem);

            return Ok(LanguageHelper.SuccessResponse("ProblemCreated", language, new
            {
                Id = problem.Id
            }));
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

            if (dto.TagIds != null && dto.TagIds.Any())
            {
                foreach (var tagId in dto.TagIds)
                {
                    _context.ProblemTags.Add(new ProblemTag
                    {
                        ProblemId = problem.Id,
                        TagId = tagId
                    });
                }
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

        // =========================================
        // Categories
        // =========================================

        [HttpGet("categories")]
        public async Task<IActionResult> GetAllCategories()
        {
            var data = await _context.Categories
                .OrderBy(x => x.Order)
                .Select(c => new CategoryDto
                {
                    Id = c.Id,
                    NameAr = c.NameAr,
                    NameEn = c.NameEn,
                    Icon = c.Icon
                })
                .ToListAsync();

            return Ok(data);
        }

        [HttpPost("categories")]
        public async Task<IActionResult> CreateCategory(CreateCategoryDto dto)
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

            return Ok(LanguageHelper.SuccessResponse("CategoryCreated", language, new
            {
                Id = category.Id
            }));
        }

        [HttpPut("categories/{id}")]
        public async Task<IActionResult> UpdateCategory(int id, UpdateCategoryDto dto)
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

            var hasProblems = await _context.Problems.AnyAsync(x => x.CategoryId == id);

            if (hasProblems)
                return BadRequest(LanguageHelper.ErrorResponse("CategoryHasProblems", language));

            _context.Categories.Remove(category);
            await _context.SaveChangesAsync();

            return Ok(LanguageHelper.SuccessResponse("CategoryDeleted", language));
        }

        // =========================================
        // Tags
        // =========================================

        [HttpGet("tags")]
        public async Task<IActionResult> GetAllTags()
        {
            var data = await _context.SearchTags
                .Select(t => new TagResponseDto
                {
                    Id = t.Id,
                    TextAr = t.TextAr,
                    TextEn = t.TextEn,
                    ProblemsCount = t.ProblemTags.Count
                })
                .ToListAsync();

            return Ok(data);
        }

        [HttpPost("tags")]
        public async Task<IActionResult> CreateTag(CreateTagDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var tag = new SearchTag
            {
                TextAr = dto.TextAr,
                TextEn = dto.TextEn
            };

            _context.SearchTags.Add(tag);
            await _context.SaveChangesAsync();

            return Ok(LanguageHelper.SuccessResponse("TagCreated", language, new
            {
                Id = tag.Id
            }));
        }

        [HttpDelete("tags/{id}")]
        public async Task<IActionResult> DeleteTag(int id)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var tag = await _context.SearchTags
                .Include(x => x.ProblemTags)
                .FirstOrDefaultAsync(x => x.Id == id);

            if (tag == null)
                return NotFound(LanguageHelper.ErrorResponse("TagNotFound", language, 404));

            _context.ProblemTags.RemoveRange(tag.ProblemTags);
            _context.SearchTags.Remove(tag);

            await _context.SaveChangesAsync();

            return Ok(LanguageHelper.SuccessResponse("TagDeleted", language));
        }

        // =========================================
        // Users
        // =========================================

        [HttpGet("users")]
        public async Task<IActionResult> GetUsers(int page = 1, int pageSize = 20)
        {
            var users = await _context.Users
                .OrderByDescending(x => x.CreatedAt)
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
                    CreatedAt = u.CreatedAt,
                    SolvedProblemsCount = _context.UserProgresses.Count(p => p.UserId == u.Id && p.IsSolved)
                })
                .ToListAsync();

            var total = await _context.Users.CountAsync();

            return Ok(new
            {
                Total = total,
                Page = page,
                PageSize = pageSize,
                Users = users
            });
        }

        // =========================================
        // Statistics
        // =========================================

        [HttpGet("stats")]
        public async Task<IActionResult> Stats()
        {
            var totalProblems = await _context.Problems.CountAsync();
            var totalUsers = await _context.Users.CountAsync();
            var totalSolved = await _context.UserProgresses.CountAsync(x => x.IsSolved);
            var totalViews = await _context.Problems.SumAsync(x => x.ViewsCount);

            return Ok(new
            {
                TotalProblems = totalProblems,
                TotalUsers = totalUsers,
                TotalSolved = totalSolved,
                TotalViews = totalViews
            });
        }
    }
}