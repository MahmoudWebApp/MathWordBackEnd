#!/usr/bin/env python3
"""Integration checks against a disposable local PostgreSQL test API only.

Coverage: JWT-owned inbox, admin messages, first-solve achievements, editorial
draft/approval/publish, duplicate prevention and no premature publication.
"""
import urllib.request
import urllib.error

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
    assert expect("GET", "/api/notifications/v2", 200, token=learner1)["UnreadCount"] == 0
    assert api("GET", "/api/notifications/v2")[0] == 401
    assert api("POST", "/api/admin/notifications/learners/1", {}, learner1)[0] == 403

    students = expect("GET", "/api/admin/learners", 200, token=admin)["Learners"]
    learner_id = next(item["Id"] for item in students if item["Email"].startswith("learner-ci-9101@"))

    # Realtime transport uses the learner JWT header (never a token in URL).
    # Stream frames are hints without titles/body/user data; the client GETs
    # the private inbox. This test also proves a committed admin send emits
    # a refresh event before the client falls back to polling.
    stream_request = urllib.request.Request(
        BASE + "/api/notifications/v2/stream",
        headers={
            "Authorization": "Bearer " + learner1,
            "Accept": "text/event-stream",
        },
    )
    assert api("GET", "/api/notifications/v2/stream")[0] == 401
    stream = urllib.request.urlopen(stream_request, timeout=8)
    assert "text/event-stream" in stream.headers.get("Content-Type", "")
    assert stream.readline().startswith(b": connected")
    assert stream.readline().strip() == b""

    sent = expect("POST", f"/api/admin/notifications/learners/{learner_id}", 200, {
        "TitleAr": "اختبار إشعار",
        "TitleEn": "Test notice",
        "BodyAr": "إشعار آمن ضمن المنصة",
        "BodyEn": "Safe in-app message",
        "TargetPath": "/dashboard",
    }, admin)
    notice_id = sent["Id"]
    assert stream.readline().strip() == b"event: inbox", "Admin notice did not trigger SSE"
    assert stream.readline().strip() == b"data: {}", "SSE must not expose notice content"
    assert stream.readline().strip() == b""
    stream.close()
    own = expect("GET", "/api/notifications/v2", 200, token=learner1)
    assert own["UnreadCount"] == 1, own
    assert any(n["Id"] == notice_id for n in own["Items"])
    other = expect("GET", "/api/notifications/v2", 200, token=learner2)
    assert other["UnreadCount"] == 0 and not other["Items"], other
    assert api("PUT", f"/api/notifications/v2/{notice_id}/read", token=learner2)[0] == 404
    expect("PUT", f"/api/notifications/v2/{notice_id}/read", 204, token=learner1)
    expect("PUT", f"/api/notifications/v2/{notice_id}/read", 204, token=learner1)
    assert expect("GET", "/api/notifications/v2", 200, token=learner1)["UnreadCount"] == 0

    # Full-page inbox is offset-paginated within 30 days and bound to JWT owner.
    # Add two more read notices without altering later achievement unread checks.
    extra_ids = []
    for n in (2, 3):
        extra = expect("POST", f"/api/admin/notifications/learners/{learner_id}", 200, {
            "TitleAr": f"إشعار اختبار {n}",
            "TitleEn": f"Test notice {n}",
            "BodyAr": "رسالة تجريبية للصفحات",
            "BodyEn": "Pagination integration check",
            "TargetPath": "/dashboard",
        }, admin)
        extra_ids.append(extra["Id"])
        expect("PUT", f"/api/notifications/v2/{extra['Id']}/read", 204, token=learner1)
    first = expect("GET", "/api/notifications/v2?take=1&skip=0", 200, token=learner1)
    second = expect("GET", "/api/notifications/v2?take=1&skip=1", 200, token=learner1)
    third = expect("GET", "/api/notifications/v2?take=1&skip=2", 200, token=learner1)
    end = expect("GET", "/api/notifications/v2?take=1&skip=3", 200, token=learner1)
    assert first["TotalCount"] == 3 and first["HasMore"], first
    assert second["HasMore"] and not third["HasMore"], (second, third)
    assert not end["Items"] and not end["HasMore"], end
    assert [page["Items"][0]["Id"] for page in (first, second, third)] == [
        extra_ids[1], extra_ids[0], notice_id,
    ]
    assert first["UnreadCount"] == 0
    assert api("GET", "/api/notifications/v2?take=0", token=learner1)[0] == 400
    assert api("GET", "/api/notifications/v2?skip=-1", token=learner1)[0] == 400
    assert api("GET", "/api/notifications/v2?skip=10001", token=learner1)[0] == 400
    isolated = expect("GET", "/api/notifications/v2?take=1&skip=0", 200, token=learner2)
    assert isolated["TotalCount"] == 0 and not isolated["Items"], isolated

    # Anonymous support submissions go only to the private active admin inbox.
    message={"Name":"CI contact","Email":"contact@mathworld.test","Category":"suggestion","Subject":"CI support","Message":"A disposable integration test contact message."}
    assert api("POST","/api/contact",dict(message,Email="not-an-email"))[0]==400
    assert expect("POST","/api/contact",200,message)["Received"] is True
    contact=[n for n in expect("GET","/api/notifications/v2",200,token=admin)["Items"] if n["Type"]=="contact"]
    assert len(contact)==1 and "contact@mathworld.test" in contact[0]["BodyEn"]
    assert "A disposable integration test contact message." in contact[0]["BodyAr"]
    assert all(n["Type"]!="contact" for n in expect("GET","/api/notifications/v2",200,token=learner1)["Items"])
    assert api("PUT",f"/api/notifications/v2/{contact[0]['Id']}/read",token=learner2)[0]==404
    assert expect("POST","/api/contact",200,dict(message,Subject="CI second support"))["Received"] is True
    assert api("POST","/api/contact",message)[0]==429
    print("PASS: private support inbox, validation, ownership and rate limit")
    
    # First unique solve emits exactly one achievement; retry doesn't duplicate it.
    question_id, correct_option = create_question(admin, 9101)
    # A category containing questions must never move stages: this would
    # break saved progress, leaderboard grouping and Free entitlements.
    boundary = "MWCategoryStageBoundary"
    form = (
        f"--{boundary}\r\n"
        'Content-Disposition: form-data; name="StageId"\r\n\r\n'
        "2\r\n"
        f"--{boundary}--\r\n"
    ).encode("utf-8")
    move = urllib.request.Request(
        BASE + "/api/categories/1",
        data=form,
        headers={
            "Authorization": "Bearer " + admin,
            "Content-Type": f"multipart/form-data; boundary={boundary}",
        },
        method="PUT",
    )
    try:
        urllib.request.urlopen(move, timeout=25)
        raise AssertionError("Moving a populated category was wrongly allowed")
    except urllib.error.HTTPError as err:
        assert err.code == 409, (err.code, err.read()[:250])

    code, _ = submit(learner1, question_id, correct_option)
    assert code == 200
    code, _ = submit(learner1, question_id, correct_option)
    assert code == 409  # Already solved; no extra badges or repeat points
    notices = expect("GET", "/api/notifications/v2", 200, token=learner1)["Items"]
    achievements = [n for n in notices if n["Type"] == "achievement"]
    assert len(achievements) == 1, achievements

    badges = expect("GET", "/api/users/achievements", 200, token=learner1)
    assert badges["UniqueSolved"] == 1 and badges["EarnedCount"] == 1, badges
    assert badges["NextMilestone"] == 10, badges
    assert badges["Badges"][0]["Key"] == "stage_1_first_step" and badges["Badges"][0]["Earned"]
    assert badges["Badges"][0]["MilestoneReachedAtUtc"], "First solved milestone must have a recorded timestamp"
    assert not badges["Badges"][1].get("MilestoneReachedAtUtc"), "Unearned milestone must not have a timestamp"

    assert not badges["Badges"][-1]["Earned"]  # No all-stage badge from one solved stage
    assert not badges["Badges"][1]["Earned"], badges
    assert api("GET", "/api/users/achievements")[0] == 401
    assert api("GET", "/api/users/achievements", token=admin)[0] == 403
    assert expect("GET", "/api/users/achievements", 200, token=learner2)["UniqueSolved"] == 0

    # Student rankings must be stage-isolated and anonymize other learners.
    leaderboard = expect("GET", "/api/users/leaderboard?stageId=1&period=all",
                         200, token=learner1)
    assert leaderboard["TotalLearners"] == 1 and leaderboard["MyRank"] == 1
    assert leaderboard["Entries"][0]["IsCurrentUser"]
    assert api("GET", "/api/users/leaderboard?stageId=2", token=learner1)[0] == 403
    assert api("GET", "/api/users/leaderboard?period=invalid", token=learner1)[0] == 400
    assert api("GET", "/api/users/leaderboard", token=admin)[0] == 403

    assert submit(learner2, question_id, correct_option)[0] == 200
    ranking = expect("GET", "/api/users/leaderboard?stageId=1&period=weekly",
                     200, token=learner1)
    assert ranking["TotalLearners"] == 2 and ranking["MyRank"] == 1, ranking
    assert ranking["Entries"][1]["DisplayName"] == "CI L.", ranking
    assert all("learner-ci-" not in row["DisplayName"] for row in ranking["Entries"])

    # Daily challenge is Premium-only; Free solves do not unlock it.
    assert api("GET", "/api/users/daily-challenge?stageId=1", token=learner1)[0] == 403

    # Admin subscription changes produce a separate notice in the same DB transaction.
    assert api("GET", "/api/users/premium-analytics", token=learner1)[0] == 403
    assert api("GET", "/api/users/premium-analytics", token=learner2)[0] == 403
    assert api("GET", "/api/users/premium-analytics", token=admin)[0] == 403

    expect("PUT", f"/api/admin/learners/{learner_id}/subscription", 200, {
        "SubscriptionType": "Premium",
        "Reason": "CI verified premium grant",
    }, admin)

    # Today's challenge is stable for the learner's current stage and does
    # not allow callers to request items from a different stage.
    today = expect("GET", "/api/users/daily-challenge?stageId=1",
                   200, token=learner1)
    assert today["StageId"] == 1 and today["Total"] == len(today["Problems"])
    assert today["Total"] > 0 and today["Total"] <= 5, today
    assert all(row["Id"] > 0 for row in today["Problems"]), today
    again = expect("GET", "/api/users/daily-challenge?stageId=1",
                   200, token=learner1)
    assert [row["Id"] for row in again["Problems"]] == [
        row["Id"] for row in today["Problems"]]
    assert api("GET", "/api/users/daily-challenge?stageId=2", token=learner1)[0] == 400

    report = expect("GET", "/api/users/premium-analytics", 200, token=learner1)
    assert report["SolvedProblems"] == 1 and report["Attempts"] == 1, report
    assert report["CorrectAttempts"] == 1 and report["AwardedPoints"] == 10, report
    assert len(report["Categories"]) == 1, report
    category = report["Categories"][0]
    assert category["StageId"] == 1 and category["CategoryId"] == 1, category

    request = urllib.request.Request(
        BASE + "/api/users/premium-analytics/export.csv",
        headers={"Authorization": "Bearer " + learner1},
    )
    with urllib.request.urlopen(request, timeout=25) as response:
        csv_bytes = response.read()
        assert response.status == 200
        assert "text/csv" in response.headers.get("Content-Type", "")
        assert csv_bytes.startswith(bytes([0xEF, 0xBB, 0xBF])), csv_bytes[:12]
        csv_text = csv_bytes.decode("utf-8-sig")
        assert csv_text.startswith("المرحلة,الفئة,") and "الأعداد" in csv_text, csv_text
        assert "StageId" not in csv_text and "CategoryId" not in csv_text, csv_text
    request = urllib.request.Request(
        BASE + "/api/users/premium-analytics/export.csv?lang=en",
        headers={"Authorization": "Bearer " + learner1},
    )
    with urllib.request.urlopen(request, timeout=25) as response:
        english_csv = response.read().decode("utf-8-sig")
        assert english_csv.startswith("Stage,Category,"), english_csv
        assert "StageId" not in english_csv and "CategoryId" not in english_csv

    notices = expect("GET", "/api/notifications/v2", 200, token=learner1)["Items"]
    assert len([n for n in notices if n["Type"] == "subscription"]) == 1
    expect("PUT", "/api/notifications/v2/read-all", 204, token=learner1)
    assert expect("GET", "/api/notifications/v2", 200, token=learner1)["UnreadCount"] == 0

    # Managed inbox: stable five-item cursor, selection and ownership isolation.
    from urllib.parse import urlencode
    for i in range(7):
        expect("POST", f"/api/admin/notifications/learners/{learner_id}", 200, {
            "TitleAr": f"إشعار إدارة {i}", "TitleEn": f"Managed inbox {i}",
            "BodyAr": "اختبار الحذف", "BodyEn": "Deletion fixture",
            "TargetPath": "/dashboard",
        }, admin)
    managed = "/api/notifications/v2/managed"
    deletion = "/api/notifications/v2/delete-selection"
    page = expect("GET", managed, 200, token=learner1)
    assert len(page["Items"]) == 5 and page["HasMore"]
    snapshot = page["SnapshotId"]
    first_ids = {x["Id"] for x in page["Items"]}
    last = page["Items"][-1]
    more = expect("GET", managed + "?" + urlencode({
        "snapshotId": snapshot, "beforeId": last["Id"],
        "beforeCreatedAt": last["CreatedAtUtc"]
    }), 200, token=learner1)
    assert more["Items"] and not (first_ids & {x["Id"] for x in more["Items"]})
    assert api("GET", managed)[0] == 401
    target = page["Items"][0]["Id"]
    foreign = expect("POST", deletion, 200, {
        "All": False, "SnapshotId": snapshot, "Ids": [target]
    }, learner2)
    assert foreign["DeletedCount"] == 0
    assert expect("POST", deletion, 200, {
        "All": False, "SnapshotId": snapshot, "Ids": [target]
    }, learner1)["DeletedCount"] == 1
    newer = expect("POST", f"/api/admin/notifications/learners/{learner_id}", 200, {
        "TitleAr": "إشعار جديد", "TitleEn": "Arrived after selection",
        "BodyAr": "يجب حفظه", "BodyEn": "Must survive select all",
        "TargetPath": "/dashboard",
    }, admin)
    assert newer["Id"] > snapshot
    assert expect("POST", deletion, 200, {
        "All": True, "SnapshotId": snapshot, "Ids": []
    }, learner1)["DeletedCount"] == page["TotalCount"] - 1
    remaining = expect("GET", managed, 200, token=learner1)
    assert remaining["TotalCount"] == 1 and remaining["Items"][0]["Id"] == newer["Id"]
    expect("PUT", f"/api/notifications/v2/{newer['Id']}/read", 204, token=learner1)
    print("PASS: five-item managed inbox, owner-bound deletion, snapshot preserves new notices")

    # Launch gift access: a one-use code grants 365 days without checkout.
    voucher = expect("POST", "/api/admin/premium-codes", 200, {
        "Label": "CI annual gift", "PremiumDays": 365, "ExpiresInDays": 30
    }, admin)
    assert voucher["SingleUse"] and voucher["Code"].startswith("MW-")
    claim = expect("POST", "/api/users/premium-codes/redeem", 200, {
        "Code": voucher["Code"]
    }, learner2)
    assert claim["SubscriptionType"] == "Premium", claim
    assert api("POST", "/api/users/premium-codes/redeem",
               {"Code": voucher["Code"]}, learner1)[0] == 400
    listing = expect("GET", "/api/admin/premium-codes", 200, token=admin)
    assert listing["Codes"][0]["Status"] == "Redeemed"
    assert "CodeHash" not in listing["Codes"][0]
    assert "Code" not in listing["Codes"][0]
    unused = expect("POST", "/api/admin/premium-codes", 200, {
        "Label": "CI revoked gift", "PremiumDays": 30, "ExpiresInDays": 7
    }, admin)
    expect("PUT", f"/api/admin/premium-codes/{unused['Id']}/revoke",
           204, token=admin)
    assert api("POST", "/api/users/premium-codes/redeem",
               {"Code": unused["Code"]}, learner2)[0] == 400

    # Proposed stage categories are preview-only. They must not reparent
    # existing category IDs or insert unreviewed content.
    categories_before = expect("GET", "/api/categories", 200)
    proposed_category = {
        "ContentKey": "ci_category_new_001",
        "StageId": 1,
        "Order": 8,
        "NameAr": "الفئة التجريبية للمراجعة فقط",
        "NameEn": "Review only sample category",
        "SuggestedIconKey": "calculator",
        "ReviewStatus": "Proposed",
        "NotesAr": "لا تنشر تلقائياً",
        "NotesEn": "Never publish automatically",
    }
    payload = {"Categories": [proposed_category]}
    assert api("POST", "/api/admin/curriculum/categories/preview",
               payload, learner1)[0] == 403
    category_preview = expect("POST", "/api/admin/curriculum/categories/preview",
                              200, payload, admin)
    assert category_preview["DryRun"] and not category_preview["Published"]
    assert category_preview["ValidCount"] == 1, category_preview
    assert not category_preview["SupportsAutomaticCategoryPublishing"]
    duplicate = dict(proposed_category)
    duplicate["ContentKey"] = "ci_category_new_002"
    category_duplicates = expect("POST", "/api/admin/curriculum/categories/preview",
                                 200, {"Categories": [proposed_category, duplicate]}, admin)
    assert category_duplicates["InvalidCount"] == 1, category_duplicates
    assert len(expect("GET", "/api/categories", 200)) == len(categories_before)

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
    print("PASS: private inbox, achievements, anonymous rankings, Premium report/CSV and safe publishing")


if __name__ == "__main__":
    main()
