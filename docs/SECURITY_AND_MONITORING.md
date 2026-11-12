# MathWorld — Security & Observability runbook (Sprint 1)

This PR is intentionally **draft** and must not be merged/deployed before the runtime
environment has been prepared. No production database changes are included.

## Why this is urgent

Previous tracked `appsettings.json` and `appsettings.Development.json` versions
contained non-empty sensitive credentials. Clearing the current files **does not erase
Git history**. Assume any real keys committed previously may be compromised.
Rotate them through the provider consoles. Do not print or paste secrets in issues,
pull requests, chat, frontend configuration, or Flutter assets.

## Before merging: Render runtime variables

In Render > MathWorld Backend > Environment, configure these secure values
(use double underscores to represent .NET configuration nesting):

| Variable | Meaning |
| --- | --- |
| `ConnectionStrings__DefaultConnection` | Supabase PostgreSQL connection string |
| `Jwt__Key` | New strong random JWT signing key (>=32 UTF-8 bytes) |
| `Jwt__Issuer` | Keep existing production issuer unchanged, unless rotating deliberately |
| `Jwt__Audience` | Keep existing production audience unchanged, unless rotating deliberately |
| `Meilisearch__ApiKey` | Search service key, if search is enabled |
| `IMGBB_API_KEY` | Image storage provider key, if in use |
| `Facebook__AppSecret` | Meta app secret if Facebook login is enabled |
| `Google__ClientId` | OAuth client ID when Google login is enabled |
| `Facebook__AppId` | Meta app ID when Facebook login is enabled |
| `Monitoring__SlowRequestThresholdMs` | Optional, default 1500 |

Do not set placeholder development secrets in a live environment. Rotate the database
password, JWT key, and any exposed API/provider secrets before production rollout.
**Changing JWT keys logs current users out.** Plan the rollout. Rotating the database
password requires updating the Render value together with Supabase. If any other
integration holds the same key, coordinate its update too.

For local development, copy `appsettings.Development.example.json` to
`appsettings.Development.json` (ignored by Git) and set local values, or use
.NET User Secrets / environment variables.

## Monitoring endpoints

- `GET /health/live`: API process is responsive; independent from database.
- `GET /health/ready`: database reachable within a 3 second check.
- `GET /health`: existing backwards-compatible database health endpoint.

Return codes: 200 means OK; 503 means not ready. These routes do not expose
credentials or exception details.

Configure the external uptime monitor to check `/health/ready` every 5 minutes
and alert the service owner after 2 consecutive failures. `/health/live` can be
used by infrastructure that needs to distinguish an API crash from a DB outage.

## Request telemetry

The new middleware writes one structured completion event per HTTP request with:
- Method, route template (no raw URL/query string), status code and elapsed ms.
- Correlation ID, also returned in the `X-Correlation-ID` response header.
- Warnings for slow requests, errors for 5xx.

The app also emits `System.Diagnostics.Metrics` counters and duration histograms
under the meter `MathWorld.API`. **Exporting those to a dashboard is a separate
deployment task** (OpenTelemetry exporter/collector not configured yet).

Suggested starting alerts: readiness failures; sustained >=5% 5xx over 10 minutes;
p95 API latency >1500ms; login-error spikes; database connection saturation.
Tune thresholds after observing real traffic. Do not log access tokens, passwords,
answer text, personal data, or full connection strings.

## Database backup and recovery

1. Enable available managed backups for your Supabase plan or arrange a secure
   encrypted PostgreSQL backup outside the application.
2. Confirm retention, ownership and restore permissions.
3. Perform an actual restore **to an isolated test database** before declaring
   backups verified. Never test a restore against production.
4. Record recovery point/time objectives and dates of drills.

This PR **does not configure** Supabase backups or Render alerting; those require
provider-level settings and the user's selection/authorization.

## CI and release safety

`.github/workflows/backend-ci.yml` checks for secrets in tracked app configuration
and compiles .NET 9 on pull requests and pushes to main. It does **not** yet run
integration tests, penetration tests, production migration, or live deployment.

Do not merge without: successful CI, staged verification of login/problem-solving,
new secrets present on Render, rotated exposed credentials, and rollback plan.
