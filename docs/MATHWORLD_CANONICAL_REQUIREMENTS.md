# MathWorld — MASTER REQUIREMENTS AND ACCEPTANCE REGISTER
**Canonical requirements register • 2026-11-13 • approved scope consolidated from project conversations**

**Purpose:** single source of truth for every requested improvement, enhancement and development. Do not silently drop any item. This register documents **requirements**, not evidence of implementation. All changes require code + tests + verification before DONE. Read together with `MATHWORLD_MASTER_EXECUTION_TRACKER.md`, `MATHWORLD_FULL_STACK_LAUNCH_ROADMAP.md`, `NOTIFICATIONS_SVG_GEOMETRY_ZERO_COST_PLAN.md`, and `CURRICULUM_CATEGORY_AND_PROBLEM_EXPANSION_V1.md`.

## 0. Non-negotiable operating rules
- Backend ASP.NET Core, frontend Next.js, mobile Flutter, PostgreSQL Supabase currently; Render + Netlify free prelaunch; Meilisearch later. Preserve current working features, routes, IDs and learner progress.
- Execute in large, coherent batches; minimize repeated user approvals. Ask only for credentials, money, destructive/production actions, legal country/curriculum decisions, or other consequential choices.
- All development on branches/draft PRs with CI and rollback; do not merge, deploy, buy or change production data without authorization.
- Budget initially **VPS + domain + Google Play registration**. Avoid recurring paid services, SMS and unnecessary external providers. Do not assume VPS includes SMTP.
- Support Arabic RTL and English LTR throughout web, Flutter, API errors, math content and reports.
- Keep a verified status ledger: NOT STARTED / IN PROGRESS / BLOCKED / DONE, commit SHA, PR, tested commands/results, screenshots where relevant. Never confuse design docs with shipped features.

## 1. Student learning journey and content
- [ ] After login/onboarding student chooses educational stage; remember selection; switch stage without deleting any historical progress.
- [ ] Each stage has clearly organized categories, levels, problem lists, completion progress and visible learning journey; **minimum ten reviewed problems per level** as user requested, then grow curated bank per category.
- [ ] Free student: **10 NEW answered problems per stage per UTC day**; repeat/review prior problems without consuming new quota. Enforce on server and prevent races/abuse.
- [ ] Premium: unlimited new problems; reveal correct answer + detailed worked solution **before attempting**, server-authorized; access to advanced personal statistics, export Excel and PDF, no ads on web or app.
- [ ] Premium future: access to private math tutor contact/marketplace, gated OFF until moderation, verification and consent are ready.
- [ ] Points/XP, daily streaks, achievements, badges, stage/category completion, student rankings by stage, and admin leaderboard of most active solvers; fair scoring and anti-cheat.
- [ ] Student dashboard: personal performance, accuracy, attempts, improvement, time, strengths/weaknesses, error notebook, recommendations, historical charts, review scheduling.
- [ ] Category expansion across **all existing educational stages**; new bilingual categories and reviewed problem bank; do not renumber existing IDs. Seed/import must be idempotent and previewable, with validation and rollback.
- [ ] Every problem: bilingual statement/title, four distinct plausible answer options, exactly one correct, difficulty, correct math solution in both languages, explanation and optional video, topic/stage fit, deduplication, editorial review, copyright provenance.
- [ ] Problem quantity target and curriculum mapping are separate from daily quota. Draft catalogue and ten example problems live in `CURRICULUM_CATEGORY_AND_PROBLEM_EXPANSION_V1.md`; **not published**.
- [ ] Problem types: arithmetic, fractions, percentages, algebra, equations, geometry, functions, graphs, probability/statistics, trigonometry, coordinates/vectors, calculus and advanced levels appropriate to the actual stage; avoid claiming official national curriculum without selection.

## 2. Geometry inside questions — BOTH platforms (mandatory)
- [ ] Display actual mathematical **shapes and diagrams inside problem and solution UI** in Next.js and Flutter, not only text or generic decorative pictures.
- [ ] Include points, lines, line segments, rays, arrows/vectors, triangles, polygons, circles, angles, coordinate axes/grid, labels, dimensions, measurements and transformations.
- [ ] Shared versioned JSON scene contract with viewport, objects, givens, constraints and answer specification; safe validated finite coordinates; stable object IDs; alt descriptions Arabic/English.
- [ ] Web SVG renderer and Flutter CustomPainter/vector renderer consume identical fixtures and yield mathematically equivalent diagrams, scaling and labeling. Static diagrams first; interactive dragging/angle measurement and construction as later phase.
- [ ] Admin authoring preview, test of correctness and solution explanation; do not accept arbitrary executable SVG/scripts. Accessibility, keyboard alternatives and responsive canvas.
- [ ] Optional backward-compatible `ProblemDiagram` schema/migration after renderers and tests are ready; preserve all old problems.

## 3. Full visual identity and UI/UX — web + mobile parity
- [ ] Use approved new MathWorld logo everywhere: header, auth, app screens, favicon, social previews, Android/iOS launcher and splash. Match brand palette without inventing replacement logo.
- [ ] **Flutter OUTSIDE launcher icon** visible on phone home screen, Android adaptive foreground/background and round/monochrome icons, iOS icons where supported; fix black background around logo; test a **release APK** and screenshots on real Android themes.
- [ ] Unified clean modern geometric/math design tokens, typography, consistent outlined category icons, color, spacing, buttons, states, responsive layout, dark/light readability and accessibility.
- [ ] Same stage cards, category cards, problems, answers, geometry, quota, Premium status, achievements and navigation patterns on web and Flutter while respecting native ergonomics.
- [ ] SVG/category icon registry with same semantic keys on both platforms; support old emoji icon values until migrated safely. No hard-coded remote asset URLs or unsafe SVG.
- [ ] Correct Arabic RTL and English LTR, bilingual math layout, equation/LaTeX rendering, readable solution steps, empty/loading/error states, keyboard and screen-reader support.
- [ ] Inspect actual app/web pages and close visual inconsistencies; do not count UI redesign as complete just because styles or icons were proposed.

## 4. Premium, admin and payments
- [ ] Admin can grant, extend, expire or revoke Premium for any learner (indefinite or date-bounded) before paid checkout exists; audit actor, reason, previous/new state, date, history and idempotency.
- [ ] Student subscription status and privileges server-enforced; expired/disabled accounts must not bypass limits.
- [ ] Admin UI for subscription grants/history, learner filtering, plans, feature flags and campaign management.
- [ ] Annual Premium target **USD 5** (configurable); checkout **OFF** until company/payout country and payment provider confirmed (UAE vs Netherlands undecided).
- [ ] Discount/promo codes (percentage, fixed, 100%, free period), validity windows, per-user/global caps, eligibility, rate limits, redemption audit and concurrency-safe transactions.
- [ ] Payment gateway later: hosted checkout, verified webhooks, idempotency, refunds/reconciliation, no stored card numbers; never activate from redirect alone.
- [ ] Ads may be introduced later for Free users only; Premium is always ad-free; keep ads OFF until approved. Tutor contact future OFF.

## 5. Authentication, security, reliability
- [ ] Google sign-in and Facebook sign-in across platforms after platform account configuration, safe account linking, server-side verification and callback handling.
- [ ] Email verification, password reset, secure sessions/refresh, inactive account enforcement, abuse and bot protection (server-verified CAPTCHA such as Turnstile), rate limiting, audit logs and admin MFA.
- [ ] Least-privilege secrets, secure CORS/CSP/CSRF as relevant, dependency scans, privacy/legal pages, GDPR/local legal review as applicable, accessibility and localization QA.
- [ ] Automated CI for ASP.NET/PostgreSQL, Next.js and Flutter; integration, security, load, regression, schema drift, migrations, backups and restore rehearsals.
- [ ] Avoid backend/frontend/mobile DTO and endpoint drift; review contracts and maintain API compatibility.

## 6. Notifications and communication — zero added recurring cost
- [ ] Persistent PostgreSQL notification inbox, read/unread, pagination, preferences and admin events.
- [ ] **SignalR** self-hosted realtime for web and Flutter foreground; authenticated per-user groups, reconnect, safe authorization.
- [ ] **FCM only for mobile background/terminated push** (not Firebase Auth/DB); device token management, opt-in, deduplication.
- [ ] Transactional email via verified sender and free/available SMTP/provider allowance, throttled queue, retries, daily limits, SPF/DKIM/DMARC. Verify actual Hostinger entitlement; do not assume free SMTP.
- [ ] **No SMS** in initial release. No hidden paid dependencies.

## 7. Hosting, deployment and marketing
- [ ] Current: Render free API, Netlify web, Supabase free PostgreSQL. Future: Hostinger **KVM2** first (upgrade KVM4 only on measured need), domain purchased separately.
- [ ] Containerized VPS architecture, reverse proxy HTTPS, health checks, logs, resource monitoring, alerts, independent offsite encrypted backups, tested restore, DNS cutover and rollback.
- [ ] Migration of API/web/database only after tested staging and explicit approval; Flutter distributed via Google Play (and iOS later if chosen).
- [ ] Meilisearch search engine phase 2; avoid premature VPS complexity.
- [ ] Launch marketing: branded YouTube, TikTok and Facebook, videos, short stories, posts, launch announcements; app store listing/screenshots, privacy/terms/contact and user support.
- [ ] Google Play one-time registration cost; domain and VPS essential expenses; request approval for any new cost.

## 8. Evidence snapshot (as of 2026-11-13)
- Backend draft PR #20: Premium entitlement, quota, admin grants/audit, feature flags, early solution endpoint; **7/7** GitHub workflows green at commit `65b4e9a` (subsequent documentation commits do not imply new code test results).
- Web draft PR #18: entitlement and early solution integration; typecheck successful at `1d977545`. Full browser UX QA still pending.
- Flutter draft PR #12: Premium API client and reusable `PremiumSolutionPanel` committed `f671163a`, **not yet mounted in problem screen or Flutter build-tested**.
- Geometry renderer, launcher icon repair, full UI refresh, additional categories and question inserts, payments, notifications and VPS migration are **NOT DONE**.
- Do not claim the editorial catalogue is database content.

## 9. Required handoff protocol
Before implementing each batch: read this register + tracker + current code. After: update tracker with commits/tests and remaining items; never erase requests. If user says 'continue', choose the highest-value safe unfinished work without asking for repeated approval. For unresolved country/curriculum, continue code/fixtures without deploying unreviewed material.
