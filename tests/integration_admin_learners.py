#!/usr/bin/env python3
"""Admin learner views / role protection on disposable local Postgres only."""
from integration_problem_history import (
    BASE, api, expect, token_of, wait_ready, student, make_question, submit,
    ADMIN_EMAIL, ADMIN_PASSWORD, create_question,
)

def main():
    assert BASE.startswith(("http://127.0.0.1:", "http://localhost:")), (
        "Never run analytics integration tests against remote data"
    )
    wait_ready()
    admin = token_of(expect("POST", "/api/auth/login", 200, {
        "Email": ADMIN_EMAIL, "Password": ADMIN_PASSWORD
    }))
    learner1, learner2 = student(71), student(72)
    expect("PUT", "/api/users/learning-stage", 200, {"StageId": 1}, learner1)
    expect("PUT", "/api/users/learning-stage", 200, {"StageId": 2}, learner2)

    for route in ["/api/admin/learners", "/api/admin/learners/1",
                  "/api/admin/learners/1/attempts"]:
        status, _ = api("GET", route, token=learner1)
        assert status == 403, (route, status)
    status, _ = api("GET", "/api/admin/learners")
    assert status == 401, status

    all_students = expect("GET", "/api/admin/learners", 200, token=admin)
    assert all_students["Total"] == 2, all_students
    ids = [x["Id"] for x in all_students["Learners"]]
    assert len(ids) == 2 and len(set(ids)) == 2, all_students
    assert all("Password" not in str(x) for x in all_students["Learners"])
    assert all("Hash" not in str(x) for x in all_students["Learners"])

    stage1 = expect("GET", "/api/admin/learners?stageId=1", 200, token=admin)
    assert stage1["Total"] == 1, stage1
    first = stage1["Learners"][0]
    assert first["CurrentStageId"] == 1, first
    assert first["SolvedProblems"] == 0, first
    assert first["TotalAwardedPoints"] == 0, first

    stage2 = expect("GET", "/api/admin/learners?stageId=2", 200, token=admin)
    assert stage2["Total"] == 1, stage2
    second = stage2["Learners"][0]
    assert first["Id"] != second["Id"]
    assert expect("GET", f"/api/admin/learners?search={first['Email']}",
                  200, token=admin)["Total"] == 1
    assert expect("GET", "/api/admin/learners?search=%25", 200,
                  token=admin)["Total"] == 0
    assert expect("GET", "/api/admin/learners?isActive=true&subscription=Free",
                  200, token=admin)["Total"] == 2

    # Only an Admin can grant or revoke Premium; Free has no daily cap.
    subscription_route = f"/api/admin/learners/{first['Id']}/subscription"
    locked_payload = make_question(71001)
    locked_payload["StageId"] = 1
    locked_payload["CategoryId"] = 3
    locked_problem = expect("POST", "/api/admin/problems", 201,
                            locked_payload, admin)["Id"]
    assert api("GET", f"/api/problems/{locked_problem}", token=learner1)[0] == 403
    preview = f"/api/problems/{locked_problem}/solution-preview"
    assert api("GET", preview, token=learner1)[0] == 403
    assert api("GET", preview)[0] == 401
    assert api("PUT", subscription_route,
               {"SubscriptionType": "Premium"}, learner1)[0] == 403
    assert api("PUT", subscription_route,
               {"SubscriptionType": "Premium"})[0] == 401
    assert api("PUT", subscription_route,
               {"SubscriptionType": "Unknown"}, admin)[0] == 400
    assert api("PUT", "/api/admin/learners/999999/subscription",
               {"SubscriptionType": "Premium"}, admin)[0] == 404
    upgraded = expect("PUT", subscription_route, 200,
                      {"SubscriptionType": "Premium"}, admin)
    assert upgraded["Id"] == first["Id"] and upgraded["SubscriptionType"] == "Premium"
    assert api("GET", f"/api/problems/{locked_problem}", token=learner1)[0] == 200
    solution = expect("GET", preview, 200, token=learner1)
    assert solution["ProblemId"] == locked_problem
    assert solution["CorrectOptionId"] is not None, solution
    # Repeating a grant is safe. Revocation must take effect immediately.
    assert expect("PUT", subscription_route, 200,
                  {"SubscriptionType": "Premium"}, admin)["SubscriptionType"] == "Premium"
    downgraded = expect("PUT", subscription_route, 200,
                        {"SubscriptionType": "Free"}, admin)
    assert downgraded["SubscriptionType"] == "Free"
    assert api("GET", f"/api/problems/{locked_problem}", token=learner1)[0] == 403
    assert api("GET", preview, token=learner1)[0] == 403


    page1 = expect("GET", "/api/admin/learners?pageSize=1&page=1", 200,
                   token=admin)
    page2 = expect("GET", "/api/admin/learners?pageSize=1&page=2", 200,
                   token=admin)
    assert page1["TotalPages"] == 2 and page2["TotalPages"] == 2
    assert page1["Learners"][0]["Id"] != page2["Learners"][0]["Id"]

    question_id, correct_option = create_question(admin, 71)
    code, result = submit(learner1, question_id, correct_option)
    assert code == 200, (code, result)

    now = expect("GET", "/api/admin/learners?stageId=1", 200, token=admin)
    current = now["Learners"][0]
    assert current["SolvedProblems"] == 1 and current["AttemptedProblems"] == 1, current
    assert current["TotalAwardedPoints"] == 10 and current["LastAttemptAt"], current

    details = expect("GET", f"/api/admin/learners/{first['Id']}?stageId=1",
                     200, token=admin)
    assert details["Learner"]["Id"] == first["Id"]
    assert details["TotalAttempts"] == 1
    assert details["CorrectAttempts"] == 1
    assert details["FirstTryCorrect"] == 1
    assert details["CorrectRatePercent"] == 100.0
    assert len(details["Stages"]) == 4
    assert next(x for x in details["Stages"] if x["StageId"] == 1)["AwardedPoints"] == 10
    assert details["Categories"], details
    assert sum(x["SolvedProblems"] for x in details["Categories"]) == 1
    assert details["Learner"]["TotalAwardedPoints"] == 10

    a = expect("GET", f"/api/admin/learners/{first['Id']}/attempts?stageId=1",
               200, token=admin)
    assert a["Total"] == 1 and len(a["Attempts"]) == 1, a
    assert a["Attempts"][0]["ProblemId"] == question_id
    assert a["Attempts"][0]["PointsEarned"] == 10
    assert a["Attempts"][0]["IsOfficial"]
    assert expect("GET", f"/api/admin/learners/{first['Id']}/attempts?stageId=2",
                  200, token=admin)["Total"] == 0

    # Switching current stage does not erase historical stage results.
    expect("PUT", "/api/users/learning-stage", 200, {"StageId": 2}, learner1)
    after = expect("GET", f"/api/admin/learners/{first['Id']}?stageId=1",
                   200, token=admin)
    assert after["Learner"]["TotalAwardedPoints"] == 10, after
    assert next(x for x in after["Stages"] if x["StageId"] == 1)["SolvedProblems"] == 1

    for route in [f"/api/admin/learners/{first['Id']}/attempts?page=0",
                  "/api/admin/learners?pageSize=1000",
                  "/api/admin/learners?subscription=Invalid",
                  "/api/admin/learners?stageId=-1"]:
        status, _ = api("GET", route, token=admin)
        assert status == 400, (route, status)
    for route in ["/api/admin/learners/999999",
                  "/api/admin/learners/999999/attempts"]:
        status, _ = api("GET", route, token=admin)
        assert status == 404, (route, status)
    print("PASS: admin learner directory, role privacy, manual Premium grants and revocation, stage history and attempts")

if __name__ == "__main__":
    main()
