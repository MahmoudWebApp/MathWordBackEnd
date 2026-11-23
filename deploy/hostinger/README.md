# MathWorld — preparation for Hostinger VPS (not a deployment)

This directory is a **reviewable, inactive deployment blueprint** for one official
MathWorld website. Nothing is deployed or migrated by committing these files.

## Services

- Caddy: automatic TLS, port **80/443 only**, one public hostname.
- Next.js 15: production `standalone` image, internal port 3000.
- ASP.NET Core 9: internal port 8080, separate Docker healthcheck.
- PostgreSQL 17: private-only port 5432, durable named volume.
- Browser API: **relative `/api` URL** through the same Caddy domain.
- Flutter: update its API base URL to `https://OFFICIAL-DOMAIN/api` only
  after domain/SSL and mobile Google authentication are verified.
- Caddy routes `/api/*` to ASP.NET **without stripping `/api`**.
- Never expose Postgres, API port 8080, or web port 3000 on the host.

The two Git repositories must be cloned as **siblings**:

```text
/srv/mathworld/
  MathWordBackEnd/
    deploy/hostinger/compose.yml
  MathWorldFrontend/
    Dockerfile
```

This compose file is in the backend repository and its frontend build context
points to the sibling `MathWorldFrontend` directory.

## Before deployment

1. Confirm the final official domain name and choose a Hostinger VPS region
   near the intended learners. Do not create a public QA/preview site.
2. Install a supported Docker Engine and current `docker compose` on a
   patched VPS with a dedicated administrator and SSH key authentication.
   Only allow incoming SSH and ports 80/443 in the firewall.
3. Review and merge the **independently tested** admin, math-content and
   speed PRs in an agreed sequence. In particular, web UX depends on new
   backend Premium and daily challenge response contracts. No PR here is
   implicitly approved for merging.
4. Verify that the existing Supabase application is a normal ASP.NET
   EF Core database: only application `public` tables are migrated. Supabase
   `auth`, `storage`, `vault`, and `extensions` schemas must not be
   blindly copied to the vanilla VPS PostgreSQL instance.
5. Protect credentials from Git and images. Store a private `.env` alongside
   `compose.yml` with **0600** permissions, using `.env.example` as a guide.
   Generate distinct random DB and JWT passwords. Preserve the exact JWT
   issuer/audience used by existing client configurations, review the existing
   storage and mail configuration, and register the final Google OAuth HTTPS
   domain and mobile Android signing/OAuth details.
6. Arrange encrypted **off-site** daily DB backups, user-upload backups,
   restore drills, disk monitoring and server monitoring *before* cutover.
   A local Docker volume is not a backup.

## Check configuration without deploying

From `/srv/mathworld/MathWordBackEnd/deploy/hostinger`:

```bash
cp .env.example .env
chmod 600 .env
# Edit the .env values. No secrets in git, chat or issue comments.
docker compose --env-file .env -f compose.yml config --quiet
docker compose --env-file .env -f compose.yml build
```

The Next.js image bakes `NEXT_PUBLIC_API_BASE_URL=/api` at **build time**.
Changing that value requires rebuilding the web image. The URL contains no
Vercel or Render dependency. The client is still served at one domain.

The database is `postgres:17-alpine`, matching the current source database's
PostgreSQL major version. Verify installed extensions, table constraints,
identity sequences, nullable fields, migration history and RLS behavior before
importing. Today's DB is approximately 15 MB; size is not the bottleneck.

## Explicit migration (on the new, empty private database ONLY)

Start just the database, then create the schema using the **reviewed EF Core
migrations**. This command is a one-off job and exits without opening the API
or creating an administrator:

```bash
docker compose --env-file .env -f compose.yml up -d db
docker compose --env-file .env -f compose.yml run --rm \
  -e Database__ApplyMigrationsOnStartup=true \
  -e Database__MigrationOnly=true \
  api
```

The normal API container always uses `Database__ApplyMigrationsOnStartup=false`;
**do not run migrations on ordinary container restarts**.

Do not run this against Supabase. The migration-only switch is deliberately
separate from startup and refuses to run if automatic migrations weren't
explicitly enabled on that single ephemeral job.

## Transfer application data safely

**Stop new writes and take a final source snapshot before the DNS cutover.**
Use Supabase's documented direct or session-pooler DB connection, never an
anonymous browser key. Run `pg_dump` against the **source** with a compatible
PostgreSQL 17 client, over TLS:

```bash
# Do not paste the actual password, connection URL, or dump into a chat.
# Use local environment-secret handling for SOURCE_DATABASE_URL.
pg_dump --dbname="$SOURCE_DATABASE_URL" \
  --format=custom --data-only --schema=public \
  --no-owner --no-acl \
  --exclude-table-data='public."__EFMigrationsHistory"' \
  --file=mathworld-public-data.dump
```

The destination schema was created from EF migrations, so do **not** restore
the source `__EFMigrationsHistory` data over the newly created migration
history. Restoring only `public` **data** excludes Supabase internals and
the Supabase-specific `public.rls_auto_enable` function (schema objects are
not in a data-only dump). Supabase `vault` is not included.

For the target, **use a clean, new, already migrated DB** with no student data:

```bash
docker compose --env-file .env -f compose.yml cp \
  mathworld-public-data.dump db:/tmp/mathworld-public-data.dump

docker compose --env-file .env -f compose.yml exec -T db \
  sh -ec 'pg_restore --username="$POSTGRES_USER" --dbname="$POSTGRES_DB" \
    --data-only --no-owner --no-acl --single-transaction --disable-triggers \
    /tmp/mathworld-public-data.dump'

docker compose --env-file .env -f compose.yml exec -T db \
  rm -f /tmp/mathworld-public-data.dump
```

Review `pg_restore --list` before running. `--disable-triggers` is
permitted only during the controlled import using the local DB superuser.
Validate all FKs, unique constraints, sequences, migration state and
per-student progress after import. Restore should fail rather than silently
skip incompatible columns. This is a **plan**, not a completed import.

Current source baseline verified on 23 Nov 2026: **24 categories, 601
student-visible problems, 214 editorial items**. Verify those and *all*
students, attempts, solved states, mistakes, discount codes, subscription
expiry dates, logs, and uploaded assets using exact before/after counts.
Never reset or overwrite a live student's existing progress.

## Start and acceptance checks

After restored data and secrets are verified:

```bash
docker compose --env-file .env -f compose.yml up -d api web proxy
docker compose --env-file .env -f compose.yml ps
# Internal API liveness and schema readiness:
docker compose --env-file .env -f compose.yml exec -T api \
  curl -fsS http://127.0.0.1:8080/health/live
docker compose --env-file .env -f compose.yml exec -T api \
  curl -fsS http://127.0.0.1:8080/health/ready
# Public HTTPS checks, replacing the hostname:
curl --fail https://OFFICIAL-DOMAIN/health
curl --fail https://OFFICIAL-DOMAIN/api/stages
```

Acceptance tests must cover Arabic/English RTL, stage/category cards,
problem solving and math rendering, correct/incorrect answers, restart
practice, Free first two categories, Premium expiry + annual bulk grant,
Google login, challenges, logs, export PDF/Excel, chart dark mode, and
Flutter Android. Check that `/api` routes never hit the Next frontend,
that Caddy automatically obtains TLS, and that there are no old Render,
Vercel or Supabase URLs embedded in active browser requests.

Measure cold/warm API TTFB and repeated navigation at the **same official
domain** and record p50/p95 times. Previous Render samples included
stage categories ~4.9s, student journey ~5.6s, admin overview ~10s, so
we have a baseline but not a verified post-migration improvement.

Keep Render, Vercel, Supabase and their backups available until full smoke
testing and a verified rollback plan. Rollback is DNS + application routing
**only if no divergent writes occurred**; otherwise reconcile newly
submitted student data before any switch.

## Backups

Run `bash backup-db.sh` after the private DB is operating. This creates
a PostgreSQL `pg_dump -Fc` file under local `backups/` with mode 0600
and a SHA-256 checksum. The files are ignored by Git and Docker builds.
Set up a secure scheduled run and independent encrypted off-site storage.
Also back up the `api_uploads` and Caddy certificate volumes as needed.
Test a restore to a **separate disposable database**; never test restore
against the live production volume.

The original site remains unchanged until all release gates above pass.
