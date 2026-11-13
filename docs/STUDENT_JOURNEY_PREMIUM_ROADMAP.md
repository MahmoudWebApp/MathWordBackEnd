# MathWorld — Student Journey, Rankings, Social Login & Premium Roadmap

Status: **proposed product and technical architecture**. No migrations, payment
collection, quotas, or OAuth onboarding are activated by this document.

## Product goal

Every student has one MathWorld identity (email/password, Google, or Facebook),
selects a learning stage on first login, sees an accurate stage-specific journey,
solves exercises, earns fair credit and optionally subscribes for unlimited daily
practice and solution previews. Admins can track genuine progress and view rankings
by stage. The same rules must apply in Next.js and Flutter because the ASP.NET Core
backend is the single source of truth.

Existing baseline:
- EducationalStage, Category, MathProblem.StageId, UserProgress, ProblemAttempt.
- First attempt is tracked as official, later attempts are training.
- AppUser.SubscriptionType is currently a string (not verified billing entitlement).
- Profile/dashboard totals currently derive from current problem data, which needs
  care when editing problems and adding preview-based or historical scoring.
- Backend has Google/Facebook social endpoints; both web and mobile OAuth UX still
  require full integration and secure account-linking review.
- No trustworthy daily quota, subscription billing record, stage enrollment,
  stage-scoped leaderboard, or preview-entitlement audit is implemented yet.

## Sequenced releases

| Phase | Scope | Backend acceptance gate | Web and Flutter |
| --- | --- | --- | --- |
| 0 — Stability | Protect question history, fix concurrent attempt scoring, validate backups/observability | Deterministic integration tests; no lost attempts, points or history | No breaking changes |
| 1 — Stage onboarding | Save current stage and stage-specific learner progress | Idempotent selection and valid stage IDs; existing accounts preserved | First-login stage chooser, profile stage switch |
| 2 — Fair progress and rank | Stage completion, stage-scoped solved counts, points ledger, ranking read models | Only genuine eligible solves counted once; rank cannot be gamed by retries | Journey dashboard, stage leaderboard, admin insights |
| 3 — Free quota and entitlements | 10 new problems per day; unlimited for paid entitlement | Atomic quota enforcement at answer-submission gate; concurrent requests cannot exceed 10 | Remaining quota, reset clock, upgrade prompt |
| 4 — Social login | Google and Facebook on web and Flutter | Verify provider identities; safe account linking; one MathWorld user | Login/register buttons + signed-in onboarding |
| 5 — Payments and premium preview | Verified subscriptions, unlimited problems, preview before solving | Verified payment webhooks, expiry/refunds; paid access backend-only | Subscription screens and preview UI |
| 6 — Engagement and scale | Reminders, review sessions, insights, badges, large leaderboards | Performance indexes, privacy, monitoring, load tests | Personalized study plan and challenges |

Phases 1–4 may have parallel frontend/backend tasks, but Phase 5 must not sell
benefits until the entitlement and anti-cheating policies are tested.

## 1. Stage selection and learner journey

- One-time first-login onboarding if `AppUser.CurrentStageId` is null; not on
  **every** login. Existing users without a stage are prompted to choose.
- The student can deliberately change current stage from their profile, without
  deleting other stage progress or losing points already earned.
- Questions have their own `MathProblem.StageId`; rankings and progress are
  calculated from the **question's stage**, not blindly from current profile stage.
- Stage progression: TotalPublishedQuestions, UniqueAttempted, UniqueSolved,
  FirstTryCorrect, Mastered, progress percentage, achievements.
- "Stage completed" achievement has a timestamp and snapshot of published-content
  revision/count: adding questions later must not revoke an earned historic badge.
  Live completion percentage can still update as content grows.
- Introduce problem publication lifecycle (`Draft | Published | Archived`)
  before scaling content imports and stage completion.
- Proposed endpoints:
  - `GET /api/stages` (already exists)
  - `GET /api/users/learning-stage`
  - `PUT /api/users/learning-stage` with validated StageId
  - `GET /api/users/journey?stageId=...`
  - Extend `GET /api/users/dashboard` additively for active stage summary
- Stage picker must support localized Arabic/English and persist across web/mobile.

## 2. Rankings, earned points and fairness

- Default leaderboard: **unique legitimately solved problems in one stage**.
  Tie-breakers: earned competitive points, then first-attempt correctness; never
  count total retry requests as "more problems solved".
- Show all-time and weekly/monthly time windows; scores from timestamps of
  **eligible** solve events, not a changing current problem-point value.
- Student sees their own rank, nickname and opt-in public leaderboard display;
  admin sees detailed aggregate per stage and period, with access control.
  Do not publish real names/emails for minors by default.
- Store immutable scoring events, e.g. `PointLedger(UserId, ProblemId, StageId,
  AttemptId, Reason, Points, AwardedAt)` and a unique constraint for each
  awardable competitive event (one solve credit/problem/user). Recalculate
  leaderboards from ledger/read model; avoid mutable in-memory counters.
- A problem must not grant a second competitive award after a successful solve.
- Current behavior grants points on the first **correct** solve, even after an
  earlier wrong official attempt. Preserve that until explicit product decision.
  Continue storing first-try accuracy independently for skill analytics.
- Previewing the solution before a qualifying attempt must not create points or
  competitive leaderboard credit for that question (practice remains possible).
  This is essential to prevent a paid competitive advantage.
- Paid vs free can share the same skill leaderboard only if contest modes apply
  the **same rules and eligible question set**. Because premium unlocks unlimited
  daily questions, prefer a **separate, equal-cap daily challenge leaderboard** for
  competitive rankings and a non-competitive stage progress view for general use.
- For an early release, leaderboard pagination and indexes may be enough; move
  ranking aggregates to cached read models only after profiling.

## 3. Daily 10-question free quota

### Recommended definition

A free learner can submit first official attempts on **10 distinct new problems
per UTC calendar day**, across the entire account, stage-independent. A wrong
first answer consumes one slot, so requests cannot test answers for free until
correct. Training retries of previously attempted problems and spaced review
of older problems are allowed, without consuming extra slots; rewards remain
governed by unique-solve and fair-scoring policy.

The limit is enforced on the **server inside the same transaction** that
persists the first attempt. It is never a React/Flutter-only count. A repeated,
duplicated or concurrent submission of the same first attempt consumes exactly
one slot; submission requests use a client-generated idempotency key to
differentiate retry from a genuine additional practice attempt.

Implementation candidates:
- `DailyUsage(UserId, UtcDate, NewProblemCount)` with unique (UserId,UtcDate)
  and atomic increment conditional on `NewProblemCount < 10`.
- `AttemptIdempotency(UserId, RequestKey, PayloadHash, ResultSnapshot)` with
  unique key, robust to network retries and multiple API instances.
- Check active subscription entitlement under the same transaction before
  quota write; define refund/expiry behavior.
- Keep a stable reset rule of 00:00 UTC for MVP; show the next reset in the
  user's local time. If later switching to user-configured timezone, persist
  and restrict timezone changes to avoid quota reset exploitation.
- Send `DailyQuotaStatus { limit:10, used, remaining, resetAtUtc, unlimited }`
  from API; offer a clear "Upgrade" prompt only when appropriate.
- Endpoint `GET /api/users/daily-quota`. Enforce in `POST /api/problems/submit`;
  add dedicated localized error `DailyQuestionLimitReached` as HTTP 403
  (or documented equivalent).
- Be careful that "ten first attempts" differs from "ten questions opened":
  browsing, searching, favorites, and opening a question should not spend a slot.
- Ensure enough published problems exist in each stage; audit inventory before
  turning this restriction on.

## 4. Premium subscription and preview permissions

Do not use the user-editable string `SubscriptionType` as the sole payment
authorization. It is useful for display, but the backend must derive benefits
from validated server-side entitlements:
- `SubscriptionPlan(PlanCode, Features, PriceRef, Enabled)`
- `UserSubscription(UserId, Provider, ExternalSubscriptionId, Status,
  CurrentPeriodEnd, CancelAtPeriodEnd)`
- `BillingEvent(Provider, ProviderEventId, EventType, VerifiedAt, PayloadHash)`
  with unique provider event IDs and replay-safe webhook processing.
- `EntitlementResolver` returns e.g. `daily_new_questions_limit` and
  `preview_solution_before_attempt`, used by both apps.
- Prefer a flexible feature/entitlement contract over hard-coded scattered
  `SubscriptionType == "Premium"` checks.
- A premium user may view **worked solution and video before trying** through a
  separate authorized endpoint `POST /api/problems/{id}/preview-solution`.
  Record `SolutionPreview(UserId, ProblemId, ViewedAt)` before sending the
  solution. Any subsequent answer to that problem is training-only for ranking
  and competitive points; preserve study progress.
- Existing normal student API must never expose answers/solution flags before
  conditions are met.
- Payment provider choice is deferred until the business registration/payment
  region and intended distribution channels are known. Google Play and Apple
  may require their in-app billing for digital subscriptions, subject to
  platform-specific regional exceptions and programs.
- Payment callbacks must be verified at the server; canceled/refunded/expired
  benefits are revoked by backend after relevant policy/grace period.
- Show transparent renewal, cancellation and access information. Test renewal,
  grace, canceled, refunded, expired, duplicate events, out-of-order events.

## 5. Google and Facebook sign-in (web + Flutter)

- Reuse `SocialAuthController` and `SocialAuthService` after review rather
  than introduce a second user table or migrate identity providers.
- Google web: Google Identity Services; Android: official Google Sign-In,
  configured with debug/release SHA keys, client IDs; iOS separate client.
- Facebook: Meta Developer app/permissions; web SDK and appropriate Flutter
  login integration. Development testing uses registered app roles.
- Backend verifies provider token, audience/app ID, issuer/expiry where
  applicable, and stable provider user ID; then issues own MathWorld JWT.
- **Do not auto-link accounts solely by same email.** Linking a provider to an
  existing identity requires an authenticated explicit link or equally secure
  verified account-ownership step. Facebook email can be missing/unverified.
- One user/account and one set of attempts, points, subscription entitlements,
  stage selection and progress across web, Android and iOS.
- Credentials and provider secrets only in secure server configuration.
- Mobile sign-out, token storage and account switching need explicit tests.
- Before iOS release review any App Store rules about third-party login choices.

## 6. Admin analytics

Admin dashboard filters by educational stage and time window:
- Registered/active/returning learners, unique attempted/solved question counts,
  eligible points, first-try accuracy, completion distribution.
- Top learners by **unique solved questions** in stage; separate first-try skill
  and weekly equal-limit challenge scores.
- Daily quota usage distribution; premium active / expiring / canceled; conversion,
  webhook failures. Avoid revealing sensitive payment information.
- `GET /api/admin/stages/{stageId}/analytics`
- `GET /api/admin/stages/{stageId}/leaderboard?period=weekly|monthly|all`
- Never send unbounded rankings or PII to non-admins.

## 7. Architecture and scalability principles

- Stay modular monolith on ASP.NET Core and PostgreSQL for now. Modularize
  `Identity`, `Learning`, `Scoring`, `Entitlements`, `Billing` and `Analytics`
  as services, not microservices.
- Transactions, unique indexes and idempotency at the database layer. Avoid
  in-memory locks/counts that fail after horizontal scaling.
- API DTO contracts shared/documented; additive changes wherever possible so
  Next.js and Flutter can deploy independently.
- OpenTelemetry request traces, correlation IDs, structured logs; watch quota
  rejection rates, leaderboard query latency, billing webhook failures,
  OAuth failures, and stage completion job delays. Alert owners.
- Version migrations; stage and payment changes require backups plus reversible
  rollout. CI must test concurrency, failure/retry, auth, and entitlements.
- Do not block regular learning when an external leaderboard cache fails.
- Never collect or publicly expose minors' real names/PII unnecessarily.

## Release acceptance tests

1. New email, Google, and Facebook learners land in stage onboarding once;
   existing users retain old progress and can switch stage without reset.
2. First 10 distinct free questions/UTC day are allowed; the 11th first attempt
   is denied; retries of already-attempted questions remain possible.
3. Parallel 10th/11th submissions cannot exceed quota across API instances.
4. Duplicate request key cannot award twice or consume two quota slots.
5. Premium users have unlimited first attempts; expiry/refund restores quota.
6. Preview-before-solve is paid-only; previewing records an audit event and
   prevents competitive scoring for that problem.
7. Leaderboard is stage-scoped, stable, privacy-safe, and independent from
   retries/changes to currently selected stage.
8. Admin edit/delete cannot destroy historical scores, attempts, favorites,
   or earned stage-completion achievements.
9. Same student shows identical stage, points, subscription, and daily quota
   on web and Flutter.
10. CI includes PostgreSQL-backed concurrency tests and auth/entitlement
    integration tests; no live data touched by tests.

## Next implementation task

Finish the existing standalone problem-history/concurrency branch with
PostgreSQL-backed tests **before merging it**. In parallel, prepare Phase 1 schema
and API contract for stage onboarding. Do not enable new quotas or payment gates
on production until inventory, UX, and entitlement validation are ready.
