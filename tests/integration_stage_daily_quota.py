#!/usr/bin/env python3
"""Unlimited practice remains stage-scoped for reporting and retry safe.

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
    assert result.get("Remaining") is None, result
    assert result["Limit"] == 0 and result["Unlimited"], result
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
    locked_one = question(admin, 2400, 1, 3)
    locked_two = question(admin, 2500, 2, 7)

    # Free students cannot fetch answers or submit directly for locked categories.
    assert api("GET", f"/api/problems/{locked_one[0]}", token=one)[0] == 403
    assert submit(one, *locked_one)[0] == 403
    # Admin tools still access all content without Free restrictions.
    assert api("GET", f"/api/problems/{locked_one[0]}", token=admin)[0] == 200


    expect("PUT", "/api/users/learning-stage", 200, {"StageId": 1}, one)
    assert_quota(one, 1, 0, None)
    for qid, correct in q1[:10]:
        status, data = submit(one, qid, correct)
        assert status == 200, (status, data)
    assert_quota(one, 1, 10, None)

    code, body = submit(one, *q1[10])
    assert code == 200, (code, body)
    # Re-attempt the first-ever solved problem: no extra quota consumed.
    code, body = submit(one, *q1[0])
    assert code == 200 and not body["Data"]["IsOfficialAttempt"], (code, body)
    assert_quota(one, 1, 11, None)

    # Changing stage does not reset used Stage 1 allowance.
    expect("PUT", "/api/users/learning-stage", 200, {"StageId": 2}, one)
    assert quota(one)["StageId"] == 2
    assert_quota(one, 2, 0, None)
    code, body = submit(one, *q2[0])
    assert code == 200, (code, body)
    assert_quota(one, 2, 1, None)
    expect("PUT", "/api/users/learning-stage", 200, {"StageId": 1}, one)
    assert_quota(one, 1, 11, None)
    assert_quota(one, 2, 1, None)

    # A different Free learner can also answer more than ten.
    for qid, correct in q2[:10]:
        code, body = submit(two, qid, correct)
        assert code == 200, (code, body)
    code, body = submit(two, *q2[10])
    assert code == 200, (code, body)
    assert_quota(two, 2, 11, None)
    # Disposable PostgreSQL only: simulate a future audited admin upgrade.
    subprocess.run([
        "psql", "-X", "-v", "ON_ERROR_STOP=1",
        "-c", """UPDATE "Users" SET "SubscriptionType"='Premium'
                 WHERE "Email"='learner-ci-502@mathworld.test' AND "Role"='Student'"""
    ], check=True, timeout=20, capture_output=True)
    premium = quota(two, 2)
    assert premium["Unlimited"] and premium.get("Remaining") is None, premium
    assert api("GET", f"/api/problems/{locked_two[0]}", token=two)[0] == 200
    assert submit(two, *locked_two)[0] == 200
    code, body = submit(two, *q2[10])
    assert code == 200, (code, body)

    # Concurrent first attempts must both succeed without a daily cap.
    for qid, correct in q3[:9]:
        code, body = submit(three, qid, correct)
        assert code == 200, (code, body)
    assert_quota(three, 1, 9, None)
    with concurrent.futures.ThreadPoolExecutor(max_workers=2) as executor:
        results = list(executor.map(lambda q: submit(three, *q), q3[9:11]))
    assert sorted(code for code, _ in results) == [200, 200], results
    assert_quota(three, 1, 11, None)

    print("PASS: unlimited practice, stage-scoped reporting, retries, "
          "Premium and Free concurrent submissions, auth and scope")


if __name__ == "__main__":
    main()
