> **ADDITIONAL LOCKED DECISIONS — 2026-11-13:** Free unlocks exactly **two categories in EACH educational stage** by default, admin-selectable, with unlimited daily problem attempts inside unlocked categories. Premium unlocks every category. The legacy 10-per-day quota must be removed **only together with backend category access enforcement**. Later, optionally offer consent-based **rewarded ads to unlock individual otherwise-locked problems** with server-side temporary entitlements, age/privacy and ad-network policy checks, caps and anti-abuse; no ads for Premium and **Ads OFF until reviewed and approved**. Marketing, technical SEO, content SEO, Search Console, analytics, CAPTCHA server validation and launch readiness are mandatory workstreams, not optional post-launch notes.\n\n> **LATEST DECISIONS OVERRIDE OLDER ENTRIES BELOW (2026-11-13):** The Free 10-new-questions/day quota is CANCELLED. Free has unlimited attempts in admin-configurable unlocked categories (initial target: two per stage); Premium has unlimited attempts in all categories. Student groups have CONFIGURABLE size, not a fixed ten. Earlier tracker lines mentioning the daily quota are historical implementation evidence, NOT current requirements. See [category-access policy](MATHWORLD_CATEGORY_ACCESS_AND_EVERGREEN_MEDIA_POLICY.md).

> **Canonical full scope:** [MATHWORLD_CANONICAL_REQUIREMENTS.md](MATHWORLD_CANONICAL_REQUIREMENTS.md). Before starting any new implementation batch, read this file; it consolidates all user-requested features including geometry, Flutter launcher logo, full UI parity, new categories/problems, Premium, notifications, security, launch and zero-extra-cost policy. This tracker records execution status only; no requirement may be dropped because it is absent from a short sprint list.

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
| B03 | Central server-side feature flags | IN PROGRESS | Fail-closed config service and read-only public API committed; persistence/admin UI/audit not yet built; CI unverified |
| B04 | Coupon/campaign redemption | NOT STARTED | Limits, locking, expiry, idempotency |
| B05 | Premium entitlements/exports/analytics | IN PROGRESS | Student entitlement snapshot API and tests committed; export/analytics enforcement still pending; CI unverified |
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

## Progress update — launch flags foundation
- Added Services/LaunchFeatureFlags.cs, DI registration in Program.cs, and Controllers/PublicFeaturesController.cs exposing GET /api/config/features.
- Flags default false: PaidCheckout, CouponRedemption, TutorMarketplace, Ads, GeometryInteractive, Notifications. Environment config can set Features__<Name>; clients must not treat flags as authorization.
- Added disposable-DB integration assertions for safe defaults. Backend build and tests have not been run successfully yet.

## Progress update — student entitlement API
- New GET /api/users/subscription requires authenticated active Student, returns effective Free/Premium, expiry, daily limit, solution-preview and analytics-export capability flags, and ads eligibility (also gated by AdsEnabled).
- Added integration coverage for unauthorized/admin, Free, Premium and expired Premium, and updated CI path filters.
- IMPORTANT: CanRevealSolutionBeforeAnswer and CanExportAnalytics are entitlement hints only; corresponding feature APIs must enforce authorization separately before launch.
- Code committed to draft backend PR #20; no successful .NET build or integration run confirmed.

## Verified execution checkpoint — 2026-11-13 (latest)
- Backend commit 65b4e9a: **7/7 GitHub Actions workflows passed** (build, quota, PostgreSQL integrity, journey, admin segregation, admin insights, schema drift). PR #20 remains draft; no production deployment.
- Next.js draft PR #18: student subscription and lazy Premium solution queries wired into RTK Query; early reveal button in `src/app/[locale]/problems/[id]/page.tsx`, visible only when server entitlement allows it. Web student stage typecheck passed for commit 1d977545. UI/behavioral QA still required.
- Flutter draft PR #12: `lib/services/premium_api_service.dart` and reusable `lib/widgets/premium_solution_panel.dart` committed (f671163a). **Not yet mounted into the actual problem detail screen, nor build-tested.**
- Explicit user reminder: **do not forget full UI refresh, new educational-stage categories, and additional reviewed math problems.** These remain required workstreams W02/W03/F03/C01/C02/C03; do not mark them complete just because Premium API is ready.
- Content acceptance: preserve existing category identifiers and learner history; prepare additive category migration; write bilingual problem statements, plausible distractors, correct-option proof and detailed worked solutions; check stage suitability and duplicate questions; keep free tier 10 new problems per stage per day (not 10 total questions in the bank). No unreviewed auto-generated problems released publicly.
- Visual acceptance: web/mobile feature parity, logo-based tokens, Arabic RTL and English LTR, responsive layouts, consistent category iconography, accessible math typography and solution rendering; avoid disrupting existing working journeys.
- Immediate order: wire and test Flutter Premium panel; admin grant/history UI; reviewed category and question seed pipeline; web/mobile visual parity; end-to-end QA. Country-specific curriculum remains unresolved, so stage/category additions must be explicitly mapped and reviewed before publication.

## Non-negotiable visual and geometry acceptance criteria — explicit user reconfirmation
- **Interactive geometry is a first-class learning feature, not a decorative image:** implement structured diagrams in BOTH Next.js and Flutter for triangle, circle, angles, rays, vectors, line segments, axes/coordinates, labels, measurements and accessibility descriptions. Use a shared versioned JSON diagram contract with deterministic scaling and RTL-aware labels; support static render first and interactive measurement/manipulation later. Test parity with the same fixtures across platforms.
- **Full visual refresh** must cover stage/category cards, question/answer layouts, mathematical typesetting, geometry canvas, progress/achievements, premium state and responsive mobile/desktop layouts. Preserve bilingual Arabic RTL and English LTR and the established logo palette.
- **Flutter external launcher logo is required**, not merely an in-app logo. Android adaptive icon foreground/background and monochrome variant, round launcher, splash, and available iOS icon assets must derive from the approved logo. Verify no black rectangle/background behind the mark on Android; test on a release APK.
- Do not mark W02/W03/F02/F03/C03 DONE without actual code/assets, screenshots or build checks, and review. Do not claim these items shipped while they are still documentation-only.
- These items are explicitly user-requested and must remain visible in every final release-readiness report, alongside new categories and reviewed problems.

## Updated execution priorities — 2026-11-13 (supersedes historical ordering)
Status below reflects confirmed implementation scope, not production completion.
1. **P0 — Category entitlements:** replace legacy StageDailyQuota enforcement with server-validated Free category unlocks and Premium all-category access; make initial two free categories per stage admin-configurable; protect list/details/answers/progress/search, preserve history, update API contracts and web/Flutter clients. **NOT DONE**.
2. **P0 — Flexible learning groups:** Stage -> Category -> ordered groups with variable editor-set problem counts; stable group/problem IDs; Continue Journey, completion and accessible locked states. **NOT DONE**.
3. **P0 — Practice longevity:** retry, mistake review, spaced review, mixed challenges, honest exhaustion handling, first-attempt vs retry analytics, no repeat XP farming. **NOT DONE**.
4. **P0 — Curated math bank:** stage/category curriculum coverage, editorial import/approval, bilingual correctness, deduplication, question-type taxonomy and additive publication. Existing DB baseline 16 categories / 34 problems as checked on 2026-11-13; target thousands of vetted questions over successive batches, not unreviewed padding. Import preview exists; publishing workflow remains **NOT DONE**.
5. **P1 — YouTube linkage:** optional videos at category, problem-type and selective individual-problem levels, reusable link metadata and future evergreen annual production calendar. No forced viewing. **NOT DONE**.
6. **P1 — Premium/commercial:** expiry and manual admin grants have partial backend support; mount admin UI, 100%-off launch campaigns, discount codes, purchase webhooks and refunds; checkout remains OFF until legal/provider approval. **PARTIAL**.
7. **P1 — Learning insights:** learner/admin analytics, leaderboards, PDFs/Excel, achievement integrity and reporting. **PARTIAL / NOT DONE**.
8. **P1 — Web/Flutter design parity:** logo, launcher/splash, stage/category icons, geometry diagrams, bilingual RTL/LTR, accessible math; some foundation code exists, full QA **NOT DONE**.
9. **P1 — Auth and communications:** Google/Facebook OAuth, CAPTCHA/rate limits, admin MFA, durable notifications, SignalR, FCM, verified email. **PARTIAL / NOT DONE**.
10. **P0 RELEASE GATE — Reliability:** CI/builds, authorization and regression tests, migration/staging, load testing, security review, independent backups and restore drill, monitoring, VPS cutover only with explicit approval. **NOT DONE**.

**Execution order:** P0 category access -> P0 groups/journey -> P0 review and editorial workflow -> P1 media linkage and parity -> commercial/auth/notifications -> release QA. Media publishing calendar (12+ months) is a separate post-product-readiness workstream, not a 12-month engineering schedule.

**User-facing access acceptance:** Free student can solve more than ten questions in one day inside an unlocked category; cannot access a locked category via direct API; Premium can access all categories; group sizes vary; expired Premium preserves progress; no daily quota blocks attempts.

## Implementation checkpoint — free category read catalog (2026-11-13)
- Added `Services/CategoryAccessPolicy.cs` (pure category access helper, two Free categories per stage by default, variable-sized groups).
- Added `Controllers/StageCategoryAccessController.cs` GET `/api/stages/{stageId}/free-categories` with optional temporary `FreeCategoryAccess:Stages:{stageId}` comma-separated category IDs and fail-closed invalid configuration.
- **Important:** This read-only endpoint is NOT access enforcement. Old daily quota enforcement still exists. Do not deploy the new policy as complete until backend problem list/search/detail/submit and other read paths enforce it atomically, old quota is removed, web/Flutter updated, and tests pass.
- No build, CI, database migration or deployment verified for this batch.

## Implementation checkpoint — category guards on problem endpoints (2026-11-13)
- ProblemsController: removed the daily new-problem answer rejection, added category checks to PostgreSQL search, problem detail, answer submission and attempt history. MeiliSearch paths fall back to PostgreSQL while the external index lacks entitlement-aware filtering. Legacy daily-quota API now returns unlimited; student subscription reports null daily cap.
- Free access is currently resolved from the first two categories per stage or temporary server configuration. Premium sees all categories. No rewarded-ad unlocks are active.
- **NOT RELEASE READY:** no verified .NET build/integration run for this commit; old quota-based CI assertions need replacement; full audit of other controllers (progress, category list, diagrams, related recommendations, analytics) remains; admin-editable persisted category selection and tests remain; web/Flutter clients not yet updated. Treat these as security blockers before merging/deploying.

## Implementation checkpoint — geometry category guard
- Added Free/Premium category access validation to `GET /api/problems/{problemId}/diagram` so a locked problem's geometry JSON is not publicly retrievable. Commit d894458.
- **Open blockers:** authorization logic currently duplicated between controllers; refactor into shared scoped service before launch; audit all remaining API endpoints; implement persisted admin-configured free categories; add integration tests, verify build/CI, and update web/Flutter. Do not merge as production-ready until security gates pass.

## Implementation checkpoint — shared entitlement service
- Added `Services/ProblemCategoryAccessService.cs`, registered in `Program.cs`, and switched ProblemsController, ProblemDiagramsController and StageCategoryAccessController to the same Free/Premium category resolver.
- **Not verified:** no build or integration tests completed; GitHub workflow runs for the latest commit were not found. All remaining controllers and search response shapes need security review. Configuration-based stage choices remain temporary, and invalid configuration currently fails closed. Rewarded ads, SEO, CAPTCHA and marketing stay tracked separately.

## Security review checkpoint — category list and official attempts
- Guarded `GET /api/categories/{id}/problems` via shared `ProblemCategoryAccessService`; category names remain public but locked problem previews are forbidden.
- Restored `isOfficialAttempt = progress.Attempts == 0` in `ProblemsController.SubmitAnswer` after old quota removal; first-attempt XP behavior depends on it.
- Unrestricted Admin category access now requires authenticated identity.
- **Build not yet verified.** Audit remaining student/progress/analytics controllers, eliminate unsafe anonymous data disclosures, add entitlement integration tests and CI verification before merge.

## Implementation checkpoint — journey lock indicators and favorites guard
- `StageCategoryProgressDto.IsLocked` is now populated by `LearningJourneyController` using shared entitlement service. Historical progress is retained when a category becomes locked.
- `UsersController.ToggleFavorite` now blocks mutations on inaccessible categories. Existing historical favorites and progress remain stored.
- **Remaining:** web and Flutter must render locked categories; verify all user read endpoints for content leakage; add tests and verify build/CI; implement persistent admin choice and secure ad unlocks only after compliance review.

## Implementation checkpoint — student account read-path restrictions
- `UsersController`: filtered favorites, solved problems, error notebook and dashboard statistics/recent previews by current category entitlements. Historical records remain in storage; access restrictions apply at query time.
- **Product decision to revisit:** dashboard summary statistics now reflect accessible categories rather than all historical achievements; a separate lifetime summary may be needed for expired Premium subscribers without exposing locked content.
- **Security/QA blockers:** audit error-notebook archive/favorite-check and other mutation endpoints, test EF query translation, build and CI; persisted admin category selections, client changes, SEO/CAPTCHA and rewarded ad unlocks are not done.

## Security checkpoint — notebook mutations and answer validation order
- Guarded `PUT /api/users/error-notebook/{problemId}/archive` and `GET /api/users/favorite/check/{problemId}` using category entitlements.
- In `POST /api/problems/submit-answer`, category authorization now runs before validating submitted answer-option IDs or reading correctness; locked questions return a uniform category-locked response.
- **Not yet verified:** compile, tests and runtime integration; audit all remaining endpoints and stage/category consistency; admin persisted configuration and web/mobile integration remain outstanding.

## Security checkpoint — category/stage consistency
- Added overload of `ProblemCategoryAccessService.CanReadProblemAsync` validating `Category.StageId == MathProblem.StageId` before granting access.
- Applied it to problem detail, answer submission and geometry diagrams; category listings and PostgreSQL search now exclude mismatched-stage problems.
- **Outstanding:** other user read paths may still include legacy mismatched records; add DB constraint/data repair after assessing existing records; verify build and tests, complete persistent admin configuration and web/Flutter integration.

## Implementation checkpoint — data consistency and verified admin
- `UsersController` student-facing dashboard/list queries exclude problem rows whose category belongs to a different stage.
- `LearningJourneyController` inventory and progress aggregation now exclude stage/category-inconsistent problems.
- `ProblemCategoryAccessService` now validates active admin identity against the Users table before unrestricted access; stale admin JWT claims alone are insufficient.
- **Still unverified:** compilation, EF Core query translation and integration tests. Complete remaining controller audit, persistent admin selection, web/mobile UI and CI before production merge.

## Security checkpoint — principal validation and student mutations
- An authenticated identity without a user ID is now denied category access; unauthenticated ID claims cannot grant student or admin entitlements.
- Favorite mutations, favorite checks and error-notebook archive mutations now require a consistent stage/category association for the target problem.
- **Verification still needed:** build and integration tests, especially anonymous catalog access, inactive accounts, malformed JWT claims and inconsistent historical records. No production deploy performed.

## CI checkpoint — .NET 9 build and policy smoke tests
- Added `.github/workflows/backend-build.yml` to restore and build the backend on premium branch pushes and relevant pull requests.
- Added `tests/MathWorld.PolicySmoke` as a dependency-free executable policy check for default/configured Free categories, invalid stage configuration, and positive journey group sizes; CI runs it after compilation.
- Excluded test sources from the web application's default compile glob in `MathWorldAPI.csproj`.
- **Execution status:** no successful workflow run has been observed; local environment lacks the .NET SDK. These changes are committed but must be verified in GitHub Actions before merge. No production deployment.
