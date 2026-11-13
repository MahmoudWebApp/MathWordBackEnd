#!/usr/bin/env python3
"""Admin/student segregation and stage analytics tests on disposable PostgreSQL."""
from integration_problem_history import (
    BASE, api, create_question, expect, student, submit, token_of, wait_ready,
    ADMIN_EMAIL, ADMIN_PASSWORD
)

def main():
    assert BASE.startswith(("http://127.0.0.1:", "http://localhost:")), (
        "Refusing admin integration tests against a remote environment"
    )
    wait_ready()
    admin = token_of(expect("POST", "/api/auth/login", 200, {
        "Email": ADMIN_EMAIL, "Password": ADMIN_PASSWORD
    }))
    learner = student(42)

    question_id, correct_option = create_question(admin, 42)

    # Admin retains profile, content and analytics access but cannot answer.
    expect("GET", "/api/users/profile", 200, token=admin)
    for method, path, body in [
        ("POST", "/api/problems/submit", {
            "ProblemId": question_id, "SelectedOptionId": correct_option,
            "TimeSpentSeconds": 4
        }),
        ("GET", f"/api/problems/{question_id}/attempts", None),
        ("GET", "/api/users/dashboard", None),
        ("GET", "/api/users/favorites", None),
        ("GET", "/api/users/solved", None),
        ("GET", "/api/users/error-notebook", None),
        ("POST", "/api/users/favorite/toggle", {
            "ProblemId": question_id, "IsFavorite": True
        }),
        ("GET", f"/api/users/favorite/check/{question_id}", None),
        ("GET", "/api/users/learning-stage", None),
        ("GET", "/api/users/journey?stageId=1", None),
        ("PUT", "/api/users/learning-stage", {"StageId": 1}),
    ]:
        result, payload = api(method, path, body, admin)
        assert result == 403, (method, path, result, payload)

    # Authenticated students must never access the admin dashboards or PII.
    expect("GET", "/api/admin/analytics/overview", 403, token=learner)
    expect("GET", "/api/admin/analytics/stages/1", 403, token=learner)
    expect("GET", "/api/admin/users", 403, token=learner)

    overview = expect("GET", "/api/admin/analytics/overview?days=7", 200,
                      token=admin)
    assert overview["TotalStudents"] == 1, overview
    assert overview["AttemptsInWindow"] == 0, overview
    assert len(overview["Stages"]) == 4, overview
    assert sum(x["Problems"] for x in overview["Stages"]) == 1, overview

    # Admin viewing question details must not become a learner solve.
    expect("GET", f"/api/problems/{question_id}", 200, token=admin)

    success, payload = submit(learner, question_id, correct_option)
    assert success == 200, (success, payload)

    overview = expect("GET", "/api/admin/analytics/overview?days=7", 200,
                      token=admin)
    assert overview["TotalStudents"] == 1, overview
    assert overview["ActiveStudentsInWindow"] == 1, overview
    assert overview["AttemptsInWindow"] == 1, overview
    assert overview["CorrectAttemptsInWindow"] == 1, overview
    assert overview["TotalUniqueSolved"] == 1, overview
    assert overview["CorrectRatePercent"] == 100.0, overview
    stage = next(x for x in overview["Stages"] if x["StageId"] == 1)
    assert stage["Problems"] == 1, stage
    assert stage["UniqueSolved"] == 1, stage
    assert stage["ActiveStudentsInWindow"] == 1, stage
    assert stage["AttemptsInWindow"] == 1, stage

    details = expect("GET", "/api/admin/analytics/stages/1?days=7", 200,
                     token=admin)
    assert details["Summary"]["StageId"] == 1, details
    assert details["Categories"], details
    cat = next(x for x in details["Categories"] if x["Problems"] == 1)
    assert cat["UniqueSolved"] == 1 and cat["AttemptsInWindow"] == 1, cat
    assert details["TopLearners"][0]["UniqueSolved"] == 1, details
    assert details["TopLearners"][0]["AwardedPoints"] == 10, details
    assert len(details["DailyActivity"]) == 7, details
    assert sum(day["Attempts"] for day in details["DailyActivity"]) == 1

    other = expect("GET", "/api/admin/analytics/stages/2", 200, token=admin)
    assert other["Summary"]["UniqueSolved"] == 0
    assert not other["TopLearners"]
    expect("GET", "/api/admin/analytics/stages/999", 404, token=admin)
    expect("GET", "/api/admin/analytics/overview?days=0", 400, token=admin)
    expect("GET", "/api/admin/analytics/stages/1?days=366", 400, token=admin)

    old_stats = expect("GET", "/api/admin/stats", 200, token=admin)
    assert old_stats["TotalUsers"] == 1, old_stats
    assert old_stats["TotalSolved"] == 1, old_stats
    public_stats = expect("GET", "/api/stats", 200)
    assert public_stats["TotalUsers"] == 1, public_stats
    assert public_stats["TotalSolved"] == 1, public_stats
    print("PASS: operator role cannot learn, student cannot access analytics; "
          "per-stage, category and daily metrics are correct")

if __name__ == "__main__":
    main()
