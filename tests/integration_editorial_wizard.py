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
    print("PASS: partial draft, ownership, revision, review return, approval, exactly-once publication and track/skill linkage")
    return did
