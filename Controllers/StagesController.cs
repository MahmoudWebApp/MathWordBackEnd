// File: Controllers/StagesController.cs

using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MathWorldAPI.Data;
using MathWorldAPI.DTOs;
using MathWorldAPI.Helpers;

namespace MathWorldAPI.Controllers
{
    /// <summary>
    /// Public controller for educational stages.
    /// No authentication required.
    /// </summary>
    [ApiController]
    [Route("api/[controller]")]
    public class StagesController : ControllerBase
    {
        private readonly AppDbContext _context;

        public StagesController(AppDbContext context)
        {
            _context = context;
        }

        /// <summary>
        /// Gets all educational stages ordered by display order.
        /// No authentication required.
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
    }
}