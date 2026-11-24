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
    a = expect("POST", route, 202, {"Email":"absent@mathworld.test"})
    b = expect("POST", route, 202, {"Email":EMAIL})
    assert a == b == {"Accepted":True}
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
    print("PASS: generic forgot response, cooldown, hashed grant, queue, concurrent single-use reset and session revocation")
if __name__=="__main__":
    main()
