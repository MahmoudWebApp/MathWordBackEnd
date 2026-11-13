# MathWorld master execution tracker — 2026-11-13

This file is the durable source of truth for continuation across conversations. Never mark an item DONE without commit/PR plus build/test evidence. Do not autonomously deploy, purchase services, activate checkout or change production databases.

## Decisions locked
- Hosting: Hostinger KVM 2 (2 vCPU, 8 GB RAM, 100 GB NVMe); VPS migration only after backups, load tests, DNS/cutover plan and approval.
- Budget: VPS, domain, Google Play publishing; no SMS and no extra paid services without approval.
- Notifications: PostgreSQL durable inbox + ASP.NET Core SignalR realtime web/foreground mobile + FCM mobile background/terminated push, transactional email only as necessary via free allowance/verified SMTP. No Firebase database or Firebase Auth requirement.
- Premium: implement now but checkout OFF at public launch. Admin grant/revoke finite or indefinite; promo codes 100% and discounts; trials, caps, audit, anti-abuse. Annual target USD 5; provider deferred until UAE vs Netherlands company setup decision.
- Security: server-enforced entitlements, admin MFA, CAPTCHA verified server-side, OAuth Google then Facebook, email verification/reset, rate limits, OWASP review, backups and restore drills.
- UI: bilingual RTL/LTR; geometric modern responsive web; Flutter branding, adaptive/monochrome launcher icon, splash; monochrome consistent SVG category icons across platforms.
- Content: add vetted categories and problems for each educational stage, bilingual mathematical review, no changes to historical category IDs.
- Geometry: structured diagrams for geometry, rays, angles, vectors, coordinate axes; static SVG first, interactive tools later; sanitized renderer and accessible alternatives.
- Student: stage onboarding, 10 new questions per stage per UTC day Free, unlimited Premium, reveal solution before answer for Premium, points/achievements/leaderboards, analytics, PDF/Excel export, no ads for Premium, tutors later.
- Payments: hosted checkout, verified webhooks, idempotency and reconciliation; disabled by feature flag until approved.
- Marketing: branded YouTube/TikTok/Facebook content, privacy/legal pages, staged launch; Meilisearch phase 2.

## Workstream tracker (status: NOT STARTED / IN PROGRESS / BLOCKED / DONE)
| ID | Workstream | Status | Evidence / next action |
|---|---|---|---|
| B01 | Premium backend expiry, admin grants, audit | IN PROGRESS | Draft backend PR #20; audited grants, expiry, bounded grant and auth tests committed; build/CI not verified |
| B02 | Backend regression, integration, migrations | BLOCKED | Manual workflow_dispatch enabled; need successful .NET and disposable PostgreSQL CI |
| B03 | Central server-side feature flags | NOT STARTED | Schema, admin API, audit, fail-closed defaults |
| B04 | Coupon/campaign redemption | NOT STARTED | Limits, locking, expiry, idempotency |
| B05 | Premium entitlements/exports/analytics | NOT STARTED | API + secure authorization |
| W01 | Next.js premium/admin settings | NOT STARTED | Admin campaigns, grants, history |
| W02 | Next.js geometric redesign and RTL | NOT STARTED | Design tokens, responsive/a11y review |
| W03 | Next.js SVG category icons | NOT STARTED | Icon registry and fallbacks |
| F01 | Flutter premium/quotas parity | NOT STARTED | API parity and regression |
| F02 | Flutter app launcher/adaptive icon/splash | NOT STARTED | Build validation Android/iOS where available |
| F03 | Flutter category icons and UI refresh | NOT STARTED | Bundled monochrome SVG assets |
| C01 | Stage category expansion | NOT STARTED | Curriculum mapping, idempotent migration |
| C02 | Reviewed math problem bank | NOT STARTED | Editorial validation, import preview |
| C03 | Geometry/rays/vectors diagrams | NOT STARTED | Versioned schema, renderers, tests |
| N01 | PostgreSQL notifications inbox | NOT STARTED | API, read state, pagination, preferences |
| N02 | SignalR authenticated realtime | NOT STARTED | Per-user groups, reconnect, auth |
| N03 | FCM mobile push | NOT STARTED | Device token lifecycle, consent, dedup |
| N04 | Transactional email | NOT STARTED | Sender validation, templates, queues, cap |
| S01 | Auth Google/Facebook | IN PROGRESS | Existing draft work; needs verification |
| S02 | CAPTCHA + rate limiting | NOT STARTED | Server token verification and fallback |
| S03 | Security hardening | NOT STARTED | OWASP, secrets, MFA, audit, scans |
| P01 | Payment provider abstraction | NOT STARTED | Country eligibility pending; checkout OFF |
| P02 | Promo launch strategy | NOT STARTED | Campaign budget and eligibility |
| I01 | Hostinger deployment architecture | NOT STARTED | Compose, proxy, HTTPS, monitoring |
| I02 | Backups, restore rehearsal, cutover | NOT STARTED | Explicit production approval required |
| Q01 | Full web/mobile/backend QA | NOT STARTED | Build, tests, load, security, RTL |
| M01 | Brand, launch content, store readiness | NOT STARTED | App listing, channels, policies |

## Dependency order
1. Stabilize B01/B02 and current app builds.
2. B03/B04 and N01/N02 in parallel after schema review.
3. W01/F01, N03/N04 and S02/S03.
4. W02/W03/F02/F03 and C01/C02; C03 follows diagram schema approval.
5. B05, P01 (OFF), I01/I02 and Q01.
6. M01, staging, rollout and post-launch monitoring.

## Reporting format for every implementation batch
Date; repository/branch/PR; exact files changed; behavior before/after; test commands/results; open blockers; security/cost impact; next task. No completion claim without verified evidence.

## Unresolved user decisions (do not block unrelated work)
- UAE or Netherlands legal business and payout setup.
- Official curriculum target by country/stage and number of problems per category.
- Hostinger server access and production migration approval at cutover time.
- Exact transactional email sending domain and quotas.

## Progress update — 2026-11-13 (batch)
- Backend draft PR #20: added manual GitHub Actions dispatch and expanded tests for bounded Premium grants, history authorization, invalid requests, idempotent grants and missing learner handling.
- PostgreSQL advisory lock SQL invocation corrected to a scalar query.
- Verified through GitHub file reads/commits only; no successful CI evidence available, no production changes.
- Next implementation gate: obtain CI logs and fix actual build/runtime failures before UI integration.

## Progress update — backend account enforcement
- Added active-account checks to StageDailyQuotaController and ProblemsController submission subscription query. Deactivated students cannot request daily quota or submit answers through these paths using an otherwise valid JWT.
- Scope: two backend controllers; committed to draft PR #20. Not verified by successful .NET CI; do not merge until verified.
