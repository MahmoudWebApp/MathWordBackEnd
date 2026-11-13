# Learning stage onboarding — coordinated release notes

This is a **draft feature**. Backend PR #4, MathWorldFrontend PR #4 and
mathworld-mobile PR #4 must be released in this order after passing review.

## Data safety and compatibility

- New field: nullable `Users.CurrentStageId` referencing `EducationalStages.Id`.
- Existing users retain null until they select a stage; past learning progress
  and attempts stay linked to their original `MathProblem.StageId`.
- Users changing selected stage keep all earlier attempts and progress.
- No existing points are recalculated or deleted by the migration.
- Stage and category completion percentages are **live fractions of all existing
  questions** in that stage; content imports alter denominators. Permanent
  "stage completed" achievements require a later versioned award system.
- Points currently follow existing dashboard logic (current question Points).
  Immutable score ledger and stage leaderboard are separate follow-up work.

## Release order (do not merge blindly)

1. Confirm the Supabase backup/restore plan, schema migration permissions,
   deployment owner, and a staging/test PostgreSQL database.
2. Ensure the problem history protection PR #3 is reviewed and tested first.
3. Execute **only** reviewed EF migration
   `20261113070000_AddStudentLearningStage` on a backed-up staging DB.
4. Run `tests/integration_learning_journey.py` against a disposable test
   database (the CI workflow does this automatically); verify migration, login,
   stage selection, scores, and history-preserving stage switching.
5. In production, apply migration during a controlled schema-change window
   **before deploying this backend code**, with a validated rollback plan.
   Current Render settings have automatic migration disabled by default;
   enabling automatic migrations permanently is not recommended.
6. Deploy backend and verify these authenticated student endpoints:
   - `GET /api/users/learning-stage`
   - `PUT /api/users/learning-stage`
   - `GET /api/users/journey?stageId=<id>`
   Existing `GET /api/users/dashboard` and `GET /api/users/profile`
   must continue to work.
7. Merge/deploy Next.js PR #4. Students with no stage get a bilingual choice.
   Test first login, reload of an existing session, admin login, stage
   switching, and dashboard on mobile/desktop.
8. Rebuild/test/install Flutter PR #4 after API release; verify existing
   sessions, stage switching, and offline error handling.
9. Monitor 401/409/500 errors, DB latency and readiness, and API response
   metrics. Do not expose JWTs, emails or secret values in logs.

## Rollback

- Client PRs can be rolled back without any data loss. The new nullable column
  can remain unused while troubleshooting.
- Backend can be rolled back to the previous code version: the new optional
  column is backwards-compatible with previous EF queries.
- **Do not run Down migrations on production** while any users have selected a
  stage, because it would erase their selected-stage preferences.
- The official free-plan 10-question gate, paid entitlements and public
  leaderboards are not enabled here. Implement and test these separately.

## Current verification

- GitHub Actions .NET release build and PostgreSQL integration workflow
  successfully applied schema migrations and tested the stage selector,
  invalid stage IDs, first attempt/points, historical stage progress,
  auth guards, profile/dashboard contract.
- Web CI validates TypeScript and production Next.js build.
- Flutter CI validates the Dart analyzer with current SDK notices treated
  as informational (warnings still fail).
- External staging and production end-to-end deployment verification remain
  required; CI must not touch the live Supabase database.
