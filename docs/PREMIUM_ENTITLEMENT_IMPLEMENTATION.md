# Premium entitlement implementation — safe rollout

Status: design gate; **not deployed or enabled**.

## Existing behavior confirmed
- `AppUser.SubscriptionType` is currently `Free` or `Premium` (string).
- `StageDailyQuota.IsUnlimited` and `ProblemsController.SubmitAnswer` check the string directly.
- `GET /api/users/daily-quota` returns the subscription string and unlimited flag.
- Admin learners list is currently read-only.

## Required backend changes (single coordinated feature)
1. Add nullable UTC `PremiumExpiresAtUtc` to `AppUser`, plus `SubscriptionGrant` audit entity with immutable actor, learner, action, old/new entitlement, UTC timestamps, expiry, reason, and idempotency key.
2. Introduce a single `PremiumEntitlement.IsActive(user, nowUtc)` policy; active only when type is Premium AND expiry is null (explicit indefinite grant) or strictly later than now. Replace **both** existing string checks and all API subscription displays with effective entitlement, not raw persisted state.
3. Add Admin-only endpoints `PUT /api/admin/learners/{id}/subscription` with validated `Free|Premium`, optional UTC expiry, required reason and optimistic concurrency/idempotency; `GET /api/admin/learners/{id}/subscription-history` with paging. Never permit admin identity targets.
4. Update `GET /api/users/daily-quota` to return effective subscription, `PremiumExpiresAtUtc`, and `Unlimited`; preserve current API fields for clients.
5. Use a DB transaction for each grant/revoke and audit insertion. Ensure concurrent grants serialize, and expired grants never allow bypass.
6. Database rollout: generate and review an EF Core migration; take verified Supabase backup before applying; deploy backend before UI. Never run automatic production migration without explicit authorization.
7. Tests on disposable PostgreSQL: Free 10th/11th, premium unlimited, expiry boundary, revoke, admin-only 401/403, invalid expiry, concurrent grant, audit persistence, idempotent retry, no student progress deletion, and existing stage quota concurrency regression.
8. Web admin: add subscription control and history in learner detail with confirmation and AR/EN messages. Flutter and web student quota displays must use the same effective server entitlement.
9. Payment and coupon issuance remain separate follow-up work; never trust client-supplied premium flags.

## Release gates
- Build and disposable PostgreSQL integration tests pass.
- CI green and manual code review.
- Production backup verified, migration explicitly approved.
- Backend live verified before web/mobile rollout.
- No modifications to student attempt history or earned points.
