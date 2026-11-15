using System.Security.Claims;
using MathWorldAPI.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

/// <summary>Administrative read-only purchase audit. No manual payment overrides.</summary>
[ApiController]
[Authorize(Roles = "Admin")]
[Route("api/admin/premium-checkout")]
[ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
public sealed class PremiumCheckoutAdminController : ControllerBase
{
    private readonly AppDbContext _db;
    public PremiumCheckoutAdminController(AppDbContext db) => _db = db;

    private async Task<bool> IsActiveAdmin(CancellationToken ct)
    {
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var id))
            return false;
        return await _db.Users.AsNoTracking().AnyAsync(
            x => x.Id == id && x.Role == "Admin" && x.IsActive, ct);
    }

    [HttpGet("summary")]
    public async Task<IActionResult> Summary(CancellationToken ct)
    {
        if (!await IsActiveAdmin(ct)) return Forbid();
        var orders = _db.PremiumCheckoutOrders.AsNoTracking();
        var total = await orders.CountAsync(ct);
        var pending = await orders.CountAsync(x => x.Status == "Pending", ct);
        var paid = await orders.CountAsync(x => x.Status == "Paid", ct);
        var failed = await orders.CountAsync(x => x.Status == "Failed", ct);
        var cancelled = await orders.CountAsync(x => x.Status == "Cancelled", ct);
        var refunded = await orders.CountAsync(x => x.Status == "Refunded", ct);
        var collected = await orders.Where(x => x.Status == "Paid")
            .SumAsync(x => (decimal?)x.TotalUsd, ct) ?? 0m;
        var discounts = await orders.Where(x => x.Status == "Paid")
            .SumAsync(x => (decimal?)x.DiscountUsd, ct) ?? 0m;
        var pendingOlderThanDay = await orders.CountAsync(x =>
            x.Status == "Pending" && x.CreatedAtUtc < DateTime.UtcNow.AddDays(-1), ct);
        return Ok(new
        {
            TotalOrders = total, Pending = pending, Paid = paid,
            Failed = failed, Cancelled = cancelled, Refunded = refunded,
            PendingOlderThan24Hours = pendingOlderThanDay,
            PaidAmountUsd = collected, RedeemedDiscountUsd = discounts,
            Currency = "USD", PaymentAvailable = false
        });
    }

    [HttpGet("orders")]
    public async Task<IActionResult> Orders(
        [FromQuery] string? status, [FromQuery] int page = 1,
        [FromQuery] int pageSize = 20, CancellationToken ct = default)
    {
        if (!await IsActiveAdmin(ct)) return Forbid();
        if (page < 1 || pageSize is < 1 or > 50 ||
            (long)(page - 1) * pageSize > int.MaxValue)
            return BadRequest(new { Message = "InvalidPagination" });
        var allowed = new[] { "Pending", "Paid", "Failed", "Cancelled", "Refunded" };
        if (status is not null && !allowed.Contains(status, StringComparer.Ordinal))
            return BadRequest(new { Message = "InvalidCheckoutStatus" });

        var query = _db.PremiumCheckoutOrders.AsNoTracking();
        if (status is not null) query = query.Where(x => x.Status == status);
        var total = await query.CountAsync(ct);
        var rows = await query.OrderByDescending(x => x.CreatedAtUtc)
            .ThenByDescending(x => x.Id)
            .Skip((page - 1) * pageSize).Take(pageSize)
            .Select(x => new
            {
                x.Id, x.OrderReference, x.StudentId, x.DiscountCodeId,
                x.Status, x.SubtotalUsd, x.DiscountUsd, x.TotalUsd,
                x.Currency, x.CreatedAtUtc, x.VerifiedPaidAtUtc,
                x.DiscountRedeemedAtUtc
            })
            .ToListAsync(ct);
        return Ok(new { Total = total, Page = page, PageSize = pageSize, Orders = rows });
    }
}
