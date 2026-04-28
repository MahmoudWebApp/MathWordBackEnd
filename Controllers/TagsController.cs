using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MathWorldAPI.Data;
using MathWorldAPI.DTOs;
using MathWorldAPI.Helpers;

namespace MathWorldAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class TagsController : ControllerBase
    {
        private readonly AppDbContext _context;

        public TagsController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> GetAllTags()
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var tags = await _context.SearchTags
                .Select(t => new
                {
                    t.Id,
                    Text = language == "en" ? t.TextEn : t.TextAr
                })
                .ToListAsync();

            return Ok(tags);
        }

        [HttpGet("{tagId}/problems")]
        public async Task<IActionResult> GetProblemsByTag(int tagId, [FromQuery] int page = 1, [FromQuery] int pageSize = 20)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var tag = await _context.SearchTags.FindAsync(tagId);
            if (tag == null)
                return NotFound(LanguageHelper.ErrorResponse("TagNotFound", language, 404));

            var problemIds = await _context.ProblemTags
                .Where(pt => pt.TagId == tagId)
                .Select(pt => pt.ProblemId)
                .ToListAsync();

            var problems = await _context.Problems
                .Include(p => p.Category)
                .Where(p => problemIds.Contains(p.Id))
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

            var tagName = language == "en" ? tag.TextEn : tag.TextAr;

            return Ok(new
            {
                TagName = tagName,
                Total = problemIds.Count,
                Page = page,
                PageSize = pageSize,
                Problems = problems
            });
        }
    }
}