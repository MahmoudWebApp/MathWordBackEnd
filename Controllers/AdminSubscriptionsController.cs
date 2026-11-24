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
        private readonly NotificationStreamBroker _stream;
        public AdminSubscriptionsController(AppDbContext db, NotificationStreamBroker stream)
        {
            _db = db;
            _stream = stream;
        }

        // One-year admin activation for individual and bulk selection.
        // All-or-nothing: check EVERY selected account after locking all IDs
        // in stable order, then commit all grants, audit rows and notices.
        [HttpPost("premium-annual")]
        public async Task<IActionResult> GrantAnnualPremium(
            [FromBody] AnnualPremiumGrantDto? request,
            CancellationToken cancellationToken)
        {
            var adminId = int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier),
                out var parsed) ? parsed : 0;
            if (adminId <= 0 || !await _db.Users.AsNoTracking().AnyAsync(
                    u => u.Id == adminId && u.Role == "Admin" && u.IsActive,
                    cancellationToken))
                return Forbid();

            var requested = request?.LearnerIds;
            if (requested == null || requested.Count == 0 || requested.Count > 100 ||
                requested.Any(id => id <= 0))
                return BadRequest(new { Message = "InvalidLearnerSelection" });

            var ids = requested.Distinct().OrderBy(id => id).ToArray();
            if (ids.Length != requested.Count)
                return BadRequest(new { Message = "DuplicateLearnerSelection" });

            await using var transaction = await _db.Database
                .BeginTransactionAsync(cancellationToken);

            // Use the same per-learner advisory key as manual grants and
            // redemption. Sorting prevents deadlocks across concurrent batches.
            foreach (var id in ids)
                await _db.Database.SqlQuery<int>(
                    $"SELECT 1 AS \"Value\" FROM pg_advisory_xact_lock({-987654321}, {id})")
                    .SingleAsync(cancellationToken);

            var learners = await _db.Users
                .Where(user => ids.Contains(user.Id) &&
                    user.Role == "Student" && user.IsActive)
                .ToListAsync(cancellationToken);
            if (learners.Count != ids.Length)
                return BadRequest(new { Message = "LearnerNotFoundOrInactive" });

            var now = DateTime.UtcNow;
            // Match PostgreSQL's timestamp precision in the response and audit.
            now = new DateTime(now.Ticks - now.Ticks % 10, DateTimeKind.Utc);
            var updatedIds = new List<int>();
            var periods = new List<object>();
            var skippedIndefiniteIds = new List<int>();
            foreach (var learner in learners.OrderBy(u => u.Id))
            {
                var isActive = PremiumEntitlement.IsActive(learner);
                if (isActive && learner.PremiumExpiresAtUtc == null)
                {
                    // Preserve pre-existing indefinite access; never shorten it.
                    skippedIndefiniteIds.Add(learner.Id);
                    continue;
                }

                var previousType = learner.SubscriptionType;
                var previousExpiry = learner.PremiumExpiresAtUtc;
                // Renewals ADD a year to remaining time rather than shortening
                // a paid/granted unexpired term. New grants start from today.
                var baseDate = isActive && previousExpiry > now
                    ? previousExpiry.Value : now;
                var expiry = baseDate.AddYears(1);
                learner.SubscriptionType = "Premium";
                learner.PremiumExpiresAtUtc = expiry;
                _db.Set<SubscriptionGrant>().Add(new SubscriptionGrant
                {
                    LearnerId = learner.Id,
                    AdminId = adminId,
                    PreviousType = previousType,
                    NewType = "Premium",
                    PreviousExpiresAtUtc = previousExpiry,
                    NewExpiresAtUtc = expiry,
                    Reason = isActive ? "AdminAnnualPremiumRenewal" : "AdminAnnualPremiumActivation",
                    ChangedAtUtc = now
                });
                _db.UserNotifications.Add(new UserNotification
                {
                    UserId = learner.Id,
                    Type = "subscription",
                    TitleAr = isActive ? "تم تجديد اشتراك Premium" : "تم تفعيل اشتراك Premium",
                    TitleEn = isActive ? "Premium renewed" : "Premium activated",
                    BodyAr = "تم منح حسابك سنة إضافية من مزايا Premium.",
                    BodyEn = "One year of Premium access was granted to your account.",
                    TargetPath = "/dashboard",
                    CreatedAtUtc = now
                });
                updatedIds.Add(learner.Id);
                // The client displays authoritative dates, not an estimated browser clock.
                periods.Add(new { LearnerId = learner.Id, StartAtUtc = baseDate, EndAtUtc = expiry });
            }

            await _db.SaveChangesAsync(cancellationToken);
            await transaction.CommitAsync(cancellationToken);
            foreach (var id in updatedIds)
                _stream.Notify(id);

            return Ok(LanguageHelper.SuccessResponse(new
            {
                Updated = updatedIds.Count,
                UpdatedIds = updatedIds,
                SkippedIndefiniteIds = skippedIndefiniteIds,
                DurationMonths = 12,
                Periods = periods
            }, "Success", LanguageHelper.GetLanguageFromRequest(Request)));
        }

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
            var reason = request.Reason?.Trim();
            if ((type != "Free" && type != "Premium") ||
                string.IsNullOrWhiteSpace(reason) ||
                reason.Length < 3 ||
                reason.Length > 500 ||
                (type == "Free" && request.PremiumExpiresAtUtc.HasValue) ||
                (request.PremiumExpiresAtUtc.HasValue &&
                    (request.PremiumExpiresAtUtc.Value.Kind != DateTimeKind.Utc ||
                     request.PremiumExpiresAtUtc.Value <= DateTime.UtcNow)))
                return BadRequest(new { Message = "InvalidSubscriptionChange" });

            await using var transaction =
                await _db.Database.BeginTransactionAsync(cancellationToken);
            // Serialize concurrent changes to the same learner across API instances.
            await _db.Database.SqlQuery<int>(
                $"SELECT 1 AS \"Value\" FROM pg_advisory_xact_lock({-987654321}, {learnerId})")
                .SingleAsync(cancellationToken);
            var learner = await _db.Users.FirstOrDefaultAsync(
                u => u.Id == learnerId && u.Role == "Student", cancellationToken);
            if (learner == null)
                return NotFound(new { Message = "UserNotFound" });

            var previousType = learner.SubscriptionType;
            var previousExpiry = learner.PremiumExpiresAtUtc;
            if (!string.Equals(previousType, type, StringComparison.Ordinal) ||
                previousExpiry != request.PremiumExpiresAtUtc)
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
                    Reason = reason!,
                    ChangedAtUtc = DateTime.UtcNow
                });
                // Persist the student's notice in the same transaction as the grant.
                // Do not notify when an idempotent request changes nothing.
                _db.UserNotifications.Add(new UserNotification
                {
                    UserId = learner.Id,
                    Type = "subscription",
                    TitleAr = type == "Premium" ? "تم تفعيل اشتراك Premium" : "تم تحديث الاشتراك",
                    TitleEn = type == "Premium" ? "Premium is now active" : "Subscription updated",
                    BodyAr = type == "Premium"
                        ? "تم تفعيل مزايا الاشتراك على حسابك."
                        : "أصبح حسابك على الخطة المجانية.",
                    BodyEn = type == "Premium"
                        ? "Premium benefits are now active for your account."
                        : "Your account is now on the Free plan.",
                    TargetPath = "/dashboard",
                    CreatedAtUtc = DateTime.UtcNow
                });
                await _db.SaveChangesAsync(cancellationToken);
            }
            await transaction.CommitAsync(cancellationToken);
            if (!string.Equals(previousType, type, StringComparison.Ordinal) ||
                previousExpiry != request.PremiumExpiresAtUtc)
                _stream.Notify(learner.Id);
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
            if (page < 1 || pageSize < 1 || pageSize > 50 ||
                (long)(page - 1) * pageSize > int.MaxValue)
                return BadRequest(new { Message = "InvalidPagination" });
            var adminId = int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier),
                out var parsed) ? parsed : 0;
            if (adminId <= 0 || !await _db.Users.AsNoTracking().AnyAsync(
                    u => u.Id == adminId && u.Role == "Admin" && u.IsActive,
                    cancellationToken))
                return Forbid();
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
