# MathWorld — Secure social identity rollout

Status: DRAFT. Do not enable social login in production before backend PR #5
passes review, developer apps are configured and web/mobile clients are tested.

## Existing endpoints

- `POST /api/auth/social/google` with JSON
  `{ "Provider":"Google", "AccessToken":"<google-id-token>" }`
- `POST /api/auth/social/facebook` with JSON
  `{ "Provider":"Facebook", "AccessToken":"<facebook-access-token>" }`
- `POST /api/auth/social/link/google` with the same Google token **and**
  `Authorization: Bearer <MathWorld-JWT>`
- `POST /api/auth/social/link/facebook` with the Facebook token and a valid
  MathWorld JWT. Both link endpoints are restricted to Student accounts.

The provider token is validated on the server; only a MathWorld-owned JWT is
issued to clients. The database stores the verified provider's stable ID and
a local UserId, not raw access tokens.

## Identity integrity rules

1. Existing `SocialLogin.Provider + ProviderId` binding identifies the
   MathWorld account.
2. An unlinked verified provider identity whose email matches any existing
   MathWorld account receives localized HTTP 409 `SocialAccountLinkRequired`.
   **Never automatically link by matching email**.
3. Existing user signs in through the original password/provider method and
   uses the authenticated `link` endpoint to prove both identities.
4. A provider identity already linked to a different UserId is rejected with
   HTTP 409. A user's existing provider ID must not silently change.
5. A Facebook account may stop returning email; a previously linked identity
   can still log in by stable ProviderId. New Facebook accounts need an email
   until an explicit safe no-email account policy is designed.
6. New user creation and provider binding commit in one transaction; no
   orphan account on a failed social identity link.
7. Google ID token validation uses Google.Apis.Auth, the configured audience
   and verified email. Facebook debug_token validation checks validity and
   app ID before fetching the identity. Keep provider app secrets server-only.

## Configuration (Render Environment)

| Variable | Example/value | Exposure |
| --- | --- | --- |
| `Google__ClientId` | Google Web OAuth client ID | Server config |
| `Facebook__AppId` | Meta application ID | Server config |
| `Facebook__AppSecret` | Meta application secret | **Server secret only** |
| `Jwt__Key` | Existing strong MathWorld signing key | **Server secret** |

Web (Netlify) public build-time variables:
- `NEXT_PUBLIC_SOCIAL_LOGIN_ENABLED=false` while testing
- `NEXT_PUBLIC_GOOGLE_CLIENT_ID=<same Web OAuth client ID>`
- `NEXT_PUBLIC_FACEBOOK_APP_ID=<Meta App ID>`

Google JS authorized origins should include the real website, for example
`https://mathwords.netlify.app`, the chosen production custom domain, and
`http://localhost:3000` for local testing. Domain configuration must match
Google Cloud OAuth client settings. Meta JavaScript SDK domain and app-role
configuration must match the live website; use app test users during
development.

Android uses the **same Web OAuth client ID** for backend ID-token audience,
plus Android OAuth clients registered with final app package name and SHA-1
signatures for debug, release and eventual Play app signing. iOS needs its own
OAuth client and URL callbacks.

## Do not replace social apps during owner transition

For a future company/organization-owned platform, transfer management/roles
of the **same Google Cloud project/OAuth clients and Meta app** where possible.
Creating a different Facebook app can change app-scoped user IDs and break
existing social provider associations. Changing Google OAuth client audience
without updating backend and clients breaks ID-token validation. Document the
transfer and test before changing credentials.

## Acceptance tests before enabling

- Existing email/password learner cannot be taken over using another social
  identity with a matching email.
- Linked Google/Facebook identity restores the same MathWorld UserId, stage,
  points and progress on both web/mobile.
- Anonymous requests to linking endpoints return 401.
- Invalid/missing provider tokens get 401.
- Linking provider ID already associated with another student returns 409.
- Retry and concurrent first-time registrations do not create orphan users.
- No social provider access tokens or app secrets appear in the database/logs.
- Account is active and role is correct before issuing MathWorld JWT.
- Rate limits and backend error notifications work.
- Rollback to email/password login works by disabling public feature flag,
  without deleting linked identities.

## Rollout

1. Review backend PR #3 protecting learner attempt history, then PR #5.
2. Deploy backend before exposing any UI; verify existing login still works.
3. Configure/test Google + Meta projects with test users and valid domains.
4. Deploy web PR #5 with social flag disabled. Enable it only after provider QA
   and rotate/redeploy safely.
5. Integrate Flutter Google flow after signed Android/iOS configuration. Do not
   add Facebook native plugin with placeholder App ID: Android initialization
   may fail and destabilize the app.
6. Monitor provider auth 401/409, errors, new user registration spikes,
   and duplicate/failed social-link attempts without logging raw tokens.

No payments, 10-question quotas or leaderboard rules are changed by this PR.
