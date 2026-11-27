#!/usr/bin/env python3
"""Recovery integration: local disposable PostgreSQL; provider disabled at worker level."""
import hashlib
import hmac
import base64
import subprocess
import concurrent.futures
from integration_problem_history import BASE, api, expect, token_of, wait_ready

KEY = base64.b64decode("Y2lfb25seV9yZWNvdmVyeV9rZXlfbmV2ZXJfcHJvZHVjdGlvbl8xMjM0")
OLD = "CI_RECOVERY_PASSWORD_12345"
NEW = "CI_RECOVERY_REPLACEMENT_67890"
EMAIL = "recovery-ci@mathworld.test"
def sql(query):
    import os
    env = {**os.environ, "PGPASSWORD": "ci_only_password"}
    return subprocess.check_output(["psql", "-X", "-h", "127.0.0.1", "-U", "postgres",
        "-d", "mathworld_ci", "-v", "ON_ERROR_STOP=1", "-Atc", query], env=env, text=True).strip()
def register(email):
    return token_of(expect("POST", "/api/auth/register", 201,
        {"FullName": "CI Recovery", "Email": email, "Password": OLD, "StageId": 1}))
def reset(token, password=NEW):
    return {"Token":token,"NewPassword":password,"ConfirmPassword":password}
def grant_token(email):
    rows = sql(f"""SELECT "Id"::text || '|' || "TokenHash" FROM "PasswordResetGrants" WHERE "Email"='{email}' ORDER BY "CreatedAtUtc" DESC LIMIT 1""")
    row, digest = rows.split("|")
    token = hmac.new(KEY, ("MathWorld/password-reset/v1/" + row.replace("-","")).encode(), hashlib.sha256).hexdigest()
    assert hashlib.sha256(token.encode()).hexdigest() == digest and digest != token
    return token
def main():
    assert BASE.startswith(("http://127.0.0.1:", "http://localhost:"))
    wait_ready()
    # Prior integration consumed 5 auth-IP permits. Let its window expire only
    # when necessary; reset tests themselves use independent recovery policy.
    import time
    def auth_retry(method, route, body):
        for _ in range(65):
            status, result = api(method, route, body)
            if status != 429: return status, result
            time.sleep(1)
        raise AssertionError("Auth rate limiter did not recover")
    status, result = auth_retry("POST", "/api/auth/register", {"FullName":"CI Recovery","Email":EMAIL,"Password":OLD,"StageId":1})
    assert status == 201
    old_token = token_of(result["Data"])
    route = "/api/auth/forgot-password"
    status, absent = api("POST", route, {"Email":"absent@mathworld.test"})
    assert status == 404 and "RecoveryEmailNotRegistered" in absent["Errors"]["Email"], absent
    # No reset grant or queued message may be created for an unknown address.
    assert sql("""SELECT COUNT(*) FROM "PasswordResetGrants" WHERE lower("Email")='absent@mathworld.test'""") == "0"
    assert sql("""SELECT COUNT(*) FROM "EmailOutbox" WHERE lower("Recipient")='absent@mathworld.test' AND "TemplateKey"='password-reset'""") == "0"
    b = expect("POST", route, 202, {"Email":EMAIL})
    assert b == {"Accepted":True}
    expect("POST", route, 202, {"Email":EMAIL})
    assert sql("""SELECT COUNT(*) FROM "PasswordResetGrants" WHERE "Email"='recovery-ci@mathworld.test'""") == "1"
    token = grant_token(EMAIL)
    assert sql("""SELECT COUNT(*) FROM "EmailOutbox" WHERE "Recipient"='recovery-ci@mathworld.test' AND "TemplateKey"='password-reset' AND "State"='Pending'""") == "1"
    reset_route="/api/auth/reset-password"
    expect("POST", reset_route, 400, reset(token,"short"))
    with concurrent.futures.ThreadPoolExecutor(max_workers=2) as pool:
        statuses=list(pool.map(lambda _: api("POST",reset_route,reset(token))[0],range(2)))
    assert sorted(statuses)==[200,400],statuses
    expect("GET","/api/notifications/v2/unread-count",401,token=old_token)
    expect("POST",reset_route,400,reset(token))
    status, result=auth_retry("POST","/api/auth/login",{"Email":EMAIL,"Password":NEW})
    assert status==200
    expect("GET","/api/notifications/v2/unread-count",200,token=token_of(result["Data"]))
    assert sql("""SELECT COUNT(*) FROM "EmailOutbox" WHERE "Recipient"='recovery-ci@mathworld.test' AND "TemplateKey"='password-changed'""")=="1"
    student_token=token_of(result["Data"])
    preferences="/api/users/email-preferences"
    initial=expect("GET",preferences,200,token=student_token)
    assert initial["EmailVerified"] and not initial["OptionalDeliveryEnabled"]
    assert not any(initial[k] for k in ("EmailLearningUpdates","EmailSubscriptionUpdates","EmailImportantAnnouncements"))
    prefs={"EmailLearningUpdates":True,"EmailSubscriptionUpdates":True,"EmailImportantAnnouncements":False,"Locale":"en"}
    updated=expect("PUT",preferences,200,prefs,student_token)
    assert updated["EmailLearningUpdates"] and updated["EmailSubscriptionUpdates"] and updated["Locale"]=="en"
    expect("PUT",preferences,400,{**prefs,"Locale":"xx"},student_token)
    expect("GET",preferences,401)
    # Opt-out always remains possible; no optional delivery in CI.
    expect("PUT",preferences,200,{**prefs,"EmailLearningUpdates":False,"EmailSubscriptionUpdates":False},student_token)
    outbox_route="/api/admin/platform/email-outbox"
    expect("GET",outbox_route,401)
    expect("GET",outbox_route,403,token=student_token)
    admin_email="ci-admin@mathworld.test"
    expect("POST",route,202,{"Email":admin_email})
    admin_secret=grant_token(admin_email)
    expect("POST",reset_route,200,reset(admin_secret,"CI_RESET_ADMIN_PASSWORD_123456"))
    status,result=auth_retry("POST","/api/auth/login",{"Email":admin_email,"Password":"CI_RESET_ADMIN_PASSWORD_123456"})
    assert status==200
    admin_token=token_of(result["Data"])
    # Verify actual event-to-outbox writes on disposable PostgreSQL, with
    # provider calls disabled and an explicit test-only queue flag.
    uid=int(sql(f"""SELECT "Id" FROM "Users" WHERE "Email"='{EMAIL}'"""))
    expect("PUT",preferences,200,{**prefs,"EmailImportantAnnouncements":True},student_token)
    notice={"TitleAr":"اختبار","TitleEn":"Test","BodyAr":"إشعار اختباري","BodyEn":"Test notice","TargetPath":"/dashboard"}
    def queued(key):
        return int(sql(f"""SELECT COUNT(*) FROM "EmailOutbox" WHERE "UserId"={uid} AND "TemplateKey"='{key}' AND "State"='Pending' AND "Locale"='en'"""))
    expect("POST",f"/api/admin/notifications/learners/{uid}",200,notice,admin_token)
    assert queued("announcement")==1
    expect("POST",f"/api/admin/notifications/learners/{uid}",200,{**notice,"IncludeOptionalEmail":False},admin_token)
    assert queued("announcement")==1
    manual=f"/api/admin/notifications/email/learners/{uid}"
    expect("POST",manual,403,notice,student_token)
    manual_result=expect("POST",manual,202,notice,admin_token)
    assert manual_result["Queued"] and not manual_result["EmailSent"] and manual_result["NoticeId"]>0
    assert queued("announcement")==2
    code=expect("POST","/api/admin/premium-codes",200,{"Label":"CI gift","PremiumDays":30,"ExpiresInDays":1},admin_token)["Code"]
    expect("POST","/api/users/premium-codes/redeem",200,{"Code":code},student_token)
    expect("POST","/api/users/premium-codes/redeem",400,{"Code":code},student_token)
    assert queued("premium-granted")==1
    expect("PUT",preferences,200,{**prefs,"EmailLearningUpdates":False,"EmailSubscriptionUpdates":False,"EmailImportantAnnouncements":False},student_token)
    expect("POST",f"/api/admin/notifications/learners/{uid}",200,notice,admin_token)
    assert queued("announcement")==2
    expect("POST",manual,409,notice,admin_token)
    assert queued("announcement")==2
    outbox=expect("GET",outbox_route,200,token=admin_token)
    assert outbox["IsConfigured"] and outbox["IsTestMode"] and not outbox["IsWorkerEnabled"]
    readiness=outbox["Readiness"]
    assert readiness["Missing"]==["WorkerDisabled"], readiness
    assert readiness["CanQueueAdminTest"] is False
    assert readiness["AdminRecoveryConfigured"] is False
    assert readiness["ProviderConnectionVerified"] is False and readiness["InboxDeliveryVerified"] is False
    assert "ci-dummy-never-send" not in str(outbox) and "ci-admin@mathworld.test" not in str(outbox)
    assert outbox["Items"] and all(not any(k in row for k in ("Recipient","ResetGrantId","ProviderMessageId","TokenHash")) for row in outbox["Items"])
    expected_templates={"test","password-reset","password-changed","supervisor-invite","welcome","premium-granted","premium-renewed","premium-expired","announcement","certificate-issued"}
    assert set(outbox["TestTemplates"])==expected_templates
    preview="/api/admin/platform/email-preview"
    expect("GET",preview,403,token=student_token)
    for key in expected_templates:
        for language in ("ar","en"):
            message=expect("GET",f"{preview}?template={key}&language={language}",200,token=admin_token)
            assert message["Subject"] and message["PlainText"] and "MathWorld" in message["Html"]
            assert ('dir="rtl"' if language=="ar" else 'dir="ltr"') in message["Html"]
            assert "#token=" not in message["Html"] and "#token=" not in message["PlainText"]
            assert ("معاينة" if language=="ar" else "[PREVIEW]") in message["Subject"]
    expect("GET",preview+"?template=unapproved",400,token=admin_token)
    expect("POST",outbox_route+"/test",503,{"Language":"ar","Template":"certificate-issued"},admin_token)
    # Readiness reports actual sample quota and cooldown even with the worker
    # disabled. Seed disposable rows only; never call the real provider.
    import uuid
    sample_ids = [str(uuid.uuid4()) for _ in range(5)]
    def add_sample(sample_id):
        sql(f"""INSERT INTO "EmailOutbox" ("Id","UserId","Recipient","TemplateKey","Locale","State","Attempts","CreatedAtUtc","ExpiresAtUtc","NextRetryAtUtc")
            SELECT '{sample_id}',"Id","Email",'test:certificate-issued','en','Pending',0,NOW(),NOW()+INTERVAL '15 minutes',NOW()
            FROM "Users" WHERE "Email"='ci-admin@mathworld.test'""")
    try:
        add_sample(sample_ids[0])
        blocked = expect("GET",outbox_route,200,token=admin_token)["Readiness"]
        assert "AdminTestCooldown" in blocked["Missing"] and "DailyTestLimitReached" not in blocked["Missing"], blocked
        assert blocked["CanQueueAdminTest"] is False
        for sample_id in sample_ids[1:]:
            add_sample(sample_id)
        blocked = expect("GET",outbox_route,200,token=admin_token)["Readiness"]
        assert {"AdminTestCooldown","DailyTestLimitReached"} <= set(blocked["Missing"]), blocked
        assert blocked["CanQueueAdminTest"] is False
    finally:
        quoted_ids = ",".join("'" + value + "'" for value in sample_ids)
        sql(f'DELETE FROM "EmailOutbox" WHERE "Id" IN ({quoted_ids})')
    # Expiration is checked atomically even if a reset link was valid earlier.
    sql("""UPDATE "PasswordResetGrants" SET "CreatedAtUtc"=NOW()-INTERVAL '5 minutes' WHERE "Email"='recovery-ci@mathworld.test'""")
    expect("POST",route,202,{"Email":EMAIL})
    expired=grant_token(EMAIL)
    sql("""UPDATE "PasswordResetGrants" SET "ExpiresAtUtc"=NOW()-INTERVAL '1 minute' WHERE "Email"='recovery-ci@mathworld.test' AND "ConsumedAtUtc" IS NULL""")
    expect("POST",reset_route,400,reset(expired))
    # An inactive account still gets the identical public response.
    sql("""UPDATE "Users" SET "IsActive"=false WHERE "Email"='recovery-ci@mathworld.test'""")
    sql("""UPDATE "PasswordResetGrants" SET "CreatedAtUtc"=NOW()-INTERVAL '5 minutes' WHERE "Email"='recovery-ci@mathworld.test'""")
    before=sql("""SELECT COUNT(*) FROM "PasswordResetGrants" WHERE "Email"='recovery-ci@mathworld.test'""")
    expect("POST",route,202,{"Email":EMAIL})
    assert sql("""SELECT COUNT(*) FROM "PasswordResetGrants" WHERE "Email"='recovery-ci@mathworld.test'""")==before
    print("PASS: explicit unknown email, cooldown, hash-only grant, queue, single-use reset, admin recovery, expiration, disabled account, and protected outbox status")
if __name__=="__main__":
    main()
