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


def reorder_category(token, route, next_order):
    boundary = "MWFreeCategoryOrder"
    form = (
        f"--{boundary}\r\n"
        'Content-Disposition: form-data; name="Order"\r\n\r\n'
        f"{next_order}\r\n"
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
    # Legacy learners without a selected stage now default to Elementary.
    # There is no daily limit for questions within accessible categories.
    initial = expect("GET", "/api/users/daily-quota", 200, token=free)
    assert initial["StageId"] == 1 and initial["Unlimited"], initial
    assert initial["Limit"] == 0 and initial.get("Remaining") is None, initial
    status, _ = api("GET", "/api/users/daily-quota?stageId=9999", token=free)
    assert status == 404, status

    questions = [create_question(admin, 3100 + i, 1, 1) for i in range(12)]
    # Let both clients know which topics contain real published questions;
    # a known-empty topic must not lead to an empty problem-list dead end.
    category_catalog = expect("GET", "/api/categories", 200, token=free)
    assert all(isinstance(category.get("ProblemsCount"), int)
               for category in category_catalog), category_catalog
    first_inventory = next(c for c in category_catalog if c["Id"] == 1)
    assert first_inventory["ProblemsCount"] >= len(questions), first_inventory
    catalog = expect("GET", "/api/stages/1/free-categories", 200)
    assert catalog["FreeCategoryIds"] == [1, 2], catalog
    assert catalog["FreeCategoryCount"] == 2, catalog
    assert catalog.get("DailyProblemLimit") is None, catalog
    assert {item["Id"] for item in catalog["Categories"] if item["IsFree"]} == {1, 2}, catalog
    # The same response must provide real published-question counts. The
    # category page must not depend on a second /categories HTTP request.
    public_counts = {item["Id"]: item["ProblemsCount"]
                     for item in category_catalog if item["StageId"] == 1}
    assert {item["Id"] for item in catalog["Categories"]} == set(public_counts), catalog
    assert all(isinstance(item.get("ProblemsCount"), int) and
               item["ProblemsCount"] == public_counts[item["Id"]]
               for item in catalog["Categories"]), (catalog, public_counts)
    locked_question = create_question(admin, 3999, 1, 3)
    updated_catalog = expect("GET", "/api/stages/1/free-categories", 200)
    updated_count = next(item["ProblemsCount"]
                         for item in updated_catalog["Categories"]
                         if item["Id"] == 3)
    assert updated_count == public_counts[3] + 1, updated_catalog
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
    # An already-solved problem can be replayed only after resetting its
    # entire category (never individually); regular practice is unlimited.
    code, body = submit(free, *questions[0])
    assert code == 409, (code, body)
    reset = expect("POST", "/api/users/practice/reset", 200,
                   {"StageId": 1, "CategoryId": 1}, free)
    assert reset["ResetSolved"] >= 1, reset
    code, body = submit(free, *questions[0])
    assert code == 200 and body["Data"]["IsCorrect"], (code, body)

    # Hide-solved is a database-side filter, not a page-local UI shortcut.
    visible = expect("GET", "/api/problems/search?stageId=1&categoryId=1&pageSize=100",
                     200, token=free)
    unsolved = expect("GET", "/api/problems/search?stageId=1&categoryId=1&pageSize=100&hideSolved=true",
                      200, token=free)
    assert unsolved["Total"] == visible["Total"] - 1, (
        "Solved questions must be excluded before pagination and totals", visible, unsolved
    )
    # Resetting this category made all previously solved questions New,
    # except the single question the learner just answered in the new cycle.
    assert questions[0][0] not in {p["Id"] for p in unsolved["Results"]}, unsolved
    assert {qid for qid, _ in questions[1:]}.issubset(
        {p["Id"] for p in unsolved["Results"]}), unsolved
    unauthorized, _ = api("GET", "/api/problems/search?stageId=1&hideSolved=true")
    assert unauthorized == 401, unauthorized

    # An earlier-stage mistake must remain in the notebook after changing
    # educational stage. The backend still enforces the two Free categories
    # per stage and must never expose a locked topic from another stage.
    stage_two_question = create_question(admin, 4401, 2, 5)
    second_options = expect("GET", f"/api/problems/{stage_two_question[0]}",
                            200, token=admin)["Options"]
    incorrect_option = next(o["Id"] for o in second_options if not o["IsCorrect"])
    expect("PUT", "/api/users/learning-stage", 200, {"StageId": 2}, free)
    assert_unlimited(free, 2)
    wrong_status, wrong_body = submit(free, stage_two_question[0], incorrect_option)
    assert wrong_status == 200 and not wrong_body["Data"]["IsCorrect"], (
        wrong_status, wrong_body
    )
    expect("PUT", "/api/users/learning-stage", 200, {"StageId": 1}, free)
    notebook = expect("GET", "/api/users/error-notebook?includeArchived=true",
                      200, token=free)
    assert stage_two_question[0] in {problem["Id"] for problem in notebook}, (
        "A past-stage mistake was lost after switching stages", notebook
    )

    # Premium still controls pre-answer solutions and analytics, not daily quota.
    subprocess.run([
        "psql", "-X", "-v", "ON_ERROR_STOP=1",
        "-c", """UPDATE "Users" SET "SubscriptionType"='Premium'
                 WHERE "Email"='learner-ci-502@mathworld.test' AND "Role"='Student'"""
    ], check=True, timeout=20, capture_output=True)
    paid = expect("GET", "/api/users/subscription", 200, token=premium)
    assert paid["IsPremium"] and not paid["CanRevealSolutionBeforeAnswer"] and paid["CanUseProgressiveHints"], paid
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
    for protected_path in (
        f"/api/problems/{locked_question[0]}/solution-preview",
        f"/api/problems/{locked_question[0]}/premium-solution",
        "/api/users/premium-report",
    ):
        denied, _ = api("GET", protected_path, token=premium)
        assert denied == 403, (protected_path, denied)

    assert_unlimited(premium, 1)

    # The default (unsaved) Free pair is already effective for learners.
    # Deleting, moving or reordering another category into the top two
    # must not silently change which questions the Free learner can access.
    default_catalog = expect("GET", "/api/stages/1/free-categories", 200)
    assert default_catalog["FreeCategoryIds"] == [1, 2], default_catalog
    assert not default_catalog["HasSavedFreeSelection"], default_catalog
    for route in ("/api/categories/2", "/api/admin/categories/2"):
        assert api("DELETE", route, token=admin)[0] == 409, route
        assert move_category(admin, route, 2) == 409, route
    for route in ("/api/categories/3", "/api/admin/categories/3"):
        assert reorder_category(admin, route, 0) == 409, route

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
    assert catalog["HasSavedFreeSelection"], catalog
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
    assert reorder_category(admin, "/api/admin/categories/3", 0) == 200, (
        "Explicitly saved Free pair must survive category editorial reordering"
    )
    after_reorder = expect("GET", "/api/stages/1/free-categories", 200)
    assert after_reorder["FreeCategoryIds"] == [2, 3], after_reorder
    print("PASS: Free unlimited practice, protected default/saved selection and admin/category guards.")


if __name__ == "__main__":
    main()
