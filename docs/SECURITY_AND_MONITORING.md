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

On a **paid service**, configure an external uptime monitor on `/health/ready`
at a cadence appropriate for your operating plan. Use `/health/live` as the
lightweight HTTP health-check path in Render > Settings > Health Checks. Never
configure Render's frequent internal check to hit the database for each probe.
Run external database readiness checks less often, with alerting based on
consecutive failures and a clear incident owner.

On the current **Render Free** plan, the service spins down after idle time.
An external check every 5 minutes keeps it awake, which consumes Free instance
hours across the workspace and may suspend the service when the shared
monthly allowance runs out. Do not enable continuous external checks without
choosing a monitoring cadence or a suitable paid plan. This PR does not
activate any recurring monitor or change Render settings.

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
and compiles .NET 9 on pull requests and pushes to main. The pipeline also
starts the API with **dummy CI-only configuration** (no real database), checks
that `/health/live` returns 200, and confirms `/health/ready` fails safely
with 503 when its database is unreachable. This is a small runtime smoke test,
not a replacement for authentication, load, integration, or production tests.
It does **not** run production migrations or live deployment.

Do not merge without: successful CI, staged verification of login/problem-solving,
new secrets present on Render, rotated exposed credentials, and rollback plan.

## Render service audit — 2026-11-12 (read-only)

- Confirmed service: `MathWordBackEnd`, deployed from GitHub `main` via Docker.
- `autoDeploy=yes` / `autoDeployTrigger=commit`: **merging this PR deploys automatically**.
- Compute plan: `free`, Oregon, one instance; no custom `healthCheckPath`.
- Existing deployment was marked `live` on Render; no inference is made about
  the availability of external monitoring or configuration of production secrets.
- The current Render integration permits reading service settings, but does **not**
  provide a read-only action for environment variable names/values. Check
  `Environment` in the dashboard before merge; do not assume variables are set.
- HTTP request/latency samples were not available in the inspected metrics.
  CPU/memory usage samples were available. Avoid treating absent metrics as
  proof of an outage or an absence of traffic.
- Free service idle spin-down is normal and can cause slow cold starts.
- Running an HTTP-ready probe on a database with intermittent networking
  can cause false alarms; liveness and readiness are deliberately separate.

### Before moving this PR from Draft

1. Review Render > Environment; populate required values without copying
   previously committed secrets. Rotate exposed credentials at their providers.
2. Verify staging build and login/problem-solving behavior end-to-end.
3. After staging verifies new routes, set `/health/live` in Render Settings >
   Health Checks, preserving the default check until the route is deployed.
4. Decide paid vs free-plan monitor cadence; then configure external alerting.
5. Confirm backup retention and a safe restore rehearsal for Supabase.

## Docker image health behavior

Docker's existing `HEALTHCHECK` is now pointed at `/health/live` rather than
`/health`, so intermittent database failures cannot make the application
container fail its **process liveness** probe. Database reachability is
separately tracked via `/health/ready`. The image's `curl` availability and
Docker build behavior should be verified with the deployment pipeline before
turning on any Docker/Render health-check policy.
