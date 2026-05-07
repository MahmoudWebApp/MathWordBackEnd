// File: MathWorldAPI/Controllers/CategoriesController.cs

using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MathWorldAPI.Data;
using MathWorldAPI.DTOs;
using MathWorldAPI.Helpers;
using MathWorldAPI.Models;

namespace MathWorldAPI.Controllers
{
    /// <summary>
    /// Controller for managing math problem categories.
    /// Supports CRUD operations and icon file uploads via multipart/form-data.
    /// All responses follow the standardized ApiResponse{T} format.
    /// </summary>
    [ApiController]
    [Route("api/[controller]")]
    public class CategoriesController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _environment;

        public CategoriesController(AppDbContext context, IWebHostEnvironment environment)
        {
            _context = context;
            _environment = environment;
        }

        /// <summary>
        /// Returns the base wwwroot path, handles null WebRootPath on Render/Docker environments
        /// </summary>
        private string GetBaseUploadPath()
        {
            return !string.IsNullOrEmpty(_environment.WebRootPath)
                ? _environment.WebRootPath
                : Path.Combine(_environment.ContentRootPath, "wwwroot");
        }

        /// <summary>
        /// Returns the uploads/categories folder path and creates it if it doesn't exist.
        /// Fixes ArgumentNullException when WebRootPath is null on Render/Docker.
        /// </summary>
        private string GetUploadsFolderPath()
        {
            var basePath = !string.IsNullOrEmpty(_environment.WebRootPath)
                ? _environment.WebRootPath
                : Path.Combine(_environment.ContentRootPath, "wwwroot");

            var folder = Path.Combine(basePath, "uploads", "categories");
            Directory.CreateDirectory(folder);
            return folder;
        }

        /// <summary>
        /// Retrieves all categories ordered by display order
        /// </summary>
        [HttpGet]
        [ProducesResponseType(typeof(ApiResponse<List<CategoryDto>>), StatusCodes.Status200OK)]
        public async Task<ActionResult<ApiResponse<List<CategoryDto>>>> GetAll()
        {
            try
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

                return Ok(LanguageHelper.SuccessResponse(categories, "Success", language));
            }
            catch (Exception)
            {
                return StatusCode(500, LanguageHelper.ErrorResponse<ApiResponse<List<CategoryDto>>>(
                    "ServerError", LanguageHelper.GetLanguageFromRequest(Request), 500));
            }
        }

        /// <summary>
        /// Retrieves problems belonging to a specific category with pagination
        /// </summary>
        [HttpGet("{id}/problems")]
        [ProducesResponseType(typeof(ApiResponse<PagedResult<ProblemPreviewDto>>), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ApiResponse<object>), StatusCodes.Status404NotFound)]
        public async Task<ActionResult<ApiResponse<PagedResult<ProblemPreviewDto>>>> GetProblemsByCategory(
            int id,
            [FromQuery] int page = 1,
            [FromQuery] int pageSize = 20)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var category = await _context.Categories.FindAsync(id);
            if (category == null)
                return NotFound(LanguageHelper.ErrorResponse<ApiResponse<PagedResult<ProblemPreviewDto>>>(
                    "CategoryNotFound", language, 404));

            var query = _context.Problems
                .Include(p => p.Category)
                .Where(p => p.CategoryId == id);

            var total = await query.CountAsync();

            var problems = await query
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

            var meta = new MetaData
            {
                Total = total,
                Page = page,
                PageSize = pageSize,
                TotalPages = (int)Math.Ceiling(total / (double)pageSize)
            };

            var result = new PagedResult<ProblemPreviewDto>
            {
                CategoryName = language == "en" ? category.NameEn : category.NameAr,
                CategoryIcon = category.Icon,
                Items = problems
            };

            return Ok(LanguageHelper.SuccessResponse(result, "Success", language, meta: meta));
        }

        /// <summary>
        /// Updates a category with optional icon file upload (FormData)
        /// </summary>
        [HttpPut("{id}")]
        [ProducesResponseType(typeof(ApiResponse<CategoryDto>), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ApiResponse<object>), StatusCodes.Status400BadRequest)]
        [ProducesResponseType(typeof(ApiResponse<object>), StatusCodes.Status404NotFound)]
        [Consumes("multipart/form-data")]
        public async Task<ActionResult<ApiResponse<CategoryDto>>> UpdateCategory(
            int id,
            [FromForm] UpdateCategoryDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var category = await _context.Categories.FindAsync(id);
            if (category == null)
                return NotFound(LanguageHelper.ErrorResponse<ApiResponse<CategoryDto>>(
                    "CategoryNotFound", language, 404));

            if (!string.IsNullOrWhiteSpace(dto.NameAr)) category.NameAr = dto.NameAr;
            if (!string.IsNullOrWhiteSpace(dto.NameEn)) category.NameEn = dto.NameEn;
            if (dto.Order.HasValue) category.Order = dto.Order.Value;

            // Handle icon file upload if provided
            if (dto.Icon != null && dto.Icon.Length > 0)
            {
                var allowedExtensions = new[] { ".jpg", ".jpeg", ".png", ".svg", ".webp" };
                var fileExtension = Path.GetExtension(dto.Icon.FileName).ToLowerInvariant();

                if (!allowedExtensions.Contains(fileExtension))
                {
                    return BadRequest(LanguageHelper.ErrorResponse<ApiResponse<CategoryDto>>(
                        "BadRequest", language, 400,
                        new Dictionary<string, List<string>>
                        {
                            { "Icon", new List<string> { $"Only {string.Join(", ", allowedExtensions)} files are allowed" } }
                        }));
                }

                // Delete the old icon file if it exists
                if (!string.IsNullOrEmpty(category.Icon))
                {
                    var oldFilePath = Path.Combine(GetBaseUploadPath(), category.Icon.TrimStart('/'));
                    if (System.IO.File.Exists(oldFilePath))
                        System.IO.File.Delete(oldFilePath);
                }

                // Save the new icon file with a unique name
                var uploadsFolder = GetUploadsFolderPath();
                var uniqueFileName = $"{Guid.NewGuid()}{fileExtension}";
                var filePath = Path.Combine(uploadsFolder, uniqueFileName);

                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    await dto.Icon.CopyToAsync(stream);
                }

                category.Icon = $"/uploads/categories/{uniqueFileName}";
            }

            await _context.SaveChangesAsync();

            var result = new CategoryDto
            {
                Id = category.Id,
                NameAr = category.NameAr,
                NameEn = category.NameEn,
                Icon = category.Icon
            };

            return Ok(LanguageHelper.SuccessResponse(result, "CategoryUpdated", language));
        }

        /// <summary>
        /// Creates a new category with optional icon upload
        /// </summary>
        [HttpPost]
        [ProducesResponseType(typeof(ApiResponse<CategoryDto>), StatusCodes.Status201Created)]
        [Consumes("multipart/form-data")]
        public async Task<ActionResult<ApiResponse<CategoryDto>>> CreateCategory(
            [FromForm] CreateCategoryDto dto)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var category = new Category
            {
                NameAr = dto.NameAr,
                NameEn = dto.NameEn,
                Order = dto.Order
            };

            // Handle icon file upload if provided
            if (dto.Icon != null && dto.Icon.Length > 0)
            {
                var allowedExtensions = new[] { ".jpg", ".jpeg", ".png", ".svg", ".webp" };
                var fileExtension = Path.GetExtension(dto.Icon.FileName).ToLowerInvariant();

                if (!allowedExtensions.Contains(fileExtension))
                    return BadRequest(LanguageHelper.ErrorResponse<ApiResponse<CategoryDto>>(
                        "BadRequest", language, 400));

                // Save the icon file with a unique name
                var uploadsFolder = GetUploadsFolderPath();
                var uniqueFileName = $"{Guid.NewGuid()}{fileExtension}";
                var filePath = Path.Combine(uploadsFolder, uniqueFileName);

                using (var stream = new FileStream(filePath, FileMode.Create))
                    await dto.Icon.CopyToAsync(stream);

                category.Icon = $"/uploads/categories/{uniqueFileName}";
            }

            _context.Categories.Add(category);
            await _context.SaveChangesAsync();

            var result = new CategoryDto
            {
                Id = category.Id,
                NameAr = category.NameAr,
                NameEn = category.NameEn,
                Icon = category.Icon
            };

            return CreatedAtAction(nameof(GetAll), new { id = category.Id },
                LanguageHelper.SuccessResponse(result, "CategoryCreated", language, 201));
        }

        /// <summary>
        /// Deletes a category (only if no problems are associated)
        /// </summary>
        [HttpDelete("{id}")]
        [ProducesResponseType(typeof(ApiResponse<object>), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ApiResponse<object>), StatusCodes.Status404NotFound)]
        [ProducesResponseType(typeof(ApiResponse<object>), StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<ApiResponse<object>>> DeleteCategory(int id)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var category = await _context.Categories.FindAsync(id);
            if (category == null)
                return NotFound(LanguageHelper.ErrorResponse<ApiResponse<object>>(
                    "CategoryNotFound", language, 404));

            var hasProblems = await _context.Problems.AnyAsync(p => p.CategoryId == id);
            if (hasProblems)
                return BadRequest(LanguageHelper.ErrorResponse<ApiResponse<object>>(
                    "CategoryHasProblems", language, 400));

            // Delete the icon file if it exists
            if (!string.IsNullOrEmpty(category.Icon))
            {
                var filePath = Path.Combine(GetBaseUploadPath(), category.Icon.TrimStart('/'));
                if (System.IO.File.Exists(filePath))
                    System.IO.File.Delete(filePath);
            }

            _context.Categories.Remove(category);
            await _context.SaveChangesAsync();

            return Ok(LanguageHelper.SuccessResponse<object>(null, "CategoryDeleted", language));
        }
    }
}