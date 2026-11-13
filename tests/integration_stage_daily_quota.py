#!/usr/bin/env python3
"""Free daily quotas are stage-local, replay safe, and concurrency safe.

Runs ONLY against a disposable local PostgreSQL CI backend.
"""
import concurrent.futures
import os
import subprocess
from integration_problem_history import (
    BASE, ADMIN_EMAIL, ADMIN_PASSWORD, api, expect,
    make_question, student, submit, token_of, wait_ready,
)


def question(admin, marker, stage, category):
    payload = make_question(marker)
    payload["StageId"] = stage
    payload["CategoryId"] = category
    created = expect("POST", "/api/admin/problems", 201, payload, admin)
    qid = created["Id"]
    detail = expect("GET", f"/api/problems/{qid}", 200, token=admin)
    correct = next(option["Id"] for option in detail["Options"]
                   if option["IsCorrect"])
    return qid, correct


def quota(token, stage=None):
    suffix = f"?stageId={stage}" if stage is not None else ""
    return expect("GET", "/api/users/daily-quota" + suffix, 200, token=token)


def assert_quota(token, stage, used, remaining):
    result = quota(token, stage)
    assert result["StageId"] == stage, result
    assert result["Used"] == used, result
    assert result["Remaining"] == remaining, result
    assert result["Limit"] == 10 and not result["Unlimited"], result
    assert result["ResetsAtUtc"] > result["DayUtc"], result


def main():
    assert BASE.startswith(("http://127.0.0.1:", "http://localhost:"))
    assert (os.getenv("PGDATABASE") == "mathworld_ci" and
            os.getenv("PGHOST") in ("localhost", "127.0.0.1")), (
        "Refusing to mutate non-disposable PostgreSQL"
    )
    wait_ready()
    admin = token_of(expect("POST", "/api/auth/login", 200, {
        "Email": ADMIN_EMAIL, "Password": ADMIN_PASSWORD
    }))
    one, two, three = student(501), student(502), student(503)

    status, _ = api("GET", "/api/users/daily-quota", token=admin)
    assert status == 403, status
    status, _ = api("GET", "/api/users/daily-quota")
    assert status == 401, status
    status, _ = api("GET", "/api/users/daily-quota", token=one)
    assert status == 409, status
    status, _ = api("GET", "/api/users/daily-quota?stageId=9999", token=one)
    assert status == 404, status

    q1 = [question(admin, 2100 + i, 1, 1) for i in range(11)]
    q2 = [question(admin, 2200 + i, 2, 5) for i in range(11)]
    q3 = [question(admin, 2300 + i, 1, 1) for i in range(11)]

    expect("PUT", "/api/users/learning-stage", 200, {"StageId": 1}, one)
    assert_quota(one, 1, 0, 10)
    for qid, correct in q1[:10]:
        status, data = submit(one, qid, correct)
        assert status == 200, (status, data)
    assert_quota(one, 1, 10, 0)

    code, body = submit(one, *q1[10])
    assert code == 429 and "10" in str(body), (code, body)
    # Re-attempt the first-ever solved problem: no extra quota consumed.
    code, body = submit(one, *q1[0])
    assert code == 200 and not body["Data"]["IsOfficialAttempt"], (code, body)
    assert_quota(one, 1, 10, 0)

    # Changing stage does not reset used Stage 1 allowance.
    expect("PUT", "/api/users/learning-stage", 200, {"StageId": 2}, one)
    assert quota(one)["StageId"] == 2
    assert_quota(one, 2, 0, 10)
    code, body = submit(one, *q2[0])
    assert code == 200, (code, body)
    assert_quota(one, 2, 1, 9)
    expect("PUT", "/api/users/learning-stage", 200, {"StageId": 1}, one)
    assert_quota(one, 1, 10, 0)
    assert_quota(one, 2, 1, 9)

    # Same 10-per-stage limit applies to a different learner.
    for qid, correct in q2[:10]:
        code, body = submit(two, qid, correct)
        assert code == 200, (code, body)
    code, body = submit(two, *q2[10])
    assert code == 429, (code, body)
    assert_quota(two, 2, 10, 0)
    # Disposable PostgreSQL only: simulate a future audited admin upgrade.
    subprocess.run([
        "psql", "-X", "-v", "ON_ERROR_STOP=1",
        "-c", """UPDATE "Users" SET "SubscriptionType"='Premium'
                 WHERE "Email"='learner-ci-502@mathworld.test' AND "Role"='Student'"""
    ], check=True, timeout=20, capture_output=True)
    premium = quota(two, 2)
    assert premium["Unlimited"] and premium.get("Remaining") is None, premium
    code, body = submit(two, *q2[10])
    assert code == 200, (code, body)

    # Expired Premium must no longer bypass the 10-question Free limit.
    expired_question = question(admin, 2500, 2, 5)
    subprocess.run([
        "psql", "-X", "-v", "ON_ERROR_STOP=1",
        "-c", """UPDATE "Users"
                 SET "PremiumExpiresAtUtc" = NOW() - INTERVAL '1 second'
                 WHERE "Email"='learner-ci-502@mathworld.test'
                   AND "Role"='Student'"""
    ], check=True, timeout=20, capture_output=True)
    expired = quota(two, 2)
    assert not expired["Unlimited"] and expired["SubscriptionType"] == "Free", expired
    code, body = submit(two, *expired_question)
    assert code == 429, (code, body)

    # Removing expiry restores the original indefinite Premium grant.
    subprocess.run([
        "psql", "-X", "-v", "ON_ERROR_STOP=1",
        "-c", """UPDATE "Users"
                 SET "PremiumExpiresAtUtc" = NULL
                 WHERE "Email"='learner-ci-502@mathworld.test'
                   AND "Role"='Student'"""
    ], check=True, timeout=20, capture_output=True)
    assert quota(two, 2)["Unlimited"]
    code, body = submit(two, *expired_question)
    assert code == 200, (code, body)

    # Admin-only subscription controls must record a durable audit trail.
    import urllib.parse
    student_email = "learner-ci-502@mathworld.test"
    # Resolve the learner through the admin-only directory, not by guessing IDs.
    directory = expect("GET", "/api/admin/learners?search=" +
                       urllib.parse.quote(student_email), 200, token=admin)
    learner = next(x for x in directory["Learners"] if x["Email"] == student_email)
    learner_id = learner["Id"]
    endpoint = f"/api/admin/learners/{learner_id}/subscription"
    change = {"SubscriptionType": "Free", "Reason": "CI expiry and revoke check"}
    status, _ = api("PUT", endpoint, change, two)
    assert status == 403, status
    status, _ = api("PUT", endpoint, change)
    assert status == 401, status
    changed = expect("PUT", endpoint, 200, change, admin)
    assert changed["SubscriptionType"] == "Free", changed
    assert not quota(two, 2)["Unlimited"]
    history = expect("GET", endpoint + "-history", 200, token=admin)
    assert history["Total"] >= 1 and history["Records"][0]["NewType"] == "Free", history
    changed = expect("PUT", endpoint, 200, {
        "SubscriptionType": "Premium",
        "Reason": "CI administrator grant check"
    }, admin)
    assert changed["Unlimited"] and quota(two, 2)["Unlimited"], changed

    # Two DIFFERENT questions racing for the same final slot must serialize.
    for qid, correct in q3[:9]:
        code, body = submit(three, qid, correct)
        assert code == 200, (code, body)
    assert_quota(three, 1, 9, 1)
    with concurrent.futures.ThreadPoolExecutor(max_workers=2) as executor:
        results = list(executor.map(lambda q: submit(three, *q), q3[9:11]))
    assert sorted(code for code, _ in results) == [200, 429], results
    assert_quota(three, 1, 10, 0)

    print("PASS: free per-stage 10, historical retry, stage switch, "
          "Premium bypass, same-stage concurrent submit, auth and scope")


if __name__ == "__main__":
    main()
