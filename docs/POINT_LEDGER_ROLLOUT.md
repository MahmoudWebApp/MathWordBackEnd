# MathWorld: Immutable point ledger and stage leaderboard — rollout gate

Status: draft implementation. Do NOT deploy before tested migration/backfill and a verified database backup.

## Compatibility
- Retains POST /api/problems/submit response and existing first-correct-solve points rule.
- First correct solve per user/problem (even zero points) creates a unique solve-credit event in the same transaction.
- Retries and duplicate concurrent requests do not produce a second award.
- Historical backfill reads ProblemAttempts.PointsEarned and UserProgresses.IsSolved, not the current mutable Problems.Points.
- Public student leaderboard returns anonymous placeholders and the viewer's own rank; admin-only endpoint includes user identifiers and names.
- Weekly ranking starts Monday 00:00 UTC; monthly ranking starts day 1 at 00:00 UTC. General stage leaderboard is for learning progress; a fair daily challenge will be separate from Premium.

## Release sequence — production safety
1. Verify a RESTORE-TESTED backup or a trusted point-in-time recovery path for MathWorldDB; record a rollback plan.
2. On a disposable PostgreSQL database run GitHub Actions build/integration tests and verify migrations, existing login and stage journey still work.
3. Read-only preflight on production:
   - count existing positive awards, duplicates per (UserId,ProblemId), solved users without positive awards, total award amount.
   - check all solved progress rows can be mapped to a correct attempt.
4. Apply EF migration 20261113130000_AddPointLedger to the backed-up database before publishing the new backend. This migration creates only the ledger/indexes, backfills history, enables RLS, and does not modify old attempts.
5. Post-migration read-only reconciliation: compare ledger rows and sum with expected saved attempts, plus an audit of zero-point solves. Confirm unique award indexes and RLS.
6. Only then merge/publish this backend PR. Render readiness checks pending migrations, so deploying first is expected to return 503.
7. Verify /health/ready, email/password and Google account login, /api/users/profile and dashboard, stage journey, submit, both leaderboard endpoints. Track 5xx/409 anomalies. Never execute destructive end-to-end tests on production.
8. The existing Next.js and Flutter clients remain compatible without changes. Add UI in separate PRs after this API is live.

## Rollback
- Code can return to the old release while the additive ledger table remains.
- Do NOT apply the Down migration to the live database after earning any credits; dropping the table destroys immutable scores.
- Reconcile and backfill with an approved repair script if historic data differs; do not guess missing points.

## API contract
- GET /api/users/leaderboard?stageId=<id>&period=all|weekly|monthly&page=1&pageSize=20 (Student).
- GET /api/admin/stages/<id>/leaderboard?period=all|weekly|monthly&page=1&pageSize=20 (Admin).
- Payload: StageId, NameAr/NameEn, Period, Page, PageSize, TotalLearners, MyRank (student), Entries.
- Entries: Rank, DisplayName, UserId (admin only, null otherwise), SolvedProblems, Points, FirstTryCorrect, IsCurrentUser.
- Authenticated students see anonymized names unless an opt-in public nickname system is designed later.
- CurrentStageId is a viewer preference, not the basis of historic stage attribution. Awards use problem StageId.
- No daily question limit, billing authorization, preview of solutions, or Premium advantages are enabled in this PR.
