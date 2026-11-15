namespace MathWorldAPI.Services;

/// <summary>
/// Server-side monetary calculations for future Premium checkout discounts.
/// This is a pure calculation helper: it does not issue codes, charge cards,
/// grant Premium access, or represent a verified payment.
/// </summary>
public static class PremiumDiscountCalculator
{
    public const decimal AnnualPriceUsd = 5.00m;

    public enum DiscountKind { Percentage, FixedUsd }

    public sealed record Quote(
        decimal SubtotalUsd,
        decimal DiscountUsd,
        decimal TotalUsd);

    public static Quote Calculate(decimal subtotalUsd, DiscountKind kind, decimal amount)
    {
        if (subtotalUsd < 0m)
            throw new ArgumentOutOfRangeException(nameof(subtotalUsd));
        if (amount < 0m)
            throw new ArgumentOutOfRangeException(nameof(amount));
        if (kind == DiscountKind.Percentage && amount > 100m)
            throw new ArgumentOutOfRangeException(nameof(amount));
        if (!Enum.IsDefined(kind))
            throw new ArgumentOutOfRangeException(nameof(kind));

        var subtotal = decimal.Round(subtotalUsd, 2, MidpointRounding.AwayFromZero);
        var rawDiscount = kind == DiscountKind.Percentage
            ? subtotal * amount / 100m
            : amount;
        var discount = Math.Min(subtotal,
            decimal.Round(rawDiscount, 2, MidpointRounding.AwayFromZero));
        return new Quote(subtotal, discount, subtotal - discount);
    }
}
