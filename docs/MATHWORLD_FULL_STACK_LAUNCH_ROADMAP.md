# MathWorld full-stack launch roadmap — 2026-11-13

Status: implementation plan; NOT proof of completion. No production deployment or migration without explicit approval and tested backups.

## Current implementation and release priorities — 17 November 2026

This roadmap started before the owner's last Free-access decision. **The outdated 10-new-questions-per-day proposal is cancelled**: Free learners have unlimited practice within exactly two admin-selected categories per educational stage.

| Priority | What remains | Why it is not closed |
| --- | --- | --- |
| P0 — before real launch | Independent educator review of **320** bilingual *draft* questions, correct answers and solutions; create/review the 16 proposed categories, approve import and publish only reviewed content | Draft CSV structural CI is not academic validation or database publication |
| P0 — real use | Owner-approved migration of backend feature schema with verified backup/restore and staging or equivalent isolated acceptance; check actual Free/Premium expiry/locked direct API calls, admin workflows and notifications | CI disposable Postgres tests pass; live production schema may not match |
| P0 — phone/web | Manual bilingual Android app icon/splash, 320px/large text, RTL math notation and PDF/XLSX viewing; iOS build/signing testing; web PWA/permissions | GitHub builds alone do not test a physical device |
| P1 — identity | Google/Facebook OAuth provider IDs, Android signing SHAs, correct redirects, session revocation/reset/verification, admin MFA and email infrastructure | Requires provider ownership/credentials and security acceptance |
| P1 — notifications | Background FCM/APNs push, consent/quiet hours and delivery logs; SSE in-app foreground is implemented | Push requires native credentials and device acceptance |
| P1 — engagement | Optional daily practice is implemented; **formal exams, tournaments, verified certificates and challenge admin blueprints** are *not* yet implemented | Need vetted question pool and fraud/grade validation before awards |
| Deferred | Live $5/year payment gateway, checkout webhooks, ads, tutor marketplace, Hostinger VPS/domain move, Meilisearch phase 2 | Separate owner decision and operational/security work |

**Build policy:** Continue batches on unmerged PR branches, then use the GitHub Actions full-stack workflow to build Backend, Next.js and Flutter Android from pinned reviewed commits. Do not imply a production deploy or database import.

## Launch policy
- Free access enabled. Premium entitlement and features developed now; paid checkout disabled by default.
- Server-owned flags: premiumFeaturesEnabled, premiumCheckoutEnabled, promoRedemptionEnabled, adsEnabled, smsEnabled, socialLoginGoogleEnabled, socialLoginFacebookEnabled. Admin updates audited; safe defaults, authorization enforced on API.
- Admin grants: finite expiry or indefinite; audit trail. Promotional entitlements independent of payments; no automatic billing or card required for free grants.
- Coupon model: unique normalized code, campaign, fixed/percent discount (0–100), free-duration grant, start/end UTC, global/per-user limits, eligibility, redemption transaction/locking, audit, revoke/disable, abuse limits. A 100% discount must not create a paid recurring charge.
- Annual Premium initial target $5 USD; configurable catalog and prices; taxes, currencies and payment-provider policy reviewed before checkout launch.

## Milestone 0 — correctness/security gate (BLOCKING)
- Verify backend PR #20 .NET build, migrations, PostgreSQL integration tests, concurrency, expiry, admin JWT claim mapping, API responses.
- Verify current frontend and Flutter builds, dependency audit and regression tests. Do not merge until green.
- Inventory secrets, rotate exposed credentials, least-privilege access, backups and restore drill, staging environment.

## Milestone 1 — entitlement and campaigns
- Backend feature flags, effective entitlements, admin API, promotions, idempotent redemption, audit and rate limits.
- Web admin settings, student Premium status and campaign management.
- Flutter same entitlement contract; Arabic/English parity.
- Test expired grants, concurrency, duplicate redemption, suspended accounts and rollback.

## Milestone 2 — student features
- Free: **exactly two admin-selected categories per educational stage, with unlimited problems and retries in those categories; no daily ten-question quota**. Premium: all categories, unlimited practice, early solutions and advanced reporting. Enforce access on the server.
- Premium unlimited, reveal-before-answer (secure solution API), progress analytics, PDF/Excel exports, no ads; future tutor messaging behind flag.
- Stage switching preserves progress; points ledger, achievements, leaderboard; anti-cheat and moderation.

## Milestone 3 — content and taxonomy
- Expand all educational stages/categories with curriculum mapping, bilingual labels, ordering and non-destructive migrations.
- Curated question bank per category with unique problem IDs, mathematically validated answers, solutions, difficulty, metadata and editorial review.
- Import pipeline with deduplication, preview, versioning and rollback; no bulk publishing unreviewed questions.

## Milestone 4 — visual design
- Web responsive geometric/math-themed visuals, clean readable layout, accessible contrast and reduced-motion support.
- Flutter launcher icon/adaptive icon/Android monochrome icon/iOS app icon, splash, branding; validate actual builds.
- Replace colorful category emoji with consistent modern monochrome SVG icon library (e.g. Lucide) on web; matching Flutter icon assets or equivalent outlined icon set; same category icon tokens.
- Arabic RTL and English LTR parity, responsive tests, keyboard and screen-reader checks.

## Milestone 5 — identity and security
- Google OAuth first; Facebook OAuth after verified app setup. Server-side token validation, account linking rules, safe email verification, secure refresh/session lifecycle.
- Password reset, verification mail, anti-enumeration, rate limits, bot defense using server-verified CAPTCHA (e.g. Turnstile), CSP, CORS, CSRF as applicable, secrets rotation, dependency scans, admin MFA, security logs.
- CAPTCHA only on risk-sensitive flows with accessible fallback; never trust client-side token alone.

## Milestone 6 — notifications
- Transactional email: verification, reset, security events, opt-in learning reminders. SMS initially optional for critical cases; explicit consent and regional regulations.
- Provider abstraction, verified sender domain SPF/DKIM/DMARC, queue, retries, templates, suppression/unsubscribe where required, delivery audit, spending caps and opt-out.
- No SMS for every daily reminder by default.

## Milestone 7 — payments (checkout OFF until launch)
- Evaluate Stripe Checkout/Billing if business entity/country and bank are supported; alternatives depend on verified legal residency, company, payout country and tax obligations.
- Hosted checkout, webhooks signature verification, idempotency, invoices/refunds, payment-state reconciliation, PCI scope minimization, no storage of card data.
- Never activate payment based solely on redirect success.

## Milestone 8 — Hostinger KVM2 migration
- Plan for 2 vCPU / 8 GB RAM / 100 GB NVMe / 8 TB transfer; measure actual utilization and load-test before deciding capacity.
- Docker compose with HTTPS reverse proxy, ASP.NET API, Next.js, PostgreSQL if moved, Redis only if justified; Flutter is distributed via app stores and only its API base URL changes.
- Supabase to VPS only after data migration and restore rehearsal; avoid split-brain; DNS TTL, staged cutover, rollback, offsite encrypted backups, monitoring, log rotation and alerts.
- Verify domain, TLS, transactional email domain, CORS origins, OAuth redirect URLs, webhook endpoints, app API endpoints, privacy policy and store links after cutover.
- No VPS access implied by screenshot; obtain authorized credentials/connectors when migration begins.

## Milestone 9 — release gate and reporting
- CI green for backend, web, Flutter; smoke tests, security review, accessibility, localization, load test, backups and rollback verified.
- Report each feature as DONE / IN PROGRESS / BLOCKED / NOT STARTED with commit/PR and test evidence. No unverified completion claims.

## Known baseline
- Backend PR #20 implements Premium expiry, audited admin grants, Free category access and optional UTC daily practice cards. GitHub Actions PostgreSQL integration suites passed on the reviewed feature commit; no production deployment, stage-data acceptance or educator publication has been approved.
- Web PR #18 and Flutter PR #12 implement stage journey, category entitlement and daily practice UI, plus notifications, progress and Premium reporting. Recheck the latest GitHub Actions SHAs before approval; a passed build is not a physical-device acceptance or store signing.
- Meilisearch phase 2. Tutors phase 2. Paid checkout OFF at launch.

## User decisions required later
- Legal country of business and payment payouts, domain, notification sending domain, SMS target countries, launch date, and Hostinger server credentials when migration is authorized.
