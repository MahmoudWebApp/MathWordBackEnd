# MathWorld — 23 November 2026 release closeout and final UAT contract

This replaces the outdated project tracking issues listed below **for this
release only**. Closing historical issues is an administrative cleanup:
it does not claim their unverified features have passed physical-device UAT.

## Final approved scope

- **One official website and one Android app**, no separate QA sites.
- Frontend: student/admin UX, consistent problem/category cards, loading and
  errors, daily challenge progress, 45s auth refresh deduplication, 180s
  public-catalog cache, airy multicolor math pattern; no payment prices.
- Backend: Premium annual periods and lean admin list, Premium-only guided
  five-question daily challenge, Free exactly two configurable categories
  per stage and unlimited problem practice, pooled SQL reads; Google only.
- Flutter: daily challenge with pause/continue and readable solution time;
  2-column category cards and correct RTL top-corner problem actions.
- **No views:** GET problem detail no longer increments a view counter or
  queues database writes. Legacy stored view counts are not migrated/deleted.
- **Attempt history removed from the learner experience:** no web timeline
  cards or GET /api/problems/{id}/attempts student route. Internal
  ProblemAttempts, UserProgresses, error notebook, idempotent scoring,
  admin stats and audit records MUST be preserved.
- Editorial batch 56 remains **draft only**. Do not publish these items or
  change question IDs, solved status, users, subscriptions or points.
- No Hostinger migration, DNS changes, payment enablement, SMS or Meta login.
  Google OAuth settings for this hosting remain as configured.
- Never bypass a Vercel build-rate-limit. If deployment is blocked, report
  the exact failed/queued build rather than claim the code is published.

## Historical Issues reconciled

| Original issue | Classification | Where ongoing truth lives |
| --- | --- | --- |
| Web #86 – administrator and published-bank audit | Archival history; current approved functionality is in release candidate. Device/admin UAT still pending | This document, signed-off live admin checks; historic issue text retained |
| Web #21 – student web UAT from old photos | Superseded by approved November 23 UX and card fixes; visual acceptance still pending | This document and user's next production feedback |
| Backend #17 – mixed full-stack roadmap | Superseded by latest scope; earlier claims and dates are stale | This document; postpone noncurrent roadmap items |
| Backend #16 – Free/Premium/payment roadmap | Free + Premium updated; old billing/SMS placeholders deferred or rejected | Current API/UI requirements in this document |
| Backend #12 – Admin control center (contains cancelled 10/day rule) | Obsolete requirement mix, do not reinstate daily quota | Current Free access and admin UX contract |
| Backend #10 – pre-PointLedger restore-tested backup | Deferred independent gate **before any future DB/PointLedger migration**, not a current schema change | Future migration/Hostinger prerequisites; never waive backup for migration |
| Flutter #16 – photo/device UAT | Code improved and CI passes; physical Android visual and Google tests still pending | This document and user acceptance of the signed QA APK |
| Flutter #13 – store signing and launcher readiness | Stable test APK workflow exists; production Play signing/app bundle + launcher device inspection remain separate future release gates | This document; do not label QA artifact a Google Play release |

Original issues are preserved in closed history, not deleted.
The current release introduces **no EF migration** and is not a PointLedger
deployment. Do not erase or reset production accounts.

## Automated acceptance and live checks

Before release: require combined **web 2/2**, **backend 10/10**,
**Flutter 4/4** tests green on the exact commits. Re-run after any source
change, particularly the removed view/attempt-history paths.

After release:
1. API /health/live and /health/ready must both be healthy and Render deploy
   must show the intended release SHA. Browser/API response must match
   actual public stages and categories, not synthetic data.
2. Vercel production target must be READY on the release SHA assigned to the
   **existing official** math-world-frontend.vercel.app domain.
3. Use one Free and one Premium student account with non-destructive
   navigation: stage selection, two allowed categories, solving once,
   incorrect -> error notebook -> correction, reset category only after
   confirmation, solved status, locked premium, daily challenge 5.
   Do not create a fake history or change any student data silently.
4. Admin: lean directory, Premium individual/bulk date periods, activity
   metrics sourced from submissions (not views), and readable chart contrast.
   Do NOT test destructive rights or grant Premium on production without the
   account owner's express authorization.
5. Flutter QA APK: same stable signing identity, install/update behavior,
   Google on a real device, launcher icon on Android 11 and Android 12+,
   RTL/English, dark mode, two-column cards, PDF/XLSX exports.
6. Reports: XLSX workbook logo + real charts; PDF logo and Arabic/English
   fonts. SEO robots/sitemap and public stage links; basic network latency.

**Open sign-off after shipment:** production user acceptance tests and
physical Android QA are not automated and therefore cannot be marked
complete before the user's actual test.

## Rollback and scope boundaries

- Keep the pre-release exact GitHub main SHA and prior Render/Vercel deployment
  identifiers documented outside secrets. If a release is unhealthy, use
  the provider-supported rollback and report which deployment is live.
- Never force-push main, enable purchases, change OAuth provider or delete
  Supabase data as a shortcut to a passing build.
- The database's historical view-count column and internal attempt rows are
  kept only for backward compatibility and private admin/statistical needs;
  they are not new learner features.
