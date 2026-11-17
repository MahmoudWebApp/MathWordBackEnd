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
        raw = error.read()
        return error.code, json.loads(raw) if raw else {}


def expect(method, route, status, payload=None, token=None):
    actual, envelope = call(method, route, payload, token)
    assert actual == status, (method, route, status, actual, envelope)
    return envelope.get("Data", envelope)


def main():
    for attempt in range(90):
        try:
            status, body = call("GET", "/health/ready")
            if status == 200 and body["status"] == "ready":
                assert body.get("database") == "available", body
                assert body.get("schema") == "current", body
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

    # Daily challenge is optional practice, not a ten-problem quota or
    # bonus-score exam. It contains only the server-authorized problem cards.
    challenge = expect("GET", "/api/users/daily-challenge", 200, token=token)
    assert challenge["StageId"] == stage1
    assert 1 <= challenge["Total"] <= 5
    assert challenge["Total"] == len(challenge["Problems"])
    assert challenge["Completed"] == 0
    assert challenge["DateUtc"] and len(challenge["DateUtc"]) == 10
    assert all(problem["CategoryId"] in (1, 2)
               for problem in challenge["Problems"]), challenge
    assert all(not (set(problem) &
                    {"IsCorrect", "DetailedSolutionAr", "DetailedSolutionEn",
                     "CorrectOptionId", "Options", "YoutubeSolutionUrl"})
               for problem in challenge["Problems"])
    same_day = expect("GET", "/api/users/daily-challenge", 200, token=token)
    assert same_day["Problems"] == challenge["Problems"]
    assert call("GET", "/api/users/daily-challenge")[0] == 401
    assert call("GET", "/api/users/daily-challenge", token=admin_token)[0] == 403
    assert call("GET", "/api/users/daily-challenge?stageId=999999", token=token)[0] == 404
    admin_problems = expect("GET", "/api/admin/problems?pageSize=100",
                            200, token=admin_token)
    item = next(p for p in admin_problems["Results"] if p["Id"] == problem_id)
    correct_id = next(option["Id"] for option in item["Options"]
                      if option["IsCorrect"])
    # A registered student with no solved problems has no earned rank.
    # Do not mistake an existing account for a ranked learner.
    unranked = expect("GET",
        f"/api/users/leaderboard?stageId={stage1}&period=all",
        200, token=token)
    assert unranked.get("MyRank") is None, unranked
    assert not any(e["IsCurrentUser"] for e in unranked["Entries"]), unranked

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
    before_switch_ranks = expect("GET",
        f"/api/users/leaderboard?stageId={stage1}&period=all",
        200, token=token)
    assert before_switch_ranks["MyRank"] is not None, before_switch_ranks
    assert before_switch_ranks["TotalLearners"] >= 1, before_switch_ranks
    my_rank_row = next(
        e for e in before_switch_ranks["Entries"] if e["IsCurrentUser"]
    )
    # Leaderboard now uses the same solved progress as student dashboard
    # (including legacy answers that predate immutable attempt records).
    assert my_rank_row["SolvedProblems"] == after["SolvedProblems"], (
        my_rank_row, after
    )
    assert my_rank_row["Points"] == after["TotalPoints"], (
        my_rank_row, after
    )

    # One real learner must be visible even if nobody else has solved in
    # this stage. Training retries cannot count the same solved problem twice.
    assert sum(e["IsCurrentUser"] for e in before_switch_ranks["Entries"]) == 1
    assert before_switch_ranks["MyRank"] == my_rank_row["Rank"]
    practice_retry = expect("POST", "/api/problems/submit", 200, {
        "ProblemId": problem_id,
        "SelectedOptionId": correct_id,
        "TimeSpentSeconds": 2
    }, token)
    assert practice_retry["IsCorrect"] is True
    assert not practice_retry["IsOfficialAttempt"], practice_retry
    rank_after_retry = expect("GET",
        f"/api/users/leaderboard?stageId={stage1}&period=all",
        200, token=token)
    assert rank_after_retry["MyRank"] == before_switch_ranks["MyRank"]
    assert rank_after_retry["TotalLearners"] == before_switch_ranks["TotalLearners"]
    retry_row = next(e for e in rank_after_retry["Entries"] if e["IsCurrentUser"])
    assert retry_row["SolvedProblems"] == my_rank_row["SolvedProblems"]
    assert retry_row["Points"] == my_rank_row["Points"]
    unchanged = expect("GET", "/api/users/journey", 200, token=token)
    assert unchanged["SolvedProblems"] == after["SolvedProblems"]
    assert unchanged["TotalPoints"] == after["TotalPoints"]

    updated_challenge = expect("GET", "/api/users/daily-challenge", 200, token=token)
    assert [p["Id"] for p in updated_challenge["Problems"]] == [
        p["Id"] for p in challenge["Problems"]
    ], "Same UTC day must keep the same suggested questions after an answer"
    if problem_id in {p["Id"] for p in challenge["Problems"]}:
        assert updated_challenge["Completed"] == challenge["Completed"] + 1
        assert next(p for p in updated_challenge["Problems"]
                    if p["Id"] == problem_id)["IsSolved"]

    switched = expect("PUT", "/api/users/learning-stage", 200,
                      {"StageId": stage2}, token)
    assert switched["StageId"] == stage2
    other = expect("GET", "/api/users/journey", 200, token=token)
    assert other["StageId"] == stage2
    assert other["SolvedProblems"] == 0
    # A different selected stage has no earned attempts yet. Do not display a
    # fake rank for simply having a registered account.
    stage2_ranks = expect("GET",
        f"/api/users/leaderboard?stageId={stage2}&period=all",
        200, token=token)
    # JSON omit-null serializer may omit MyRank entirely when unranked.
    assert stage2_ranks.get("MyRank") is None, stage2_ranks
    assert all(not e["IsCurrentUser"] for e in stage2_ranks["Entries"]), stage2_ranks
    # A user must not query an arbitrary stage as an access workaround.
    assert call("GET",
        f"/api/users/leaderboard?stageId={stage1}&period=all",
        token=token)[0] == 403

    old = expect("GET", "/api/users/journey?stageId=" + str(stage1),
                 200, token=token)
    assert old["SolvedProblems"] == 1 and old["TotalPoints"] == 10
    profile = expect("GET", "/api/users/profile", 200, token=token)
    assert profile["CurrentStageId"] == stage2
    dashboard = expect("GET", "/api/users/dashboard", 200, token=token)
    assert dashboard["CurrentStageId"] == stage2
    assert dashboard["SolvedProblemsCount"] == 0, dashboard
    assert dashboard["TotalPoints"] == 0, dashboard
    assert dashboard["RecentSolved"] == [], dashboard
    assert expect("GET", "/api/users/solved", 200, token=token) == []
    assert expect("GET", "/api/users/favorites", 200, token=token) == []
    assert expect("GET", "/api/users/error-notebook", 200, token=token) == []

    # The original stage's records must reappear unchanged after switching back.
    expect("PUT", "/api/users/learning-stage", 200, {"StageId": stage1}, token)
    returned = expect("GET", "/api/users/dashboard", 200, token=token)
    assert returned["SolvedProblemsCount"] == 1, returned
    assert returned["TotalPoints"] == 10, returned
    assert len(returned["RecentSolved"]) == 1, returned
    assert len(expect("GET", "/api/users/solved", 200, token=token)) == 1
    # Switching back must restore the same scored ranking, not silently lose
    # the point record while the learner's stage selection was different.
    back_ranks = expect("GET",
        f"/api/users/leaderboard?stageId={stage1}&period=all",
        200, token=token)
    assert back_ranks["MyRank"] == before_switch_ranks["MyRank"], (
        back_ranks, before_switch_ranks
    )
    assert back_ranks["TotalLearners"] >= 1 and back_ranks["Entries"], back_ranks

    # Leave the account in stage2 to ensure persistence on next login.
    expect("PUT", "/api/users/learning-stage", 200, {"StageId": stage2}, token)

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
