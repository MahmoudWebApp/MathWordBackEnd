#!/usr/bin/env python3
"""Presence API checks on disposable local PostgreSQL only. No production writes."""
import os
import subprocess
from integration_problem_history import (
    BASE, ADMIN_EMAIL, ADMIN_PASSWORD, api, expect,
    student, token_of, wait_ready,
)

A = "dd5d944c-9c96-41c8-8b48-ab57ccce2b11"
B = "fd23e1ab-2c15-4b47-88a9-f3a75faf0e33"
C = "9adb1386-b9f5-4504-bca0-3843fb0c5a88"


def pulse(token, session):
    expect("POST", "/api/users/presence/heartbeat", 204,
           {"SessionId": session}, token)


def overview(admin):
    return expect("GET", "/api/admin/engagement/overview?days=7",
                  200, token=admin)


def main():
    assert BASE.startswith(("http://127.0.0.1:", "http://localhost:"))
    assert os.getenv("PGDATABASE") == "mathworld_ci"
    assert os.getenv("PGHOST") in ("127.0.0.1", "localhost")
    wait_ready()

    admin = token_of(expect("POST", "/api/auth/login", 200, {
        "Email": ADMIN_EMAIL, "Password": ADMIN_PASSWORD
    }))
    one, two = student(9811), student(9812)
    for token in (one, two):
        expect("PUT", "/api/users/learning-stage", 200, {"StageId": 1}, token)

    start = overview(admin)
    baseline = start["OnlineLearners"]

    assert api("POST", "/api/users/presence/heartbeat",
               {"SessionId": A})[0] == 401
    assert api("POST", "/api/users/presence/heartbeat",
               {"SessionId": A}, admin)[0] == 403
    assert api("POST", "/api/users/presence/heartbeat",
               {"SessionId": "00000000-0000-0000-0000-000000000000"}, one)[0] == 400

    pulse(one, A)
    pulse(one, B)
    pulse(one, A)  # idempotent: two sessions still one distinct learner.
    assert overview(admin)["OnlineLearners"] == baseline + 1

    pulse(two, C)
    data = overview(admin)
    assert data["OnlineLearners"] == baseline + 2, data
    stage1 = next(s for s in data["Stages"] if s["StageId"] == 1)
    assert stage1["OnlineLearners"] >= 2, stage1

    first = expect("GET",
                   "/api/admin/engagement/students?onlineOnly=true&search=CI%20Learner%209811",
                   200, token=admin)
    assert first["Total"] == 1, first
    assert first["Students"][0]["IsOnline"] is True, first
    assert first["Students"][0]["LastHeartbeatAtUtc"], first

    # A different authenticated learner cannot remove a victim's session.
    expect("DELETE", f"/api/users/presence/sessions/{A}", 204, token=two)
    assert overview(admin)["OnlineLearners"] == baseline + 2

    expect("DELETE", f"/api/users/presence/sessions/{A}", 204, token=one)
    assert overview(admin)["OnlineLearners"] == baseline + 2
    expect("DELETE", f"/api/users/presence/sessions/{B}", 204, token=one)
    assert overview(admin)["OnlineLearners"] == baseline + 1

    # Expiration is based on DB clock, not a client-supplied timestamp.
    subprocess.run([
        "psql", "-X", "-v", "ON_ERROR_STOP=1",
        "-c", f"""UPDATE "LearnerPresences"
               SET "LastSeenAtUtc"=NOW()-INTERVAL '6 minutes'
               WHERE "SessionId"='{C}'::uuid"""
    ], check=True, capture_output=True, timeout=20)
    assert overview(admin)["OnlineLearners"] == baseline

    stale = expect("GET",
                   "/api/admin/engagement/students?onlineOnly=true&search=CI%20Learner%209812",
                   200, token=admin)
    assert stale["Total"] == 0, stale
    expect("DELETE", f"/api/users/presence/sessions/{C}", 204, token=two)

    # A user-initiated sign-out is an explicit action, not a browser-close guess.
    actor_id = first["Students"][0]["Id"]
    expect("POST", "/api/users/session/sign-out", 204, token=one)
    audit_path = (f"/api/admin/activity-audit?actorId={actor_id}"
                  "&action=ExplicitSignOut&days=30")
    assert api("GET", audit_path, token=one)[0] == 403
    actions = expect("GET", audit_path, 200, token=admin)
    assert actions["Total"] == 1, actions
    event = actions["Entries"][0]
    assert event["ActorUserId"] == actor_id
    assert event["ActorRole"] == "Student"
    assert event["Action"] == "ExplicitSignOut"
    assert "learner-ci-" not in str(event).lower() and "password" not in str(event).lower()

    print("PASS: learner-only presence, session ownership, per-stage counts, expiry and private sign-out audit")


if __name__ == "__main__":
    main()
