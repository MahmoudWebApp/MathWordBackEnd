// File: MathWorldAPI/Controllers/TagsController.cs

using MathWorldAPI.Data;
using MathWorldAPI.DTOs;
using MathWorldAPI.Helpers;
using MathWorldAPI.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers
{
    /// <summary>
    /// Controller for managing search tags
    /// </summary>
    [ApiController]
    [Route("api/[controller]")]
    public class TagsController : ControllerBase
    {
        private readonly AppDbContext _context;

        public TagsController(AppDbContext context) => _context = context;

        /// <summary>
        /// Retrieves all tags.
        /// Returns 'Text' based on the current request language.
        /// </summary>
        [HttpGet]
        [ProducesResponseType(typeof(ApiResponse<List<TagResponseDto>>), StatusCodes.Status200OK)]
        public async Task<ActionResult<ApiResponse<List<TagResponseDto>>>> GetAllTags()
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var tags = await _context.SearchTags
                .Select(t => new TagResponseDto
                {
                    Id = t.Id,
                    TextAr = t.TextAr,
                    TextEn = t.TextEn,
                    Text = language == "en" ? t.TextEn : t.TextAr, 
                    ProblemsCount = t.ProblemTags.Count
                })
                .ToListAsync();

            return Ok(LanguageHelper.SuccessResponse(tags, "Success", language));
        }

        /// <summary>
        /// Retrieves problems belonging to a specific tag with pagination.
        /// </summary>
        [HttpGet("{tagId}/problems")]
        [ProducesResponseType(typeof(ApiResponse<PagedResult<ProblemPreviewDto>>), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ApiResponse<object>), StatusCodes.Status404NotFound)]
        public async Task<ActionResult<ApiResponse<PagedResult<ProblemPreviewDto>>>> GetProblemsByTag(
            int tagId,
            [FromQuery] int page = 1,
            [FromQuery] int pageSize = 20)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var tag = await _context.SearchTags.FindAsync(tagId);
            if (tag == null)
                return NotFound(LanguageHelper.ErrorResponse<ApiResponse<PagedResult<ProblemPreviewDto>>>(
                    "TagNotFound", language, 404));

            var problemIds = await _context.ProblemTags
                .Where(pt => pt.TagId == tagId)
                .Select(pt => pt.ProblemId)
                .ToListAsync();

            var query = _context.Problems
                .Include(p => p.Category)
                .Where(p => problemIds.Contains(p.Id));

            var total = problemIds.Count;

            var problems = await query
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .Select(p => new ProblemPreviewDto
                {
                    Id = p.Id,
                    Title = language == "en" ? p.TitleEn : p.TitleAr,
                    StageId = p.StageId, // Changed from Difficulty
                    StageName = language == "en" ? p.Stage.NameEn : p.Stage.NameAr, // Changed from Difficulty
                    CategoryName = language == "en" ? p.Category.NameEn : p.Category.NameAr,
                    ViewsCount = p.ViewsCount,
                    RequiresLogin = true
                })
                .ToListAsync();

            var meta = new MetaData
            {
                Total = total,
                Page = page,
                PageSize = pageSize,
                TotalPages = (int)Math.Ceiling(total / (double)pageSize)
            };

            var result = new PagedResult<ProblemPreviewDto>
            {
                CategoryName = language == "en" ? tag.TextEn : tag.TextAr,
                Items = problems
            };

            return Ok(LanguageHelper.SuccessResponse(result, "Success", language, meta: meta));
        }

        [HttpPost]
        [ProducesResponseType(typeof(ApiResponse<TagCreatedDto>), StatusCodes.Status201Created)]
        public async Task<ActionResult<ApiResponse<TagCreatedDto>>> CreateTag([FromBody] CreateTagDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var tag = new SearchTag { TextAr = dto.TextAr, TextEn = dto.TextEn };
            _context.SearchTags.Add(tag);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetAllTags), new { id = tag.Id },
                LanguageHelper.SuccessResponse(new TagCreatedDto { Id = tag.Id }, "TagCreated", language, 201));
        }

        [HttpPut("{id}")]
        [ProducesResponseType(typeof(ApiResponse<object>), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ApiResponse<object>), StatusCodes.Status404NotFound)]
        public async Task<ActionResult<ApiResponse<object>>> UpdateTag(int id, [FromBody] UpdateTagDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var tag = await _context.SearchTags.FindAsync(id);
            if (tag == null)
                return NotFound(LanguageHelper.ErrorResponse<ApiResponse<object>>("TagNotFound", language, 404));

            if (!string.IsNullOrWhiteSpace(dto.TextAr)) tag.TextAr = dto.TextAr;
            if (!string.IsNullOrWhiteSpace(dto.TextEn)) tag.TextEn = dto.TextEn;

            await _context.SaveChangesAsync();
            return Ok(LanguageHelper.SuccessResponse<object>(null, "TagUpdated", language));
        }

        [HttpDelete("{id}")]
        [ProducesResponseType(typeof(ApiResponse<object>), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ApiResponse<object>), StatusCodes.Status404NotFound)]
        public async Task<ActionResult<ApiResponse<object>>> DeleteTag(int id)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var tag = await _context.SearchTags.Include(t => t.ProblemTags).FirstOrDefaultAsync(t => t.Id == id);
            if (tag == null)
                return NotFound(LanguageHelper.ErrorResponse<ApiResponse<object>>("TagNotFound", language, 404));

            _context.ProblemTags.RemoveRange(tag.ProblemTags);
            _context.SearchTags.Remove(tag);
            await _context.SaveChangesAsync();

            return Ok(LanguageHelper.SuccessResponse<object>(null, "TagDeleted", language));
        }
    }
}