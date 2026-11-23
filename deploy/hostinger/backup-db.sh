#!/usr/bin/env bash
# Local custom-format PostgreSQL backup. Offsite encrypted copies still required.
set -Eeuo pipefail
umask 077

ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"
test -r .env || { echo "Missing private .env" >&2; exit 1; }
mkdir -p backups

stamp="$(date -u +%Y%m%dT%H%M%SZ)"
out="backups/mathworld-${stamp}.dump"
temp="${out}.partial"
trap 'rm -f "$temp"' EXIT

docker compose --env-file .env -f compose.yml exec -T db \
  sh -ec 'exec pg_dump --username="$POSTGRES_USER" --dbname="$POSTGRES_DB" --format=custom --no-owner --no-acl' > "$temp"

test -s "$temp" || { echo "Backup is empty" >&2; exit 1; }
mv "$temp" "$out"
trap - EXIT
sha256sum "$out" > "${out}.sha256"
echo "Created $out"
echo "Upload encrypted offsite; a backup solely on the VPS is not sufficient."
