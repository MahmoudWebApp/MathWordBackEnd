# MathWorld Premium checkout, discounts, and payment safety (development branches)

**Not deployed, no online payment provider connected.** Annual plan: USD 5.00.
GitHub Actions builds may pass without any payment being processed. Gift codes (`MW-...`)
are separate from purchase discounts (`MD-...`).

## Student APIs

- `POST /api/users/premium-discounts/quote` — body `{"Code":"MD-..."}`; server-owned preview: `SubtotalUsd`, `DiscountUsd`, `TotalUsd`, `Currency`, `EndsAtUtc`. Does not reserve a code.
- `POST /api/users/premium-checkout/orders` — body `{"DiscountCode":"MD-..."}` or `{"DiscountCode":null}`; prepares a **Pending** order using server-side prices. Never charges or activates Premium. Max three unpaid draft orders per student, concurrency-safe.
- `GET /api/users/premium-checkout/orders?page=1&pageSize=10` — authenticated student's own paginated order history.
- `GET /api/users/premium-checkout/orders/{id}` — student's own order details only.
- `POST /api/users/premium-checkout/orders/{id}/cancel` — atomic idempotent cancellation of a local unpaid draft. A provider-attached or paid order cannot be cancelled by this route.

All student operations use JWT authorization and active-account checks. Discount quote
and draft creation have a per-user rate limit. Raw discount codes are never
returned in history responses.

## Admin APIs

- `POST /api/admin/premium-discounts` — create a random discount code. Plaintext is returned only once. Input: `Label`, `DiscountKind` (`Percentage`/`FixedUsd`), `Amount`, UTC `StartsAtUtc` and `EndsAtUtc`, optional `MaxRedemptions`, optional `MaxRedemptionsPerStudent` (default **1**; `null` explicitly means unlimited).
- `GET /api/admin/premium-discounts?page=1&pageSize=20` — metadata, usage caps, schedule, and derived status; never raw codes.
- `PUT /api/admin/premium-discounts/{id}/settings` — change UTC validity dates, total and per-student limits under a row lock. Cannot re-enable a disabled code or set total cap below already recorded usage. Discount amount/kind never change.
- `PUT /api/admin/premium-discounts/{id}/disable` — irreversible disable in this API.
- `GET /api/admin/premium-checkout/summary` — order state counts, pending older than one day, paid revenue and redeemed discounts.
- `GET /api/admin/premium-checkout/orders?status=Pending&page=1&pageSize=20` — read-only purchase audit with optional status filter.

## Usage and money rules

All promo dates are UTC. `StartsAtUtc` is inclusive; `EndsAtUtc` is exclusive.
Total usage and per-student usage are only **consumed after verified settlement**;
quotes and Pending orders never increment counts. A percent/fixed USD discount is
rounded to two decimals on the server, never below zero. Discounted orders with
a zero total are intentionally **not** accepted as checkout orders yet: use a
separate Premium gift code for no-payment grants, until a fully audited zero-price
flow is designed. The admin UI should not imply 100%-off checkout can currently
be paid.

`PremiumCheckoutOrders` records preserve student ID, code ID, order reference,
server-priced amounts, currency, provider/payment identifiers and verification
timestamps. The database enforces amount reconciliation and unique provider
payment identifiers to prevent accidental double booking.

## Verified settlement service (NOT a payment provider)

`PremiumPaymentSettlementService.SettleVerifiedAsync(VerifiedReceipt)` implements
transactional **server-side settlement logic only**. It has no HTTP route.
An eventual payment-provider adapter must first authenticate webhook signatures,
verify provider transaction state, correlate order reference, amount, currency,
identity and timestamp with the provider's API, and only then construct the
server-only receipt.

Settlement locks the order, locks the discount row, rechecks time and total/per-
student limits, obtains the same learner advisory lock used by subscription
grants, extends Premium for one year, writes the redemption count and user
notification, then commits atomically. Repeated verified receipts for the same
paid order are idempotent. One provider payment cannot be applied to another
order due to the unique database index.

A rejected or mismatched **already charged** receipt must trigger provider-specific
reconciliation/refund/retry operations; this service cannot automatically refund.
Do **not** expose a student-accessible `mark paid` / `confirm payment` route.

## Still launch-blocking

1. Choose and configure an actual payment provider and merchant account.
2. Independently verify payment signatures + provider transaction queries, handle delayed
   webhooks, refunds, chargebacks, reconciliation and alerts. Never trust client status.
3. Test concurrent settlements, per-student/global discount usage, coupon expiry,
   idempotency, order ownership and refund cases against disposable PostgreSQL.
4. Apply and verify migrations in staging first; then verify web and Flutter UI on
   real devices in Arabic and English.
5. Decide the rules for zero-cost checkout and taxes/fees/currency when applicable,
   and obtain applicable legal/compliance reviews before accepting real payments.
6. Do not merge or deploy without explicit release approval.
