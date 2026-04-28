using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MathWorldAPI.Data;
using MathWorldAPI.DTOs;
using MathWorldAPI.Helpers;

namespace MathWorldAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class CategoriesController : ControllerBase
    {
        private readonly AppDbContext _context;

        public CategoriesController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

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

        [HttpGet("{id}/problems")]
        public async Task<IActionResult> GetProblemsByCategory(int id, [FromQuery] int page = 1, [FromQuery] int pageSize = 20)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var category = await _context.Categories.FindAsync(id);
            if (category == null)
                return NotFound(LanguageHelper.ErrorResponse("CategoryNotFound", language, 404));

            var problems = await _context.Problems
                .Include(p => p.Category)
                .Where(p => p.CategoryId == id)
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
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

            return Ok(new
            {
                CategoryName = language == "en" ? category.NameEn : category.NameAr,
                CategoryIcon = category.Icon,
                Total = await _context.Problems.CountAsync(p => p.CategoryId == id),
                Page = page,
                PageSize = pageSize,
                Problems = problems
            });
        }
    }
}