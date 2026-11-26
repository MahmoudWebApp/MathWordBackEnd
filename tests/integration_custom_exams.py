"""Disposable local PostgreSQL: verify custom exam grading and report isolation."""
from uuid import uuid4
from urllib.request import Request,urlopen
from integration_learning_journey import BASE,expect,call
from integration_learning_tracks import sql

ROOT="/api/users/custom-exams"

def verify_custom_exams(admin, learner, other, stage):
    expect("GET",ROOT+"/availability",401)
    assert expect("GET",ROOT+"/availability",200,token=other)["Enabled"]
    expect("GET",ROOT+"/setup",403,token=admin)
    # Reuse five verified certificate fixture problems, never production IDs.
    category=int(sql(f"""SELECT "Id" FROM "Categories" WHERE "StageId"={stage} AND "NameEn"='Certificate fixture'"""))
    skill=int(sql("""SELECT "Id" FROM "CurriculumSkills" WHERE "StableKey"='ci-cert-skill'"""))
    ids=[int(v) for v in sql(f'SELECT "Id" FROM "Problems" WHERE "CategoryId"={category} ORDER BY "Id"').splitlines()]
    assert len(ids)==5
    tracks=expect("GET","/api/admin/learning-tracks",200,token=admin)["Items"]
    t=next(x["Track"] for x in tracks if x["Track"]["StageId"]==stage and not x["Track"]["IsPublished"])
    tid=t["Id"];root=f"/api/admin/learning-tracks/{tid}"
    mapped=expect("PUT",root+"/mapping",200,{"Revision":t["Revision"],"CategoryIds":[category],"SkillIds":[skill],"ProblemIds":ids},admin)
    expect("PUT",root+"/publication",200,{"Revision":mapped["Revision"],"Publish":True},admin)
    expect("PUT","/api/users/learning-track",200,{"TrackId":tid},other)
    setup=expect("GET",ROOT+"/setup",200,token=other)
    assert setup["Track"]["Id"]==tid and setup["Categories"][0]["Count"]==5
    assert setup["PassPercent"]==70
    # Test a free student, temporarily changing only the disposable fixture.
    uid=int(sql("""SELECT "Id" FROM "Users" WHERE "CurrentTrackId"="""+str(tid)))
    sql(f"""UPDATE "Users" SET "SubscriptionType"='Free',"PremiumExpiresAtUtc"=NULL WHERE "Id"={uid}""")
    expect("GET",ROOT+"/setup",403,token=other)
    expect("POST",ROOT+"/start",403,{"RequestId":str(uuid4()),"Count":5},other)
    expect("GET","/api/users/current-grade-report",403,token=other)
    sql(f"""UPDATE "Users" SET "SubscriptionType"='Premium',"PremiumExpiresAtUtc"=NULL WHERE "Id"={uid}""")
    baseline=expect("GET","/api/users/current-grade-report",200,token=other)
    assert baseline["TrackId"]==tid and baseline["ProblemsCount"]==5
    assert baseline["Solved"]==0 and baseline["Attempts"]==0,baseline
    start={"RequestId":str(uuid4()),"CategoryId":category,"Count":5}
    expect("POST",ROOT+"/start",409,dict(start,Count=10),other)
    first=expect("POST",ROOT+"/start",200,start,other)
    assert first["Answered"]==0 and first.get("Score") is None and first.get("Review") is None
    eid=first["Id"];path=ROOT+"/"+eid
    assert expect("POST",ROOT+"/start",200,start,other)["Id"]==eid
    expect("POST",ROOT+"/start",409,dict(start,RequestId=str(uuid4())),other)
    expect("GET",path,404,token=learner)
    expect("POST",path+"/finish",409,token=other)
    seen=set()
    for pos in range(5):
        current=expect("GET",path,200,token=other)
        q=current["CurrentQuestion"]
        assert q["Id"] not in seen
        seen.add(q["Id"])
        assert all("IsCorrect" not in o for o in q["Options"])
        assert "DetailedSolutionAr" not in q and current.get("Score") is None and current.get("Review") is None
        real=expect("GET",f"/api/problems/{q['Id']}",200,token=admin)
        correct=next(o["Id"] for o in real["Options"] if o["IsCorrect"])
        wrong=next(o["Id"] for o in real["Options"] if not o["IsCorrect"])
        answer={"Position":pos,"OptionId":wrong if pos==0 else correct}
        if pos==0:
            expect("POST",path+"/answer",400,dict(answer,Position=1),other)
            expect("POST",path+"/answer",404,answer,learner)
        result=expect("POST",path+"/answer",200,answer,other)
        assert result["Answered"]==pos+1 and result.get("Score") is None
        assert expect("POST",path+"/answer",200,answer,other)["Answered"]==pos+1
        expect("POST",path+"/answer",409,dict(answer,OptionId=correct if pos==0 else wrong),other)
    result=expect("POST",path+"/finish",200,token=other)
    assert result["Score"]==4 and result["Passed"] and result["CertificateIssued"]
    assert len(result["Review"])==5
    assert expect("POST",path+"/finish",200,token=other)==result
    expect("GET",path+"/certificate",404,token=learner)
    code=sql(f"""SELECT "VerificationCode" FROM "CustomExams" WHERE "Id"='{eid}'""")
    public=expect("GET","/api/exam-certificates/verify/"+code,200)
    assert public["Valid"] and public["Score"]==4 and "StudentName" not in public
    for lang in ("ar","en"):
        with urlopen(Request(BASE+path+"/certificate?lang="+lang,headers={"Authorization":"Bearer "+other}),timeout=45) as r:
            assert r.headers.get_content_type()=="application/pdf" and r.read(5)==b"%PDF-"
    after=expect("GET","/api/users/current-grade-report",200,token=other)
    assert after==baseline,"Exams must not alter practice reports or rewards"
    failed=expect("POST",ROOT+"/start",200,dict(start,RequestId=str(uuid4())),other)
    fpath=ROOT+"/"+failed["Id"]
    for pos in range(5):
        q=expect("GET",fpath,200,token=other)["CurrentQuestion"]
        real=expect("GET",f"/api/problems/{q['Id']}",200,token=admin)
        wrong=next(o["Id"] for o in real["Options"] if not o["IsCorrect"])
        expect("POST",fpath+"/answer",200,{"Position":pos,"OptionId":wrong},other)
    failed=expect("POST",fpath+"/finish",200,token=other)
    assert failed["Score"]==0 and not failed["Passed"] and not failed["CertificateIssued"]
    expect("GET",fpath+"/certificate",404,token=other)
    sql(f"""UPDATE "Users" SET "SubscriptionType"='Free',"PremiumExpiresAtUtc"=NULL WHERE "Id"={uid}""")
    assert expect("GET",path,200,token=other)["CertificateIssued"]
    with urlopen(Request(BASE+path+"/certificate?lang=en",headers={"Authorization":"Bearer "+other}),timeout=45) as r:
        assert r.read(5)==b"%PDF-"
    print("PASS: Premium exam lifecycle, private correct answers, replay, fail/pass, bilingual PDF, scope and reward isolation, expired Premium certificate")
