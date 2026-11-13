using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.DTOs;
using MathWorldAPI.Helpers;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers
{
    [ApiController]
    [Route("api/users")]
    [Authorize(Roles = "Student")]
    public sealed class StageDailyQuotaController : ControllerBase
    {
        private readonly AppDbContext _db;
        public StageDailyQuotaController(AppDbContext db) => _db = db;

        [HttpGet("daily-quota")]
        public async Task<ActionResult<ApiResponse<StageDailyQuotaDto>>> Get(
            [FromQuery] int? stageId, CancellationToken cancellationToken)
        {
            var userId = int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier),
                out var parsedId) ? parsedId : 0;
            if (userId < 1)
                return Unauthorized(Error("Unauthorized", 401));

            var user = await _db.Users.AsNoTracking()
                .FirstOrDefaultAsync(u => u.Id == userId && u.Role == "Student" && u.IsActive,
                    cancellationToken);
            if (user == null)
                return NotFound(Error("UserNotFound", 404));

            var id = stageId ?? user.CurrentStageId;
            if (!id.HasValue)
                return Conflict(Error("LearningStageRequired", 409));

            var stage = await _db.EducationalStages.AsNoTracking()
                .FirstOrDefaultAsync(s => s.Id == id.Value, cancellationToken);
            if (stage == null)
                return NotFound(Error("StageNotFound", 404));

            var date = StageDailyQuota.UtcDayStart(DateTime.UtcNow);
            var used = 0; // Legacy endpoint: quota removed, always unlimited.
            var unlimited = true;
            var result = new StageDailyQuotaDto
            {
                StageId = stage.Id,
                NameAr = stage.NameAr,
                NameEn = stage.NameEn,
                Limit = 0,
                Used = used,
                Remaining = null,
                Unlimited = unlimited,
                SubscriptionType = PremiumEntitlement.EffectiveType(user),
                PremiumExpiresAtUtc = PremiumEntitlement.IsActive(user) ? user.PremiumExpiresAtUtc : null,
                DayUtc = date,
                ResetsAtUtc = date.AddDays(1)
            };
            return Ok(LanguageHelper.SuccessResponse(result, "Success",
                LanguageHelper.GetLanguageFromRequest(Request)));
        }

        private ApiResponse<StageDailyQuotaDto> Error(string key, int status) =>
            LanguageHelper.ErrorResponse<StageDailyQuotaDto>(key,
                LanguageHelper.GetLanguageFromRequest(Request), status);
    }
}
