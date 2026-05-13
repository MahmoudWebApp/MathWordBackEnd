// File: MathWorldAPI/Controllers/StagesController.cs

using MathWorldAPI.Data;
using MathWorldAPI.DTOs;
using MathWorldAPI.Helpers;
using MathWorldAPI.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers
{
    /// <summary>
    /// Public controller for managing and retrieving educational stages.
    /// No Admin authorization required for read operations.
    /// </summary>
    [ApiController]
    [Route("api/[controller]")]
    public class StagesController : ControllerBase
    {
        private readonly AppDbContext _context;

        public StagesController(AppDbContext context) => _context = context;

        /// <summary>
        /// Retrieves all educational stages ordered by display order.
        /// Returns names based on the current request language.
        /// </summary>
        [HttpGet]
        [ProducesResponseType(typeof(ApiResponse<List<StageDto>>), StatusCodes.Status200OK)]
        public async Task<ActionResult<ApiResponse<List<StageDto>>>> GetAllStages()
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            var stages = await _context.EducationalStages
                .OrderBy(s => s.Order)
                .Select(s => new StageDto
                {
                    Id = s.Id,
                    NameAr = s.NameAr,
                    NameEn = s.NameEn,
                    Order = s.Order
                })
                .ToListAsync();

            return Ok(LanguageHelper.SuccessResponse(stages, "Success", language));
        }

        /// <summary>
        /// Retrieves problems belonging to a specific educational stage with pagination.
        /// </summary>
        [HttpGet("{stageId}/problems")]
        [ProducesResponseType(typeof(ApiResponse<PagedResult<ProblemPreviewDto>>), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ApiResponse<object>), StatusCodes.Status404NotFound)]
        public async Task<ActionResult<ApiResponse<PagedResult<ProblemPreviewDto>>>> GetProblemsByStage(
            int stageId,
            [FromQuery] int page = 1,
            [FromQuery] int pageSize = 20)
        {
            var language = LanguageHelper.GetLanguageFromRequest(Request);

            // Check if stage exists
            var stage = await _context.EducationalStages.FindAsync(stageId);
            if (stage == null)
                return NotFound(LanguageHelper.ErrorResponse<ApiResponse<PagedResult<ProblemPreviewDto>>>(
                    "StageNotFound", language, 404));

            // Query problems for this stage
            var query = _context.Problems
                .Include(p => p.Category)
                .Include(p => p.Stage)
                .Where(p => p.StageId == stageId);

            var total = await query.CountAsync();

            var problems = await query
                .OrderByDescending(p => p.CreatedAt) // Or any default sorting
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
                    RequiresLogin = true // Adjust based on your business logic
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
                CategoryName = language == "en" ? stage.NameEn : stage.NameAr,
                Items = problems
            };

            return Ok(LanguageHelper.SuccessResponse(result, "Success", language, meta: meta));
        }
    }
}