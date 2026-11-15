using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using MathWorldAPI.Data;
using MathWorldAPI.Models;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.RateLimiting;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

/// <summary>
/// Admin management and student price previews for scheduled checkout discounts.
/// Quotes do not reserve codes, collect payments or activate subscriptions.
/// </summary>
[ApiController]
[Route("api")]
[Authorize]
public sealed class PremiumDiscountCodesController : ControllerBase
{
    private readonly AppDbContext _db;
    public PremiumDiscountCodesController(AppDbContext db) => _db = db;

    public sealed class CreateRequest
    {
        public string Label { get; set; } = "";
        public string DiscountKind { get; set; } = "Percentage";
        public decimal Amount { get; set; }
        public DateTime StartsAtUtc { get; set; }
        public DateTime EndsAtUtc { get; set; }
        public int? MaxRedemptions { get; set; }
        public int? MaxRedemptionsPerStudent { get; set; } = 1;
    }

    public sealed class UpdateSettingsRequest
    {
        public DateTime StartsAtUtc { get; set; }
        public DateTime EndsAtUtc { get; set; }
        public int? MaxRedemptions { get; set; }
        public int? MaxRedemptionsPerStudent { get; set; } = 1;
    }

    public sealed class QuoteRequest
    {
        public string Code { get; set; } = "";
    }

    private async Task<int?> ActiveUserId(string role, CancellationToken ct)
    {
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var id) || id <= 0)
            return null;
        return await _db.Users.AsNoTracking().AnyAsync(
            x => x.Id == id && x.Role == role && x.IsActive, ct) ? id : null;
    }

    private static string Normalize(string? raw) =>
        (raw ?? "").Trim().Replace("-", "", StringComparison.Ordinal)
            .Replace(" ", "", StringComparison.Ordinal).ToUpperInvariant();

    private static string Hash(string value) =>
        Convert.ToHexString(SHA256.HashData(Encoding.UTF8.GetBytes(value)));

    private static PremiumDiscountEligibility.Policy Policy(PremiumDiscountCode code) =>
        new(code.StartsAtUtc, code.EndsAtUtc, code.Enabled,
            code.MaxRedemptions, code.RedemptionCount);

    [HttpPost("admin/premium-discounts")]
    [Authorize(Roles = "Admin")]
    public async Task<IActionResult> Create([FromBody] CreateRequest? request, CancellationToken ct)
    {
        var adminId = await ActiveUserId("Admin", ct);
        if (adminId is null) return Forbid();
        if (request is null) return BadRequest(new { Message = "InvalidDiscountSettings" });

        var label = request.Label?.Trim() ?? "";
        if (label.Length is < 3 or > 80 ||
            !Enum.TryParse<PremiumDiscountCalculator.DiscountKind>(
                request.DiscountKind, false, out var kind) ||
            !Enum.IsDefined(kind) ||
            request.Amount < 0m ||
            (kind == PremiumDiscountCalculator.DiscountKind.Percentage && request.Amount > 100m) ||
            (kind == PremiumDiscountCalculator.DiscountKind.FixedUsd && request.Amount > PremiumDiscountCalculator.AnnualPriceUsd) ||
            decimal.Round(request.Amount, 2) != request.Amount ||
            request.MaxRedemptions is <= 0 ||
            request.MaxRedemptionsPerStudent is <= 0)
            return BadRequest(new { Message = "InvalidDiscountSettings" });

        var now = DateTime.UtcNow;
        var policy = new PremiumDiscountEligibility.Policy(
            request.StartsAtUtc, request.EndsAtUtc, true, request.MaxRedemptions, 0);
        try { PremiumDiscountEligibility.Validate(policy); }
        catch (ArgumentException) { return BadRequest(new { Message = "InvalidDiscountWindow" }); }
        if (request.EndsAtUtc <= now || request.EndsAtUtc > now.AddYears(3))
            return BadRequest(new { Message = "InvalidDiscountWindow" });

        var secret = Convert.ToHexString(RandomNumberGenerator.GetBytes(18));
        var normalized = "MD" + secret;
        var display = $"MD-{secret[..12]}-{secret[12..24]}-{secret[24..]}";
        var code = new PremiumDiscountCode
        {
            CodeHash = Hash(normalized),
            Label = label,
            DiscountKind = kind.ToString(),
            Amount = request.Amount,
            StartsAtUtc = request.StartsAtUtc,
            EndsAtUtc = request.EndsAtUtc,
            MaxRedemptions = request.MaxRedemptions,
            MaxRedemptionsPerStudent = request.MaxRedemptionsPerStudent,
            CreatedByAdminId = adminId.Value,
            CreatedAtUtc = now,
            Enabled = true
        };
        _db.PremiumDiscountCodes.Add(code);
        await _db.SaveChangesAsync(ct);
        Response.Headers.CacheControl = "no-store";
        return Ok(new
        {
            code.Id, Code = display, code.Label, code.DiscountKind, code.Amount,
            code.StartsAtUtc, code.EndsAtUtc, code.MaxRedemptions,
            code.MaxRedemptionsPerStudent, code.Enabled
        });
    }

    [HttpGet("admin/premium-discounts")]
    [Authorize(Roles = "Admin")]
    [ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
    public async Task<IActionResult> List([FromQuery] int page = 1,
        [FromQuery] int pageSize = 20, CancellationToken ct = default)
    {
        if (await ActiveUserId("Admin", ct) is null) return Forbid();
        if (page < 1 || pageSize is < 1 or > 50 || (long)(page - 1) * pageSize > int.MaxValue)
            return BadRequest(new { Message = "InvalidPagination" });

        var now = DateTime.UtcNow;
        var total = await _db.PremiumDiscountCodes.CountAsync(ct);
        var codes = await _db.PremiumDiscountCodes.AsNoTracking()
            .OrderByDescending(x => x.CreatedAtUtc).ThenByDescending(x => x.Id)
            .Skip((page - 1) * pageSize).Take(pageSize)
            .ToListAsync(ct);
        return Ok(new
        {
            Total = total, Page = page, PageSize = pageSize,
            Codes = codes.Select(x => new
            {
                x.Id, x.Label, x.DiscountKind, x.Amount, x.StartsAtUtc,
                x.EndsAtUtc, x.Enabled, x.MaxRedemptions,
                x.MaxRedemptionsPerStudent, x.RedemptionCount,
                x.CreatedAtUtc,
                Status = PremiumDiscountEligibility.Evaluate(Policy(x), now).ToString()
            })
        });
    }

    [HttpPut("admin/premium-discounts/{id:long}/settings")]
    [Authorize(Roles = "Admin")]
    public async Task<IActionResult> UpdateSettings(long id,
        [FromBody] UpdateSettingsRequest? request, CancellationToken ct)
    {
        if (await ActiveUserId("Admin", ct) is null) return Forbid();
        if (request is null ||
            request.MaxRedemptions is <= 0 ||
            request.MaxRedemptionsPerStudent is <= 0)
            return BadRequest(new { Message = "InvalidDiscountSettings" });

        var now = DateTime.UtcNow;
        var policy = new PremiumDiscountEligibility.Policy(
            request.StartsAtUtc, request.EndsAtUtc, true, request.MaxRedemptions, 0);
        try { PremiumDiscountEligibility.Validate(policy); }
        catch (ArgumentException) { return BadRequest(new { Message = "InvalidDiscountWindow" }); }
        if (request.EndsAtUtc <= now || request.EndsAtUtc > now.AddYears(3))
            return BadRequest(new { Message = "InvalidDiscountWindow" });

        // Lock the same row used by settlement, so admin edits and
        // paid redemptions cannot change coupon limits concurrently.
        await using var tx = await _db.Database.BeginTransactionAsync(ct);
        var code = await _db.PremiumDiscountCodes
            .FromSqlInterpolated($@"SELECT * FROM ""PremiumDiscountCodes""
                WHERE ""Id"" = {id} FOR UPDATE")
            .SingleOrDefaultAsync(ct);
        if (code is null) return NotFound(new { Message = "DiscountNotFound" });
        if (!code.Enabled)
            return Conflict(new { Message = "DiscountDisabled" });
        if (request.MaxRedemptions is int max && max < code.RedemptionCount)
            return Conflict(new { Message = "DiscountLimitBelowUsage" });

        code.StartsAtUtc = request.StartsAtUtc;
        code.EndsAtUtc = request.EndsAtUtc;
        code.MaxRedemptions = request.MaxRedemptions;
        code.MaxRedemptionsPerStudent = request.MaxRedemptionsPerStudent;
        await _db.SaveChangesAsync(ct);
        await tx.CommitAsync(ct);
        return Ok(new
        {
            code.Id, code.StartsAtUtc, code.EndsAtUtc,
            code.MaxRedemptions, code.MaxRedemptionsPerStudent,
            code.RedemptionCount, code.Enabled
        });
    }

    [HttpPut("admin/premium-discounts/{id:long}/disable")]
    [Authorize(Roles = "Admin")]
    public async Task<IActionResult> Disable(long id, CancellationToken ct)
    {
        if (await ActiveUserId("Admin", ct) is null) return Forbid();
        var code = await _db.PremiumDiscountCodes.FindAsync(new object[] { id }, ct);
        if (code is null) return NotFound(new { Message = "DiscountNotFound" });
        code.Enabled = false;
        await _db.SaveChangesAsync(ct);
        return NoContent();
    }

    [HttpPost("users/premium-discounts/quote")]
    [EnableRateLimiting("premium-code")]
    [Authorize(Roles = "Student")]
    [ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
    public async Task<IActionResult> Quote([FromBody] QuoteRequest? request, CancellationToken ct)
    {
        var studentId = await ActiveUserId("Student", ct);
        if (studentId is null) return Forbid();
        var normalized = Normalize(request?.Code);
        if (!Regex.IsMatch(normalized, "^MD[0-9A-F]{36}$"))
            return BadRequest(new { Message = "InvalidOrUnavailableDiscount" });

        var hash = Hash(normalized);
        var code = await _db.PremiumDiscountCodes.AsNoTracking()
            .SingleOrDefaultAsync(x => x.CodeHash == hash, ct);
        var now = DateTime.UtcNow;
        if (code is null ||
            PremiumDiscountEligibility.Evaluate(Policy(code), now) !=
                PremiumDiscountEligibility.Status.Active)
            return BadRequest(new { Message = "InvalidOrUnavailableDiscount" });

        if (code.MaxRedemptionsPerStudent is int maxPerStudent)
        {
            var used = await _db.PremiumCheckoutOrders.AsNoTracking().CountAsync(
                x => x.StudentId == studentId.Value && x.DiscountCodeId == code.Id &&
                     x.DiscountRedeemedAtUtc != null, ct);
            if (used >= maxPerStudent)
                return BadRequest(new { Message = "InvalidOrUnavailableDiscount" });
        }

        if (!Enum.TryParse<PremiumDiscountCalculator.DiscountKind>(code.DiscountKind, out var kind) ||
            !Enum.IsDefined(kind))
            return BadRequest(new { Message = "InvalidOrUnavailableDiscount" });
        var quote = PremiumDiscountCalculator.Calculate(
            PremiumDiscountCalculator.AnnualPriceUsd, kind, code.Amount);
        Response.Headers.CacheControl = "no-store";
        return Ok(new
        {
            quote.SubtotalUsd, quote.DiscountUsd, quote.TotalUsd,
            Currency = "USD", code.EndsAtUtc,
            Notice = "PreviewOnlyRevalidateAtCheckout"
        });
    }
}
