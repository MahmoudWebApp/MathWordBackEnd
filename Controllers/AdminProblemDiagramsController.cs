using System.ComponentModel.DataAnnotations;
using System.Security.Claims;
using System.Text.Json;
using MathWorldAPI.Data;
using MathWorldAPI.Models;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers
{
    /// <summary>
    /// Admin-only geometry authoring API. Does not alter the problem, its options,
    /// solutions, existing student attempts or stage quotas.
    /// </summary>
    [ApiController]
    [Route("api/admin/problems")]
    [Authorize(Roles = "Admin")]
    public sealed class AdminProblemDiagramsController : ControllerBase
    {
        private readonly AppDbContext _db;
        public AdminProblemDiagramsController(AppDbContext db) => _db = db;

        public sealed class UpsertDiagramRequest
        {
            [Required] public JsonElement Scene { get; set; }
        }

        [HttpPut("{problemId:int}/diagram")]
        public async Task<IActionResult> Upsert(int problemId,
            [FromBody] UpsertDiagramRequest request,
            CancellationToken cancellationToken)
        {
            if (!await ActiveAdmin(cancellationToken)) return Forbid();
            if (problemId <= 0) return BadRequest(new { Message = "InvalidProblemId" });

            if (request.Scene.ValueKind != JsonValueKind.Object ||
                !GeometrySceneValidator.TryParse(request.Scene.GetRawText(), out var scene) ||
                !scene.TryGetProperty("altTextAr", out var ar) ||
                !scene.TryGetProperty("altTextEn", out var en) ||
                ar.ValueKind != JsonValueKind.String ||
                en.ValueKind != JsonValueKind.String ||
                string.IsNullOrWhiteSpace(ar.GetString()) ||
                string.IsNullOrWhiteSpace(en.GetString()) ||
                ar.GetString()!.Length > 500 || en.GetString()!.Length > 500)
                return BadRequest(new { Message = "InvalidGeometryScene" });

            if (!await _db.Problems.AnyAsync(p => p.Id == problemId, cancellationToken))
                return NotFound(new { Message = "ProblemNotFound" });

            // Persist only the declarative primitives. Alt text is stored separately.
            var payload = JsonSerializer.Serialize(new
            {
                schemaVersion = 1,
                viewport = scene.GetProperty("viewport"),
                objects = scene.GetProperty("objects")
            });
            var record = await _db.ProblemDiagrams
                .SingleOrDefaultAsync(d => d.ProblemId == problemId, cancellationToken);
            if (record == null)
            {
                record = new ProblemDiagram { ProblemId = problemId };
                _db.ProblemDiagrams.Add(record);
            }

            record.SchemaVersion = 1;
            record.DiagramJson = payload;
            record.AltTextAr = ar.GetString()!;
            record.AltTextEn = en.GetString()!;
            await _db.SaveChangesAsync(cancellationToken);
            return Ok(new { Message = "DiagramSaved", ProblemId = problemId });
        }

        [HttpDelete("{problemId:int}/diagram")]
        public async Task<IActionResult> Delete(int problemId,
            CancellationToken cancellationToken)
        {
            if (problemId <= 0 || !await ActiveAdmin(cancellationToken))
                return Forbid();

            var record = await _db.ProblemDiagrams
                .SingleOrDefaultAsync(d => d.ProblemId == problemId, cancellationToken);
            if (record == null) return NotFound(new { Message = "DiagramNotFound" });
            _db.ProblemDiagrams.Remove(record);
            await _db.SaveChangesAsync(cancellationToken);
            return NoContent();
        }

        private async Task<bool> ActiveAdmin(CancellationToken cancellationToken)
        {
            var id = int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier),
                out var parsed) ? parsed : 0;
            return id > 0 && await _db.Users.AsNoTracking().AnyAsync(
                u => u.Id == id && u.Role == "Admin" && u.IsActive, cancellationToken);
        }
    }
}
