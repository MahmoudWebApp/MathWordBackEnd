# MathWorld — full branch comparison audit

**Dated snapshot:** 2026-11-24. Compared all three linked GitHub repositories against their current `main` commit using the read-only compare API. No refs or branches were deleted.

## Complete comparison results

| Repository | All branches including main | Non-main compared | Ahead=0 | Ahead>0 |
| --- | ---: | ---: | ---: | ---: |
| Backend | 143 | 142 | 18 | 124 |
| Next.js | 106 | 105 | 16 | 89 |
| Flutter | 74 | 73 | 11 | 62 |
| **All** | **323** | **320** | **45** | **275** |

- `ahead_by=0`: branch tip has **no commits that are not reachable from `main`** (potential pruning candidate, subject to references/protections/deployment checks).
- `ahead_by>0`: distinct commit history; **not necessarily unported code**, because squash/cherry-pick merges can yield equivalent files with different SHA. Needs patch comparison and requirement checks before pruning.
- The checked `main` baseline can change after merges; rerun before any branch deletion. **Do not automatically prune based only on this report.**

## 45 zero-ahead branch candidates (verify references before removal)

### Backend — 18 candidate branches

- `docs/mathworld-student-journey-premium-roadmap`
- `feature/admin-activity-insights-20261113`
- `feature/admin-learner-insights-v1`
- `feature/admin-learner-subscription-speed-20261123`
- `feature/admin-separation-analytics-v1`
- `feature/current-stage-dashboard-context-v1`
- `feature/curriculum-wave4-20261123`
- `feature/daily-challenge-guided-flow-20261123`
- `feature/point-ledger-stage-rankings-v1`
- `feature/security-observability-sprint1`
- `feature/sitewide-api-latency-20261123`
- `feature/social-login-safe-account-linking`
- `feature/stage-daily-quota-v1`
- `feature/student-learning-stage-journey-v1`
- `fix/problem-history-current-main-20261113`
- `fix/readiness-detect-pending-db-migrations`
- `fix/restore-backend-before-ledger-migration`
- `release/requests-frozen-20261123`

### Next.js — 16 candidate branches

- `feature/admin-activity-dashboard-rtl-v1`
- `feature/admin-control-center-stage-analytics-v1`
- `feature/admin-dashboard-navigation-cleanup-v1`
- `feature/admin-learner-insights-web-v1`
- `feature/admin-ux-premium-performance-20261123`
- `feature/mathworld-brand-logo-v2`
- `feature/mathworld-calm-ui-v1`
- `feature/rtl-sitewide-analytics-main-20261113`
- `feature/selected-stage-student-parity-v1`
- `feature/social-login-web-v1`
- `feature/stage-daily-quota-web-v1`
- `feature/stage-leaderboards-web-v1`
- `feature/student-learning-stage-journey-web-v1`
- `fix/hide-leaderboard-until-api-live`
- `fix/transparent-navbar-logo-v3`
- `release/requests-frozen-20261123`

### Flutter — 11 candidate branches

- `feature/mathworld-brand-logo-v2`
- `feature/mathworld-calm-ui-v1`
- `feature/social-google-mobile-auth-v1`
- `feature/stage-focused-mobile-parity-v1`
- `feature/stage-leaderboard-flutter-v1`
- `feature/student-learning-stage-journey-flutter-v1`
- `fix/calm-dark-theme-rtl-v1`
- `fix/gate-stage-leaderboard-until-api-live`
- `fix/rtl-directional-icons-v1`
- `fix/mobile-challenge-card-ux-20261123`
- `release/requests-frozen-20261123`

## Preserve and inspect rather than delete

- **Backend:** older content/audit branches can hold independently reviewed solution laws and unpublished files; some integration branches have hundreds of unique commits. Inspect changed-file patches and whether content was already imported before deleting or cherry-picking.
- **Next.js:** larger integration branches (e.g. `integration/premium-web-reconcile-20261118` and `feature/premium-entitlements-client`) have very divergent histories. Review source patches against current UI and the *active* requirements, not the historical branch name.
- **Flutter:** `integration/premium-mobile-reconcile-20261118` and `feature/premium-entitlements-client` each show 250+ unique commits; preserve until patch-by-patch assessment. The already merged PR #76 source branch can retain different commit history due to squash; treat it as merged only after checking tree equivalence.
- Active review branches **must not be pruned:** backend `chore/safe-cleanup-auth-migrations-20261124` ([PR #146](https://github.com/MahmoudWebApp/MathWordBackEnd/pull/146)), web `chore/clean-single-pnpm-lockfile-20261124` ([PR #107](https://github.com/MahmoudWebApp/MathWorldFrontend/pull/107)). Flutter [PR #76](https://github.com/MahmoudWebApp/mathworld-mobile/pull/76) was merged; its branch still requires release/reference and patch-equivalence confirmation before removal.

## Safe removal checklist (NOT executed)

1. Fetch the newest `main`, branch protections, open PR references, deployment sources, build workflow references and pending release tags. Refresh the comparison.
2. Check all changed files and full diff for any nonzero-ahead branch. Preserve work for the current requirements even when the branch name sounds obsolete.
3. For zero-ahead candidates, confirm no protected/ref-dependent workflow, open PR or release is using the ref. Stage a rollback/reference tag if the repository's retention policy requires it.
4. Delete only branches approved after these checks. Git history, student progress, database records and live deployments are **out of scope** for this inventory. Do not delete `main`.
5. Check GitHub Actions and Render/Vercel after any approved merge. No live deployment or database mutation was made by this audit.

**Audit state:** **320/320 non-main branches compared**, with 45 candidates for additional reference checks and 275 branches that need commit/patch review before any removal. **Zero deletions**.
