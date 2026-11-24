# MathWorld — safe Git branch cleanup inventory

**Read-only comparison snapshot, 2026-11-24. No branches deleted.**

## Scope

GitHub branch inventory returned **323** branch names across the three maintained repositories: backend **143**, Next.js **106**, Flutter **74**. This includes `main`, feature/release/repair branches, and the current review branches. Branch names and totals are a timestamped inventory, not proof that each branch is obsolete.

Fifteen *selected* branches were compared to `main` with GitHub's compare API. `ahead_by = 0` proves that these branches contain no additional commits relative to `main` under the comparison; `ahead_by > 0` needs inspection even when equivalent changes might have been squash-merged under different commits.

| Repository | Branch | Ahead | Behind | Decision |
| --- | --- | ---: | ---: | --- |
| Backend | `release/requests-frozen-20261123` | 0 | 44 | Candidate for eventual pruning after reference check |
| Backend | `release/publish-reviewed-172-curriculum-items-20261123` | 9 | 2 | KEEP / review 5 changed files |
| Backend | `security/archive-rls-execute-grants-20261118` | 1 | 150 | KEEP / review 1 changed file |
| Backend | `audit/complete-primary-fractions-laws-20261123` | 5 | 30 | KEEP / review 5 changed files |
| Backend | `audit/complete-middle-number-theory-algebra-laws-20261123` | 5 | 26 | KEEP / review 5 changed files |
| Next.js | `release/requests-frozen-20261123` | 0 | 10 | Candidate for eventual pruning after reference check |
| Next.js | `release/mathworld-web-final-20261122` | 12 | 52 | KEEP / review 12 changed files |
| Next.js | `feat/approved-11-curriculum-category-icons-20261123` | 14 | 1 | KEEP / review 13 changed files |
| Next.js | `feat/admin-visible-student-activity-20261118` | 1 | 102 | KEEP / review 1 changed file |
| Next.js | `feat/student-practice-flow-20261122` | 10 | 54 | KEEP / review 9 changed files |
| Flutter | `release/requests-frozen-20261123` | 0 | 4 | Candidate for eventual pruning after reference check |
| Flutter | `release/android-podium-no-views-20261122` | 5 | 17 | KEEP / review 5 changed files |
| Flutter | `feat/flutter-simple-practice-20261122` | 10 | 19 | KEEP / review 9 changed files |
| Flutter | `docs/approved-launcher-release-20261122` | 1 | 23 | KEEP / review 1 changed file |
| Flutter | `feat/branded-premium-pdf-charts-20261122` | 2 | 18 | KEEP / review 1 changed file |

**Interim finding:** 3/15 sampled branches have zero unique commits; 12/15 have additional commits, so mass deletion would be unsafe. No write operation is needed to classify them.

## Follow-up comparison — additional 24 branches

Additional comparisons were made against `main` using the same non-destructive GitHub compare endpoint. These results are **snapshots**, not approval to delete unreviewed branches.

| Repository | Branch | Ahead | Behind | Disposition |
|---|---|---:|---:|---|
| Backend | `feature/admin-learner-subscription-speed-20261123` | 0 | 86 | Candidate after references check |
| Backend | `feature/sitewide-api-latency-20261123` | 0 | 86 | Candidate after references check |
| Backend | `feature/daily-challenge-guided-flow-20261123` | 0 | 85 | Candidate after references check |
| Backend | `feat/student-practice-cycles-20261122` | 20 | 100 | Keep and inspect 7 files |
| Backend | `feat/admin-annual-premium-batch-20261122` | 7 | 101 | Keep and inspect 7 files |
| Backend | `fix/analytics-export-language-pdf-20261123` | 14 | 41 | Keep and inspect 10+ files |
| Backend | `feature/curriculum-wave4-20261123` | 0 | 71 | Candidate after references check |
| Backend | `feature/split-broad-curriculum-topics-20261121` | 1 | 118 | Keep and inspect SQL |
| Next.js | `feature/admin-ux-premium-performance-20261123` | 0 | 15 | Candidate after references check |
| Next.js | `feature/sitewide-web-request-efficiency-20261123` | 5 | 50 | Keep and inspect 4 files |
| Next.js | `feature/category-skills-and-compact-stats-20261123` | 7 | 3 | Keep and inspect 6 files |
| Next.js | `fix/mobile-navbar-auth-loading-20261123` | 2 | 5 | Keep and inspect 2 files |
| Next.js | `fix/analytics-export-ui-language-20261123` | 5 | 8 | Keep and inspect 2 files |
| Next.js | `fix/admin-email-and-readable-rankings-20261122` | 7 | 51 | Keep and inspect 6 files |
| Next.js | `feature/public-pages-curriculum-ux-20261121` | 38 | 62 | Keep and inspect multi-file differences |
| Next.js | `fix/curriculum-published-editorial-state-20261121` | 2 | 65 | Keep and inspect 2 files |
| Flutter | `fix/mobile-challenge-card-ux-20261123` | 0 | 5 | Candidate after references check |
| Flutter | `fix/reset-confirmation-copy-20261123` | 1 | 3 | Keep and inspect 1 file |
| Flutter | `feature/category-skills-parity-20261123` | 7 | 2 | Keep and inspect 7 files |
| Flutter | `fix/category-skills-dialog-bounded-layout-20261123` | 2 | 1 | Keep and inspect 1 file |
| Flutter | `fix/latex-rtl-problem-rendering-20261121` | 3 | 31 | Keep and inspect 3 files |
| Flutter | `feat/hide-solved-resume-20261121` | 2 | 30 | Keep and inspect 5 files |
| Flutter | `fix/real-student-names-20261122` | 3 | 16 | Keep and inspect 3 files |
| Flutter | `feature/approved-external-launcher-icon-20261122` | 8 | 25 | Keep and inspect 5 files |

**Cumulative sampled:** 39/323 names individually compared; 8 had `ahead_by=0`, while 31 had unique commits. **No branches deleted.** Do not equate unique commit history with a non-merged feature; inspect patch equivalence and PR history first.

## Required before pruning any branch

1. List **all branches** and fetch the current default-branch HEAD (do not assume it has stayed unchanged since this snapshot).
2. Check whether a branch is protected, targeted by open PRs, used by deploys/Actions, or referenced by a pending release.
3. Compare branch to current `main`, and inspect full per-file patch plus related PR. With squash merges, confirm *patch equivalence*, not just `ahead_by`.
4. Preserve any branch with unported requirements, unmerged fixes, security work, deployment dependencies, or uncertain ownership. Update the active MathWorld issue #17 with the classification.
5. Prune only verified disposable branches after a backup/reference tag if necessary; do not prune `main` or the three active cleanup PR branches. GitHub branch deletion is intentionally **not executed** by this audit.
6. Revalidate essential CI and the production deployment revision after any merge. No production writes or automatic deployment during branch inventory.

## Current active cleanup PRs

- [Backend #146](https://github.com/MahmoudWebApp/MathWordBackEnd/pull/146) — authentication logging and read-only EF migration report
- [Next.js #107](https://github.com/MahmoudWebApp/MathWorldFrontend/pull/107) — pnpm-only lockfile hygiene
- [Flutter #76](https://github.com/MahmoudWebApp/mathworld-mobile/pull/76) — README and local environment ignore rules

**Status:** sample classified; **308 other branches not individually compared in this audit**, so comprehensive branch pruning remains open.
