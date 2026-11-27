#!/usr/bin/env python3
"""Bounded anonymous production timing samples; not a load test or authenticated UAT."""
import json
import time
from urllib.request import Request, urlopen
from urllib.parse import urlsplit

API = "https://mathwordbackend.onrender.com"
WEB = "https://math-world-frontend.vercel.app"
MAX_BYTES = 3_000_000
samples = []

def measure(label, url, accept, round_number):
    start = time.monotonic()
    with urlopen(Request(url, headers={
        "User-Agent": "MathWorld-Bounded-Latency-Smoke/1.0",
        "Accept": accept,
        "Accept-Language": "ar",
    }), timeout=30) as response:
        if response.status != 200 or urlsplit(response.geturl()).netloc != urlsplit(url).netloc:
            raise RuntimeError("Unexpected status or redirect")
        headers_ms = round((time.monotonic() - start) * 1000)
        raw = response.read(MAX_BYTES + 1)
        total_ms = round((time.monotonic() - start) * 1000)
        if len(raw) > MAX_BYTES:
            raise RuntimeError("Response exceeded bounded read")
        row = dict(label=label, sample=round_number, status=response.status,
                   headers_ms=headers_ms, total_ms=total_ms, bytes=len(raw))
        samples.append(row)
        print(json.dumps(row), flush=True)
    time.sleep(1.5)
    return json.loads(raw) if accept == "application/json" else None

def main():
    # At most 12 sequential GETs, no credentials, retry, or concurrency.
    # First sample is not necessarily a cold start; neither sample is a percentile.
    for n in (1, 2):
        measure("public-home-ar", WEB+"/ar", "text/html", n)
        measure("public-stages-ar", WEB+"/ar/stages", "text/html", n)
        measure("api-stages", API+"/api/Stages", "application/json", n)
        measure("api-stats", API+"/api/Stats", "application/json", n)
        catalog = measure("api-stage-2-tracks", API+"/api/stages/2/tracks", "application/json", n)
        items = catalog.get("Items", catalog.get("items", []))
        if not items:
            raise RuntimeError("Stage 2 has no published tracks; detail not measured")
        track = items[0]
        track_id = int(track.get("Id", track.get("id", 0)))
        if track_id <= 0:
            raise RuntimeError("Invalid track ID")
        measure("api-track-detail", API+f"/api/learning-tracks/{track_id}", "application/json", n)

if __name__ == "__main__":
    try:
        main()
    finally:
        with open("public-latency-samples.json", "w", encoding="utf-8") as result:
            json.dump(samples, result, indent=2)
        print("Diagnostic samples only: runner-to-origin elapsed times; no rendering, student or admin UAT.", flush=True)
