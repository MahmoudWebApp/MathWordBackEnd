using MathWorldAPI.Services;
using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.Helpers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers
{
    /// <summary>
    /// Optional read-only geometry scene. Never returns executable SVG.
    /// Invalid legacy/unreviewed data is not exposed to clients.
    /// </summary>
    [ApiController]
    [Route("api/problems")]
    public sealed class ProblemDiagramsController : ControllerBase
    {
        private readonly AppDbContext _db;
        public ProblemDiagramsController(AppDbContext db) => _db = db;

        [HttpGet("{problemId:int}/diagram")]
        public async Task<IActionResult> Get(int problemId, CancellationToken cancellationToken)
        {
            if (problemId <= 0) return BadRequest(new { Message = "InvalidProblemId" });
            // Diagrams are part of the protected problem content.
            var problem = await _db.Problems.AsNoTracking()
                .Where(p => p.Id == problemId)
                .Select(p => new { p.StageId, p.CategoryId })
                .FirstOrDefaultAsync(cancellationToken);
            if (problem == null) return NotFound(new { Message = "ProblemNotFound" });

            var role = User.FindFirstValue(ClaimTypes.Role);
            if (!string.Equals(role, "Admin", StringComparison.OrdinalIgnoreCase))
            {
                var userId = int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var parsed)
                    ? parsed : 0;
                var learner = userId > 0 ? await _db.Users.AsNoTracking()
                    .FirstOrDefaultAsync(u => u.Id == userId && u.IsActive && u.Role == "Student",
                        cancellationToken) : null;
                if (userId > 0 && learner == null)
                    return StatusCode(403, new { Message = "CategoryLocked" });
                if (learner == null || !PremiumEntitlement.IsActive(learner))
                {
                    var categories = await _db.Categories.AsNoTracking()
                        .Where(c => c.StageId == problem.StageId)
                        .OrderBy(c => c.Order).ThenBy(c => c.Id)
                        .ToListAsync(cancellationToken);
                    var config = HttpContext.RequestServices.GetRequiredService<IConfiguration>()
                        [$"FreeCategoryAccess:Stages:{problem.StageId}"];
                    List<int>? configured = null;
                    if (!string.IsNullOrWhiteSpace(config))
                    {
                        var parts = config.Split(',', StringSplitOptions.TrimEntries |
                            StringSplitOptions.RemoveEmptyEntries);
                        if (parts.Length != CategoryAccessPolicy.DefaultFreeCategoriesPerStage ||
                            parts.Any(part => !int.TryParse(part, out _)))
                            return StatusCode(403, new { Message = "CategoryLocked" });
                        configured = parts.Select(int.Parse).ToList();
                    }
                    try
                    {
                        var free = CategoryAccessPolicy.ResolveFreeCategoryIds(categories, configured);
                        if (!free.Contains(problem.CategoryId))
                            return StatusCode(403, new { Message = "CategoryLocked" });
                    }
                    catch (ArgumentException)
                    {
                        return StatusCode(403, new { Message = "CategoryLocked" });
                    }
                }
            }

            var record = await _db.ProblemDiagrams.AsNoTracking()
                .Where(x => x.ProblemId == problemId)
                .Select(x => new { x.SchemaVersion, x.DiagramJson, x.AltTextAr, x.AltTextEn })
                .FirstOrDefaultAsync(cancellationToken);
            if (record == null) return NotFound(new { Message = "DiagramNotFound" });
            if (record.SchemaVersion != 1 || record.DiagramJson.Length > 30000)
                return NotFound(new { Message = "UnsupportedDiagram" });

            if (!GeometrySceneValidator.TryParse(record.DiagramJson, out var parsed))
                return NotFound(new { Message = "InvalidDiagram" });

            var scene = new
            {
                schemaVersion = 1,
                viewport = parsed.GetProperty("viewport"),
                objects = parsed.GetProperty("objects"),
                altTextAr = record.AltTextAr,
                altTextEn = record.AltTextEn
            };
            return Ok(LanguageHelper.SuccessResponse(scene, "Success",
                LanguageHelper.GetLanguageFromRequest(Request)));
        }
    }
}
