using System.Security.Claims;
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
    [ApiController]
    [Route("api/admin/learners")]
    [Authorize(Roles = "Admin")]
    public sealed class AdminSubscriptionsController : ControllerBase
    {
        private readonly AppDbContext _db;
        public AdminSubscriptionsController(AppDbContext db) => _db = db;

        [HttpPut("{learnerId:int}/subscription")]
        public async Task<IActionResult> Update(
            int learnerId, [FromBody] UpdateSubscriptionDto request,
            CancellationToken cancellationToken)
        {
            var adminId = int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier),
                out var parsed) ? parsed : 0;
            if (adminId <= 0 || !await _db.Users.AsNoTracking()
                    .AnyAsync(u => u.Id == adminId && u.Role == "Admin" && u.IsActive,
                        cancellationToken))
                return Forbid();

            var type = request.SubscriptionType?.Trim();
            if ((type != "Free" && type != "Premium") ||
                string.IsNullOrWhiteSpace(request.Reason) ||
                request.Reason.Trim().Length < 3 ||
                request.Reason.Length > 500 ||
                (type == "Free" && request.PremiumExpiresAtUtc.HasValue) ||
                (request.PremiumExpiresAtUtc.HasValue &&
                    (request.PremiumExpiresAtUtc.Value.Kind != DateTimeKind.Utc ||
                     request.PremiumExpiresAtUtc.Value <= DateTime.UtcNow)))
                return BadRequest(new { Message = "InvalidSubscriptionChange" });

            await using var transaction =
                await _db.Database.BeginTransactionAsync(cancellationToken);
            // Serialize concurrent changes to the same learner across API instances.
            await _db.Database.ExecuteSqlInterpolatedAsync(
                $"SELECT pg_advisory_xact_lock({-987654321}, {learnerId})",
                cancellationToken);
            var learner = await _db.Users.FirstOrDefaultAsync(
                u => u.Id == learnerId && u.Role == "Student", cancellationToken);
            if (learner == null)
                return NotFound(new { Message = "UserNotFound" });

            var previousType = learner.SubscriptionType;
            var previousExpiry = learner.PremiumExpiresAtUtc;
            if (previousType != type || previousExpiry != request.PremiumExpiresAtUtc)
            {
                learner.SubscriptionType = type!;
                learner.PremiumExpiresAtUtc = request.PremiumExpiresAtUtc;
                _db.Set<SubscriptionGrant>().Add(new SubscriptionGrant
                {
                    LearnerId = learner.Id,
                    AdminId = adminId,
                    PreviousType = previousType,
                    NewType = type!,
                    PreviousExpiresAtUtc = previousExpiry,
                    NewExpiresAtUtc = request.PremiumExpiresAtUtc,
                    Reason = request.Reason.Trim(),
                    ChangedAtUtc = DateTime.UtcNow
                });
                await _db.SaveChangesAsync(cancellationToken);
            }
            await transaction.CommitAsync(cancellationToken);
            return Ok(LanguageHelper.SuccessResponse(new SubscriptionStatusDto
            {
                LearnerId = learner.Id,
                SubscriptionType = PremiumEntitlement.EffectiveType(learner),
                PremiumExpiresAtUtc = PremiumEntitlement.IsActive(learner)
                    ? learner.PremiumExpiresAtUtc : null,
                Unlimited = PremiumEntitlement.IsActive(learner)
            }, "Success", LanguageHelper.GetLanguageFromRequest(Request)));
        }

        [HttpGet("{learnerId:int}/subscription-history")]
        public async Task<IActionResult> History(int learnerId,
            [FromQuery] int page = 1, [FromQuery] int pageSize = 20,
            CancellationToken cancellationToken = default)
        {
            if (page < 1 || pageSize < 1 || pageSize > 50)
                return BadRequest(new { Message = "InvalidPagination" });
            if (!await _db.Users.AsNoTracking().AnyAsync(
                    u => u.Id == learnerId && u.Role == "Student", cancellationToken))
                return NotFound(new { Message = "UserNotFound" });
            var query = _db.Set<SubscriptionGrant>().AsNoTracking()
                .Where(x => x.LearnerId == learnerId);
            var total = await query.CountAsync(cancellationToken);
            var records = await query.OrderByDescending(x => x.ChangedAtUtc)
                .ThenByDescending(x => x.Id)
                .Skip((page - 1) * pageSize).Take(pageSize)
                .Select(x => new
                {
                    x.Id, x.AdminId, x.PreviousType, x.NewType,
                    x.PreviousExpiresAtUtc, x.NewExpiresAtUtc,
                    x.Reason, x.ChangedAtUtc
                }).ToListAsync(cancellationToken);
            return Ok(LanguageHelper.SuccessResponse(
                new { Total = total, Page = page, PageSize = pageSize, Records = records },
                "Success", LanguageHelper.GetLanguageFromRequest(Request)));
        }
    }
}
