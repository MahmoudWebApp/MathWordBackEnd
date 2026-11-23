#!/usr/bin/env python3
"""Validate VPS deployment env before any real Docker deployment.

Reads only a local file. Never prints, uploads or logs credentials.
"""
from __future__ import annotations

import re
import stat
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent
ENV_FILE = ROOT / ".env"


def read_env(path: Path) -> dict[str, str]:
    result: dict[str, str] = {}
    for row in path.read_text(encoding="utf-8").splitlines():
        row = row.strip()
        if not row or row.startswith("#"):
            continue
        if "=" not in row:
            raise ValueError("Invalid environment line without '='")
        key, value = row.split("=", 1)
        key = key.strip()
        value = value.strip()
        if len(value) >= 2 and value[0] == value[-1] and value[0] in {"'", '"'}:
            value = value[1:-1]
        if key in result:
            raise ValueError("Duplicate environment name")
        result[key] = value
    return result


def main() -> int:
    if not ENV_FILE.is_file():
        print("FAIL: private .env has not been created", file=sys.stderr)
        return 1
    # Docker administrators are privileged; do not expose secrets to the
    # rest of the Linux host by making the env file world/group readable.
    if stat.S_IMODE(ENV_FILE.stat().st_mode) & 0o077:
        print("FAIL: chmod 600 .env before continuing", file=sys.stderr)
        return 1
    try:
        data = read_env(ENV_FILE)
        domain = data.get("MATHWORLD_DOMAIN", "")
        if not re.fullmatch(r"[a-zA-Z0-9][a-zA-Z0-9.-]*[a-zA-Z0-9]", domain):
            raise ValueError("Invalid domain hostname")
        if "." not in domain or domain.endswith(".example") or domain.endswith(".local"):
            raise ValueError("Set the final public domain, not an example")
        db = data.get("POSTGRES_DB", "")
        user = data.get("POSTGRES_USER", "")
        if not all(re.fullmatch(r"[A-Za-z_][A-Za-z0-9_]*", name) for name in (db, user)):
            raise ValueError("Set safe database and role names")
        db_password = data.get("POSTGRES_PASSWORD", "")
        jwt_key = data.get("JWT_KEY", "")
        if len(db_password) < 24 or "REPLACE" in db_password.upper():
            raise ValueError("Use a unique random PostgreSQL password (at least 24 chars)")
        if not re.fullmatch(r"[A-Za-z0-9_-]+", db_password):
            raise ValueError("Use a URL-safe DB password without semicolons or spaces")
        if len(jwt_key.encode("utf-8")) < 32 or "REPLACE" in jwt_key.upper():
            raise ValueError("Use a unique random JWT signing key (at least 32 bytes)")
        if db_password == jwt_key:
            raise ValueError("Database password and JWT signing key must differ")
        if data.get("SOCIAL_LOGIN_ENABLED", "").lower() in {"1", "true"}:
            if not data.get("GOOGLE_CLIENT_ID", "").endswith(".apps.googleusercontent.com"):
                raise ValueError("Google OAuth must be configured before enabling social login")
    except (OSError, UnicodeError, ValueError) as exc:
        # Our validation error messages never include secret values.
        print(f"FAIL: {exc}", file=sys.stderr)
        return 1
    print("PASS: environment file permissions, final domain and secret prerequisites")
    print("Next: docker compose --env-file .env -f compose.yml config --quiet")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
