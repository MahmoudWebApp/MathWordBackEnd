# G1 release gates — current checkpoint

All three changesets are on their existing feature PRs (backend #148, web #109, mobile #78). Do not create extra staging sites or deploy per commit. No production migration, content publication, flag activation, or final signed APK is represented as complete.

## Content evidence
- 773 distinct published question IDs independently checked; 758 matches and 15 correct under documented assumptions.
- 56 short-solution candidates add explicit bilingual mathematical laws. Source text and answer are guarded; no live write performed.
- 15 bilingual wording candidates resolve ambiguity in arithmetic sequences, fair independent trials and independent-sampling confidence intervals. Two already have learner attempts. All require the approved content-version/review path; do not rewrite original stems or option IDs in place.
- 21 new question drafts and 26 source-matched hint candidates await approval. Track inventory is provisional, not a published curriculum.
- Remaining editorial checks: longer explanations, rendered mathematics, all symbolic distractor representations, translations and per-question grade/course placement. Do not assert full editorial approval from numeric checks.

## Deployment sequence
1. Freeze all three heads and ensure all relevant CI is green. Verify no merge conflict. Check the actual configuration and current production schema, including the EF and Supabase ledgers.
2. Produce and verify an encrypted, off-repository logical backup of roles/schema/data/ledgers and any storage/configuration; restore to an independent target, compare counts and rehearse migrations. Existing private historical tables are not a verified independent backup. Never expose passwords, tokens or learner rows in logs or PRs.
3. Merge and deploy backend first, with feature flags initially off; verify readiness and legacy student/admin smoke tests, then one compatible web production deployment. No extra production URLs or unnecessary builds. Do not drop old columns or downgrade destructive migrations.
4. Configure and verify Brevo sender and approved recipient; send actual test mail, verify receipt and token reset/change/revocation. Keep live delivery disabled until confirmation. Credentials must be set directly in protected hosting settings, not committed or pasted into chat.
5. Review and publish content and track mappings through approved admin workflow; preserve historical progress, honor first-two-category Free rule and resolve course access gaps without unrelated mappings. Enable compatible flags only after acceptance. Check ordinary/guided/reset/daily flow across two clients, Free/Premium, student/admin/supervisor and bilingual/RTL/light/dark. Verify certificates and branded exports, actual performance and analytics, Google login and stage switch.
6. Build the one signed Android release from the accepted mobile head, verify permanent signing identity, installation, login and smoke tests, then deliver APK and single production URL. CI build success alone is not release signing or install verification.

## Current live DB read-only checks
27 public tables: RLS enabled on all; no direct anon/authenticated table privileges. The historical private snapshot schema (10 tables) has no anon/authenticated schema usage or table privileges, and is not an independent backup. Security advisor INFO notices about RLS without client policies are expected for server-only tables; do not add client access merely to clear a lint. Performance advisory INFO notices about unused indexes and historical snapshot PKs are not evidence of live query bottlenecks; do not remove indexes without workload evidence.
