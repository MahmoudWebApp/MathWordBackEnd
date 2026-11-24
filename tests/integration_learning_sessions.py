"""Exercise independent sessions only against the disposable journey API."""
from uuid import uuid4
from integration_learning_journey import expect, call

ROOT = "/api/users/learning-sessions"

def verify_sessions(admin, learner, other, stage):
    expect("PUT", "/api/users/learning-stage", 200, {"StageId": stage}, learner)
    expect("PUT", "/api/users/learning-stage", 200, {"StageId": stage}, other)
    # Real accessible, distinct seed questions; no guessed production IDs.
    for n in range(40, 50):
        expect("POST", "/api/admin/problems", 201, {
            "StageId": stage, "CategoryId": 5, "Points": 10,
            "QuestionTextAr": f"اختبار الجلسة: ما نتيجة {n} + 1؟",
            "QuestionTextEn": f"Session fixture: what is {n} + 1?",
            "DetailedSolutionAr": f"نجمع 1 إلى {n} فنحصل على {n+1}.",
            "DetailedSolutionEn": f"Add one to {n} to get {n+1}.",
            "Options": [{"LatexCode": str(v), "IsCorrect": v==n+1, "Order": i}
                        for i,v in enumerate(range(n,n+4),1)]
        },admin)
    start={"RequestId":str(uuid4()),"Kind":"daily","Count":5}
    expect("POST",ROOT+"/start",401,start)
    expect("POST",ROOT+"/start",403,start,admin)
    s=expect("POST",ROOT+"/start",200,start,other)
    assert s["Total"]==5 and s["Completed"]==0 and not s["IsComplete"]
    sid=s["Id"];path=f"{ROOT}/{sid}"
    assert expect("POST",ROOT+"/start",200,start,other)["Id"]==sid
    assert expect("POST",ROOT+"/start",200,dict(start,RequestId=str(uuid4())),other)["Id"]==sid
    expect("GET",path,404,token=learner)
    expect("GET",path,403,token=admin)
    initial=expect("GET",ROOT+"/current?kind=daily",200,token=other)
    assert initial["Id"]==sid and initial["CurrentQuestion"]["Id"]==s["CurrentQuestion"]["Id"]
    q=s["CurrentQuestion"]
    assert all("IsCorrect" not in o for o in q["Options"])
    assert "DetailedSolutionAr" not in q and "CorrectOptionId" not in q
    info=expect("GET",f"/api/problems/{q['Id']}",200,token=admin)
    bad=next(o["Id"] for o in info["Options"] if not o["IsCorrect"])
    good=next(o["Id"] for o in info["Options"] if o["IsCorrect"])
    # Ordinary solving must never advance an independent daily session.
    ordinary=expect("POST","/api/problems/submit",200,{
        "ProblemId":q["Id"],"SelectedOptionId":good,"TimeSpentSeconds":3},other)
    assert ordinary["IsCorrect"]
    assert expect("GET",path,200,token=other)["Completed"]==0
    baseline=expect("GET","/api/users/journey",200,token=other)
    wrong={"RequestId":str(uuid4()),"Position":0,"ProblemId":q["Id"],"SelectedOptionId":bad}
    w=expect("POST",path+"/answer",200,wrong,other)
    assert w["Completed"]==0 and not w["IsCorrect"] and w["AttemptNumber"]==1
    assert w.get("CorrectOptionId") is None and w.get("DetailedSolutionAr") is None
    assert expect("POST",path+"/answer",200,wrong,other)["AttemptNumber"]==1
    expect("POST",path+"/answer",409,dict(wrong,SelectedOptionId=good),other)
    expect("POST",path+"/answer",409,dict(wrong,RequestId=str(uuid4()),Position=1),other)
    assert expect("GET",path,200,token=other)["Completed"]==0
    # A correct answer advances exactly one, while the original question
    # remains in its attempt ledger. Replays cannot advance again.
    first=dict(wrong,RequestId=str(uuid4()),SelectedOptionId=good)
    a=expect("POST",path+"/answer",200,first,other)
    assert a["IsCorrect"] and not a["FirstAttemptCorrect"] and a["Completed"]==1
    assert a["CorrectOptionId"]==good and a["DetailedSolutionEn"]
    assert expect("POST",path+"/answer",200,first,other)["Completed"]==1
    expect("POST",path+"/answer",409,dict(first,RequestId=str(uuid4())),other)
    for pos in range(1,5):
        current=expect("GET",path,200,token=other)
        q=current["CurrentQuestion"]
        info=expect("GET",f"/api/problems/{q['Id']}",200,token=admin)
        correct=next(o["Id"] for o in info["Options"] if o["IsCorrect"])
        a=expect("POST",path+"/answer",200,{"RequestId":str(uuid4()),"Position":pos,
             "ProblemId":q["Id"],"SelectedOptionId":correct},other)
        assert a["Completed"]==pos+1 and a["FirstAttemptCorrect"]
    finished=expect("GET",path,200,token=other)
    assert finished["IsComplete"] and finished["Completed"]==5 and finished.get("CurrentQuestion") is None
    assert expect("POST",ROOT+"/start",200,dict(start,RequestId=str(uuid4())),other)["Id"]==sid
    after=expect("GET","/api/users/journey",200,token=other)
    assert after["TotalPoints"]==baseline["TotalPoints"] and after["SolvedProblems"]==baseline["SolvedProblems"]
    # Switch stage: today's daily session is not replaced. Restore on return.
    expect("PUT","/api/users/learning-stage",200,{"StageId":1},other)
    expect("POST",ROOT+"/start",409,dict(start,RequestId=str(uuid4())),other)
    expect("PUT","/api/users/learning-stage",200,{"StageId":stage},other)
    assert expect("GET",path,200,token=other)["Completed"]==5
    p=expect("POST",ROOT+"/start",200,{"RequestId":str(uuid4()),"Kind":"practice","Count":5,"CategoryId":5},learner)
    assert p["Id"]!=sid and p["Completed"]==0
    assert expect("GET",ROOT+"/current?kind=practice&categoryId=5",200,token=learner)["Id"]==p["Id"]
    expect("POST",ROOT+"/start",400,{"RequestId":str(uuid4()),"Kind":"practice","Count":11},learner)
    assert expect("GET",path,200,token=other)["Completed"]==5
    print("PASS: independent 5-question session, owner isolation, correct-only advance, replay, daily uniqueness and practice separation")
