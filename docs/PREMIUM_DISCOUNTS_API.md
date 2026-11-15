# MathWorld Premium — scheduled discount codes (development only)

This implementation is **not a payment system** and is not deployed. Annual checkout base price is currently USD 5.00.

## Roles and endpoints

- `POST /api/admin/premium-discounts` — authenticated active Admin only; creates a cryptographically random, one-time-displayed discount code. Input: `Label`, `DiscountKind` (`Percentage` or `FixedUsd`), `Amount`, `StartsAtUtc`, `EndsAtUtc`, optional `MaxRedemptions`.
- `GET /api/admin/premium-discounts?page=1&pageSize=20` — Admin-only metadata, no plaintext code.
- `PUT /api/admin/premium-discounts/{id}/disable` — Admin-only, irreversible disable in this API.
- `POST /api/users/premium-discounts/quote` — active authenticated Student only, body `{ "Code": "MD-..." }`. Returns `SubtotalUsd`, `DiscountUsd`, `TotalUsd`, `Currency`, `EndsAtUtc`, and `Notice: PreviewOnlyRevalidateAtCheckout`.

## Date and usage semantics

All timestamps must be UTC. A code is eligible when `StartsAtUtc <= nowUtc < EndsAtUtc`, it is enabled, and the redemption count is below `MaxRedemptions` (when set). Codes can be scheduled to start in the future. Dates are enforced by the backend, not the device clock.

## Important checkout integration requirements (NOT implemented)

1. Quote is informational only; it **does not reserve or consume** a code, charge a card, or grant Premium.
2. The payment service must revalidate the code in a database transaction with a row lock when confirming a **verified payment**, and atomically increment `RedemptionCount`.
3. Store a unique payment/order identifier, user, final server-calculated price, applied discount ID, and payment-provider confirmation; make payment webhook handling idempotent.
4. Define and enforce per-user redemption limits (not yet implemented), refunds, and the behavior of 100%-off checkout before enabling public redemption.
5. Apply the migration and run PostgreSQL integration tests plus `dotnet build` before merge or deployment.
6. Do not expose the plaintext code in admin list responses or logs; the create response shows it once.

Gift codes (`MW-...`) are a separate existing flow that grants Premium without checkout. Discount codes (`MD-...`) never grant Premium directly.
