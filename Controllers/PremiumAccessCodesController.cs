using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using MathWorldAPI.Data;
using MathWorldAPI.Helpers;
using MathWorldAPI.Models;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.RateLimiting;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

/// <summary>
/// Single-use 100% Premium access gifts. No payment or percentage-off checkout
/// is implemented. The redeemable value is returned once on creation and
/// stored as a SHA-256 hash. Gift codes are 144 bits of cryptographic entropy.
/// </summary>
[ApiController]
[Route("api")]
[Authorize]
public sealed class PremiumAccessCodesController : ControllerBase
{
    private readonly AppDbContext _db;
    public PremiumAccessCodesController(AppDbContext db) => _db = db;

    public sealed class CreateCodeRequest
    {
        public string Label { get; set; } = "";
        public int PremiumDays { get; set; } = 365;
        public int ExpiresInDays { get; set; } = 30;
    }

    public sealed class RedeemCodeRequest
    {
        public string Code { get; set; } = "";
    }

    private async Task<int?> ActiveUserId(string role, CancellationToken ct)
    {
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var id) || id <= 0)
            return null;
        return await _db.Users.AsNoTracking().AnyAsync(
            u => u.Id == id && u.Role == role && u.IsActive, ct) ? id : null;
    }

    [HttpPost("admin/premium-codes")]
    [Authorize(Roles = "Admin")]
    public async Task<IActionResult> Create([FromBody] CreateCodeRequest? request,
        CancellationToken ct)
    {
        var admin = await ActiveUserId("Admin", ct);
        if (admin is null) return Forbid();
        var label = request?.Label?.Trim() ?? "";
        if (label.Length is < 3 or > 80 ||
            request!.PremiumDays is < 1 or > 365 ||
            request.ExpiresInDays is < 1 or > 365)
            return BadRequest(new { Message = "InvalidPremiumCodeSettings" });

        var now = DateTime.UtcNow;
        var random = Convert.ToHexString(RandomNumberGenerator.GetBytes(18));
        var normalized = "MW" + random;
        var display = $"MW-{random[..12]}-{random[12..24]}-{random[24..]}";
        var code = new PremiumAccessCode
        {
            CodeHash = Digest(normalized),
            Label = label,
            PremiumDays = request.PremiumDays,
            CreatedByAdminId = admin.Value,
            CreatedAtUtc = now,
            ExpiresAtUtc = now.AddDays(request.ExpiresInDays)
        };
        _db.PremiumAccessCodes.Add(code);
        await _db.SaveChangesAsync(ct);

        // One-time plaintext only in this response; never re-exposed in lists.
        Response.Headers.CacheControl = "no-store";
        return Ok(new
        {
            code.Id, Code = display, code.Label, code.PremiumDays,
            code.CreatedAtUtc, code.ExpiresAtUtc, SingleUse = true,
            DiscountType = "Gift100Percent", PaymentRequired = false
        });
    }

    [HttpGet("admin/premium-codes")]
    [Authorize(Roles = "Admin")]
    [ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
    public async Task<IActionResult> List([FromQuery] int page = 1,
        [FromQuery] int pageSize = 20, CancellationToken ct = default)
    {
        if (await ActiveUserId("Admin", ct) is null) return Forbid();
        if (page < 1 || pageSize is < 1 or > 50 ||
            (long)(page - 1) * pageSize > int.MaxValue)
            return BadRequest(new { Message = "InvalidPagination" });

        var now = DateTime.UtcNow;
        var total = await _db.PremiumAccessCodes.CountAsync(ct);
        var rows = await _db.PremiumAccessCodes.AsNoTracking()
            .OrderByDescending(x => x.CreatedAtUtc).ThenByDescending(x => x.Id)
            .Skip((page - 1) * pageSize).Take(pageSize)
            .Select(x => new
            {
                x.Id, x.Label, x.PremiumDays, x.CreatedByAdminId,
                x.CreatedAtUtc, x.ExpiresAtUtc, x.RedeemedByUserId,
                x.RedeemedAtUtc, x.RevokedAtUtc
            }).ToListAsync(ct);

        return Ok(new
        {
            Total = total, Page = page, PageSize = pageSize,
            Codes = rows.Select(x => new
            {
                x.Id, x.Label, x.PremiumDays, x.CreatedByAdminId,
                x.CreatedAtUtc, x.ExpiresAtUtc, x.RedeemedByUserId,
                x.RedeemedAtUtc, x.RevokedAtUtc,
                Status = x.RedeemedAtUtc.HasValue ? "Redeemed" :
                    x.RevokedAtUtc.HasValue ? "Revoked" :
                    x.ExpiresAtUtc <= now ? "Expired" : "Available"
            }).ToList()
        });
    }

    [HttpPut("admin/premium-codes/{id:long}/revoke")]
    [Authorize(Roles = "Admin")]
    public async Task<IActionResult> Revoke(long id, CancellationToken ct)
    {
        if (await ActiveUserId("Admin", ct) is null) return Forbid();
        await using var tx = await _db.Database.BeginTransactionAsync(ct);
        var code = await _db.PremiumAccessCodes
            .FromSqlInterpolated($@"SELECT * FROM ""PremiumAccessCodes"" WHERE ""Id"" = {id} FOR UPDATE")
            .SingleOrDefaultAsync(ct);
        if (code is null) return NotFound(new { Message = "PremiumCodeNotFound" });
        if (code.RedeemedAtUtc.HasValue || code.RevokedAtUtc.HasValue)
            return Conflict(new { Message = "PremiumCodeAlreadyUsedOrRevoked" });
        code.RevokedAtUtc = DateTime.UtcNow;
        await _db.SaveChangesAsync(ct);
        await tx.CommitAsync(ct);
        return NoContent();
    }

    [HttpPost("users/premium-codes/redeem")]
    [Authorize(Roles = "Student")]
    [EnableRateLimiting("premium-code")]
    public async Task<IActionResult> Redeem([FromBody] RedeemCodeRequest? request,
        CancellationToken ct)
    {
        var userId = await ActiveUserId("Student", ct);
        if (userId is null) return Forbid();
        var raw = request?.Code?.Trim().Replace("-", "", StringComparison.Ordinal)
            .Replace(" ", "", StringComparison.Ordinal).ToUpperInvariant() ?? "";
        if (!Regex.IsMatch(raw, "^MW[0-9A-F]{36}$"))
            return BadRequest(new { Message = "InvalidOrUnavailablePremiumCode" });

        var hash = Digest(raw);
        await using var tx = await _db.Database.BeginTransactionAsync(ct);
        var code = await _db.PremiumAccessCodes
            .FromSqlInterpolated($@"SELECT * FROM ""PremiumAccessCodes"" WHERE ""CodeHash"" = {hash} FOR UPDATE")
            .SingleOrDefaultAsync(ct);
        var now = DateTime.UtcNow;
        if (code is null || code.RevokedAtUtc.HasValue ||
            code.RedeemedAtUtc.HasValue || code.ExpiresAtUtc <= now)
            return BadRequest(new { Message = "InvalidOrUnavailablePremiumCode" });

        // Reuse the same advisory key as manual admin subscription grants.
        await _db.Database.SqlQuery<int>(
                $"SELECT 1 AS \"Value\" FROM pg_advisory_xact_lock({-987654321}, {userId.Value})")
            .SingleAsync(ct);

        var user = await _db.Users.FirstOrDefaultAsync(
            u => u.Id == userId.Value && u.Role == "Student" && u.IsActive, ct);
        if (user is null) return Forbid();

        // Never replace a legacy indefinite Premium grant with an expiry.
        if (PremiumEntitlement.IsActive(user) && user.PremiumExpiresAtUtc is null)
            return Conflict(new { Message = "AlreadyIndefinitePremium" });

        var previousType = user.SubscriptionType;
        var previousExpiry = user.PremiumExpiresAtUtc;
        var start = PremiumEntitlement.IsActive(user) &&
            user.PremiumExpiresAtUtc is not null && user.PremiumExpiresAtUtc > now
                ? user.PremiumExpiresAtUtc.Value : now;
        var newExpiry = start.AddDays(code.PremiumDays);

        user.SubscriptionType = "Premium";
        user.PremiumExpiresAtUtc = newExpiry;
        code.RedeemedByUserId = user.Id;
        code.RedeemedAtUtc = now;

        _db.Set<SubscriptionGrant>().Add(new SubscriptionGrant
        {
            LearnerId = user.Id,
            AdminId = code.CreatedByAdminId,
            PreviousType = previousType,
            NewType = "Premium",
            PreviousExpiresAtUtc = previousExpiry,
            NewExpiresAtUtc = newExpiry,
            Reason = $"Self-redeemed 100% Premium gift code #{code.Id} (issued by admin)",
            ChangedAtUtc = now
        });
        _db.UserNotifications.Add(new UserNotification
        {
            UserId = user.Id,
            Type = "subscription",
            TitleAr = "تم تفعيل هدية Premium",
            TitleEn = "Your Premium gift is active",
            BodyAr = $"تم تفعيل مزايا Premium لمدة {code.PremiumDays} يوماً.",
            BodyEn = $"Premium benefits have been extended by {code.PremiumDays} days.",
            TargetPath = "/dashboard",
            CreatedAtUtc = now
        });

        await _db.SaveChangesAsync(ct);
        await tx.CommitAsync(ct);
        return Ok(LanguageHelper.SuccessResponse(new
        {
            SubscriptionType = "Premium",
            PremiumExpiresAtUtc = newExpiry,
            GrantedDays = code.PremiumDays
        }, "Success", LanguageHelper.GetLanguageFromRequest(Request)));
    }

    private static string Digest(string normalized) =>
        Convert.ToHexString(SHA256.HashData(Encoding.UTF8.GetBytes(normalized)));
}
