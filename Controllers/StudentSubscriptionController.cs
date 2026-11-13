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
    /// <summary>
    /// Student-facing entitlement snapshot for Next.js and Flutter.
    /// Does not disclose administrator history or grant reasons.
    /// </summary>
    [ApiController]
    [Route("api/users/subscription")]
    [Authorize(Roles = "Student")]
    public sealed class StudentSubscriptionController : ControllerBase
    {
        private readonly AppDbContext _db;
        private readonly LaunchFeatureFlags _features;
        public StudentSubscriptionController(AppDbContext db, LaunchFeatureFlags features)
        {
            _db = db;
            _features = features;
        }

        [HttpGet]
        [ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
        public async Task<IActionResult> Get(CancellationToken cancellationToken)
        {
            if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var userId) ||
                userId <= 0)
                return Unauthorized();

            var user = await _db.Users.AsNoTracking().FirstOrDefaultAsync(
                u => u.Id == userId && u.Role == "Student" && u.IsActive,
                cancellationToken);
            if (user == null)
                return NotFound(new { Message = "UserNotFound" });

            var isPremium = PremiumEntitlement.IsActive(user);
            return Ok(LanguageHelper.SuccessResponse(new
            {
                SubscriptionType = isPremium ? "Premium" : "Free",
                IsPremium = isPremium,
                PremiumExpiresAtUtc = isPremium ? user.PremiumExpiresAtUtc : null,
                DailyNewProblemsLimit = isPremium ? (int?)null : StageDailyQuota.FreeLimit,
                CanRevealSolutionBeforeAnswer = isPremium,
                CanExportAnalytics = isPremium,
                AdsEligible = !isPremium && _features.AdsEnabled
            }, "Success", LanguageHelper.GetLanguageFromRequest(Request)));
        }
    }
}
