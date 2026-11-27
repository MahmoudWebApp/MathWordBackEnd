"""Verify shared-practice reports after the isolated journey suite, on local CI only."""
import time
from integration_learning_journey import expect, call
from integration_learning_tracks import sql

def main():
    for _ in range(60):
        try:
            if call("GET","/health/ready")[0]==200:
                break
        except Exception:
            pass
        time.sleep(1)
    else:
        raise AssertionError("Shared-practice API did not become ready")

    uid=int(sql("""SELECT "Id" FROM "Users" WHERE "Email"='stage-after-signup@mathworld.test'"""))
    tid=int(sql(f'SELECT "CurrentTrackId" FROM "Users" WHERE "Id"={uid}'))
    assert tid>0
    pid=int(sql(f'SELECT "ProblemId" FROM "LearningTrackProblems" WHERE "TrackId"={tid} ORDER BY "ProblemId" LIMIT 1'))
    route="/api/users/current-grade-report"
    opt=route+"?allowSharedPractice=true"
    token=expect("POST","/api/auth/login",200,{"Email":"stage-after-signup@mathworld.test","Password":"CI_TEST_PASSWORD_2026"})["Token"]
    expect("GET",opt,401)
    expect("GET",opt,403,token=token)
    sql(f"""UPDATE "Users" SET "SubscriptionType"='Premium',"PremiumExpiresAtUtc"=NULL WHERE "Id"={uid}""")
    expect("GET",route,409,token=token)
    before=expect("GET",opt,200,token=token)
    assert before["TrackId"]==tid and before["MetricsScope"]=="CurrentTrack"
    assert before["TrackPracticeIsolationEnabled"] is False
    assert before["ProgressScope"]=="SharedStagePracticeCycle"
    assert before["HistoryScope"]=="SharedPracticeAndRecordedTrackAttempts"
    correct=int(sql(f'SELECT "Id" FROM "QuestionOptions" WHERE "ProblemId"={pid} AND "IsCorrect" LIMIT 1'))
    # The fixture's exam results must not become practice results.
    assert sql(f'SELECT count(*) FROM "UserProgresses" WHERE "UserId"={uid} AND "ProblemId"={pid} AND "PracticeScopeId"=0 AND "IsSolved"')=="0"
    answer=expect("POST","/api/problems/submit",200,{"ProblemId":pid,"SelectedOptionId":correct,"TimeSpentSeconds":2,"PracticeScopeId":0},token)
    assert answer["IsCorrect"]
    after=expect("GET",opt,200,token=token)
    assert after["Solved"]==before["Solved"]+1,after
    assert after["Attempts"]==before["Attempts"]+1,after
    assert any(a["ProblemId"]==pid and a["Source"]=="shared-practice" for a in after["RecentAttempts"]),after
    print("PASS: shared practice reports use real current-grade filtered data; Premium and legacy-client guard preserved.")

if __name__=="__main__":
    main()
