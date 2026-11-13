using System.Text.Json;
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
            var record = await _db.ProblemDiagrams.AsNoTracking()
                .Where(x => x.ProblemId == problemId)
                .Select(x => new { x.SchemaVersion, x.DiagramJson, x.AltTextAr, x.AltTextEn })
                .FirstOrDefaultAsync(cancellationToken);
            if (record == null) return NotFound(new { Message = "DiagramNotFound" });
            if (record.SchemaVersion != 1 || record.DiagramJson.Length > 30000)
                return NotFound(new { Message = "UnsupportedDiagram" });

            try
            {
                using var document = JsonDocument.Parse(record.DiagramJson);
                var root = document.RootElement;
                if (root.ValueKind != JsonValueKind.Object ||
                    !root.TryGetProperty("schemaVersion", out var version) ||
                    version.ValueKind != JsonValueKind.Number || version.GetInt32() != 1 ||
                    !root.TryGetProperty("viewport", out var viewport) ||
                    viewport.ValueKind != JsonValueKind.Object ||
                    !root.TryGetProperty("objects", out var objects) ||
                    objects.ValueKind != JsonValueKind.Array || objects.GetArrayLength() > 100)
                    return NotFound(new { Message = "InvalidDiagram" });

                var scene = new
                {
                    schemaVersion = 1,
                    viewport = viewport.Clone(),
                    objects = objects.Clone(),
                    altTextAr = record.AltTextAr,
                    altTextEn = record.AltTextEn
                };
                return Ok(LanguageHelper.SuccessResponse(scene, "Success",
                    LanguageHelper.GetLanguageFromRequest(Request)));
            }
            catch (JsonException)
            {
                return NotFound(new { Message = "InvalidDiagram" });
            }
            catch (InvalidOperationException)
            {
                return NotFound(new { Message = "InvalidDiagram" });
            }
        }
    }
}
