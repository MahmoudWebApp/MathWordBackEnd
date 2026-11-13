#!/usr/bin/env python3
"""Disposable PostgreSQL integration: immutable stage credits, privacy, ranking."""
from integration_problem_history import api, expect, token_of, wait_ready, student, make_question, submit

def create_question(admin, test_id, stage_id=1, category_id=1):
    body = make_question(test_id)
    body["StageId"] = stage_id
    body["CategoryId"] = category_id
    item = expect("POST", "/api/admin/problems", 201, body, admin)
    qid = item["Id"]
    detail = expect("GET", f"/api/problems/{qid}", 200, token=admin)
    correct = next(x["Id"] for x in detail["Options"] if x["IsCorrect"])
    wrong = next(x["Id"] for x in detail["Options"] if not x["IsCorrect"])
    return qid, correct, wrong

def answer(token, qid, option_id, awarded):
    status, response = submit(token, qid, option_id)
    assert status == 200, response
    assert response["Data"]["PointsEarned"] == awarded, response
    return response["Data"]

def leaderboard(token, stage=1, period="all"):
    return expect("GET", f"/api/users/leaderboard?stageId={stage}&period={period}",
                  200, token=token)

def main():
    from os import environ
    base = environ.get("MATHWORLD_TEST_BASE_URL", "http://127.0.0.1:5054")
    assert base.startswith(("http://127.0.0.1:", "http://localhost:"))
    wait_ready()
    admin = token_of(expect("POST", "/api/auth/login", 200, {
        "Email": "ci-admin@mathworld.test",
        "Password": "CI_TEST_ADMIN_PASSWORD_12345"
    }))
    first, second = student(100), student(101)
    a, right_a, wrong_a = create_question(admin, "ledger-a")
    b, right_b, _ = create_question(admin, "ledger-b")
    c, right_c, _ = create_question(admin, "ledger-c", stage_id=2, category_id=5)
    answer(first, a, wrong_a, 0)
    award = answer(first, a, right_a, 10)
    assert award["IsOfficialAttempt"] is False
    answer(first, a, right_a, 0)
    answer(first, b, right_b, 10)
    answer(second, a, right_a, 10)
    answer(second, b, right_b, 10)
    stage1 = leaderboard(first)
    assert stage1["TotalLearners"] == 2, stage1
    assert stage1["MyRank"] == 2, stage1
    assert [x["SolvedProblems"] for x in stage1["Entries"]] == [2, 2], stage1
    assert [x["Points"] for x in stage1["Entries"]] == [20, 20], stage1
    assert [x["FirstTryCorrect"] for x in stage1["Entries"]] == [2, 1], stage1
    assert all(x.get("UserId") is None for x in stage1["Entries"]), stage1
    assert all("CI Learner" not in x["DisplayName"] for x in stage1["Entries"])
    assert [x["Rank"] for x in stage1["Entries"]] == [1, 2], stage1
    assert leaderboard(first, period="weekly")["TotalLearners"] == 2
    assert leaderboard(first, period="monthly")["TotalLearners"] == 2
    stage1_points = expect("GET", "/api/users/journey?stageId=1", 200, token=first)
    assert stage1_points["TotalPoints"] == 20, stage1_points
    answer(first, c, right_c, 10)
    assert leaderboard(first)["MyRank"] == 2
    assert leaderboard(first, stage=2)["MyRank"] == 1
    expect("PUT", "/api/users/learning-stage", 200, {"StageId": 2}, first)
    stage1_after = expect("GET", "/api/users/journey?stageId=1", 200, token=first)
    assert stage1_after["TotalPoints"] == 20
    stage2_after = expect("GET", "/api/users/journey?stageId=2", 200, token=first)
    assert stage2_after["TotalPoints"] == 10
    dashboard = expect("GET", "/api/users/dashboard", 200, token=first)
    assert dashboard["TotalPoints"] == 30, dashboard
    profile = expect("GET", "/api/users/profile", 200, token=first)
    assert profile["TotalPoints"] == 30, profile
    admin_rank = expect("GET", "/api/admin/stages/1/leaderboard", 200, token=admin)
    assert admin_rank["TotalLearners"] == 2
    assert all(row["UserId"] is not None for row in admin_rank["Entries"])
    assert all("CI Learner" in row["DisplayName"] for row in admin_rank["Entries"])
    forbidden, _ = api("GET", "/api/admin/stages/1/leaderboard", token=first)
    assert forbidden == 403, forbidden
    invalid, _ = api("GET", "/api/users/leaderboard?period=never", token=first)
    assert invalid == 400, invalid
    print("PASS: unique awards, tie break, historical points, stage isolation, privacy")

if __name__ == "__main__":
    main()
