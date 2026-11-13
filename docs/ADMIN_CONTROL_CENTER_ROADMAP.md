# MathWorld Control Center — Admin is an operator, never a learner
Updated: 2026-11-13
Status: Phase 1 in PR; later phases are roadmap, not implemented.

## Product rules (binding decisions)
- Admin and Student are mutually exclusive account roles. Never reuse an Admin account for student solving, badges, progression, quota or leaderboard participation.
- Admin may inspect question/answer content to manage it; previewing questions must not increase student engagement/view metrics.
- API authorization is enforced on the server. Hiding Flutter/Next.js buttons is not a security boundary.
- Admin role may access identity and progress details for operational purposes. Student-facing leaderboards use anonymous aliases or consent-based opt-in public names only.
- Distinguish **all-time saved outcomes** (unique solved problems) from **activity in date windows** (attempts, distinct active students, correctness). CurrentStageId is current preference; historic attempts stay attached to the problem's actual stage.
- Count only users whose Role = Student in all student and activity statistics.
- No hard-coded admin identity or bypass of authentication. Admin account bootstrap/security operations require audited privileged workflows.

## Section 1 — Executive dashboard (phase 1, API groundwork)
Menu item: Admin > Analytics.
KPI tiles: students (exclude admins), active students in selected interval, problem inventory, unique saved solves, attempts, correctness rate.
Four stage cards, one per educational stage, with student stage selection counts, active users, problems, categories, solves, attempts and accuracy.
Timeframe: rolling UTC date window (7, 30, 90 days, with custom 1..365 query).
Drill into a stage for per-category activity, day-by-day chart, top 20 learners.
API: GET /api/admin/analytics/overview?days=30
API: GET /api/admin/analytics/stages/{stageId}?days=30
No new database tables, no destructive migration.

## Section 2 — Student management and support (next)
- Search/pagination/filter by stage, active status, tier, sign-in method, last activity, onboarding completion.
- Learner details: profile + membership, stage history, solved/attempted counts, retention, progress by category, score timeline, error notebook summary, slow/difficult topics.
- Account actions: disable/restore login, reset password link, verified account-linking assistance, change tier through an audited entitlement workflow.
- Exports for authorized admins only, CSV with scope/filters, downloadable with expiring access. Restrict personal information, no public emails or passwords.
- Progressive retention policy and user-requested deletion/consent handling; require separate confirmation for production deletes.
- Ability to remove *demo* student rows and associated activity without touching the sole active admin, stages, categories or problems. The cleanup is a one-off, audited maintenance operation, not a generic public API.

## Section 3 — Content health and learning quality
- Inventory: stage > category > problems. Missing/corrupt content, unsupported LaTeX, unbalanced correct choices, broken videos.
- Difficulty/quality analytics: per-question unique users, correct/wrong attempts, first-try correctness, average answer time, hint usage and reports.
- Identify abandoned topics, items frequently failed, unclear answer keys and missing content, editorial review queue.
- Bulk import CSV/Excel with preview, validation and versioned content. Immutable attempt snapshots; updates to attempted questions create revisions rather than rewriting history.
- Assign curriculum levels, tags, learning objectives, estimated difficulty, languages and optional prerequisite maps.
- Exclude admin previews from student views and training metrics.

## Section 4 — Gamification and honest leaderboards
- Reintroduce PointLedger after a tested/safe schema rollout; one unique solve credit per learner/question.
- Stage and category rankings, daily/weekly/monthly all calculated server-side.
- Rank by unique solved problems, earned points, first-try correctness, deterministic tie-break. Student nicknames or anonymized IDs by default.
- Admin dashboard can inspect legitimate score events, duplicate/replayed attempts, suspicious rapid submissions and manually reviewed score adjustments.
- Fairness: early-solution visibility for Premium cannot grant competitive solve credit for that item; track bonus features separately.
- Badges, streaks and school-level challenges are separate from paid access. Avoid pay-to-win ranking.

## Section 5 — Quotas and Premium
- Free: 10 **new** questions per UTC day (day boundary configurable transparently); retries do not consume a new slot.
- Premium: unlimited new questions, view explanations ahead of answer, saved progress, additional insights, but no unfair rank boost.
- Subscription audit: plan, period, activation, expiration, payment provider receipt/webhook, refund, grace period, anti-tampering. Never trust client flags.
- Admin can review active/trial/expired/refunded subscriptions, conversions, churn, recurring revenue and daily quota rejections.
- No processing card details inside MathWorld; hosted PCI-compliant provider.
- Release gating and manual test mode before using a real payment gateway.

## Section 6 — Operations, monitoring, safety and team
- Live status: API /health/live and /health/ready, schema drift, deploy version, uptime/latency, API 4xx/5xx, Render/Netlify/Supabase status and backup age.
- Security events: anomalous sign-in, locked users, repeated failures, role/permission changes, unusual point writes, suspicious API usage.
- Audit trail: who/when/what on category/question/student/account/plan/setting changes; append-only with readable diffs; approval for sensitive actions.
- Start with one owner Admin; later separate roles SuperAdmin, ContentManager, SupportAgent, Analyst (read-only), BillingManager. Least privilege and explicit permission matrix.
- Sensitive diagnostics restricted to admins and avoid exposing secrets in logs.
- Background jobs and incremental rollups as user population grows; build trend indexes and cache immutable snapshots.
- Reliable offsite backups with actual restore drills before launch.

## Release order
1. Enforce Student-only solving, journey, favorites & study workflows; preserve Admin profile and management endpoints. Add role regression tests.
2. Read-only Admin analytics API covering four stages and categories; CI tests with disposable PostgreSQL.
3. Next.js operator-only Analytics page, responsive AR/EN RTL/LTR, stage/time selectors and daily chart.
4. Mobile: do not expose admin controls to regular Flutter student UI. Admin manages from web console initially.
5. Reset demo learner accounts ONLY if useful: confirm sole Admin and active credentials; maintain 4 stages, 16 categories, 34 sample problems and question options. No need to delete now.
6. Restore-tested backup or explicit demo data-loss acceptance, then staged PointLedger migration and reintroduction of ranking code. Apply schema before Render deploy.
7. Implement daily quota + Premium, then advanced user/per-question drilldowns and operational tools.

## Metrics definitions
- SelectedStudents: Students with CurrentStageId equal to stage (may differ from stage of historical solves).
- ActiveStudentsInWindow: distinct Students who submitted >=1 attempt in the stage within the selected UTC window.
- UniqueSolved: count of UserProgress rows where IsSolved=true for Student users and problems in that stage; not unique individual students.
- AttemptsInWindow: saved ProblemAttempt rows for Student users in the UTC window.
- CorrectRatePercent: correct attempts / all attempts * 100; zero when no attempts.
- TopLearners: saved distinct correct solves by stage; tie-break by original awarded PointsEarned snapshots, then FirstAttemptCorrect, then UserId.
- Admin self-activity and question previews never increment student KPIs.
