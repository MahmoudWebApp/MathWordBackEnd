#!/usr/bin/env python3
"""Staff invitations, deny-by-default, role and version revocation on disposable DB."""
import time
from integration_problem_history import BASE, api, expect, token_of, wait_ready
from integration_password_recovery import grant_token, reset, sql
EMAIL="supervisor-ci@mathworld.test"
PWD="CI_SUPERVISOR_PASSWORD_123456"
ADMIN="ci-admin@mathworld.test"
ADMIN_PWD="CI_RESET_ADMIN_PASSWORD_123456"
ROUTE="/api/admin/supervisors"
def login(email,password):
    for _ in range(65):
        status,result=api("POST","/api/auth/login",{"Email":email,"Password":password})
        if status!=429: return status,result
        time.sleep(1)
    raise AssertionError("Auth limiter did not recover")
def main():
    assert BASE.startswith(("http://127.0.0.1:","http://localhost:"))
    wait_ready()
    status,result=login(ADMIN,ADMIN_PWD)
    assert status==200
    admin=token_of(result["Data"])
    created=expect("POST",ROUTE,201,{"FullName":"CI Supervisor","Email":EMAIL,"Language":"en"},admin)
    sid=created["Id"]
    assert created["StaffSetupPending"] and not created["InvitationQueued"]
    expect("POST",ROUTE,409,{"FullName":"Duplicate","Email":EMAIL.upper(),"Language":"en"},admin)
    expect("GET",ROUTE,401)
    status,result=login("recovery-ci@mathworld.test","CI_RECOVERY_REPLACEMENT_67890")
    assert status==401  # disabled by preceding recovery test
    status,result=login(EMAIL,PWD)
    assert status==401
    expect("POST","/api/auth/forgot-password",202,{"Email":EMAIL})
    assert sql(f'SELECT COUNT(*) FROM "PasswordResetGrants" WHERE "UserId"={sid}')=="0"
    invite=expect("POST",f"{ROUTE}/{sid}/invite",202,{"Language":"en"},admin)
    assert invite["Queued"] and not invite["WorkerEnabled"]  # no provider call in CI
    assert sql(f"""SELECT COUNT(*) FROM "EmailOutbox" WHERE "UserId"={sid} AND "TemplateKey"='supervisor-invite' AND "State"='Pending'""")=="1"
    expect("POST",f"{ROUTE}/{sid}/invite",429,{"Language":"en"},admin)
    secret=grant_token(EMAIL)
    expect("POST","/api/auth/reset-password",200,reset(secret,PWD))
    expect("POST","/api/auth/reset-password",400,reset(secret,PWD))
    status,result=login(EMAIL,PWD)
    assert status==200 and result["Data"]["Role"]=="Supervisor"
    supervisor=token_of(result["Data"])
    assert expect("GET","/api/supervisor/permissions",200,token=supervisor)["Permissions"]==3
    expect("GET","/api/users/profile",200,token=supervisor)
    for path in (ROUTE,"/api/admin/learners","/api/admin/curriculum/drafts","/api/admin/platform/email-outbox","/api/users/dashboard","/api/notifications/v2/unread-count"):
        expect("GET",path,403,token=supervisor)
    expect("POST","/api/admin/problems",403,{},supervisor)
    expect("POST","/api/problems/submit",403,{},supervisor)
    from integration_editorial_wizard import verify_wizard
    draft=verify_wizard(admin,supervisor,sid)
    row=next(x for x in expect("GET",ROUTE,200,token=admin)["Items"] if x["Id"]==sid)
    assert not row["StaffSetupPending"] and row["Permissions"]==3
    rev=row["Revision"]
    for invalid in (8,32,-1):
        expect("PUT",f"{ROUTE}/{sid}",400,{"IsActive":True,"Permissions":invalid,"Revision":rev},admin)
    expect("GET","/api/supervisor/students",403,token=supervisor)
    expect("GET","/api/supervisor/reports",403,token=supervisor)
    expect("PUT",f"{ROUTE}/{sid}",200,{"IsActive":True,"Permissions":28,"Revision":rev},admin)
    expect("GET","/api/supervisor/permissions",401,token=supervisor)
    status,result=login(EMAIL,PWD)
    assert status==200
    supervisor=token_of(result["Data"])
    assert expect("GET","/api/supervisor/permissions",200,token=supervisor)["Permissions"]==28
    students=expect("GET","/api/supervisor/students",200,token=supervisor)
    assert all("PasswordHash" not in row and "Role" not in row for row in students["Items"])
    expect("GET","/api/supervisor/reports",200,token=supervisor)
    if students["Items"]:
        expect("GET",f'/api/supervisor/students/{students["Items"][0]["Id"]}/activity',200,token=supervisor)
    expect("GET",ROUTE,403,token=supervisor)
    rev+=1
    expect("PUT",f"{ROUTE}/{sid}",200,{"IsActive":True,"Permissions":1,"Revision":rev},admin)
    expect("GET","/api/supervisor/permissions",401,token=supervisor)
    expect("PUT",f"{ROUTE}/{sid}",409,{"IsActive":True,"Permissions":3,"Revision":rev},admin)
    status,result=login(EMAIL,PWD)
    assert status==200
    token=token_of(result["Data"])
    assert expect("GET","/api/supervisor/permissions",200,token=token)["Permissions"]==1
    expect("POST",f"/api/editorial/problems/{draft}/submit",403,{"Revision":0},token)
    expect("PUT",f"{ROUTE}/{sid}",200,{"IsActive":False,"Permissions":1,"Revision":rev+1},admin)
    expect("GET","/api/supervisor/permissions",401,token=token)
    status,result=login(EMAIL,PWD)
    assert status==401
    expect("GET",ROUTE,200,token=admin)
    history=expect("GET",f"{ROUTE}/{sid}/activity",200,token=admin)
    actions={x["Action"] for x in history["Items"]}
    assert {"SupervisorCreated","SupervisorInvited","SupervisorInvitationAccepted","LoggedIn","SupervisorPermissionsChanged"}<=actions, actions
    print("PASS: managed staff invitation, password setup, supervisor endpoint boundary, permission revocation and disable")
if __name__=="__main__": main()
