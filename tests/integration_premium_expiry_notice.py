#!/usr/bin/env python3
"""Disposable database only; verify one notice per expired subscription term."""
import time
from integration_problem_history import BASE
from integration_password_recovery import sql

def main():
    assert BASE.startswith(("http://127.0.0.1:","http://localhost:"))
    email="password-ci@mathworld.test"
    uid=int(sql(f"""SELECT "Id" FROM "Users" WHERE "Email"='{email}'"""))
    def notices():
        return int(sql(f"""SELECT COUNT(*) FROM "UserNotifications" WHERE "UserId"={uid} AND "TitleEn"='Premium expired'"""))
    def expire():
        sql(f"""UPDATE "Users" SET "SubscriptionType"='Premium',"PremiumExpiresAtUtc"=NOW()-INTERVAL '1 minute' WHERE "Id"={uid}""")
    def await_count(expected):
        for _ in range(30):
            if notices()==expected: return
            time.sleep(1)
        raise AssertionError((notices(),expected))
    before=notices()
    expire()
    await_count(before+1)
    assert sql(f"""SELECT ("PremiumExpiryNotifiedAtUtc"="PremiumExpiresAtUtc")::text FROM "Users" WHERE "Id"={uid}""")=="true"
    time.sleep(6)
    assert notices()==before+1
    # A renewed term may expire again; old notice must not suppress it.
    sql(f"""UPDATE "Users" SET "PremiumExpiresAtUtc"=NOW()+INTERVAL '1 year' WHERE "Id"={uid}""")
    expire()
    await_count(before+2)
    assert sql(f"""SELECT COUNT(*) FROM "EmailOutbox" WHERE "UserId"={uid} AND "TemplateKey"='premium-expired'""")=="0"
    print("PASS: one in-app notice per expired term, no duplicate, no optional delivery when disabled")
if __name__=="__main__": main()
