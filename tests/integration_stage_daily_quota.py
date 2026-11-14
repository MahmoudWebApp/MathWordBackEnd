#!/usr/bin/env python3
"""Free unlimited practice and Premium entitlements against disposable PostgreSQL CI only."""
import os
import subprocess
import urllib.request
import urllib.error
from integration_problem_history import (
    BASE, ADMIN_EMAIL, ADMIN_PASSWORD, api, expect,
    make_question, student, submit, token_of, wait_ready,
)


def create_question(admin, marker, stage, category):
    payload = make_question(marker)
    payload["StageId"] = stage
    payload["CategoryId"] = category
    created = expect("POST", "/api/admin/problems", 201, payload, admin)
    qid = created["Id"]
    detail = expect("GET", f"/api/problems/{qid}", 200, token=admin)
    correct = next(o["Id"] for o in detail["Options"] if o["IsCorrect"])
    return qid, correct


def move_category(token, route, target_stage):
    # Both API endpoints bind category updates from multipart/form-data.
    boundary = "MWFreeCategoryGuard"
    form = (
        f"--{boundary}\r\n"
        'Content-Disposition: form-data; name="StageId"\r\n\r\n'
        f"{target_stage}\r\n"
        f"--{boundary}--\r\n"
    ).encode("utf-8")
    request = urllib.request.Request(
        BASE + route, data=form,
        headers={
            "Authorization": "Bearer " + token,
            "Content-Type": f"multipart/form-data; boundary={boundary}",
        }, method="PUT",
    )
    try:
        with urllib.request.urlopen(request, timeout=25) as response:
            return response.status
    except urllib.error.HTTPError as error:
        return error.code


def quota(token, stage=None):
    suffix = f"?stageId={stage}" if stage is not None else ""
    return expect("GET", "/api/users/daily-quota" + suffix, 200, token=token)


def assert_unlimited(token, stage):
    result = quota(token, stage)
    assert result["StageId"] == stage, result
    assert result["Unlimited"] and result.get("Remaining") is None, result
    assert result["Limit"] == 0, result


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
    free, premium = student(501), student(502)
    status, _ = api("GET", "/api/users/subscription")
    assert status == 401, status
    status, _ = api("GET", "/api/users/subscription", token=admin)
    assert status == 403, status
    ent = expect("GET", "/api/users/subscription", 200, token=free)
    assert ent["SubscriptionType"] == "Free" and not ent["IsPremium"], ent
    assert ent.get("DailyNewProblemsLimit") is None, ent
    assert ent["FreeCategoriesPerStage"] == 2, ent
    assert not ent["CanRevealSolutionBeforeAnswer"], ent
    assert not ent["CanExportAnalytics"], ent

    status, _ = api("GET", "/api/users/daily-quota", token=admin)
    assert status == 403, status
    status, _ = api("GET", "/api/users/daily-quota")
    assert status == 401, status
    status, _ = api("GET", "/api/users/daily-quota", token=free)
    assert status == 409, status
    status, _ = api("GET", "/api/users/daily-quota?stageId=9999", token=free)
    assert status == 404, status

    questions = [create_question(admin, 3100 + i, 1, 1) for i in range(12)]
    catalog = expect("GET", "/api/stages/1/free-categories", 200)
    assert catalog["FreeCategoryIds"] == [1, 2], catalog
    assert catalog["FreeCategoryCount"] == 2, catalog
    assert catalog.get("DailyProblemLimit") is None, catalog
    assert {item["Id"] for item in catalog["Categories"] if item["IsFree"]} == {1, 2}, catalog
    locked_question = create_question(admin, 3999, 1, 3)
    code, _ = api("GET", f"/api/problems/{locked_question[0]}", token=free)
    assert code == 403, code
    code, _ = submit(free, *locked_question)
    assert code == 403, code
    code, _ = api("GET", "/api/categories/3/problems", token=free)
    assert code == 403, code

    expect("PUT", "/api/users/learning-stage", 200, {"StageId": 1}, free)
    assert_unlimited(free, 1)
    for qid, correct in questions:
        code, body = submit(free, qid, correct)
        assert code == 200, (code, body)
    assert_unlimited(free, 1)
    # Reattempts remain allowed and should not become new official attempts.
    code, body = submit(free, *questions[0])
    assert code == 200 and not body["Data"]["IsOfficialAttempt"], (code, body)

    # Premium still controls pre-answer solutions and analytics, not daily quota.
    subprocess.run([
        "psql", "-X", "-v", "ON_ERROR_STOP=1",
        "-c", """UPDATE "Users" SET "SubscriptionType"='Premium'
                 WHERE "Email"='learner-ci-502@mathworld.test' AND "Role"='Student'"""
    ], check=True, timeout=20, capture_output=True)
    paid = expect("GET", "/api/users/subscription", 200, token=premium)
    assert paid["IsPremium"] and paid["CanRevealSolutionBeforeAnswer"], paid
    assert paid["CanExportAnalytics"] and paid.get("DailyNewProblemsLimit") is None, paid
    assert_unlimited(premium, 1)
    code, _ = api("GET", f"/api/problems/{locked_question[0]}", token=premium)
    assert code == 200, code
    code, body = submit(premium, *locked_question)
    assert code == 200, (code, body)

    subprocess.run([
        "psql", "-X", "-v", "ON_ERROR_STOP=1",
        "-c", """UPDATE "Users" SET "PremiumExpiresAtUtc"=NOW()-INTERVAL '1 second'
                 WHERE "Email"='learner-ci-502@mathworld.test' AND "Role"='Student'"""
    ], check=True, timeout=20, capture_output=True)
    expired = expect("GET", "/api/users/subscription", 200, token=premium)
    assert not expired["IsPremium"] and not expired["CanExportAnalytics"], expired
    assert expired.get("DailyNewProblemsLimit") is None, expired
    assert_unlimited(premium, 1)

    # The default (unsaved) Free pair is already effective for learners.
    # Category 2 has no problems; deleting/moving it would silently change
    # which category a Free learner can reach.
    for route in ("/api/categories/2", "/api/admin/categories/2"):
        assert api("DELETE", route, token=admin)[0] == 409, route
        assert move_category(admin, route, 2) == 409, route

    # The dashboard talks to /api/admin/categories, not /api/categories.
    # Selecting exactly two Free categories must be server-authorized and
    # prevent both routes from deleting/moving an explicitly selected one.
    assert api("PUT", "/api/admin/stages/1/free-categories", {
        "CategoryIds": [2, 3]
    }, free)[0] == 403
    assert api("PUT", "/api/admin/stages/1/free-categories", {
        "CategoryIds": [2, 3]
    })[0] == 401
    assert api("PUT", "/api/admin/stages/1/free-categories", {
        "CategoryIds": [2, 2]
    }, admin)[0] == 400
    assert api("PUT", "/api/admin/stages/1/free-categories", {
        "CategoryIds": [2, 5]
    }, admin)[0] == 400
    saved = expect("PUT", "/api/admin/stages/1/free-categories", 200, {
        "CategoryIds": [2, 3]
    }, admin)
    assert saved["FreeCategoryIds"] == [2, 3], saved
    catalog = expect("GET", "/api/stages/1/free-categories", 200)
    assert catalog["FreeCategoryIds"] == [2, 3], catalog
    assert {x["Id"] for x in catalog["Categories"] if x["IsFree"]} == {2, 3}
    assert api("GET", f"/api/problems/{questions[0][0]}", token=free)[0] == 403
    assert api("GET", f"/api/problems/{locked_question[0]}", token=free)[0] == 200
    for route in ("/api/categories/2", "/api/admin/categories/2"):
        assert api("DELETE", route, token=admin)[0] == 409, route
        assert move_category(admin, route, 2) == 409, route
    assert move_category(admin, "/api/admin/categories/1", 2) == 409, (
        "Populated category moved through dashboard route"
    )
    print("PASS: Free unlimited practice, audited stage selection and both admin/category guards.")


if __name__ == "__main__":
    main()
