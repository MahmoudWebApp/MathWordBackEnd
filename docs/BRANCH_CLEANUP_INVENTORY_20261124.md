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
