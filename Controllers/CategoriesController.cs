using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MathWorldAPI.Data;
using MathWorldAPI.DTOs;
using MathWorldAPI.Helpers;
using MathWorldAPI.Models;
using MathWorldAPI.Services;

namespace MathWorldAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class CategoriesController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly IImgBbStorageService _imgBbStorage;

        public CategoriesController(AppDbContext context, IImgBbStorageService imgBbStorage)
        {
            _context = context;
            _imgBbStorage = imgBbStorage;
        }

        [HttpGet]
        [ProducesResponseType(typeof(ApiResponse<List<CategoryDto>>), StatusCodes.Status200OK)]
        public async Task<ActionResult<ApiResponse<List<CategoryDto>>>> GetAll()
        {
            try
            {
                var language = LanguageHelper.GetLanguageFromRequest(Request);

                var categories = await _context.Categories
                    .OrderBy(c => c.StageId)
                    .ThenBy(c => c.Order)
                    .Select(c => new CategoryDto
                    {
                        Id = c.Id,
                        NameAr = c.NameAr,
                        NameEn = c.NameEn,
                        Name = language == "en" ? c.NameEn : c.NameAr,
                        Icon = c.Icon ?? string.Empty,
                        StageId = c.StageId,
                        Order = c.Order
                    })
                    .ToListAsync();

                foreach (var cat in categories)
                    cat.Icon = _imgBbStorage.GetFullUrl(cat.Icon) ?? string.Empty;

                return Ok(LanguageHelper.SuccessResponse(categories, "Success", language));
            }
            catch (Exception)
            {
                return StatusCode(500, LanguageHelper.ErrorResponse < ApiResponse<List<CategoryDto>>>("ServerError", LanguageHelper.GetLanguageFromRequest(Request), 500));
            }
        }

        [HttpGet("{id}/problems")]
        [ProducesResponseType(typeof(ApiResponse<PagedResult<ProblemPreviewDto>>), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ApiResponse<object>), StatusCodes.Status404NotFound)]
        public async Task<ActionResult<ApiResponse<PagedResult<ProblemPreviewDto>>>> GetProblemsByCategory(int id, [FromQuery] int page = 1, [FromQuery] int pageSize = 20)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            var category = await _context.Categories.FindAsync(id);
            if (category == null) return NotFound(LanguageHelper.ErrorResponse < ApiResponse<PagedResult<ProblemPreviewDto>>>("CategoryNotFound", language, 404));

            var query = _context.Problems.Include(p => p.Category).Where(p => p.CategoryId == id);
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
                    CategoryName = language == "en" ? p.Category.NameEn : p.Category.NameAr,
                    ViewsCount = p.ViewsCount,
                    RequiresLogin = true
                }).ToListAsync();

            var meta = new MetaData { Total = total, Page = page, PageSize = pageSize, TotalPages = (int)Math.Ceiling(total / (double)pageSize) };

            var result = new PagedResult<ProblemPreviewDto>
            {
                CategoryName = language == "en" ? category.NameEn : category.NameAr,
                CategoryIcon = _imgBbStorage.GetFullUrl(category.Icon) ?? string.Empty,
                Items = problems
            };

            return Ok(LanguageHelper.SuccessResponse(result, "Success", language, meta: meta));
        }

        [HttpPut("{id}")]
        [Consumes("multipart/form-data")]
        public async Task<ActionResult<ApiResponse<CategoryDto>>> UpdateCategory(int id, [FromForm] UpdateCategoryDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            var category = await _context.Categories.FindAsync(id);
            if (category == null) return NotFound(LanguageHelper.ErrorResponse<ApiResponse<CategoryDto>>("CategoryNotFound", language, 404));

            if (!string.IsNullOrWhiteSpace(dto.NameAr)) category.NameAr = dto.NameAr;
            if (!string.IsNullOrWhiteSpace(dto.NameEn)) category.NameEn = dto.NameEn;
            if (dto.Order.HasValue) category.Order = dto.Order.Value;
            if (dto.StageId.HasValue) category.StageId = dto.StageId.Value;

            if (dto.Icon != null && dto.Icon.Length > 0)
            {
                if (!UploadHelper.IsValidImageExtension(dto.Icon.FileName, out _))
                {
                    var allowedExtensions = new[] { ".jpg", ".jpeg", ".png", ".svg", ".webp" };
                    return BadRequest(LanguageHelper.ErrorResponse<ApiResponse<CategoryDto>>("BadRequest", language, 400, new Dictionary<string, List<string>> { { "Icon", new List<string> { $"Only {string.Join(", ", allowedExtensions)} files are allowed" } } }));
                }

                category.Icon = await _imgBbStorage.UploadFileAsync(dto.Icon);
            }

            await _context.SaveChangesAsync();
            return Ok(LanguageHelper.SuccessResponse(new CategoryDto
            {
                Id = category.Id,
                NameAr = category.NameAr,
                NameEn = category.NameEn,
                Icon = _imgBbStorage.GetFullUrl(category.Icon) ?? string.Empty,
                StageId = category.StageId,
                Order = category.Order
            }, "CategoryUpdated", language));
        }

        [HttpPost]
        [Consumes("multipart/form-data")]
        public async Task<ActionResult<ApiResponse<CategoryDto>>> CreateCategory([FromForm] CreateCategoryDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            var category = new Category
            {
                NameAr = dto.NameAr,
                NameEn = dto.NameEn,
                Order = dto.Order,
                StageId = dto.StageId
            };

            if (dto.Icon != null && dto.Icon.Length > 0)
            {
                if (!UploadHelper.IsValidImageExtension(dto.Icon.FileName, out _))
                    return BadRequest(LanguageHelper.ErrorResponse<ApiResponse<CategoryDto>>("BadRequest", language, 400));

                category.Icon = await _imgBbStorage.UploadFileAsync(dto.Icon);
            }

            _context.Categories.Add(category);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetAll), LanguageHelper.SuccessResponse(new CategoryDto
            {
                Id = category.Id,
                NameAr = category.NameAr,
                NameEn = category.NameEn,
                Icon = _imgBbStorage.GetFullUrl(category.Icon) ?? string.Empty,
                StageId = category.StageId,
                Order = category.Order
            }, "CategoryCreated", language, 201));
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult<ApiResponse<object>>> DeleteCategory(int id)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);
            var category = await _context.Categories.FindAsync(id);
            if (category == null) return NotFound(LanguageHelper.ErrorResponse<ApiResponse<object>>("CategoryNotFound", language, 404));
            if (await _context.Problems.AnyAsync(p => p.CategoryId == id))
                return BadRequest(LanguageHelper.ErrorResponse<ApiResponse<object>>("CategoryHasProblems", language));

            _context.Categories.Remove(category);
            await _context.SaveChangesAsync();
            return Ok(LanguageHelper.SuccessResponse<object>(null, "CategoryDeleted", language));
        }
    }
}