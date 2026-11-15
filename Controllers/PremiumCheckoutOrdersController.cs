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
/// Prepares server-priced Premium checkout orders without taking payment.
/// No endpoint in this controller can confirm payment or activate Premium.
/// </summary>
[ApiController]
[Route("api/users/premium-checkout")]
[Authorize(Roles = "Student")]
[ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
public sealed class PremiumCheckoutOrdersController : ControllerBase
{
    private readonly AppDbContext _db;
    public PremiumCheckoutOrdersController(AppDbContext db) => _db = db;

    public sealed class PrepareRequest
    {
        public string? DiscountCode { get; set; }
    }

    private async Task<int?> StudentId(CancellationToken ct)
    {
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var id) || id <= 0)
            return null;
        return await _db.Users.AsNoTracking().AnyAsync(
            x => x.Id == id && x.Role == "Student" && x.IsActive, ct) ? id : null;
    }

    private static string Normalize(string raw) =>
        raw.Trim().Replace("-", "", StringComparison.Ordinal)
            .Replace(" ", "", StringComparison.Ordinal).ToUpperInvariant();

    [HttpPost("orders")]
    [EnableRateLimiting("premium-code")]
    public async Task<IActionResult> Prepare([FromBody] PrepareRequest? request, CancellationToken ct)
    {
        var studentId = await StudentId(ct);
        if (studentId is null) return Forbid();
        if (request is null) return BadRequest(new { Message = "InvalidCheckoutRequest" });

        var now = DateTime.UtcNow;
        PremiumDiscountCode? discountCode = null;
        var quote = PremiumDiscountCalculator.Calculate(
            PremiumDiscountCalculator.AnnualPriceUsd,
            PremiumDiscountCalculator.DiscountKind.FixedUsd, 0m);

        if (!string.IsNullOrWhiteSpace(request.DiscountCode))
        {
            var normalized = Normalize(request.DiscountCode);
            if (!Regex.IsMatch(normalized, "^MD[0-9A-F]{36}$"))
                return BadRequest(new { Message = "InvalidOrUnavailableDiscount" });

            var hash = Convert.ToHexString(SHA256.HashData(Encoding.UTF8.GetBytes(normalized)));
            discountCode = await _db.PremiumDiscountCodes.AsNoTracking()
                .SingleOrDefaultAsync(x => x.CodeHash == hash, ct);
            if (discountCode is null ||
                PremiumDiscountEligibility.Evaluate(new PremiumDiscountEligibility.Policy(
                    discountCode.StartsAtUtc, discountCode.EndsAtUtc,
                    discountCode.Enabled, discountCode.MaxRedemptions,
                    discountCode.RedemptionCount), now) != PremiumDiscountEligibility.Status.Active ||
                !Enum.TryParse<PremiumDiscountCalculator.DiscountKind>(
                    discountCode.DiscountKind, out var kind) || !Enum.IsDefined(kind))
                return BadRequest(new { Message = "InvalidOrUnavailableDiscount" });

            quote = PremiumDiscountCalculator.Calculate(
                PremiumDiscountCalculator.AnnualPriceUsd, kind, discountCode.Amount);
        }

        // A 100% discount requires a separate, audited free-checkout path.
        // Never create a zero-value order that a payment provider cannot verify.
        if (quote.TotalUsd == 0m)
            return Conflict(new { Message = "ZeroValueCheckoutNotAvailable" });

        var order = new PremiumCheckoutOrder
        {
            StudentId = studentId.Value,
            DiscountCodeId = discountCode?.Id,
            OrderReference = "MWO-" + Convert.ToHexString(RandomNumberGenerator.GetBytes(16)),
            Status = "Pending",
            SubtotalUsd = quote.SubtotalUsd,
            DiscountUsd = quote.DiscountUsd,
            TotalUsd = quote.TotalUsd,
            Currency = "USD",
            CreatedAtUtc = now
        };
        _db.PremiumCheckoutOrders.Add(order);
        await _db.SaveChangesAsync(ct);
        Response.Headers.CacheControl = "no-store";
        return CreatedAtAction(nameof(GetOrder), new { id = order.Id }, new
        {
            order.Id, order.OrderReference, order.Status, order.SubtotalUsd,
            order.DiscountUsd, order.TotalUsd, order.Currency, order.CreatedAtUtc,
            PaymentAvailable = false,
            Notice = "NoPaymentProviderConfiguredDiscountRevalidatedAtSettlement"
        });
    }

    [HttpGet("orders/{id:long}")]
    public async Task<IActionResult> GetOrder(long id, CancellationToken ct)
    {
        var studentId = await StudentId(ct);
        if (studentId is null) return Forbid();
        var order = await _db.PremiumCheckoutOrders.AsNoTracking()
            .Where(x => x.Id == id && x.StudentId == studentId.Value)
            .Select(x => new
            {
                x.Id, x.OrderReference, x.Status, x.SubtotalUsd,
                x.DiscountUsd, x.TotalUsd, x.Currency, x.CreatedAtUtc,
                x.VerifiedPaidAtUtc
            }).SingleOrDefaultAsync(ct);
        if (order is null) return NotFound(new { Message = "CheckoutOrderNotFound" });
        Response.Headers.CacheControl = "no-store";
        return Ok(order);
    }
}
