using MathWorldAPI.Data;
using MathWorldAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Services;

/// <summary>
/// Called exclusively by a future provider adapter AFTER independent webhook
/// signature and provider-API verification. No HTTP endpoint accepts this type
/// from a student. Failure returns a state for provider-specific refund/retry
/// handling; it must never be interpreted as a successful charge.
/// </summary>
public sealed class PremiumPaymentSettlementService
{
    private readonly AppDbContext _db;
    private readonly NotificationStreamBroker _stream;
    private readonly RecoveryEmailQueue _emailQueue;
    public PremiumPaymentSettlementService(AppDbContext db, NotificationStreamBroker stream, RecoveryEmailQueue emailQueue)
    {
        _db = db;
        _stream = stream;
        _emailQueue = emailQueue;
    }

    // A verified receipt is SERVER-ONLY evidence. Client POST bodies are not evidence.
    public sealed record VerifiedReceipt(
        string OrderReference,
        string Provider,
        string ProviderPaymentId,
        decimal PaidUsd,
        string Currency,
        DateTime ProviderPaidAtUtc);

    public enum Outcome
    {
        Settled,
        AlreadySettled,
        OrderNotFound,
        IneligibleOrder,
        InvalidPayment,
        DiscountNoLongerEligible,
        StudentUnavailable
    }

    public sealed record Result(Outcome Status, long? OrderId = null,
        DateTime? PremiumExpiresAtUtc = null);

    public async Task<Result> SettleVerifiedAsync(VerifiedReceipt receipt,
        CancellationToken ct = default)
    {
        // Validating provider identity and signature MUST happen in the adapter
        // BEFORE calling this method. A future public webhook must be signed.
        if (string.IsNullOrWhiteSpace(receipt.OrderReference) ||
            receipt.OrderReference.Length > 64 ||
            string.IsNullOrWhiteSpace(receipt.Provider) ||
            receipt.Provider.Length > 40 ||
            string.IsNullOrWhiteSpace(receipt.ProviderPaymentId) ||
            receipt.ProviderPaymentId.Length > 160 ||
            receipt.ProviderPaidAtUtc.Kind != DateTimeKind.Utc ||
            receipt.ProviderPaidAtUtc > DateTime.UtcNow.AddMinutes(5) ||
            receipt.PaidUsd <= 0m || receipt.Currency != "USD" ||
            decimal.Round(receipt.PaidUsd, 2) != receipt.PaidUsd)
            return new Result(Outcome.InvalidPayment);

        await using var tx = await _db.Database.BeginTransactionAsync(ct);

        var order = await _db.PremiumCheckoutOrders
            .FromSqlInterpolated($@"SELECT * FROM ""PremiumCheckoutOrders""
                WHERE ""OrderReference"" = {receipt.OrderReference} FOR UPDATE")
            .SingleOrDefaultAsync(ct);
        if (order is null) return new Result(Outcome.OrderNotFound);

        if (order.Status == "Paid" &&
            order.Provider == receipt.Provider &&
            order.ProviderPaymentId == receipt.ProviderPaymentId &&
            order.TotalUsd == receipt.PaidUsd &&
            order.Currency == receipt.Currency)
            return new Result(Outcome.AlreadySettled, order.Id);

        if (order.Status != "Pending" ||
            order.Provider is not null ||
            order.ProviderPaymentId is not null ||
            order.VerifiedPaidAtUtc.HasValue)
            return new Result(Outcome.IneligibleOrder, order.Id);

        if (receipt.ProviderPaidAtUtc < order.CreatedAtUtc ||
            order.TotalUsd != receipt.PaidUsd ||
            order.Currency != receipt.Currency)
            return new Result(Outcome.InvalidPayment, order.Id);

        // The uniqueness constraint on (Provider, ProviderPaymentId) is the
        // final guard against attaching one provider payment to two orders.
        if (await _db.PremiumCheckoutOrders.AsNoTracking().AnyAsync(
            x => x.Provider == receipt.Provider &&
                 x.ProviderPaymentId == receipt.ProviderPaymentId, ct))
            return new Result(Outcome.InvalidPayment, order.Id);

        PremiumDiscountCode? discount = null;
        if (order.DiscountCodeId is long codeId)
        {
            discount = await _db.PremiumDiscountCodes
                .FromSqlInterpolated($@"SELECT * FROM ""PremiumDiscountCodes""
                    WHERE ""Id"" = {codeId} FOR UPDATE")
                .SingleOrDefaultAsync(ct);
            if (discount is null) return new Result(Outcome.DiscountNoLongerEligible, order.Id);

            // Evaluate validity at the provider's verified payment timestamp,
            // so delayed webhooks do not erase valid on-time purchases.
            var policy = new PremiumDiscountEligibility.Policy(
                discount.StartsAtUtc, discount.EndsAtUtc, discount.Enabled,
                discount.MaxRedemptions, discount.RedemptionCount);
            if (PremiumDiscountEligibility.Evaluate(policy, receipt.ProviderPaidAtUtc)
                != PremiumDiscountEligibility.Status.Active ||
                !Enum.TryParse<PremiumDiscountCalculator.DiscountKind>(
                    discount.DiscountKind, out var kind) || !Enum.IsDefined(kind))
                return new Result(Outcome.DiscountNoLongerEligible, order.Id);
            // The coupon row is locked: simultaneous settlements using the
            // same code are serialized, including per-student usage checks.
            if (discount.MaxRedemptionsPerStudent is int maxPerStudent)
            {
                var previousUses = await _db.PremiumCheckoutOrders.AsNoTracking()
                    .CountAsync(x => x.StudentId == order.StudentId &&
                        x.DiscountCodeId == discount.Id &&
                        x.DiscountRedeemedAtUtc != null, ct);
                if (previousUses >= maxPerStudent)
                    return new Result(Outcome.DiscountNoLongerEligible, order.Id);
            }

            var price = PremiumDiscountCalculator.Calculate(
                PremiumDiscountCalculator.AnnualPriceUsd, kind, discount.Amount);
            if (price.SubtotalUsd != order.SubtotalUsd ||
                price.DiscountUsd != order.DiscountUsd ||
                price.TotalUsd != order.TotalUsd)
                return new Result(Outcome.DiscountNoLongerEligible, order.Id);
        }
        else if (order.DiscountUsd != 0m ||
                 order.TotalUsd != PremiumDiscountCalculator.AnnualPriceUsd)
        {
            return new Result(Outcome.InvalidPayment, order.Id);
        }

        // Serialize grants for a learner with admin changes and gift redemption.
        await _db.Database.SqlQuery<int>(
            $"SELECT 1 AS \"Value\" FROM pg_advisory_xact_lock({-987654321}, {order.StudentId})")
            .SingleAsync(ct);

        var student = await _db.Users.SingleOrDefaultAsync(
            x => x.Id == order.StudentId && x.Role == "Student" && x.IsActive, ct);
        if (student is null) return new Result(Outcome.StudentUnavailable, order.Id);

        var now = DateTime.UtcNow;
        var wasActive=PremiumEntitlement.IsActive(student,now);
        // Do not replace a previously granted indefinite Premium subscription.
        DateTime? expires = student.PremiumExpiresAtUtc;
        if (!(PremiumEntitlement.IsActive(student, now) && expires is null))
        {
            var begins = PremiumEntitlement.IsActive(student, now) &&
                expires.HasValue && expires.Value > now ? expires.Value : now;
            expires = begins.AddYears(1);
            student.SubscriptionType = "Premium";
            student.PremiumExpiresAtUtc = expires;
        }

        order.Status = "Paid";
        order.Provider = receipt.Provider;
        order.ProviderPaymentId = receipt.ProviderPaymentId;
        order.VerifiedPaidAtUtc = receipt.ProviderPaidAtUtc;

        if (discount is not null)
        {
            discount.RedemptionCount += 1;
            order.DiscountRedeemedAtUtc = now;
        }

        _db.UserNotifications.Add(new UserNotification
        {
            UserId = student.Id,
            Type = "subscription",
            TitleAr = "تم تأكيد اشتراك Premium",
            TitleEn = "Premium payment confirmed",
            BodyAr = "تم التحقق من الدفع وتحديث اشتراك Premium.",
            BodyEn = "Your payment was verified and your Premium subscription was updated.",
            TargetPath = "/dashboard",
            CreatedAtUtc = now
        });

        _emailQueue.AddOptionalNotice(student,wasActive?"premium-renewed":"premium-granted",now);
        await _db.SaveChangesAsync(ct);
        await tx.CommitAsync(ct);
        _stream.Notify(student.Id);
        return new Result(Outcome.Settled, order.Id, expires);
    }
}
