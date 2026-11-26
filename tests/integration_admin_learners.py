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

    # Persistent notifications: no cross-learner visibility, private unread
    # state, Admin-only creation and optional stage-scoped announcements.
    assert api("GET", "/api/notifications")[0] == 401
    assert api("GET", "/api/notifications", token=admin)[0] == 403
    assert api("POST", "/api/admin/notifications/announce", {
        "TitleAr": "اختبار", "TitleEn": "Test",
        "BodyAr": "رسالة", "BodyEn": "Message",
        "StageId": 1
    }, learner1)[0] == 403
    assert api("POST", "/api/admin/notifications/announce", {
        "TitleAr": "اختبار", "TitleEn": "Test",
        "BodyAr": "رسالة", "BodyEn": "Message",
        "ActionPath": "//evil.example"
    }, admin)[0] == 400
    assert expect("POST", "/api/admin/notifications/announce", 200, {
        "TitleAr": "مرحباً", "TitleEn": "Welcome",
        "BodyAr": "خبر جديد", "BodyEn": "New announcement",
        "StageId": 1, "ActionPath": "/stages/1"
    }, admin)["Sent"] == 1
    first_notice_page = expect("GET", "/api/notifications", 200,
                               token=learner1)
    second_notice_page = expect("GET", "/api/notifications", 200,
                                token=learner2)
    assert first_notice_page["Total"] == 1, first_notice_page
    assert first_notice_page["UnreadCount"] == 1, first_notice_page
    assert not second_notice_page["Notifications"], second_notice_page
    notice = first_notice_page["Notifications"][0]
    assert notice["Title"] == "مرحباً" and not notice["IsRead"], notice
    assert notice["ActionPath"] == "/stages/1", notice
    unread_route = "/api/notifications/unread-count"
    assert expect("GET", unread_route, 200,
                  token=learner1)["UnreadCount"] == 1
    assert api("PUT", f"/api/notifications/{notice['Id']}/read",
               token=learner2)[0] == 404
    assert expect("PUT", f"/api/notifications/{notice['Id']}/read", 200,
                  token=learner1)["IsRead"]
    assert expect("PUT", f"/api/notifications/{notice['Id']}/read", 200,
                  token=learner1)["IsRead"]
    assert expect("GET", unread_route, 200,
                  token=learner1)["UnreadCount"] == 0
    assert expect("POST", "/api/admin/notifications/announce", 200, {
        "TitleAr": "عام", "TitleEn": "All",
        "BodyAr": "للجميع", "BodyEn": "For everyone"
    }, admin)["Sent"] == 2
    assert expect("GET", unread_route, 200,
                  token=learner1)["UnreadCount"] == 1
    assert expect("GET", unread_route, 200,
                  token=learner2)["UnreadCount"] == 1
    assert expect("PUT", "/api/notifications/read-all", 200,
                  token=learner1)["Updated"] == 1
    assert expect("GET", unread_route, 200,
                  token=learner1)["UnreadCount"] == 0
    assert expect("GET", unread_route, 200,
                  token=learner2)["UnreadCount"] == 1
    assert api("GET", "/api/notifications?pageSize=500",
               token=learner1)[0] == 400

    for route in ["/api/admin/learners", "/api/admin/learners/1",
                  "/api/admin/learners/1/attempts"]:
        status, _ = api("GET", route, token=learner1)
        assert status == 403, (route, status)
    status, _ = api("GET", "/api/admin/learners")
    assert status == 401, status

    # Content audit is admin-only and never exposes learner identities.
    assert api("GET", "/api/admin/content-audit")[0] == 401
    assert api("GET", "/api/admin/content-audit", token=learner1)[0] == 403
    audit = expect("GET", "/api/admin/content-audit", 200, token=admin)
    assert audit["Summary"]["TotalStages"] >= 4, audit
    assert audit["Summary"]["TotalCategories"] >= 8, audit
    assert audit["Summary"]["LearnersWithoutStage"] >= 0, audit
    assert len(audit["Categories"]) == audit["Summary"]["TotalCategories"], audit
    assert "Password" not in str(audit) and "Email" not in str(audit), audit

    all_students = expect("GET", "/api/admin/learners", 200, token=admin)
    assert all_students["Total"] == 2, all_students
    ids = [x["Id"] for x in all_students["Learners"]]
    assert len(ids) == 2 and len(set(ids)) == 2, all_students
    assert all("Password" not in str(x) for x in all_students["Learners"])
    assert all("Hash" not in str(x) for x in all_students["Learners"])

    # The subscription table uses the lean directory. It must keep accurate
    # learner identities, stages and effective entitlements without aggregate joins.
    light_directory = expect("GET", "/api/admin/learners?includeActivity=false", 200, token=admin)
    assert light_directory["Total"] == all_students["Total"], light_directory
    assert sorted(x["Id"] for x in light_directory["Learners"]) == sorted(ids)
    assert all(x["SubscriptionType"] == "Free" for x in light_directory["Learners"])
    assert all(x["SolvedProblems"] == 0 and x["TotalAwardedPoints"] == 0
               for x in light_directory["Learners"])
    assert all("Password" not in str(x) for x in light_directory["Learners"])

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

    # Learner-owned reports are never available to anonymous/Admin/Free.
    report_route = "/api/users/premium-report"
    csv_route = "/api/users/premium-report/csv"
    assert api("GET", report_route)[0] == 401
    assert api("GET", report_route, token=admin)[0] == 403
    assert api("GET", report_route, token=learner1)[0] == 403
    assert api("GET", csv_route, token=learner1)[0] == 403

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
               {"SubscriptionType": "Premium", "Reason": "CI subscription check"}, admin)[0] == 404
    upgraded = expect("PUT", subscription_route, 200,
                      {"SubscriptionType": "Premium", "Reason": "CI subscription check"}, admin)
    assert upgraded["LearnerId"] == first["Id"] and upgraded["SubscriptionType"] == "Premium"
    report_initial = expect("GET", report_route, 200, token=learner1)
    assert report_initial["StageId"] == 1, report_initial
    assert report_initial["SolvedProblems"] == 0, report_initial
    assert len(report_initial["Categories"]) >= 1, report_initial
    assert api("GET", report_route + "?stageId=999999",
               token=learner1)[0] == 404
    # CSV is intentionally not JSON; verify the binary export directly.
    import urllib.request
    csv_request = urllib.request.Request(
        BASE + csv_route,
        headers={"Authorization": "Bearer " + learner1,
                 "Accept": "text/csv"})
    with urllib.request.urlopen(csv_request, timeout=20) as response:
        assert response.status == 200, response.status
        assert response.headers.get_content_type() == "text/csv"
        csv_bytes = response.read()
        assert csv_bytes[:3] == bytes((239, 187, 191)), csv_bytes[:12]
        assert b"Category,Total Problems" in csv_bytes
    assert api("GET", f"/api/problems/{locked_problem}", token=learner1)[0] == 200
    expect("GET", preview, 403, token=learner1)
    expect("GET", f"/api/problems/{locked_problem}/premium-solution", 403, token=learner1)
    # Repeating a grant is safe. Revocation must take effect immediately.
    assert expect("PUT", subscription_route, 200,
                  {"SubscriptionType": "Premium", "Reason": "CI subscription check"}, admin)["SubscriptionType"] == "Premium"
    downgraded = expect("PUT", subscription_route, 200,
                        {"SubscriptionType": "Free", "Reason": "CI subscription check"}, admin)
    assert downgraded["SubscriptionType"] == "Free"
    assert api("GET", report_route, token=learner1)[0] == 403
    assert api("GET", csv_route, token=learner1)[0] == 403
    assert api("GET", f"/api/problems/{locked_problem}", token=learner1)[0] == 403
    assert api("GET", preview, token=learner1)[0] == 403


    # One-click annual Premium can grant a single learner or a selected batch.
    # All requests are server-validated and AUDITED without a browser reason/date.
    annual = "/api/admin/learners/premium-annual"
    selected = [first["Id"], second["Id"]]
    assert api("POST", annual, {"LearnerIds": selected})[0] == 401
    assert api("POST", annual, {"LearnerIds": selected}, learner1)[0] == 403
    assert api("POST", annual, {"LearnerIds": selected + [999999]}, admin)[0] == 400
    assert api("POST", annual, {"LearnerIds": [first["Id"], first["Id"]]}, admin)[0] == 400
    assert expect("GET", f"/api/admin/learners/{first['Id']}", 200,
                  token=admin)["Learner"]["SubscriptionType"] == "Free"

    granted = expect("POST", annual, 200, {"LearnerIds": selected}, admin)
    assert granted["Updated"] == 2, granted
    assert sorted(granted["UpdatedIds"]) == sorted(selected), granted
    assert granted["DurationMonths"] == 12, granted
    assert len(granted["Periods"]) == 2, granted
    assert sorted(p["LearnerId"] for p in granted["Periods"]) == sorted(selected)
    for period in granted["Periods"]:
        import datetime
        start = datetime.datetime.fromisoformat(period["StartAtUtc"].replace("Z", "+00:00"))
        end = datetime.datetime.fromisoformat(period["EndAtUtc"].replace("Z", "+00:00"))
        assert 364 <= (end - start).days <= 366, period
        assert start < end
    details_after = expect("GET", f"/api/admin/learners/{first['Id']}", 200,
                           token=admin)
    expiry_before = details_after["Learner"]["PremiumExpiresAtUtc"]
    assert expiry_before == next(p["EndAtUtc"] for p in granted["Periods"] if p["LearnerId"]==first["Id"])
    assert details_after["Learner"]["SubscriptionType"] == "Premium", details_after
    assert expiry_before, details_after
    import datetime
    from datetime import timezone
    parsed_expiry = datetime.datetime.fromisoformat(expiry_before.replace("Z", "+00:00"))
    delta = parsed_expiry - datetime.datetime.now(timezone.utc)
    assert 364 <= delta.days <= 366, delta
    renewed = expect("POST", annual, 200, {"LearnerIds": [first["Id"]]}, admin)
    assert renewed["Updated"] == 1, renewed
    assert len(renewed["Periods"]) == 1, renewed
    assert renewed["Periods"][0]["LearnerId"] == first["Id"]
    assert renewed["Periods"][0]["StartAtUtc"] == expiry_before, renewed
    expiry_after = expect("GET", f"/api/admin/learners/{first['Id']}", 200,
                          token=admin)["Learner"]["PremiumExpiresAtUtc"]
    assert datetime.datetime.fromisoformat(expiry_after.replace("Z", "+00:00")) > parsed_expiry
    history = expect("GET", f"/api/admin/learners/{first['Id']}/subscription-history",
                     200, token=admin)
    assert any(h["Reason"] == "AdminAnnualPremiumRenewal"
               for h in history["Records"]), history
    assert expiry_after == renewed["Periods"][0]["EndAtUtc"]
    assert any(h["Reason"]=="AdminAnnualPremiumRenewal" and h["PreviousExpiresAtUtc"]==expiry_before and h["NewExpiresAtUtc"]==expiry_after for h in history["Records"])
    for include in ("true","false"):
        directory=expect("GET",f"/api/admin/learners?subscription=Premium&includeActivity={include}",200,token=admin)
        assert next(u for u in directory["Learners"] if u["Id"]==first["Id"])["PremiumExpiresAtUtc"]==expiry_after
    assert expect("GET","/api/users/subscription",200,token=learner1)["PremiumExpiresAtUtc"]==expiry_after
    # Legacy indefinite grants are not shortened by annual renewal.
    expect("PUT",subscription_route,200,{"SubscriptionType":"Premium","Reason":"CI indefinite access"},admin)
    indefinite=expect("POST",annual,200,{"LearnerIds":[first["Id"]]},admin)
    assert indefinite["Updated"]==0 and indefinite["SkippedIndefiniteIds"]==[first["Id"]]
    assert expect("GET",f"/api/admin/learners/{first['Id']}",200,token=admin)["Learner"].get("PremiumExpiresAtUtc") is None
    for learner_id in selected:
        expect("PUT", f"/api/admin/learners/{learner_id}/subscription", 200,
               {"SubscriptionType": "Free", "Reason": "Reset CI annual access"}, admin)

    page1 = expect("GET", "/api/admin/learners?pageSize=1&page=1", 200,
                   token=admin)
    page2 = expect("GET", "/api/admin/learners?pageSize=1&page=2", 200,
                   token=admin)
    assert page1["TotalPages"] == 2 and page2["TotalPages"] == 2
    assert page1["Learners"][0]["Id"] != page2["Learners"][0]["Id"]

    question_id, correct_option = create_question(admin, 71)
    updated_audit = expect("GET", "/api/admin/content-audit", 200, token=admin)
    assert updated_audit["Summary"]["TotalProblems"] >= (
        audit["Summary"]["TotalProblems"] + 1), updated_audit
    assert updated_audit["Summary"]["ProblemsWithInvalidOptions"] == 0, updated_audit

    code, result = submit(learner1, question_id, correct_option)
    assert code == 200, (code, result)

    now = expect("GET", "/api/admin/learners?stageId=1", 200, token=admin)
    current = now["Learners"][0]
    assert current["SolvedProblems"] == 1 and current["AttemptedProblems"] == 1, current
    assert current["TotalAwardedPoints"] == 10 and current["LastAttemptAt"], current
    expect("PUT", subscription_route, 200,
           {"SubscriptionType": "Premium", "Reason": "CI subscription check"}, admin)
    report_solved = expect("GET", report_route, 200, token=learner1)
    assert report_solved["SolvedProblems"] == 1, report_solved
    assert report_solved["OfficialPoints"] == 10, report_solved
    assert sum(c["SolvedProblems"] for c in report_solved["Categories"]) == 1
    assert sum(c["OfficialPoints"] for c in report_solved["Categories"]) == 10
    expect("PUT", subscription_route, 200,
           {"SubscriptionType": "Free", "Reason": "CI subscription check"}, admin)

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
    # A disposable student can be deleted after practice; their old token
    # cannot access the profile, and another student is not removed.
    disposable = student(73)
    profile = expect("GET", "/api/users/profile", 200, token=disposable)
    target = profile["Id"]
    expect("PUT", "/api/users/learning-stage", 200, {"StageId": 1}, disposable)
    assert submit(disposable, question_id, correct_option)[0] == 200
    route = f"/api/admin/learners/{target}"
    expect("DELETE", route, 400, token=admin)
    expect("DELETE", route+"?confirm=true", 403, token=learner1)
    expect("DELETE", route+"?confirm=true", 200, token=admin)
    expect("GET", route, 404, token=admin)
    assert api("GET", "/api/users/profile", token=disposable)[0] in (401,403,404)
    expect("GET", f"/api/admin/learners/{first['Id']}", 200, token=admin)
    student(73)  # same test email is reusable after permanent deletion
    print("PASS: admin learner directory, role privacy, manual Premium grants and revocation, stage history and attempts")

if __name__ == "__main__":
    main()
