#!/usr/bin/env python3
"""Authenticated password change and JWT revocation against disposable CI DB only."""
import base64
import concurrent.futures
import hashlib
import hmac
import json
from integration_problem_history import BASE, api, expect, token_of, wait_ready, ADMIN_EMAIL, ADMIN_PASSWORD

def legacy_token(token):
    header, payload, _ = token.split(".")
    def decode(value):
        return json.loads(base64.urlsafe_b64decode(value + "=" * (-len(value) % 4)))
    def encode(value):
        return base64.urlsafe_b64encode(value).decode().rstrip("=")
    claims = decode(payload)
    assert claims.pop("mw_token_version") in (0, "0")
    unsigned = header + "." + encode(json.dumps(claims, separators=(",", ":")).encode())
    key = b"ci_only_test_signing_key_never_use_in_production_0123456789"
    return unsigned + "." + encode(hmac.new(key, unsigned.encode(), hashlib.sha256).digest())

def main():
    assert BASE.startswith(("http://127.0.0.1:", "http://localhost:"))
    wait_ready()
    email = "password-ci@mathworld.test"
    old = "CI_STUDENT_PASSWORD_12345"
    new = "CI_NEW_STUDENT_PASSWORD_67890"
    route = "/api/auth/change-password"
    protected = "/api/notifications/v2/unread-count"
    token = token_of(expect("POST", "/api/auth/register", 201, {
        "FullName": "CI Password", "Email": email, "Password": old, "StageId": 1
    }))
    preferences="/api/users/email-preferences"
    initial=expect("GET",preferences,200,token=token)
    assert not initial["EmailVerified"] and not initial["OptionalDeliveryEnabled"]
    expect("PUT",preferences,409,{"EmailLearningUpdates":True,"EmailSubscriptionUpdates":False,"EmailImportantAnnouncements":False,"Locale":"en"},token)
    from integration_password_recovery import sql
    assert sql(f"""SELECT COUNT(*) FROM "EmailVerificationGrants" WHERE "Email"='{email}'""")=="1"
    assert sql(f"""SELECT COUNT(*) FROM "EmailOutbox" WHERE "Recipient"='{email}' AND "TemplateKey"='welcome' AND "State"='Pending'""")=="1"
    legacy = legacy_token(token)
    expect("GET", protected, 200, token=legacy)
    admin = token_of(expect("POST", "/api/auth/login", 200,
        {"Email": ADMIN_EMAIL, "Password": ADMIN_PASSWORD}))
    def body(current, new_password, confirm=None):
        return {"CurrentPassword": current, "NewPassword": new_password,
                "ConfirmPassword": new_password if confirm is None else confirm}
    expect("POST", route, 401, body(old, new))
    expect("POST", route, 400, body("not-the-password", new), token)
    expect("POST", route, 400, body(old, old), token)
    expect("POST", route, 400, body(old, "ش" * 37), token)
    # Both calls may authenticate before either commits, but exactly one can change.
    with concurrent.futures.ThreadPoolExecutor(max_workers=2) as pool:
        statuses = list(pool.map(lambda _: api("POST", route, body(old, new), token)[0], range(2)))
    assert sorted(statuses)[0] == 200 and sorted(statuses)[1] in (401, 409), statuses
    expect("GET", protected, 401, token=token)
    expect("GET", protected, 401, token=legacy)
    expect("POST", "/api/auth/login", 401, {"Email": email, "Password": old})
    replacement = token_of(expect("POST", "/api/auth/login", 200, {"Email": email, "Password": new}))
    assert expect("GET", protected, 200, token=replacement)["UnreadCount"] == 1
    expect("GET", "/api/admin/learners", 403, token=replacement)
    # Existing administrator uses exactly the same authenticated endpoint.
    admin_new = "CI_NEW_ADMIN_PASSWORD_67890"
    assert expect("POST", route, 200, body(ADMIN_PASSWORD, admin_new), admin)["RequiresSignIn"]
    expect("GET", "/api/admin/learners", 401, token=admin)
    new_admin = token_of(expect("POST", "/api/auth/login", 200,
        {"Email": ADMIN_EMAIL, "Password": admin_new}))
    expect("GET", "/api/admin/learners", 200, token=new_admin)
    assert expect("GET", protected, 200, token=new_admin)["UnreadCount"] == 1
    print("PASS: password changes, atomic concurrency, legacy and versioned JWT revocation, admin continuity.")
    public_route = "/api/platform/brand"
    admin_route = "/api/admin/platform/brand"
    initial = expect("GET", public_route, 200)
    assert initial["Profile"]["SocialLinks"] == [] and initial["Profile"].get("SupportEmail") is None
    expect("GET", admin_route, 401)
    expect("GET", admin_route, 403, token=replacement)
    profile = initial["Profile"]
    profile["SocialLinks"] = [{"Platform":"test","LabelAr":"اختبار","LabelEn":"Test","Url":"",
                               "IsEnabled":False,"DisplayOrder":0}]
    payload = {"Revision":initial["Revision"],"Profile":profile}
    expect("PUT", admin_route, 403, payload, replacement)
    invalid = {**profile,"LogoUrl":"https://evil.example/logo.png"}
    expect("PUT", admin_route, 400, {"Revision":initial["Revision"],"Profile":invalid}, new_admin)
    saved = expect("PUT", admin_route, 200, payload, new_admin)
    assert saved["Revision"] == initial["Revision"] + 1
    assert len(saved["Profile"]["SocialLinks"]) == 1
    assert expect("GET", public_route, 200)["Profile"]["SocialLinks"] == []
    expect("PUT", admin_route, 409, payload, new_admin)
    preview = "/api/admin/platform/email-preview"
    expect("GET", preview, 401)
    expect("GET", preview, 403, token=replacement)
    for lang, direction in (("ar", "rtl"), ("en", "ltr")):
        message = expect("GET", preview + "?language=" + lang + "&template=password-changed", 200, token=new_admin)
        assert 'dir="' + direction + '"' in message["Html"]
        assert message["PlainText"] and message["Subject"]
    expect("GET", preview + "?template=unknown", 400, token=new_admin)
    print("PASS: shared brand settings, private admin edit, disabled links hidden, revision conflicts and bilingual email preview.")
    # Independent verification is not a password reset or a login.
    from integration_password_recovery import sql,KEY
    request="/api/auth/email-verification/request"
    confirm="/api/auth/email-verification/confirm"
    expect("POST",request,401,{"Language":"en"})
    # The registration grant predates the password change and must not
    # verify the changed account. Age it beyond the resend cooldown.
    sql(f"""UPDATE "EmailVerificationGrants" SET "CreatedAtUtc"=NOW()-INTERVAL '3 minutes' WHERE "Email"='{email}'""")
    expect("POST",request,202,{"Language":"en"},replacement)
    expect("POST",request,429,{"Language":"en"},replacement)
    grant=sql(f"""SELECT "Id"::text||'|'||"TokenHash" FROM "EmailVerificationGrants" WHERE "Email"='{email}' AND "ConsumedAtUtc" IS NULL""")
    gid,digest=grant.split("|")
    verify=hmac.new(KEY,("MathWorld/email-verification/v1/"+gid.replace("-","")).encode(),hashlib.sha256).hexdigest()
    assert hashlib.sha256(verify.encode()).hexdigest()==digest
    assert verify!=hmac.new(KEY,("MathWorld/password-reset/v1/"+gid.replace("-","")).encode(),hashlib.sha256).hexdigest()
    assert sql(f"""SELECT COUNT(*) FROM "EmailOutbox" WHERE "Id"='{gid}' AND "TemplateKey"='welcome' AND "State"='Pending'""")=="1"
    expect("POST",confirm,400,{"Token":"0"*64})
    with concurrent.futures.ThreadPoolExecutor(max_workers=2) as pool:
        statuses=list(pool.map(lambda _: api("POST",confirm,{"Token":verify})[0],range(2)))
    assert sorted(statuses)==[200,400],statuses
    assert expect("GET",preferences,200,token=replacement)["EmailVerified"]
    expect("POST",confirm,400,{"Token":verify})
    assert expect("GET",protected,200,token=replacement)["UnreadCount"]==1
    print("PASS: separate hash-only mailbox verification, cooldown, atomic one-time proof, JWT unchanged.")

if __name__ == "__main__":
    main()
