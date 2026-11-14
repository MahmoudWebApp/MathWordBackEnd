#!/usr/bin/env python3
"""Integration checks against a disposable local PostgreSQL test API only.

Coverage: JWT-owned inbox, admin messages, first-solve achievements, editorial
draft/approval/publish, duplicate prevention and no premature publication.
"""
from integration_problem_history import (
    BASE, ADMIN_EMAIL, ADMIN_PASSWORD, api, expect, token_of, wait_ready,
    student, create_question, submit,
)


def assert_local():
    assert BASE.startswith(("http://127.0.0.1:", "http://localhost:")), (
        "Refusing to run mutation tests against remote hosts"
    )


def draft_question():
    return {
        "ContentKey": "ci_review_001",
        "StageId": 1,
        "CategoryId": 1,
        "QuestionTextAr": "ما ناتج جمع 41 و17 في تجربة مراجعة المحتوى؟",
        "QuestionTextEn": "What is 41 + 17 in the editorial integration check?",
        "DetailedSolutionAr": "41 + 17 = 58.",
        "DetailedSolutionEn": "41 plus 17 equals 58.",
        "Points": 10,
        "Options": [
            {"LatexCode": str(n), "IsCorrect": n == 58, "Order": i}
            for i, n in enumerate((56, 57, 58, 59), 1)
        ],
    }


def main():
    assert_local()
    wait_ready()
    admin = token_of(expect("POST", "/api/auth/login", 200, {
        "Email": ADMIN_EMAIL, "Password": ADMIN_PASSWORD
    }))
    learner1 = student(9101)
    learner2 = student(9102)
    expect("PUT", "/api/users/learning-stage", 200, {"StageId": 1}, learner1)
    expect("PUT", "/api/users/learning-stage", 200, {"StageId": 1}, learner2)

    # Notifications use the authenticated token, never a user-id query param.
    assert expect("GET", "/api/notifications", 200, token=learner1)["UnreadCount"] == 0
    assert api("GET", "/api/notifications")[0] == 401
    assert api("POST", "/api/admin/notifications/learners/1", {}, learner1)[0] == 403

    students = expect("GET", "/api/admin/learners", 200, token=admin)["Learners"]
    learner_id = next(item["Id"] for item in students if item["Email"].startswith("learner-ci-9101@"))

    sent = expect("POST", f"/api/admin/notifications/learners/{learner_id}", 200, {
        "TitleAr": "اختبار إشعار",
        "TitleEn": "Test notice",
        "BodyAr": "إشعار آمن ضمن المنصة",
        "BodyEn": "Safe in-app message",
        "TargetPath": "/dashboard",
    }, admin)
    notice_id = sent["Id"]
    own = expect("GET", "/api/notifications", 200, token=learner1)
    assert own["UnreadCount"] == 1, own
    assert any(n["Id"] == notice_id for n in own["Items"])
    other = expect("GET", "/api/notifications", 200, token=learner2)
    assert other["UnreadCount"] == 0 and not other["Items"], other
    assert api("PUT", f"/api/notifications/{notice_id}/read", token=learner2)[0] == 404
    expect("PUT", f"/api/notifications/{notice_id}/read", 204, token=learner1)
    expect("PUT", f"/api/notifications/{notice_id}/read", 204, token=learner1)
    assert expect("GET", "/api/notifications", 200, token=learner1)["UnreadCount"] == 0

    # First unique solve emits exactly one achievement; retry doesn't duplicate it.
    question_id, correct_option = create_question(admin, 9101)
    code, _ = submit(learner1, question_id, correct_option)
    assert code == 200
    code, _ = submit(learner1, question_id, correct_option)
    assert code == 200
    notices = expect("GET", "/api/notifications", 200, token=learner1)["Items"]
    achievements = [n for n in notices if n["Type"] == "achievement"]
    assert len(achievements) == 1, achievements

    # Admin subscription changes produce a separate notice in the same DB transaction.
    expect("PUT", f"/api/admin/learners/{learner_id}/subscription", 200, {
        "SubscriptionType": "Premium",
        "Reason": "CI verified premium grant",
    }, admin)
    notices = expect("GET", "/api/notifications", 200, token=learner1)["Items"]
    assert len([n for n in notices if n["Type"] == "subscription"]) == 1
    expect("PUT", "/api/notifications/read-all", 204, token=learner1)
    assert expect("GET", "/api/notifications", 200, token=learner1)["UnreadCount"] == 0

    # Import preview is read-only. Draft and approval must not insert questions.
    proposed = draft_question()
    original_count = expect("GET", "/api/admin/curriculum/readiness", 200, token=admin)["TotalProblems"]
    preview = expect("POST", "/api/admin/curriculum/import/preview", 200, {
        "Problems": [proposed]
    }, admin)
    assert preview["DryRun"] and preview["ValidCount"] == 1
    assert expect("GET", "/api/admin/curriculum/readiness", 200, token=admin)["TotalProblems"] == original_count
    assert api("POST", "/api/admin/curriculum/drafts", {"Problems": [proposed]}, learner1)[0] == 403

    queued = expect("POST", "/api/admin/curriculum/drafts", 200, {
        "Problems": [proposed]
    }, admin)
    batch_id = queued["Id"]
    assert queued["Status"] == "Pending" and not queued["Published"]
    assert expect("GET", "/api/admin/curriculum/readiness", 200, token=admin)["TotalProblems"] == original_count

    detail = expect("GET", f"/api/admin/curriculum/drafts/{batch_id}", 200, token=admin)
    assert detail["Problems"][0]["ContentKey"] == proposed["ContentKey"]
    listed = expect("GET", "/api/admin/curriculum/drafts?status=Pending", 200, token=admin)
    assert any(x["Id"] == batch_id for x in listed["Batches"])

    assert api("PUT", f"/api/admin/curriculum/drafts/{batch_id}/review",
               {"Approve": True, "Note": "too short"}, admin)[0] == 400
    assert api("POST", f"/api/admin/curriculum/drafts/{batch_id}/publish",
               {"Confirm": True}, admin)[0] == 409
    approved = expect("PUT", f"/api/admin/curriculum/drafts/{batch_id}/review",
                      200, {"Approve": True, "Note": "Checked Arabic and English solutions."}, admin)
    assert approved["Status"] == "Approved"
    assert expect("GET", "/api/admin/curriculum/readiness", 200, token=admin)["TotalProblems"] == original_count
    assert api("POST", f"/api/admin/curriculum/drafts/{batch_id}/publish",
               {"Confirm": False}, admin)[0] == 400

    published = expect("POST", f"/api/admin/curriculum/drafts/{batch_id}/publish",
                       200, {"Confirm": True}, admin)
    assert published["Status"] == "Published" and published["PublishedCount"] == 1
    assert expect("GET", "/api/admin/curriculum/readiness", 200, token=admin)["TotalProblems"] == original_count + 1
    assert api("POST", f"/api/admin/curriculum/drafts/{batch_id}/publish",
               {"Confirm": True}, admin)[0] == 409
    assert api("POST", "/api/admin/curriculum/drafts", {"Problems": [proposed]}, admin)[0] == 400
    print("PASS: owned notifications, milestone, subscription notice, draft review and safe publish")


if __name__ == "__main__":
    main()
