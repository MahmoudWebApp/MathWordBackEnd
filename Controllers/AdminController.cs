// File: MathWorldAPI/Controllers/AdminController.cs

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
    /// Admin controller for managing problems, categories, stages,
    /// users, statistics, search indexing, and system maintenance.
    /// Requires Admin role authorization.
    /// </summary>
    [ApiController]
    [Route("api/admin")]
    [Authorize(Roles = "Admin")]
    public class AdminController : ControllerBase
    {
        /// <summary>
        /// Maximum allowed category icon size in bytes.
        /// The current limit is 2 MB.
        /// </summary>
        private const long MaximumIconSize = 2 * 1024 * 1024;

        private readonly AppDbContext _context;
        private readonly IMeiliSearchService _searchService;
        private readonly IImgBbStorageService _imgBbStorage;
        private readonly ILogger<AdminController> _logger;

        /// <summary>
        /// Initializes a new instance of the AdminController.
        /// </summary>
        /// <param name="context">
        /// Application database context.
        /// </param>
        /// <param name="searchService">
        /// Search indexing service.
        /// </param>
        /// <param name="imgBbStorage">
        /// Category image storage service.
        /// </param>
        /// <param name="logger">
        /// Application logger.
        /// </param>
        public AdminController(
            AppDbContext context,
            IMeiliSearchService searchService,
            IImgBbStorageService imgBbStorage,
            ILogger<AdminController> logger)
        {
            _context = context;
            _searchService = searchService;
            _imgBbStorage = imgBbStorage;
            _logger = logger;
        }

        // =====================================================================
        // SEARCH INDEX MANAGEMENT
        // =====================================================================

        /// <summary>
        /// Reindexes all problems in MeiliSearch.
        /// </summary>
        /// <returns>
        /// A successful response when all problems have been reindexed.
        /// </returns>
        [HttpPost("reindex")]
        [ProducesResponseType(
            typeof(ApiResponse<object>),
            StatusCodes.Status200OK)]
        [ProducesResponseType(
            typeof(ApiResponse<object>),
            StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> ReindexAll()
        {
            var language =
                LanguageHelper.GetLanguageFromRequest(Request);

            try
            {
                await _searchService.ReindexAllAsync();

                _logger.LogInformation(
                    "All problems were reindexed successfully.");

                return Ok(
                    LanguageHelper.SuccessResponse<object>(
                        null,
                        "Success",
                        language));
            }
            catch (Exception exception)
            {
                _logger.LogError(
                    exception,
                    "Failed to reindex all problems.");

                return StatusCode(
                    StatusCodes.Status500InternalServerError,
                    LanguageHelper.ErrorResponse<object>(
                        "ServerError",
                        language,
                        StatusCodes.Status500InternalServerError));
            }
        }

        /// <summary>
        /// Synchronizes all PostgreSQL problems with MeiliSearch.
        /// </summary>
        /// <returns>
        /// The total number of synchronized problems.
        /// </returns>
        [HttpPost("sync-meilisearch")]
        [ProducesResponseType(
            typeof(ApiResponse<SyncResultDto>),
            StatusCodes.Status200OK)]
        [ProducesResponseType(
            typeof(ApiResponse<SyncResultDto>),
            StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> SyncMeiliSearch()
        {
            var language =
                LanguageHelper.GetLanguageFromRequest(Request);

            try
            {
                var problems = await _context.Problems
                    .Include(problem => problem.Category)
                    .Include(problem => problem.Stage)
                    .AsNoTracking()
                    .ToListAsync();

                foreach (var problem in problems)
                {
                    await _searchService.UpdateProblemAsync(problem);
                }

                _logger.LogInformation(
                    "Synchronized {ProblemCount} problems with MeiliSearch.",
                    problems.Count);

                return Ok(
                    LanguageHelper.SuccessResponse(
                        new SyncResultDto
                        {
                            Total = problems.Count
                        },
                        "Success",
                        language));
            }
            catch (Exception exception)
            {
                _logger.LogError(
                    exception,
                    "Failed to synchronize problems with MeiliSearch.");

                return StatusCode(
                    StatusCodes.Status500InternalServerError,
                    LanguageHelper.ErrorResponse<SyncResultDto>(
                        "ServerError",
                        language,
                        StatusCodes.Status500InternalServerError));
            }
        }

        // =====================================================================
        // PROBLEM MANAGEMENT
        // =====================================================================

        /// <summary>
        /// Gets all problems with optional search, category filtering,
        /// stage filtering, and pagination.
        /// </summary>
        /// <param name="q">
        /// Optional search text.
        /// </param>
        /// <param name="categoryId">
        /// Optional category ID.
        /// </param>
        /// <param name="stageId">
        /// Optional educational stage ID.
        /// </param>
        /// <param name="page">
        /// Current one-based page number.
        /// </param>
        /// <param name="pageSize">
        /// Number of problems returned per page.
        /// </param>
        /// <returns>
        /// Paginated administrative problem information.
        /// </returns>
        [HttpGet("problems")]
        [ProducesResponseType(
            typeof(ApiResponse<object>),
            StatusCodes.Status200OK)]
        public async Task<IActionResult> GetAllProblems(
            [FromQuery] string? q = null,
            [FromQuery] int? categoryId = null,
            [FromQuery] int? stageId = null,
            [FromQuery] int page = 1,
            [FromQuery] int pageSize = 10)
        {
            var language =
                LanguageHelper.GetLanguageFromRequest(Request);

            page = Math.Max(1, page);
            pageSize = Math.Clamp(pageSize, 1, 100);

            var query = _context.Problems
                .AsNoTracking()
                .Include(problem => problem.Options)
                .Include(problem => problem.Stage)
                .Include(problem => problem.Category)
                .AsQueryable();

            if (!string.IsNullOrWhiteSpace(q))
            {
                var normalizedQuery = q.Trim();

                query = query.Where(problem =>
                    problem.TitleAr.Contains(normalizedQuery) ||
                    problem.TitleEn.Contains(normalizedQuery) ||
                    problem.QuestionTextAr.Contains(normalizedQuery) ||
                    problem.QuestionTextEn.Contains(normalizedQuery));
            }

            if (categoryId.HasValue)
            {
                query = query.Where(problem =>
                    problem.CategoryId == categoryId.Value);
            }

            if (stageId.HasValue)
            {
                query = query.Where(problem =>
                    problem.StageId == stageId.Value);
            }

            var total =
                await query.CountAsync();

            var totalPages =
                (int)Math.Ceiling(total / (double)pageSize);

            var problems = await query
                .OrderByDescending(problem => problem.Id)
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .Select(problem => new
                {
                    problem.Id,
                    problem.TitleAr,
                    problem.TitleEn,
                    problem.QuestionTextAr,
                    problem.QuestionTextEn,
                    problem.DetailedSolutionAr,
                    problem.DetailedSolutionEn,
                    problem.StageId,

                    StageName = language == "en"
                        ? problem.Stage.NameEn
                        : problem.Stage.NameAr,

                    problem.Points,
                    problem.CategoryId,

                    CategoryName = language == "en"
                        ? problem.Category.NameEn
                        : problem.Category.NameAr,

                    CategoryIcon =
                        problem.Category.Icon ?? string.Empty,

                    problem.ViewsCount,
                    problem.SolvedCount,
                    problem.CreatedAt,
                    problem.YoutubeSolutionUrl,

                    Options = problem.Options
                        .OrderBy(option => option.Order)
                        .Select(option => new AdminOptionDto
                        {
                            Id = option.Id,
                            LatexCode = option.LatexCode,
                            IsCorrect = option.IsCorrect,
                            Order = option.Order
                        })
                        .ToList()
                })
                .ToListAsync();

            var responseData = new
            {
                Results = problems,
                Total = total,
                Page = page,
                PageSize = pageSize,
                TotalPages = totalPages
            };

            var metadata =
                new MetaData
                {
                    Total = total,
                    Page = page,
                    PageSize = pageSize,
                    TotalPages = totalPages,
                    Query = q
                };

            _logger.LogInformation(
                "Administrator requested problem page {Page}. Returned {Count} of {Total} problems.",
                page,
                problems.Count,
                total);

            return Ok(
                LanguageHelper.SuccessResponse(
                    responseData,
                    problems.Count == 0
                        ? "NoResultsFound"
                        : "Success",
                    language,
                    meta: metadata));
        }

        /// <summary>
        /// Creates a new math problem.
        /// The Arabic and English titles are automatically extracted
        /// from the corresponding question text.
        /// </summary>
        /// <param name="dto">
        /// Problem creation data.
        /// </param>
        /// <returns>
        /// The ID of the newly created problem.
        /// </returns>
        [HttpPost("problems")]
        [ProducesResponseType(
            typeof(ApiResponse<ProblemCreatedDto>),
            StatusCodes.Status201Created)]
        [ProducesResponseType(
            typeof(ApiResponse<ProblemCreatedDto>),
            StatusCodes.Status400BadRequest)]
        public async Task<
            ActionResult<ApiResponse<ProblemCreatedDto>>> CreateProblem(
            [FromBody] CreateProblemDto dto)
        {
            var language =
                LanguageHelper.GetLanguageFromRequest(Request);

            var validationMessage =
                ValidateProblemOptions(dto);

            if (validationMessage != null)
            {
                return BadRequest(
                    LanguageHelper.ErrorResponse<ProblemCreatedDto>(
                        validationMessage,
                        language,
                        StatusCodes.Status400BadRequest));
            }

            var stageExists =
                await _context.EducationalStages
                    .AnyAsync(stage =>
                        stage.Id == dto.StageId);

            if (!stageExists)
            {
                return BadRequest(
                    LanguageHelper.ErrorResponse<ProblemCreatedDto>(
                        "StageNotFound",
                        language,
                        StatusCodes.Status400BadRequest));
            }

            var category = await _context.Categories
                .AsNoTracking()
                .FirstOrDefaultAsync(item =>
                    item.Id == dto.CategoryId);

            if (category == null)
            {
                return BadRequest(
                    LanguageHelper.ErrorResponse<ProblemCreatedDto>(
                        "CategoryNotFound",
                        language,
                        StatusCodes.Status400BadRequest));
            }

            if (category.StageId != dto.StageId)
            {
                return BadRequest(
                    LanguageHelper.ErrorResponse<ProblemCreatedDto>(
                        "BadRequest",
                        language,
                        StatusCodes.Status400BadRequest,
                        new Dictionary<string, List<string>>
                        {
                            {
                                "StageId",
                                new List<string>
                                {
                                    "The selected category does not belong to the selected stage."
                                }
                            }
                        }));
            }

            var problem =
                new MathProblem
                {
                    TitleAr =
                        MathTextHelper.ExtractTitleFromQuestion(
                            dto.QuestionTextAr),

                    TitleEn =
                        MathTextHelper.ExtractTitleFromQuestion(
                            dto.QuestionTextEn),

                    QuestionTextAr =
                        dto.QuestionTextAr.Trim(),

                    QuestionTextEn =
                        dto.QuestionTextEn.Trim(),

                    DetailedSolutionAr =
                        dto.DetailedSolutionAr.Trim(),

                    DetailedSolutionEn =
                        dto.DetailedSolutionEn.Trim(),

                    YoutubeSolutionUrl =
                        NormalizeOptionalText(
                            dto.YoutubeSolutionUrl),

                    StageId =
                        dto.StageId,

                    Points =
                        dto.Points,

                    CategoryId =
                        dto.CategoryId,

                    CreatedAt =
                        DateTime.UtcNow,

                    Options = dto.Options
                        .OrderBy(option => option.Order)
                        .Select(option =>
                            new QuestionOption
                            {
                                LatexCode =
                                    option.LatexCode.Trim(),

                                IsCorrect =
                                    option.IsCorrect,

                                Order =
                                    option.Order
                            })
                        .ToList()
                };

            _context.Problems.Add(problem);

            await _context.SaveChangesAsync();

            try
            {
                await _searchService.IndexProblemAsync(problem);

                _logger.LogInformation(
                    "Problem {ProblemId} was indexed in MeiliSearch.",
                    problem.Id);
            }
            catch (Exception exception)
            {
                // Search indexing is non-critical.
                // The problem remains successfully stored in PostgreSQL.
                _logger.LogWarning(
                    exception,
                    "Problem {ProblemId} was created but could not be indexed.",
                    problem.Id);
            }

            _logger.LogInformation(
                "Problem {ProblemId} was created successfully.",
                problem.Id);

            return CreatedAtAction(
                "GetProblem",
                "Problems",
                new
                {
                    id = problem.Id
                },
                LanguageHelper.SuccessResponse(
                    new ProblemCreatedDto
                    {
                        Id = problem.Id
                    },
                    "ProblemCreated",
                    language,
                    StatusCodes.Status201Created));
        }

        /// <summary>
        /// Updates an existing math problem and replaces its answer options.
        /// </summary>
        /// <param name="id">
        /// Problem ID.
        /// </param>
        /// <param name="dto">
        /// Updated problem data.
        /// </param>
        /// <returns>
        /// A successful response when the problem is updated.
        /// </returns>
        [HttpPut("problems/{id:int}")]
        [ProducesResponseType(
            typeof(ApiResponse<object>),
            StatusCodes.Status200OK)]
        [ProducesResponseType(
            typeof(ApiResponse<object>),
            StatusCodes.Status400BadRequest)]
        [ProducesResponseType(
            typeof(ApiResponse<object>),
            StatusCodes.Status404NotFound)]
        public async Task<IActionResult> UpdateProblem(
            int id,
            [FromBody] CreateProblemDto dto)
        {
            var language =
                LanguageHelper.GetLanguageFromRequest(Request);

            var validationMessage =
                ValidateProblemOptions(dto);

            if (validationMessage != null)
            {
                return BadRequest(
                    LanguageHelper.ErrorResponse<object>(
                        validationMessage,
                        language,
                        StatusCodes.Status400BadRequest));
            }

            var problem = await _context.Problems
                .Include(item => item.Options)
                .FirstOrDefaultAsync(item =>
                    item.Id == id);

            if (problem == null)
            {
                return NotFound(
                    LanguageHelper.ErrorResponse<object>(
                        "ProblemNotFound",
                        language,
                        StatusCodes.Status404NotFound));
            }

            var stageExists =
                await _context.EducationalStages
                    .AnyAsync(stage =>
                        stage.Id == dto.StageId);

            if (!stageExists)
            {
                return BadRequest(
                    LanguageHelper.ErrorResponse<object>(
                        "StageNotFound",
                        language,
                        StatusCodes.Status400BadRequest));
            }

            var category = await _context.Categories
                .AsNoTracking()
                .FirstOrDefaultAsync(item =>
                    item.Id == dto.CategoryId);

            if (category == null)
            {
                return BadRequest(
                    LanguageHelper.ErrorResponse<object>(
                        "CategoryNotFound",
                        language,
                        StatusCodes.Status400BadRequest));
            }

            if (category.StageId != dto.StageId)
            {
                return BadRequest(
                    LanguageHelper.ErrorResponse<object>(
                        "BadRequest",
                        language,
                        StatusCodes.Status400BadRequest,
                        new Dictionary<string, List<string>>
                        {
                            {
                                "StageId",
                                new List<string>
                                {
                                    "The selected category does not belong to the selected stage."
                                }
                            }
                        }));
            }

            problem.TitleAr =
                MathTextHelper.ExtractTitleFromQuestion(
                    dto.QuestionTextAr);

            problem.TitleEn =
                MathTextHelper.ExtractTitleFromQuestion(
                    dto.QuestionTextEn);

            problem.QuestionTextAr =
                dto.QuestionTextAr.Trim();

            problem.QuestionTextEn =
                dto.QuestionTextEn.Trim();

            problem.DetailedSolutionAr =
                dto.DetailedSolutionAr.Trim();

            problem.DetailedSolutionEn =
                dto.DetailedSolutionEn.Trim();

            problem.StageId =
                dto.StageId;

            problem.Points =
                dto.Points;

            problem.CategoryId =
                dto.CategoryId;

            problem.YoutubeSolutionUrl =
                NormalizeOptionalText(
                    dto.YoutubeSolutionUrl);

            // Remove existing answer options before inserting new ones.
            _context.QuestionOptions.RemoveRange(
                problem.Options);

            problem.Options = dto.Options
                .OrderBy(option => option.Order)
                .Select(option =>
                    new QuestionOption
                    {
                        LatexCode =
                            option.LatexCode.Trim(),

                        IsCorrect =
                            option.IsCorrect,

                        Order =
                            option.Order
                    })
                .ToList();

            await _context.SaveChangesAsync();

            try
            {
                await _searchService.UpdateProblemAsync(problem);

                _logger.LogInformation(
                    "Problem {ProblemId} was updated in MeiliSearch.",
                    problem.Id);
            }
            catch (Exception exception)
            {
                // Search indexing is non-critical.
                _logger.LogWarning(
                    exception,
                    "Problem {ProblemId} was updated in PostgreSQL but not in MeiliSearch.",
                    problem.Id);
            }

            _logger.LogInformation(
                "Problem {ProblemId} was updated successfully.",
                problem.Id);

            return Ok(
                LanguageHelper.SuccessResponse<object>(
                    null,
                    "ProblemUpdated",
                    language));
        }

        /// <summary>
        /// Deletes a problem by ID.
        /// Related answer options and progress records are deleted
        /// according to configured entity relationships.
        /// </summary>
        /// <param name="id">
        /// Problem ID.
        /// </param>
        /// <returns>
        /// A successful response when the problem is deleted.
        /// </returns>
        [HttpDelete("problems/{id:int}")]
        [ProducesResponseType(
            typeof(ApiResponse<object>),
            StatusCodes.Status200OK)]
        [ProducesResponseType(
            typeof(ApiResponse<object>),
            StatusCodes.Status404NotFound)]
        public async Task<IActionResult> DeleteProblem(
            int id)
        {
            var language =
                LanguageHelper.GetLanguageFromRequest(Request);

            var problem =
                await _context.Problems
                    .FirstOrDefaultAsync(item =>
                        item.Id == id);

            if (problem == null)
            {
                return NotFound(
                    LanguageHelper.ErrorResponse<object>(
                        "ProblemNotFound",
                        language,
                        StatusCodes.Status404NotFound));
            }

            _context.Problems.Remove(problem);

            await _context.SaveChangesAsync();

            try
            {
                await _searchService.DeleteProblemAsync(id);

                _logger.LogInformation(
                    "Problem {ProblemId} was deleted from MeiliSearch.",
                    id);
            }
            catch (Exception exception)
            {
                // Search deletion is non-critical.
                _logger.LogWarning(
                    exception,
                    "Problem {ProblemId} was deleted from PostgreSQL but not from MeiliSearch.",
                    id);
            }

            _logger.LogInformation(
                "Problem {ProblemId} was deleted successfully.",
                id);

            return Ok(
                LanguageHelper.SuccessResponse<object>(
                    null,
                    "ProblemDeleted",
                    language));
        }

        // =====================================================================
        // CATEGORY MANAGEMENT
        // =====================================================================

        /// <summary>
        /// Gets all categories ordered by stage and display order.
        /// </summary>
        /// <returns>
        /// All available categories.
        /// </returns>
        [HttpGet("categories")]
        [ProducesResponseType(
            typeof(ApiResponse<List<CategoryDto>>),
            StatusCodes.Status200OK)]
        public async Task<IActionResult> GetAllCategories()
        {
            var language =
                LanguageHelper.GetLanguageFromRequest(Request);

            var categories = await _context.Categories
                .AsNoTracking()
                .OrderBy(category => category.StageId)
                .ThenBy(category => category.Order)
                .Select(category => new CategoryDto
                {
                    Id = category.Id,
                    NameAr = category.NameAr,
                    NameEn = category.NameEn,

                    Name = language == "en"
                        ? category.NameEn
                        : category.NameAr,

                    Icon =
                        category.Icon ?? string.Empty,

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

        /// <summary>
        /// Creates a new category with an optional uploaded icon.
        /// </summary>
        /// <param name="dto">
        /// Category creation data.
        /// </param>
        /// <returns>
        /// The newly created category.
        /// </returns>
        [HttpPost("categories")]
        [Consumes("multipart/form-data")]
        [ProducesResponseType(
            typeof(ApiResponse<CategoryDto>),
            StatusCodes.Status201Created)]
        [ProducesResponseType(
            typeof(ApiResponse<CategoryDto>),
            StatusCodes.Status400BadRequest)]
        public async Task<IActionResult> CreateCategory(
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
                var iconErrors =
                    ValidateIcon(dto.Icon);

                if (iconErrors != null)
                {
                    return BadRequest(
                        LanguageHelper.ErrorResponse<CategoryDto>(
                            "InvalidImage",
                            language,
                            StatusCodes.Status400BadRequest,
                            iconErrors));
                }

                category.Icon =
                    await _imgBbStorage.UploadFileAsync(
                        dto.Icon);
            }

            _context.Categories.Add(category);

            await _context.SaveChangesAsync();

            _logger.LogInformation(
                "Category {CategoryId} was created by an administrator.",
                category.Id);

            var response =
                MapCategory(
                    category,
                    language);

            return CreatedAtAction(
                nameof(GetAllCategories),
                LanguageHelper.SuccessResponse(
                    response,
                    "CategoryCreated",
                    language,
                    StatusCodes.Status201Created));
        }

        /// <summary>
        /// Updates an existing category.
        /// </summary>
        /// <param name="id">
        /// Category ID.
        /// </param>
        /// <param name="dto">
        /// Category update data.
        /// </param>
        /// <returns>
        /// The updated category.
        /// </returns>
        [HttpPut("categories/{id:int}")]
        [Consumes("multipart/form-data")]
        [ProducesResponseType(
            typeof(ApiResponse<CategoryDto>),
            StatusCodes.Status200OK)]
        [ProducesResponseType(
            typeof(ApiResponse<CategoryDto>),
            StatusCodes.Status404NotFound)]
        public async Task<IActionResult> UpdateCategory(
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
                var iconErrors =
                    ValidateIcon(dto.Icon);

                if (iconErrors != null)
                {
                    return BadRequest(
                        LanguageHelper.ErrorResponse<CategoryDto>(
                            "InvalidImage",
                            language,
                            StatusCodes.Status400BadRequest,
                            iconErrors));
                }

                category.Icon =
                    await _imgBbStorage.UploadFileAsync(
                        dto.Icon);
            }

            await _context.SaveChangesAsync();

            _logger.LogInformation(
                "Category {CategoryId} was updated by an administrator.",
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
        /// Deletes a category when it has no associated problems.
        /// </summary>
        /// <param name="id">
        /// Category ID.
        /// </param>
        /// <returns>
        /// A successful response when the category is deleted.
        /// </returns>
        [HttpDelete("categories/{id:int}")]
        [ProducesResponseType(
            typeof(ApiResponse<object>),
            StatusCodes.Status200OK)]
        [ProducesResponseType(
            typeof(ApiResponse<object>),
            StatusCodes.Status400BadRequest)]
        [ProducesResponseType(
            typeof(ApiResponse<object>),
            StatusCodes.Status404NotFound)]
        public async Task<IActionResult> DeleteCategory(
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
                "Category {CategoryId} was deleted by an administrator.",
                id);

            return Ok(
                LanguageHelper.SuccessResponse<object>(
                    null,
                    "CategoryDeleted",
                    language));
        }

        // =====================================================================
        // USER MANAGEMENT
        // =====================================================================

        /// <summary>
        /// Gets a paginated list of users.
        /// </summary>
        /// <param name="page">
        /// Current one-based page number.
        /// </param>
        /// <param name="pageSize">
        /// Number of users returned per page.
        /// </param>
        /// <returns>
        /// Paginated user data.
        /// </returns>
        [HttpGet("users")]
        [ProducesResponseType(
            typeof(ApiResponse<PagedUserListDto>),
            StatusCodes.Status200OK)]
        public async Task<IActionResult> GetUsers(
            [FromQuery] int page = 1,
            [FromQuery] int pageSize = 20)
        {
            var language =
                LanguageHelper.GetLanguageFromRequest(Request);

            page = Math.Max(1, page);
            pageSize = Math.Clamp(pageSize, 1, 100);

            var total =
                await _context.Users.CountAsync();

            var totalPages =
                (int)Math.Ceiling(
                    total / (double)pageSize);

            var users = await _context.Users
                .AsNoTracking()
                .OrderByDescending(user =>
                    user.CreatedAt)
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .Select(user =>
                    new UserListDto
                    {
                        Id = user.Id,
                        FullName = user.FullName,
                        Email = user.Email,
                        Role = user.Role,

                        SubscriptionType =
                            user.SubscriptionType,

                        IsActive =
                            user.IsActive,

                        CreatedAt =
                            user.CreatedAt,

                        SolvedProblemsCount =
                            _context.UserProgresses.Count(
                                progress =>
                                    progress.UserId == user.Id &&
                                    progress.IsSolved)
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

            var response =
                new PagedUserListDto
                {
                    Users = users,
                    Total = total,
                    Page = page,
                    PageSize = pageSize,
                    TotalPages = totalPages
                };

            return Ok(
                LanguageHelper.SuccessResponse(
                    response,
                    "Success",
                    language,
                    meta: metadata));
        }

        // =====================================================================
        // PLATFORM STATISTICS
        // =====================================================================

        /// <summary>
        /// Gets administrative dashboard statistics.
        /// </summary>
        /// <returns>
        /// Platform problem, user, solved, and view statistics.
        /// </returns>
        [HttpGet("stats")]
        [ProducesResponseType(
            typeof(ApiResponse<DashboardStatsDto>),
            StatusCodes.Status200OK)]
        public async Task<IActionResult> Stats()
        {
            var language =
                LanguageHelper.GetLanguageFromRequest(Request);

            var totalViews =
                await _context.Problems
                    .Select(problem =>
                        (long?)problem.ViewsCount)
                    .SumAsync()
                ?? 0;

            var stats =
                new DashboardStatsDto
                {
                    TotalProblems =
                        await _context.Problems.CountAsync(),

                    TotalUsers =
                        await _context.Users.CountAsync(),

                    TotalSolved =
                        await _context.UserProgresses
                            .CountAsync(progress =>
                                progress.IsSolved),

                    TotalViews =
                        totalViews
                };

            return Ok(
                LanguageHelper.SuccessResponse(
                    stats,
                    "Success",
                    language));
        }

        // =====================================================================
        // EDUCATIONAL STAGE MANAGEMENT
        // =====================================================================

        /// <summary>
        /// Gets all educational stages ordered by display order.
        /// </summary>
        /// <returns>
        /// All educational stages.
        /// </returns>
        [HttpGet("stages")]
        [ProducesResponseType(
            typeof(ApiResponse<List<StageDto>>),
            StatusCodes.Status200OK)]
        public async Task<IActionResult> GetAllStages()
        {
            var language =
                LanguageHelper.GetLanguageFromRequest(Request);

            var stages =
                await _context.EducationalStages
                    .AsNoTracking()
                    .OrderBy(stage =>
                        stage.Order)
                    .Select(stage =>
                        new StageDto
                        {
                            Id = stage.Id,
                            NameAr = stage.NameAr,
                            NameEn = stage.NameEn,
                            Order = stage.Order
                        })
                    .ToListAsync();

            return Ok(
                LanguageHelper.SuccessResponse(
                    stages,
                    "Success",
                    language));
        }

        /// <summary>
        /// Creates a new educational stage.
        /// </summary>
        /// <param name="dto">
        /// Educational stage data.
        /// </param>
        /// <returns>
        /// The ID of the created stage.
        /// </returns>
        [HttpPost("stages")]
        [ProducesResponseType(
            typeof(ApiResponse<object>),
            StatusCodes.Status200OK)]
        public async Task<IActionResult> CreateStage(
            [FromBody] StageDto dto)
        {
            var language =
                LanguageHelper.GetLanguageFromRequest(Request);

            var stage =
                new EducationalStage
                {
                    NameAr =
                        dto.NameAr.Trim(),

                    NameEn =
                        dto.NameEn.Trim(),

                    Order =
                        Math.Max(0, dto.Order)
                };

            _context.EducationalStages.Add(stage);

            await _context.SaveChangesAsync();

            _logger.LogInformation(
                "Educational stage {StageId} was created.",
                stage.Id);

            return Ok(
                LanguageHelper.SuccessResponse(
                    new
                    {
                        stage.Id
                    },
                    "StageCreated",
                    language));
        }

        /// <summary>
        /// Updates an existing educational stage.
        /// </summary>
        /// <param name="id">
        /// Educational stage ID.
        /// </param>
        /// <param name="dto">
        /// Updated educational stage data.
        /// </param>
        /// <returns>
        /// A successful response when the stage is updated.
        /// </returns>
        [HttpPut("stages/{id:int}")]
        [ProducesResponseType(
            typeof(ApiResponse<object>),
            StatusCodes.Status200OK)]
        [ProducesResponseType(
            typeof(ApiResponse<object>),
            StatusCodes.Status404NotFound)]
        public async Task<IActionResult> UpdateStage(
            int id,
            [FromBody] StageDto dto)
        {
            var language =
                LanguageHelper.GetLanguageFromRequest(Request);

            var stage =
                await _context.EducationalStages
                    .FirstOrDefaultAsync(item =>
                        item.Id == id);

            if (stage == null)
            {
                return NotFound(
                    LanguageHelper.ErrorResponse<object>(
                        "StageNotFound",
                        language,
                        StatusCodes.Status404NotFound));
            }

            stage.NameAr =
                dto.NameAr.Trim();

            stage.NameEn =
                dto.NameEn.Trim();

            stage.Order =
                Math.Max(0, dto.Order);

            await _context.SaveChangesAsync();

            _logger.LogInformation(
                "Educational stage {StageId} was updated.",
                stage.Id);

            return Ok(
                LanguageHelper.SuccessResponse<object>(
                    null,
                    "StageUpdated",
                    language));
        }

        /// <summary>
        /// Deletes an educational stage when it has no associated
        /// categories or problems.
        /// </summary>
        /// <param name="id">
        /// Educational stage ID.
        /// </param>
        /// <returns>
        /// A successful response when the stage is deleted.
        /// </returns>
        [HttpDelete("stages/{id:int}")]
        [ProducesResponseType(
            typeof(ApiResponse<object>),
            StatusCodes.Status200OK)]
        [ProducesResponseType(
            typeof(ApiResponse<object>),
            StatusCodes.Status400BadRequest)]
        [ProducesResponseType(
            typeof(ApiResponse<object>),
            StatusCodes.Status404NotFound)]
        public async Task<IActionResult> DeleteStage(
            int id)
        {
            var language =
                LanguageHelper.GetLanguageFromRequest(Request);

            var stage =
                await _context.EducationalStages
                    .FirstOrDefaultAsync(item =>
                        item.Id == id);

            if (stage == null)
            {
                return NotFound(
                    LanguageHelper.ErrorResponse<object>(
                        "StageNotFound",
                        language,
                        StatusCodes.Status404NotFound));
            }

            var hasCategories =
                await _context.Categories
                    .AnyAsync(category =>
                        category.StageId == id);

            var hasProblems =
                await _context.Problems
                    .AnyAsync(problem =>
                        problem.StageId == id);

            if (hasCategories || hasProblems)
            {
                return BadRequest(
                    LanguageHelper.ErrorResponse<object>(
                        "StageHasProblems",
                        language,
                        StatusCodes.Status400BadRequest));
            }

            _context.EducationalStages.Remove(stage);

            await _context.SaveChangesAsync();

            _logger.LogInformation(
                "Educational stage {StageId} was deleted.",
                id);

            return Ok(
                LanguageHelper.SuccessResponse<object>(
                    null,
                    "StageDeleted",
                    language));
        }

        // =====================================================================
        // MAINTENANCE ENDPOINTS
        // =====================================================================

        // في AdminController، أضف endpoint مؤقت:

        /// <summary>
        /// Rebuilds the Arabic and English titles of all existing problems
        /// from their question text.
        /// This endpoint is intended for temporary administrative maintenance.
        /// </summary>
        /// <returns>
        /// The total number of processed problems.
        /// </returns>
        [HttpPost("fix-titles")]
        [ProducesResponseType(
            StatusCodes.Status200OK)]
        public async Task<IActionResult> FixTitles()
        {
            var problems =
                await _context.Problems.ToListAsync();

            foreach (var problem in problems)
            {
                problem.TitleAr =
                    MathTextHelper.ExtractTitleFromQuestion(
                        problem.QuestionTextAr);

                problem.TitleEn =
                    MathTextHelper.ExtractTitleFromQuestion(
                        problem.QuestionTextEn);
            }

            await _context.SaveChangesAsync();

            _logger.LogWarning(
                "The temporary fix-titles endpoint updated {ProblemCount} problems.",
                problems.Count);

            return Ok(
                new
                {
                    count = problems.Count
                });
        }

        // =====================================================================
        // PRIVATE HELPERS
        // =====================================================================

        /// <summary>
        /// Validates the option collection of a problem.
        /// </summary>
        /// <param name="dto">
        /// Problem data containing the answer options.
        /// </param>
        /// <returns>
        /// A localization message key when validation fails;
        /// otherwise null.
        /// </returns>
        private static string? ValidateProblemOptions(
            CreateProblemDto dto)
        {
            if (dto.Options == null ||
                dto.Options.Count != 4)
            {
                return "OptionsCountError";
            }

            if (dto.Options.Count(option =>
                    option.IsCorrect) != 1)
            {
                return "CorrectOptionError";
            }

            if (dto.Options.Any(option =>
                    string.IsNullOrWhiteSpace(
                        option.LatexCode)))
            {
                return "BadRequest";
            }

            var distinctOrders =
                dto.Options
                    .Select(option => option.Order)
                    .Distinct()
                    .Count();

            if (distinctOrders != 4)
            {
                return "BadRequest";
            }

            if (dto.Options.Any(option =>
                    option.Order < 1 ||
                    option.Order > 4))
            {
                return "BadRequest";
            }

            return null;
        }

        /// <summary>
        /// Validates an uploaded category icon.
        /// </summary>
        /// <param name="icon">
        /// Uploaded image file.
        /// </param>
        /// <returns>
        /// Validation errors when the icon is invalid;
        /// otherwise null.
        /// </returns>
        private static Dictionary<string, List<string>>? ValidateIcon(
            IFormFile icon)
        {
            if (icon.Length <= 0)
            {
                return new Dictionary<string, List<string>>
                {
                    {
                        "Icon",
                        new List<string>
                        {
                            "The uploaded image is empty."
                        }
                    }
                };
            }

            if (icon.Length > MaximumIconSize)
            {
                return new Dictionary<string, List<string>>
                {
                    {
                        "Icon",
                        new List<string>
                        {
                            "The image must not exceed 2 MB."
                        }
                    }
                };
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

                return new Dictionary<string, List<string>>
                {
                    {
                        "Icon",
                        new List<string>
                        {
                            $"Only {string.Join(", ", allowedExtensions)} files are allowed."
                        }
                    }
                };
            }

            return null;
        }

        /// <summary>
        /// Maps a category entity to a localized category DTO.
        /// </summary>
        /// <param name="category">
        /// Category entity.
        /// </param>
        /// <param name="language">
        /// Selected response language.
        /// </param>
        /// <returns>
        /// Localized category data.
        /// </returns>
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

        /// <summary>
        /// Trims optional text and converts empty values to null.
        /// </summary>
        /// <param name="value">
        /// Optional input value.
        /// </param>
        /// <returns>
        /// Trimmed text or null.
        /// </returns>
        private static string? NormalizeOptionalText(
            string? value)
        {
            return string.IsNullOrWhiteSpace(value)
                ? null
                : value.Trim();
        }
    }
}