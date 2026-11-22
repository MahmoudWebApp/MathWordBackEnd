#!/usr/bin/env python3
"""Presence API checks on disposable local PostgreSQL only. No production writes."""
import os
import subprocess
import threading
import urllib.request
import urllib.error
from contextlib import ExitStack
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

    actor_id = first["Students"][0]["Id"]

    # SSE is an authenticated, user-scoped *refresh hint*, not a source of
    # notification bodies or bearer tokens. Reuse these already-created
    # students so the real five-per-minute auth limiter remains enabled.
    assert api("GET", "/api/notifications/stream")[0] == 401

    def open_stream(token):
        request = urllib.request.Request(
            BASE + "/api/notifications/stream",
            headers={"Authorization": "Bearer " + token,
                     "Accept": "text/event-stream"}
        )
        response = urllib.request.urlopen(request, timeout=7)
        assert "text/event-stream" in response.headers.get("Content-Type", "")
        assert response.readline().startswith(b": connected")
        assert response.readline().strip() == b""
        return response

    def reader_loop(response, received, observed):
        try:
            while True:
                line = response.readline()
                if not line:
                    break
                if line.strip() == b"event: inbox":
                    received.append(line)
                    observed.set()
                    return
                assert b"Bearer " not in line and b"learner-ci-" not in line
        except (OSError, ValueError):
            pass

    first_seen, second_seen = threading.Event(), threading.Event()
    first_frames, second_frames = [], []
    with ExitStack() as stack:
        first_stream = stack.enter_context(open_stream(one))
        second_stream = stack.enter_context(open_stream(two))
        listener1 = threading.Thread(
            target=reader_loop, args=(first_stream, first_frames, first_seen),
            daemon=True)
        listener2 = threading.Thread(
            target=reader_loop, args=(second_stream, second_frames, second_seen),
            daemon=True)
        listener1.start()
        listener2.start()

        notice = {
            "TitleAr": "اختبار حدث لحظي", "TitleEn": "Realtime event test",
            "BodyAr": "بيانات خاصة لا تدخل البث",
            "BodyEn": "Private notice body never enters SSE",
            "TargetPath": "/dashboard",
        }
        expect("POST", f"/api/admin/notifications/learners/{actor_id}", 200,
               notice, admin)
        assert first_seen.wait(5), "Learner 1 did not receive an inbox hint"
        assert not second_seen.wait(.6), "Notification leaked to another learner"

        learner2_directory = expect(
            "GET",
            "/api/admin/engagement/students?search=CI%20Learner%209812",
            200, token=admin)
        second_id = learner2_directory["Students"][0]["Id"]
        expect("POST", f"/api/admin/notifications/learners/{second_id}",
               200, notice, admin)
        assert second_seen.wait(5), "Learner 2 did not receive an inbox hint"
        assert first_frames == [b"event: inbox\n"], first_frames
        assert second_frames == [b"event: inbox\n"], second_frames

    # A user-initiated sign-out is an explicit action, not a browser-close guess.
    expect("POST", "/api/users/session/sign-out", 204, token=one)
    learner_activity = expect(
        "GET", "/api/admin/engagement/students?search=CI%20Learner%209811",
        200, token=admin)
    assert learner_activity["Students"][0]["LastExplicitSignOutAtUtc"], learner_activity
    # An unclosed second session must never invent a sign-out timestamp.
    learner2_activity = expect(
        "GET", "/api/admin/engagement/students?search=CI%20Learner%209812",
        200, token=admin)
    assert learner2_activity["Students"][0].get("LastExplicitSignOutAtUtc") is None, learner2_activity
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

    # Read-only CSV export must enforce the same admin ownership and filters.
    csv_request = urllib.request.Request(
        BASE + "/api/admin/activity-audit/export.csv?days=30"
               "&action=ExplicitSignOut&actorId=" + str(actor_id),
        headers={"Authorization": "Bearer " + admin, "Accept": "text/csv"})
    with urllib.request.urlopen(csv_request, timeout=10) as csv_response:
        exported = csv_response.read().decode("utf-8-sig")
        assert csv_response.headers.get("Cache-Control") == "no-store"
        assert csv_response.headers.get("Content-Type", "").startswith("text/csv")
        assert exported.startswith("EventId,ActorUserId,ActorName,")
        assert "ExplicitSignOut" in exported, exported
        assert "password" not in exported.lower()
    forbidden = urllib.request.Request(
        BASE + "/api/admin/activity-audit/export.csv?days=30",
        headers={"Authorization": "Bearer " + one})
    try:
        urllib.request.urlopen(forbidden, timeout=10)
        raise AssertionError("Student downloaded an admin-only audit CSV")
    except urllib.error.HTTPError as forbidden_response:
        assert forbidden_response.code == 403, forbidden_response.code

    print("PASS: learner-only presence, session ownership, per-stage counts, expiry, isolated SSE notifications and private sign-out audit")


if __name__ == "__main__":
    main()
