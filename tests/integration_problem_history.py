#!/usr/bin/env python3
"""Checks on a disposable local PostgreSQL database; refuses remote URLs."""
import concurrent.futures
import json
import os
import time
import urllib.error
import urllib.request

BASE = os.getenv("MATHWORLD_TEST_BASE_URL", "http://127.0.0.1:5051")
ADMIN_EMAIL = "ci-admin@mathworld.test"
ADMIN_PASSWORD = "CI_TEST_ADMIN_PASSWORD_12345"


def api(method, route, body=None, token=None):
    headers = {"Accept": "application/json"}
    data = None
    if token:
        headers["Authorization"] = "Bearer " + token
    if body is not None:
        data = json.dumps(body).encode("utf-8")
        headers["Content-Type"] = "application/json"
    request = urllib.request.Request(
        BASE + route, method=method, headers=headers, data=data
    )
    try:
        with urllib.request.urlopen(request, timeout=25) as response:
            raw = response.read()
            return response.status, json.loads(raw) if raw else {}
    except urllib.error.HTTPError as error:
        raw = error.read()
        return error.code, json.loads(raw) if raw else {}


def expect(method, route, status, body=None, token=None):
    actual, payload = api(method, route, body, token)
    assert actual == status, (
        f"{method} {route}: expected HTTP {status}; actual {actual}, response "
        f"{str(payload)[:450]}"
    )
    return payload.get("Data", payload)


def token_of(response):
    token = response.get("Token")
    assert isinstance(token, str) and token, response
    return token


def wait_ready():
    for _ in range(90):
        try:
            code, payload = api("GET", "/health/ready")
            if code == 200 and payload.get("status") == "ready":
                return
        except (OSError, ValueError):
            pass
        time.sleep(1)
    raise AssertionError("Local integration-test API never became ready")


def make_question(test_id):
    return {
        "QuestionTextAr": f"اختبار الإجابات المتزامنة {test_id}",
        "QuestionTextEn": f"Concurrent attempt integration test {test_id}",
        "DetailedSolutionAr": "الإجابة الصحيحة واحد",
        "DetailedSolutionEn": "The answer is one",
        "StageId": 1, "CategoryId": 1, "Points": 10,
        "Options": [
            {"LatexCode": str(i), "IsCorrect": i == 1, "Order": i}
            for i in range(1, 5)
        ]
    }


def student(index):
    response = expect("POST", "/api/auth/register", 201, {
        "FullName": f"CI Learner {index}",
        "Email": f"learner-ci-{index}@mathworld.test",
        "Password": "CI_TEST_STUDENT_PASSWORD_12345",
        "StageId": 1
    })
    return token_of(response)


def create_question(admin, id_value):
    item = expect("POST", "/api/admin/problems", 201,
                  make_question(id_value), admin)
    question_id = item["Id"]
    detail = expect("GET", f"/api/problems/{question_id}", 200, token=admin)
    correct_id = next(x["Id"] for x in detail["Options"] if x["IsCorrect"])
    return question_id, correct_id


def submit(token, question_id, option_id):
    return api("POST", "/api/problems/submit", {
        "ProblemId": question_id,
        "SelectedOptionId": option_id,
        "TimeSpentSeconds": 5
    }, token)


def solved_count(admin, question_id):
    data = expect("GET", "/api/admin/problems?pageSize=100",
                  200, token=admin)
    problem = next(row for row in data["Results"] if row["Id"] == question_id)
    return problem["SolvedCount"]


def verify_diverse_category_paging(admin, student_token):
    """On CI's disposable DB, numerical variants should not fill page one."""
    newest = {}
    for family in ("المربعات", "الأشجار", "الرسومات"):
        for variant in (1, 2):
            body = make_question(1000 + variant)
            body["QuestionTextAr"] = (
                f"سؤال التنوع {family} يحتوي {variant} عناصر"
            )
            body["QuestionTextEn"] = (
                f"Curriculum diversity {family} has {variant} items"
            )
            item = expect("POST", "/api/admin/problems", 201, body, admin)
            newest[family] = item["Id"]

    data = expect(
        "GET", "/api/categories/1/problems?page=1&pageSize=3",
        200, token=student_token
    )
    first_ids = [item["Id"] for item in data["Items"]]
    assert first_ids == [
        newest["الرسومات"], newest["الأشجار"], newest["المربعات"]
    ], ("A learner received repeated number clones before fresh concepts", first_ids)

    # The same order must remain stable when clients change page size.
    page1 = expect(
        "GET", "/api/categories/1/problems?page=1&pageSize=2",
        200, token=student_token
    )
    page2 = expect(
        "GET", "/api/categories/1/problems?page=2&pageSize=2",
        200, token=student_token
    )
    ids1 = [item["Id"] for item in page1["Items"]]
    ids2 = [item["Id"] for item in page2["Items"]]
    full = expect(
        "GET", "/api/categories/1/problems?page=1&pageSize=4",
        200, token=student_token
    )
    assert ids1 + ids2 == [item["Id"] for item in full["Items"]]
    assert not set(ids1).intersection(ids2), "Overlapping pages"

    # Browsing remains a preview for guests: no question body/answers.
    guest = expect("GET", "/api/categories/1/problems?page=1&pageSize=2", 200)
    assert all("QuestionText" not in item and "Options" not in item
               for item in guest["Items"])
    print("PASS: category previews interleave math concepts before numeric clones")


def main():
    assert BASE.startswith(("http://127.0.0.1:", "http://localhost:")), (
        "Refusing destructive integration checks against a remote URL"
    )
    wait_ready()
    admin = token_of(expect("POST", "/api/auth/login", 200, {
        "Email": ADMIN_EMAIL, "Password": ADMIN_PASSWORD
    }))
    users = [student(i) for i in range(3)]

    question_id, correct_option = create_question(admin, 1)

    with concurrent.futures.ThreadPoolExecutor(max_workers=2) as pool:
        attempts = list(pool.map(
            lambda _: submit(users[0], question_id, correct_option),
            range(2)
        ))
    assert sorted(code for code, _ in attempts) == [200, 409], attempts
    accepted = [body["Data"] for code, body in attempts if code == 200]
    assert accepted[0]["PointsEarned"] == 10 and accepted[0]["IsSolved"]
    assert accepted[0]["IsOfficialAttempt"], accepted
    # Only a whole-topic or stage restart can replay a solved question.
    reset = expect("POST", "/api/users/practice/reset", 200,
                   {"StageId": 1, "CategoryId": 1}, users[0])
    assert reset["ResetSolved"] == 1, reset
    assert solved_count(admin, question_id) == 0
    status, replay = submit(users[0], question_id, correct_option)
    assert status == 200 and replay["Data"]["IsSolved"], (status, replay)
    assert replay["Data"]["AttemptNumber"] == 2, replay
    assert solved_count(admin, question_id) == 1

    with concurrent.futures.ThreadPoolExecutor(max_workers=2) as pool:
        other_attempts = list(pool.map(
            lambda t: submit(t, question_id, correct_option), users[1:]
        ))
    assert all(code == 200 for code, _ in other_attempts), other_attempts
    assert all(x["Data"]["PointsEarned"] == 10 for _, x in other_attempts)
    assert solved_count(admin, question_id) == 3, "Lost an atomic solve increment"

    history = expect("GET", f"/api/problems/{question_id}/attempts",
                     200, token=users[0])
    assert history["TotalAttempts"] == 1, history  # current practice cycle
    assert len(history["Attempts"]) == 2, history  # immutable audit preserved

    expect("PUT", f"/api/admin/problems/{question_id}", 409,
           make_question(2), admin)
    expect("DELETE", f"/api/admin/problems/{question_id}", 409, token=admin)

    still_there = expect("GET", f"/api/problems/{question_id}", 200, token=admin)
    assert still_there["Id"] == question_id

    # Unused question should remain editable and removable.
    unused_id, _ = create_question(admin, 3)
    expect("PUT", f"/api/admin/problems/{unused_id}", 200,
           make_question(4), admin)
    expect("DELETE", f"/api/admin/problems/{unused_id}", 200, token=admin)

    # A question saved as a favorite must not be deleted.
    favorite_id, _ = create_question(admin, 5)
    expect("POST", "/api/users/favorite/toggle", 200,
           {"ProblemId": favorite_id, "IsFavorite": True}, users[0])
    expect("DELETE", f"/api/admin/problems/{favorite_id}", 409, token=admin)
    verify_diverse_category_paging(admin, users[0])
    print("PASS: atomic solves, solved replay denied, topic reset, immutable attempts")


if __name__ == "__main__":
    main()
