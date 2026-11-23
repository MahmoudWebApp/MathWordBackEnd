#!/usr/bin/env python3
"""Read-only API latency smoke test for the same MathWorld official domain.

No auth cookies/tokens, mutations, or private responses are used.
Measurements are end-to-end HTTP round trips from the machine running this
script, NOT isolated SQL durations. Use before/after on the same network.
"""
from __future__ import annotations

import argparse
import json
import statistics
import time
import urllib.error
import urllib.parse
import urllib.request

PATHS = [
    "/health",
    "/api/stages",
    "/api/categories",
    "/api/stages/1/free-categories",
    "/api/problems/search?page=1&pageSize=10",
]


def percentile(values: list[float], ratio: float) -> float:
    ordered = sorted(values)
    index = max(0, min(len(ordered) - 1, round(ratio * (len(ordered) - 1))))
    return ordered[index]


def measure(base: str, path: str, timeout: float) -> tuple[int, float]:
    # Fixed route allowlist: no input-provided path, method, cookies or token.
    url = base.rstrip("/") + path
    request = urllib.request.Request(
        url,
        method="GET",
        headers={"Accept": "application/json", "User-Agent": "MathWorld-ReadOnly-LatencyAudit/1"},
    )
    start = time.perf_counter()
    try:
        with urllib.request.urlopen(request, timeout=timeout) as response:
            code = response.status
            response.read(512)  # Confirm payload starts arriving.
    except urllib.error.HTTPError as error:
        code = error.code
    duration = (time.perf_counter() - start) * 1000
    return code, duration


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("base_url", help="HTTPS official origin, without /api")
    parser.add_argument("--rounds", type=int, default=5)
    parser.add_argument("--timeout", type=float, default=15)
    args = parser.parse_args()
    parsed = urllib.parse.urlparse(args.base_url)
    if parsed.scheme not in {"https", "http"} or not parsed.hostname:
        parser.error("Use a valid HTTP(S) origin.")
    if parsed.username or parsed.password or parsed.query or parsed.fragment:
        parser.error("Credentials or query strings are not allowed in the origin.")
    if parsed.path not in {"", "/"}:
        parser.error("Pass a bare origin, not an API path.")
    if not (1 <= args.rounds <= 30 and 1 <= args.timeout <= 30):
        parser.error("Use 1–30 rounds and timeout 1–30 seconds.")

    rows = []
    failed = False
    for path in PATHS:
        timings: list[float] = []
        codes: list[int] = []
        for _ in range(args.rounds):
            try:
                code, milliseconds = measure(args.base_url, path, args.timeout)
            except (OSError, TimeoutError) as error:
                print(json.dumps({"path": path, "error_type": type(error).__name__}))
                failed = True
                break
            codes.append(code)
            timings.append(milliseconds)
            if not 200 <= code < 300:
                failed = True
        if timings:
            rows.append({
                "path": path,
                "statuses": sorted(set(codes)),
                "samples": len(timings),
                "p50_ms": round(statistics.median(timings), 1),
                "p95_ms": round(percentile(timings, 0.95), 1),
                "min_ms": round(min(timings), 1),
                "max_ms": round(max(timings), 1),
            })

    print(json.dumps({"origin": parsed.scheme + "://" + parsed.netloc, "results": rows}, indent=2))
    return int(failed)


if __name__ == "__main__":
    raise SystemExit(main())
