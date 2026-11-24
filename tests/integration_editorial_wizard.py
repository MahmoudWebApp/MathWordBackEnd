"""Wizard lifecycle, ownership and publication; disposable CI DB only."""
from integration_problem_history import expect
from integration_password_recovery import sql
def verify_wizard(admin,supervisor,sid):
    root="/api/editorial/problems"
    stage=1
    inventory=expect("GET",f"{root}/classification/{stage}",200,token=supervisor)
    category=inventory["Categories"][0]["Id"]
    track=inventory["Tracks"][0]["Id"]
    # Explicit reviewed test skill; no assumptions about pre-existing content.
    domain=int(sql("""INSERT INTO "CurriculumDomains" ("StableKey","NameAr","NameEn","DescriptionAr","DescriptionEn","SortOrder","IsPublished") VALUES ('ci-wizard-domain','اختبار','Test','','',0,true) RETURNING "Id" """).splitlines()[0])
    skill=int(sql(f"""INSERT INTO "CurriculumSkills" ("StableKey","DomainId","StageId","CategoryId","NameAr","NameEn","DescriptionAr","DescriptionEn","SortOrder","IsPublished") VALUES ('ci-wizard-skill',{domain},{stage},{category},'جمع','Addition','','',0,true) RETURNING "Id" """).splitlines()[0])
    def pair(ar,en): return {"Ar":ar,"En":en}
    p={"StageId":stage,"CategoryId":category,"PrimarySkillId":skill,"TrackIds":[track],
       "DifficultyLevel":1,"Points":10,"Title":pair("اختبار الجمع","Wizard addition fixture"),
       "Question":pair("ما ناتج 13 + 9 في اختبار المحرر؟","What is 13 + 9 in the editorial fixture?"),
       "Options":[{"LatexCode":str(n),"IsCorrect":n==22,"ErrorType":"addition",
                   "Reason":pair("خطأ في الجمع","Addition error")} for n in (20,21,22,23)],
       "Hints":[pair("استخدم الجمع","Use addition"),pair("اجمع الآحاد أولاً","Add the ones first")],
       "Solution":{"Idea":pair("الجمع","Addition"),"FormulaLatex":"a+b","Steps":[pair("اجمع 13 و9","Add 13 and 9")],
                   "Substitution":pair("13 + 9","13 + 9"),"Result":pair("22","22"),
                   "Unit":pair("بلا وحدة","Unitless"),"Verification":pair("22 - 9 = 13","22 - 9 = 13"),
                   "CommonError":pair("انتبه للحمل","Remember carrying")}}
    count=sql('SELECT COUNT(*) FROM "Problems"')
    other=expect("POST",root,201,{"Revision":0,"Content":{}},admin)
    expect("GET",f"{root}/{other['Id']}",404,token=supervisor)
    expect("PUT",f"{root}/{other['Id']}",404,{"Revision":0,"Content":p},supervisor)
    draft=expect("POST",root,201,{"Revision":0,"Content":{}},supervisor)
    did=draft["Id"];path=f"{root}/{did}"
    assert draft["OwnerUserId"]==sid and draft["Status"]=="Draft"
    expect("POST",path+"/submit",400,{"Revision":0},supervisor)
    saved=expect("PUT",path,200,{"Revision":0,"Content":p},supervisor)
    assert saved["Revision"]==1 and saved["Content"]["TrackIds"]==[track]
    expect("PUT",path,409,{"Revision":0,"Content":p},supervisor)
    expect("POST",path+"/review",403,{"Revision":1,"Confirm":True,"Note":"Reviewed"},supervisor)
    pending=expect("POST",path+"/submit",200,{"Revision":1},supervisor)
    assert pending["Status"]=="PendingReview"
    expect("PUT",path,409,{"Revision":2,"Content":p},supervisor)
    expect("POST",path+"/publish",403,{"Revision":2,"Confirm":True},supervisor)
    returned=expect("POST",path+"/review",200,{"Revision":2,"Confirm":False,"Note":"Check the steps"},admin)
    assert returned["Status"]=="NeedsChanges"
    expect("PUT",path,200,{"Revision":3,"Content":p},supervisor)
    expect("POST",path+"/submit",200,{"Revision":4},supervisor)
    approved=expect("POST",path+"/review",200,{"Revision":5,"Confirm":True,"Note":"Validated mathematical content"},admin)
    assert approved["Status"]=="Approved" and sql('SELECT COUNT(*) FROM "Problems"')==count
    published=expect("POST",path+"/publish",200,{"Revision":6,"Confirm":True},admin)
    pid=published["PublishedProblemId"]
    assert published["Status"]=="Published" and sql(f'SELECT COUNT(*) FROM "LearningTrackProblems" WHERE "ProblemId"={pid}')=="1"
    assert sql(f'SELECT COUNT(*) FROM "CurriculumProblemSkills" WHERE "ProblemId"={pid} AND "IsPrimary"')=="1"
    expect("POST",path+"/publish",409,{"Revision":7,"Confirm":True},admin)
    assert int(sql('SELECT COUNT(*) FROM "Problems"'))==int(count)+1
    assert sql(f"""SELECT COUNT(*) FROM "PlatformActivityEvents" WHERE "Resource"='EditorialProblem' AND "ResourceId"='{did}'""")=="8"
    verify_solve(admin,pid,stage,category)
    print("PASS: partial draft, ownership, revision, review return, approval, exactly-once publication and track/skill linkage")
    return did

def verify_solve(admin,pid,stage,category):
    import time
    from integration_problem_history import api,token_of
    email="wizard-solve-ci@mathworld.test"
    for _ in range(65):
        status,result=api("POST","/api/auth/register",{"FullName":"Wizard learner","Email":email,"Password":"CI_WIZARD_PASSWORD_123456","StageId":stage})
        if status!=429: break
        time.sleep(1)
    assert status==201
    student=token_of(result["Data"]);uid=result["Data"]["Id"]
    root=f"/api/problems/{pid}"
    # Admin grants are not needed for this fixture: mutate disposable DB only.
    sql(f"""UPDATE "Users" SET "SubscriptionType"='Premium',"PremiumExpiresAtUtc"=NULL WHERE "Id"={uid}""")
    detail=expect("GET",root,200,token=student)
    assert detail.get("CorrectOptionId") is None and detail.get("DetailedSolution") is None
    assert detail.get("SolutionStructure") is None
    expect("GET",root+"/solution-preview",403,token=student)
    expect("GET",root+"/premium-solution",403,token=student)
    h=expect("GET",root+"/hints",200,token=student)
    assert h["Available"] and h["Hints"]==[]
    expect("POST",root+"/hints",409,{"Level":2},student)
    one=expect("POST",root+"/hints",200,{"Level":1},student)
    assert one["RevealedCount"]==1 and len(one["Hints"])==1
    expect("POST",root+"/hints",200,{"Level":1},student)
    assert expect("GET",root+"/hints",200,token=student)["RevealedCount"]==1
    two=expect("POST",root+"/hints",200,{"Level":2},student)
    assert two["RevealedCount"]==2 and len(two["Hints"])==2
    expect("POST",root+"/hints",400,{"Level":3},student)
    assert sql(f"""SELECT COUNT(*) FROM "PlatformActivityEvents" WHERE "ActorUserId"={uid} AND "Action" IN ('ProblemHint1','ProblemHint2')""")=="2"
    correct=int(sql(f'SELECT "Id" FROM "QuestionOptions" WHERE "ProblemId"={pid} AND "IsCorrect"'))
    wrong=int(sql(f'SELECT "Id" FROM "QuestionOptions" WHERE "ProblemId"={pid} AND NOT "IsCorrect" LIMIT 1'))
    def answer(option):return {"ProblemId":pid,"SelectedOptionId":option,"TimeSpentSeconds":5}
    bad=expect("POST","/api/problems/submit",200,answer(wrong),student)
    assert not bad["IsCorrect"] and bad["UsedHint"] and bad["CanRetry"]
    assert bad.get("CorrectOptionId") is None and bad.get("DetailedSolution") is None and bad.get("SolutionStructure") is None
    expect("GET",root+"/premium-solution",403,token=student)
    good=expect("POST","/api/problems/submit",200,answer(correct),student)
    assert good["IsCorrect"] and good["UsedHint"] and good["CorrectOptionId"]==correct and good["PointsEarned"]==10
    assert good["SolutionStructure"]["FormulaLatex"]=="a+b"
    expect("GET",root+"/hints",409,token=student)
    assert expect("GET",root+"/premium-solution",200,token=student)["CorrectOptionId"]==correct
    assert expect("GET",root,200,token=student)["SolutionStructure"]["FormulaLatex"]=="a+b"
    expect("POST","/api/users/practice/reset",200,{"StageId":stage,"CategoryId":category},student)
    expect("GET",root+"/premium-solution",403,token=student)
    assert expect("GET",root+"/hints",200,token=student)["RevealedCount"]==0
    again=expect("POST","/api/problems/submit",200,answer(correct),student)
    assert again["PointsEarned"]==0 and not again["UsedHint"]
    sql(f"""UPDATE "Users" SET "SubscriptionType"='Free' WHERE "Id"={uid}""")
    expect("GET",root+"/hints",403,token=student)
    print("PASS: no early answer, ordered/idempotent hints, recorded assistance, correct-only structure, reset hides answers and prevents repeat points")
