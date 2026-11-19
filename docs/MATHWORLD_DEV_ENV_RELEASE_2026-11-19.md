# MathWorld — Existing development environment release checkpoint
Date: 2026-11-19 (UTC). **This document records verified actions; it is not a full end-to-end UAT pass.**

## Scope and identity
- **No new staging/development environments created.** Reused existing Render API `MathWordBackEnd`, Vercel website and existing Supabase project `MathWorldDB`.
- Backend deployed on Render from GitHub `main`, commit `f17f4fdd6775c68365a83cace8981b6c24fb8179` (merged Premium PR #20).
- Existing Vercel project's latest production deployment was `READY` at web commit `1507387c764242122d7663619d39c3bc36a1d554` during this release check.
- Flutter changes are committed to `main` in its own repository; no Play Store release or physical device test is claimed.

## Schema release and preservation
- Before upgrade, existing EF history had **7** applied entries; afterward it has **19** entries. The **12 pending additive EF migrations** were applied using application-native EF Core `Database.MigrateAsync` during one controlled Render deployment.
- Render startup explicitly logged `Database migrated successfully!` at 2026-11-19 07:08:15 UTC; the API subsequently started and Render marked the deployment live.
- Immediately after successful migration, set Render `Database__ApplyMigrationsOnStartup=false`. Render deployed **the same code commit** and logged `Automatic database migrations are disabled.` at 2026-11-19 07:08:47 UTC; final deploy `dep-dbva0smtlv9c73898tag` reached `live`.
- Before schema upgrade, made a **private in-database row snapshot** of all **10 preexisting application tables** under schema `mw_pre_premium_20261119`. Verified matching record counts and denied schema USAGE to `anon` and `authenticated`. This snapshot is **NOT** an offsite or `pg_dump` backup. Retain until independently exported and restore-tested.
- After upgrade: **7 users**, **16 categories**, **66 problems**, **264 options**, **29 learner progress entries**, **35 attempts**; pre-upgrade counts matched.
- All **20** current public application tables have RLS enabled; `anon` and `authenticated` do not have direct SELECT grants. Supabase health advisors returned no findings. Supabase security advisor listed informational `rls_enabled_no_policy` for these private API-only tables; no direct client grants were detected.
- New Premium grant/audit, access-code, discount, orders, free-category selection, diagrams, activity, notification, curriculum draft and learner-presence tables are present and initialized empty. There were no new Premium grants or student subscriptions created during release.
- Feature flags `PaidCheckoutEnabled`, `CouponRedemptionEnabled`, `AdsEnabled`, `TutorMarketplaceEnabled` default to false in code. Do not enable payment or ads without separate authorization.

## Checks and remaining gates
- GitHub CI previously passed the full-stack build, EF PostgreSQL migration upgrade rehearsal, Free/Premium category enforcement and backend security checks at reviewed feature commit.
- On current release, Render reported `live`; no `error`-level application logs were returned for the checked post-release interval. Database migration records and contents were read back from Supabase.
- **Not verified**: independent HTTP `/health/ready` status from outside Render, authenticated web/mobile complete journey, new 100% gift redemption, admin grant/revoke in a real user session, complete iOS/Android release signing, Arabic PDF rendering on phone, UI screenshots, scientific editorial approval, offsite database backup and recovery drill.
- **Before testing**: use existing dev accounts, explicitly avoid live paid transactions; verify stage access, Free/Premium switching, admin grants/codes and notifications. Do not publish the 320 unreviewed bilingual question drafts or 16 proposed categories.
- **Before any non-development public launch**: export a full offsite `pg_dump` backup and rehearse restoration, review persistent DataProtection keys on ephemeral Render container, test HTTP readiness and authorization, complete device UX/QAs and security review.

## Operational policy
Use **only the existing** MathWorld Render + Vercel + Supabase environment unless the owner explicitly requests something else. A backup **schema** is not a new environment. Keep any future migrations explicit and never silently modify learner records.
