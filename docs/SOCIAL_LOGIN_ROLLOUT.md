# MathWorld — Google-only authentication and safe linking
Updated: 2026-11-19. This supersedes the earlier Google/Meta rollout plan.

## Current public API contract

| Method | Route | Access | Expected behavior |
| --- | --- | --- | --- |
| POST | `/api/auth/social/google` | Public, rate-limited | Verify Google ID token and active user; return MathWorld JWT |
| GET | `/api/auth/social/link-status` | Active Student JWT | Return `Data.GoogleLinked` only; no provider identifier or token |
| POST | `/api/auth/social/link/google` | Active Student JWT | Link verified Google identity explicitly |
| POST | `/api/auth/social/facebook` | Not registered | 404; provider is removed for now |
| POST | `/api/auth/social/link/facebook` | Not registered | 404; provider is removed for now |

The UI shows only Google. Existing local email/password authentication remains
available. **Historical social-link records must not be deleted**; removing a
public login route does not authorize database account deletion.

## Identity safety

- A matching email does not automatically link an unlinked Google identity.
  Existing students must first authenticate to MathWorld and explicitly link.
- A Google provider ID already linked to a different user is a 409 conflict.
- Google identity tokens are verified server-side for the configured audience
  and verified email. Store only the provider identity mapping, never tokens.
- The account must be active before a MathWorld JWT or link-status is returned.
- After successful link, both web and Flutter hide the link control. Re-fetch
  `link-status` on later visits; do not infer linkage from a Google SDK session.
- New Google-only accounts still require stage onboarding when no stage exists.

## Configuration and rollout

Backend Render: `Google__ClientId` and existing JWT configuration.
Web Vercel: `NEXT_PUBLIC_GOOGLE_CLIENT_ID` plus
`NEXT_PUBLIC_SOCIAL_LOGIN_ENABLED=true` **only once the deployed backend
provides the link-status route and the OAuth client authorizes the real origin**.
Flutter needs the correct Android signing SHA and matching Google OAuth clients.

Do not re-enable Meta from old environment values, stale app settings,
Swagger descriptions or inactive feature flags.

## Release verification — no real accounts or writes in CI

1. Confirm the running Render commit is at least the Google-only controller
   merge (#41), and has this PR's service cleanup when deployed.
2. Verify `GET /health/live` is 200 and `GET /health/ready` is 200 with
   migrations already applied. Do not enable automatic migrations to test it.
3. Verify unauthenticated `GET /api/auth/social/link-status` returns 401;
   Meta POST endpoints return 404.
4. On an authorized test account, validate Google sign-in, explicit link,
   revisiting settings, token failure, duplicate link 409, and stage onboarding
   on web and Android.
5. Revalidate Free two-category access, Premium expiry/gift-code activation,
   daily-challenge 403 for Free, and no unauthorized analytics exposure.

An API smoke test cannot substitute for the signed Android device test.
No payment, ads, tutors, production data imports or account migration are
part of this rollout.
