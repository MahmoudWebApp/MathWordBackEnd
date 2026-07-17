// File: MathWorldAPI/Controllers/CategoriesController.cs

using MathWorldAPI.Data;
using MathWorldAPI.DTOs;
using MathWorldAPI.Helpers;
using MathWorldAPI.Models;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers
{
    /// <summary>
    /// Public controller for reading categories and category problems.
    /// Category creation, update, and deletion require the Admin role.
    /// </summary>
    [ApiController]
    [Route("api/[controller]")]
    public class CategoriesController : ControllerBase
    {
        private const long MaximumIconSize =
            2 * 1024 * 1024;

        private readonly AppDbContext _context;
        private readonly IImgBbStorageService _imgBbStorage;
        private readonly ILogger<CategoriesController> _logger;

        /// <summary>
        /// Initializes a new instance of the CategoriesController.
        /// </summary>
        public CategoriesController(
            AppDbContext context,
            IImgBbStorageService imgBbStorage,
            ILogger<CategoriesController> logger)
        {
            _context = context;
            _imgBbStorage = imgBbStorage;
            _logger = logger;
        }

        /// <summary>
        /// Gets all categories ordered by stage and display order.
        /// </summary>
        [HttpGet]
        [ProducesResponseType(
            typeof(ApiResponse<List<CategoryDto>>),
            StatusCodes.Status200OK)]
        public async Task<
            ActionResult<ApiResponse<List<CategoryDto>>>> GetAll()
        {
            try
            {
                var language =
                    LanguageHelper.GetLanguageFromRequest(Request);

                var categories =
                    await _context.Categories
                        .AsNoTracking()
                        .OrderBy(category =>
                            category.StageId)
                        .ThenBy(category =>
                            category.Order)
                        .Select(category =>
                            new CategoryDto
                            {
                                Id = category.Id,
                                NameAr = category.NameAr,
                                NameEn = category.NameEn,

                                Name = language == "en"
                                    ? category.NameEn
                                    : category.NameAr,

                                Icon =
                                    category.Icon
                                    ?? string.Empty,

                                StageId =
                                    category.StageId,

                                Order =
                                    category.Order
                            })
                        .ToListAsync();

                foreach (var category in categories)
                {
                    category.Icon =
                        _imgBbStorage.GetFullUrl(
                            category.Icon)
                        ?? string.Empty;
                }

                return Ok(
                    LanguageHelper.SuccessResponse(
                        categories,
                        "Success",
                        language));
            }
            catch (Exception exception)
            {
                _logger.LogError(
                    exception,
                    "Failed to retrieve categories.");

                var language =
                    LanguageHelper.GetLanguageFromRequest(Request);

                return StatusCode(
                    StatusCodes.Status500InternalServerError,
                    LanguageHelper.ErrorResponse<List<CategoryDto>>(
                        "ServerError",
                        language,
                        StatusCodes.Status500InternalServerError));
            }
        }

        /// <summary>
        /// Gets paginated problems belonging to a category.
        /// </summary>
        [HttpGet("{id:int}/problems")]
        [ProducesResponseType(
            typeof(ApiResponse<PagedResult<ProblemPreviewDto>>),
            StatusCodes.Status200OK)]
        [ProducesResponseType(
            typeof(ApiResponse<PagedResult<ProblemPreviewDto>>),
            StatusCodes.Status404NotFound)]
        public async Task<
            ActionResult<ApiResponse<PagedResult<ProblemPreviewDto>>>> GetProblemsByCategory(
            int id,
            [FromQuery] int page = 1,
            [FromQuery] int pageSize = 20)
        {
            page = Math.Max(1, page);
            pageSize = Math.Clamp(pageSize, 1, 100);

            var language =
                LanguageHelper.GetLanguageFromRequest(Request);

            var category =
                await _context.Categories
                    .AsNoTracking()
                    .FirstOrDefaultAsync(item =>
                        item.Id == id);

            if (category == null)
            {
                return NotFound(
                    LanguageHelper.ErrorResponse<
                        PagedResult<ProblemPreviewDto>>(
                        "CategoryNotFound",
                        language,
                        StatusCodes.Status404NotFound));
            }

            var query =
                _context.Problems
                    .AsNoTracking()
                    .Where(problem =>
                        problem.CategoryId == id);

            var total =
                await query.CountAsync();

            var totalPages =
                (int)Math.Ceiling(
                    total / (double)pageSize);

            var problems =
                await query
                    .OrderByDescending(problem =>
                        problem.Id)
                    .Skip((page - 1) * pageSize)
                    .Take(pageSize)
                    .Select(problem =>
                        new ProblemPreviewDto
                        {
                            Id = problem.Id,

                            Title = language == "en"
                                ? problem.TitleEn
                                : problem.TitleAr,

                            StageId =
                                problem.StageId,

                            StageName = language == "en"
                                ? problem.Stage.NameEn
                                : problem.Stage.NameAr,

                            CategoryId =
                                problem.CategoryId,

                            CategoryName = language == "en"
                                ? problem.Category.NameEn
                                : problem.Category.NameAr,

                            Points =
                                problem.Points,

                            ViewsCount =
                                problem.ViewsCount,

                            RequiresLogin = true
                        })
                    .ToListAsync();

            var metadata =
                new MetaData
                {
                    Total = total,
                    Page = page,
                    PageSize = pageSize,
                    TotalPages = totalPages
                };

            var result =
                new PagedResult<ProblemPreviewDto>
                {
                    CategoryName =
                        language == "en"
                            ? category.NameEn
                            : category.NameAr,

                    CategoryIcon =
                        _imgBbStorage.GetFullUrl(
                            category.Icon)
                        ?? string.Empty,

                    Items = problems
                };

            return Ok(
                LanguageHelper.SuccessResponse(
                    result,
                    problems.Count == 0
                        ? "NoResultsFound"
                        : "Success",
                    language,
                    meta: metadata));
        }

        /// <summary>
        /// Updates an existing category.
        /// Requires the Admin role.
        /// </summary>
        [Authorize(Roles = "Admin")]
        [HttpPut("{id:int}")]
        [Consumes("multipart/form-data")]
        [ProducesResponseType(
            typeof(ApiResponse<CategoryDto>),
            StatusCodes.Status200OK)]
        public async Task<
            ActionResult<ApiResponse<CategoryDto>>> UpdateCategory(
            int id,
            [FromForm] UpdateCategoryDto dto)
        {
            var language =
                LanguageHelper.GetLanguageFromRequest(Request);

            var category =
                await _context.Categories
                    .FirstOrDefaultAsync(item =>
                        item.Id == id);

            if (category == null)
            {
                return NotFound(
                    LanguageHelper.ErrorResponse<CategoryDto>(
                        "CategoryNotFound",
                        language,
                        StatusCodes.Status404NotFound));
            }

            if (dto.StageId.HasValue)
            {
                var stageExists =
                    await _context.EducationalStages
                        .AnyAsync(stage =>
                            stage.Id == dto.StageId.Value);

                if (!stageExists)
                {
                    return BadRequest(
                        LanguageHelper.ErrorResponse<CategoryDto>(
                            "StageNotFound",
                            language,
                            StatusCodes.Status400BadRequest));
                }
            }

            if (!string.IsNullOrWhiteSpace(dto.NameAr))
            {
                category.NameAr =
                    dto.NameAr.Trim();
            }

            if (!string.IsNullOrWhiteSpace(dto.NameEn))
            {
                category.NameEn =
                    dto.NameEn.Trim();
            }

            if (dto.Order.HasValue)
            {
                category.Order =
                    Math.Max(0, dto.Order.Value);
            }

            if (dto.StageId.HasValue)
            {
                category.StageId =
                    dto.StageId.Value;
            }

            if (dto.Icon != null &&
                dto.Icon.Length > 0)
            {
                var validationResult =
                    ValidateIcon(
                        dto.Icon,
                        language);

                if (validationResult != null)
                {
                    return validationResult;
                }

                category.Icon =
                    await _imgBbStorage.UploadFileAsync(
                        dto.Icon);
            }

            await _context.SaveChangesAsync();

            _logger.LogInformation(
                "Category {CategoryId} was updated.",
                category.Id);

            var response =
                MapCategory(
                    category,
                    language);

            return Ok(
                LanguageHelper.SuccessResponse(
                    response,
                    "CategoryUpdated",
                    language));
        }

        /// <summary>
        /// Creates a category.
        /// Requires the Admin role.
        /// </summary>
        [Authorize(Roles = "Admin")]
        [HttpPost]
        [Consumes("multipart/form-data")]
        [ProducesResponseType(
            typeof(ApiResponse<CategoryDto>),
            StatusCodes.Status201Created)]
        public async Task<
            ActionResult<ApiResponse<CategoryDto>>> CreateCategory(
            [FromForm] CreateCategoryDto dto)
        {
            var language =
                LanguageHelper.GetLanguageFromRequest(Request);

            var stageExists =
                await _context.EducationalStages
                    .AnyAsync(stage =>
                        stage.Id == dto.StageId);

            if (!stageExists)
            {
                return BadRequest(
                    LanguageHelper.ErrorResponse<CategoryDto>(
                        "StageNotFound",
                        language,
                        StatusCodes.Status400BadRequest));
            }

            var category =
                new Category
                {
                    NameAr =
                        dto.NameAr.Trim(),

                    NameEn =
                        dto.NameEn.Trim(),

                    Order =
                        Math.Max(0, dto.Order),

                    StageId =
                        dto.StageId
                };

            if (dto.Icon != null &&
                dto.Icon.Length > 0)
            {
                var validationResult =
                    ValidateIcon(
                        dto.Icon,
                        language);

                if (validationResult != null)
                {
                    return validationResult;
                }

                category.Icon =
                    await _imgBbStorage.UploadFileAsync(
                        dto.Icon);
            }

            _context.Categories.Add(category);
            await _context.SaveChangesAsync();

            _logger.LogInformation(
                "Category {CategoryId} was created.",
                category.Id);

            var response =
                MapCategory(
                    category,
                    language);

            return StatusCode(
                StatusCodes.Status201Created,
                LanguageHelper.SuccessResponse(
                    response,
                    "CategoryCreated",
                    language,
                    StatusCodes.Status201Created));
        }

        /// <summary>
        /// Deletes a category that has no associated problems.
        /// Requires the Admin role.
        /// </summary>
        [Authorize(Roles = "Admin")]
        [HttpDelete("{id:int}")]
        [ProducesResponseType(
            typeof(ApiResponse<object>),
            StatusCodes.Status200OK)]
        public async Task<
            ActionResult<ApiResponse<object>>> DeleteCategory(
            int id)
        {
            var language =
                LanguageHelper.GetLanguageFromRequest(Request);

            var category =
                await _context.Categories
                    .FirstOrDefaultAsync(item =>
                        item.Id == id);

            if (category == null)
            {
                return NotFound(
                    LanguageHelper.ErrorResponse<object>(
                        "CategoryNotFound",
                        language,
                        StatusCodes.Status404NotFound));
            }

            var hasProblems =
                await _context.Problems
                    .AnyAsync(problem =>
                        problem.CategoryId == id);

            if (hasProblems)
            {
                return BadRequest(
                    LanguageHelper.ErrorResponse<object>(
                        "CategoryHasProblems",
                        language,
                        StatusCodes.Status400BadRequest));
            }

            _context.Categories.Remove(category);
            await _context.SaveChangesAsync();

            _logger.LogInformation(
                "Category {CategoryId} was deleted.",
                id);

            return Ok(
                LanguageHelper.SuccessResponse<object>(
                    null,
                    "CategoryDeleted",
                    language));
        }

        /// <summary>
        /// Validates a category icon before uploading it.
        /// </summary>
        private ActionResult<ApiResponse<CategoryDto>>? ValidateIcon(
            IFormFile icon,
            string language)
        {
            if (icon.Length > MaximumIconSize)
            {
                return BadRequest(
                    LanguageHelper.ErrorResponse<CategoryDto>(
                        "InvalidImage",
                        language,
                        StatusCodes.Status400BadRequest,
                        new Dictionary<string, List<string>>
                        {
                            {
                                "Icon",
                                new List<string>
                                {
                                    "The image must not exceed 2 MB."
                                }
                            }
                        }));
            }

            if (!UploadHelper.IsValidImageExtension(
                    icon.FileName,
                    out _))
            {
                var allowedExtensions =
                    new[]
                    {
                        ".jpg",
                        ".jpeg",
                        ".png",
                        ".svg",
                        ".webp"
                    };

                return BadRequest(
                    LanguageHelper.ErrorResponse<CategoryDto>(
                        "InvalidImage",
                        language,
                        StatusCodes.Status400BadRequest,
                        new Dictionary<string, List<string>>
                        {
                            {
                                "Icon",
                                new List<string>
                                {
                                    $"Only {string.Join(", ", allowedExtensions)} files are allowed."
                                }
                            }
                        }));
            }

            return null;
        }

        /// <summary>
        /// Maps a category entity to a localized DTO.
        /// </summary>
        private CategoryDto MapCategory(
            Category category,
            string language)
        {
            return new CategoryDto
            {
                Id = category.Id,
                NameAr = category.NameAr,
                NameEn = category.NameEn,

                Name = language == "en"
                    ? category.NameEn
                    : category.NameAr,

                Icon =
                    _imgBbStorage.GetFullUrl(
                        category.Icon)
                    ?? string.Empty,

                StageId = category.StageId,
                Order = category.Order
            };
        }
    }
}