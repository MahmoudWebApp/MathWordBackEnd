#!/usr/bin/env python3
"""Smoke/integration tests exclusively against disposable local PostgreSQL."""
import json
import os
import time
import urllib.error
import urllib.request

BASE = os.getenv("MATHWORLD_TEST_BASE_URL", "http://127.0.0.1:5052")
assert BASE.startswith(("http://localhost:", "http://127.0.0.1:")), (
    "This test must never run against a remotely hosted API"
)


def call(method, route, payload=None, token=None):
    headers = {"Accept": "application/json"}
    if token:
        headers["Authorization"] = "Bearer " + token
    data = json.dumps(payload).encode() if payload is not None else None
    if data is not None:
        headers["Content-Type"] = "application/json"
    req = urllib.request.Request(BASE + route, data=data,
                                 headers=headers, method=method)
    try:
        with urllib.request.urlopen(req, timeout=20) as response:
            return response.status, json.loads(response.read())
    except urllib.error.HTTPError as error:
        return error.code, json.loads(error.read())


def expect(method, route, status, payload=None, token=None):
    actual, envelope = call(method, route, payload, token)
    assert actual == status, (method, route, status, actual, envelope)
    return envelope.get("Data", envelope)


def main():
    for attempt in range(90):
        try:
            status, body = call("GET", "/health/ready")
            if status == 200 and body["status"] == "ready":
                break
        except Exception:
            pass
        time.sleep(1)
    else:
        raise AssertionError("Local API did not become ready")

    stages = expect("GET", "/api/stages", 200)
    assert len(stages) >= 2
    stage1, stage2 = stages[0]["Id"], stages[1]["Id"]

    registered = expect("POST", "/api/auth/register", 201, {
        "FullName": "Learning Journey Test Learner",
        "Email": "journey-learner@mathworld.test",
        "Password": "CI_TEST_PASSWORD_2026"
    })
    token = registered["Token"]
    assert registered.get("CurrentStageId") is None
    assert expect("GET", "/api/users/learning-stage", 200, token=token).get("StageId") is None
    expect("GET", "/api/users/journey", 409, token=token)
    expect("PUT", "/api/users/learning-stage", 404, {"StageId": 999999}, token)

    saved = expect("PUT", "/api/users/learning-stage", 200,
                   {"StageId": stage1}, token)
    assert saved["StageId"] == stage1
    assert expect("GET", "/api/users/learning-stage", 200, token=token)["StageId"] == stage1
    journey = expect("GET", "/api/users/journey", 200, token=token)
    assert journey["StageId"] == stage1
    assert journey["SolvedProblems"] == 0
    assert journey["CompletionPercent"] == 0
    assert len(journey["Categories"]) >= 1

    admin_login = expect("POST", "/api/auth/login", 200, {
        "Email": "ci-admin@mathworld.test",
        "Password": "CI_TEST_ADMIN_PASSWORD_12345"
    })
    admin_token = admin_login["Token"]
    create = {
        "QuestionTextAr": "ما قيمة 1 + 1 ؟",
        "QuestionTextEn": "What is 1 + 1?",
        "DetailedSolutionAr": "اثنان",
        "DetailedSolutionEn": "Two",
        "StageId": stage1,
        "CategoryId": 1,
        "Points": 10,
        "Options": [
            {"LatexCode": str(v), "IsCorrect": v == 2, "Order": v}
            for v in range(1, 5)
        ]
    }
    made = expect("POST", "/api/admin/problems", 201, create, admin_token)
    problem_id = made["Id"]
    admin_problems = expect("GET", "/api/admin/problems?pageSize=100",
                            200, token=admin_token)
    item = next(p for p in admin_problems["Results"] if p["Id"] == problem_id)
    correct_id = next(option["Id"] for option in item["Options"]
                      if option["IsCorrect"])
    solved = expect("POST", "/api/problems/submit", 200, {
        "ProblemId": problem_id,
        "SelectedOptionId": correct_id,
        "TimeSpentSeconds": 3
    }, token)
    assert solved["IsCorrect"] is True
    after = expect("GET", "/api/users/journey", 200, token=token)
    assert after["SolvedProblems"] == 1
    assert after["AttemptedProblems"] == 1
    assert after["FirstTryCorrect"] == 1
    assert after["TotalPoints"] == 10
    assert after["Categories"][0]["SolvedProblems"] == 1

    switched = expect("PUT", "/api/users/learning-stage", 200,
                      {"StageId": stage2}, token)
    assert switched["StageId"] == stage2
    other = expect("GET", "/api/users/journey", 200, token=token)
    assert other["StageId"] == stage2
    assert other["SolvedProblems"] == 0

    old = expect("GET", "/api/users/journey?stageId=" + str(stage1),
                 200, token=token)
    assert old["SolvedProblems"] == 1 and old["TotalPoints"] == 10
    profile = expect("GET", "/api/users/profile", 200, token=token)
    assert profile["CurrentStageId"] == stage2
    dashboard = expect("GET", "/api/users/dashboard", 200, token=token)
    assert dashboard["CurrentStageId"] == stage2

    logged_in = expect("POST", "/api/auth/login", 200, {
        "Email": "journey-learner@mathworld.test",
        "Password": "CI_TEST_PASSWORD_2026"
    })
    assert logged_in["CurrentStageId"] == stage2

    assert call("GET", "/api/users/learning-stage")[0] == 401
    assert call("GET", "/api/users/journey")[0] == 401
    print("PASS: onboarding, invalid stage, progress and points, stage switching, old history, auth")


if __name__ == "__main__":
    main()
