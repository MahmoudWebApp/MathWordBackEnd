"""Wizard lifecycle, ownership and publication; disposable CI DB only."""
from integration_problem_history import expect
from integration_password_recovery import sql
def verify_wizard(admin,supervisor,sid):
    root="/api/editorial/problems"
    # The private fixed package must not be exposed to anonymous users or supervisors.
    catalog=expect("GET",root+"/reviewed-bank",200,token=admin)
    expect("GET",root+"/reviewed-bank",401)
    expect("GET",root+"/reviewed-bank",403,token=supervisor)
    assert catalog["HeldCount"]==45
    assert len(catalog["Batches"])==18
    counts={}
    ids=set()
    keys=set()
    before=sql('SELECT COUNT(*) FROM "CurriculumDraftItems"')
    for b in catalog["Batches"]:
        path=f"{root}/reviewed-bank/{b['Kind']}/{b['Number']}"
        batch=expect("GET",path,200,token=admin)
        assert len(batch["Items"])==b["Count"]<=50
        counts[b["Kind"]]=counts.get(b["Kind"],0)+b["Count"]
        for row in batch["Items"]:
            if b["Kind"] in ("hints","amendments"):
                assert row["ProblemId"] not in ids
                ids.add(row["ProblemId"])
                assert not row.get("TaxonomyReviewPending")
            else:
                assert row["ContentKey"] not in keys
                keys.add(row["ContentKey"])
    assert counts=={"amendments":728,"new-existing":51,"new-missing":8}
    assert len(ids)==728 and len(keys)==59
    assert sql('SELECT COUNT(*) FROM "CurriculumDraftItems"')==before
    expect("GET",root+"/reviewed-bank/amendments/1",403,token=supervisor)
    expect("GET",root+"/reviewed-bank/amendments/1",401)
    expect("GET",root+"/reviewed-bank/hints/999",404,token=admin)
    wording=expect("GET",root+"/held-wording",200,token=admin)
    assert len(wording["Items"])==37 and all(x["ProblemId"] not in ids for x in wording["Items"])
    assert {7,10,177} <= {x["ProblemId"] for x in wording["Items"]}
    assert not {20,649,768,1578}&{x["ProblemId"] for x in wording["Items"]}
    expect("GET",root+"/held-wording",401)
    expect("GET",root+"/held-wording",403,token=supervisor)
    expect("POST",root+"/held-wording/import",403,{"ProblemIds":[153]},supervisor)
    expect("POST",root+"/held-wording/import",400,{"ProblemIds":[20],"Confirm":True},admin)
    expect("POST",root+"/held-wording/import",400,{"ProblemIds":[153,153],"Confirm":True},admin)
    assert sql('SELECT COUNT(*) FROM "CurriculumDraftItems"')==before
    print("PASS: private embedded reviewed catalog, no writes, exact candidate counts; held wording inventory guarded")
    verify_held_wording(admin,wording)
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
    review_queue=expect("GET",root+"?activeOnly=true&supervisorReviewOnly=true",200,token=admin)
    assert any(row["Id"]==did for row in review_queue["Items"])
    assert all(row["Status"] in ("PendingReview","Approved") and row["OwnerUserId"]!=None for row in review_queue["Items"])
    expect("GET",root+"?supervisorReviewOnly=true",403,token=supervisor)
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
    bank=expect("GET",f"{root}/bank?stageId={stage}&categoryId={category}&trackId={track}&search={pid}&status=clear",200,token=admin)
    assert any(row["Id"]==pid for row in bank["Items"])
    assert all(row["StageId"]==stage and row["CategoryId"]==category for row in bank["Items"])
    expect("GET",root+"/bank?status=invalid",400,token=admin)
    queue=expect("GET",root+"?activeOnly=true",200,token=admin)
    assert all(row["Status"] in ("Draft","NeedsChanges","PendingReview","Approved") for row in queue["Items"])
    assert all(row["Id"]!=did for row in queue["Items"])
    assert all(row["Id"]!=did for row in expect("GET",root+"?supervisorReviewOnly=true",200,token=admin)["Items"])
    assert int(queue["Total"])==int(sql("""SELECT COUNT(*) FROM "CurriculumDraftItems" WHERE "WizardJson" IS NOT NULL AND "EditorialStatus" IN ('Draft','NeedsChanges','PendingReview','Approved')"""))
    own_queue=expect("GET",root+"?activeOnly=true",200,token=supervisor)
    assert all(row["OwnerUserId"]==sid and row["Status"]!="Published" for row in own_queue["Items"])
    assert published["Status"]=="Published" and sql(f'SELECT COUNT(*) FROM "LearningTrackProblems" WHERE "ProblemId"={pid}')=="1"
    assert sql(f'SELECT COUNT(*) FROM "CurriculumProblemSkills" WHERE "ProblemId"={pid} AND "IsPrimary"')=="1"
    expect("POST",path+"/publish",409,{"Revision":7,"Confirm":True},admin)
    assert int(sql('SELECT COUNT(*) FROM "Problems"'))==int(count)+1
    assert sql(f"""SELECT COUNT(*) FROM "PlatformActivityEvents" WHERE "Resource"='EditorialProblem' AND "ResourceId"='{did}'""")=="8"
    expect("DELETE",f"/api/admin/problems/{pid}",409,token=admin)
    verify_solve(admin,pid,stage,category)
    verify_amendment(admin,supervisor,pid)
    verify_import(admin,supervisor,p,track)
    verify_amendment_import(admin,supervisor,p,track,skill,category)
    verify_hint_only_import(admin,supervisor,p,skill,category)
    from integration_editorial_gap_wave import verify_gap_wave
    verify_gap_wave(admin)
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

def verify_amendment(admin,supervisor,pid):
    root="/api/editorial/problems"
    before=sql(f'SELECT string_agg("Id"::text,\',\' ORDER BY "Id") FROM "QuestionOptions" WHERE "ProblemId"={pid}')
    attempts=sql(f'SELECT COUNT(*) FROM "ProblemAttempts" WHERE "ProblemId"={pid}')
    count=sql('SELECT COUNT(*) FROM "Problems"')
    d=expect("POST",f"{root}/amend/{pid}",201,{},supervisor)
    assert d["SourceProblemId"]==pid and d["Content"]["Solution"]["FormulaLatex"]=="a+b"
    expect("POST",f"{root}/amend/{pid}",409,{},admin)
    path=f"{root}/{d['Id']}"
    p=d["Content"]
    old=p["Question"]["En"];p["Question"]["En"]="Changed question"
    expect("PUT",path,200,{"Revision":0,"Content":p},supervisor)
    expect("POST",path+"/submit",400,{"Revision":1},supervisor)
    p["Question"]["En"]=old;p["Solution"]["Verification"]["En"]="Subtract 9 from 22 to verify 13."
    expect("PUT",path,200,{"Revision":1,"Content":p},supervisor)
    expect("POST",path+"/submit",200,{"Revision":2},supervisor)
    expect("POST",path+"/review",200,{"Revision":3,"Confirm":True,"Note":"Reviewed explanation"},admin)
    result=expect("POST",path+"/publish",200,{"Revision":4,"Confirm":True},admin)
    assert result["PublishedProblemId"]==pid and result["Status"]=="Published"
    assert sql('SELECT COUNT(*) FROM "Problems"')==count
    assert sql(f'SELECT string_agg("Id"::text,\',\' ORDER BY "Id") FROM "QuestionOptions" WHERE "ProblemId"={pid}')==before
    assert sql(f'SELECT COUNT(*) FROM "ProblemAttempts" WHERE "ProblemId"={pid}')==attempts
    print("PASS: reviewed amendment keeps problem and option IDs, attempt history and count")

def verify_import(admin,supervisor,p,track):
    import copy
    root="/api/editorial/problems/import"
    new=copy.deepcopy(p)
    new["Question"]={"Ar":"ما ناتج 12 + 10 في اختبار استيراد المسودة؟","En":"What is 12 + 10 in the draft import fixture?"}
    code=sql(f'SELECT "Code" FROM "LearningTracks" WHERE "Id"={track}')
    row={"ContentKey":"ci-wizard-import-one","PrimarySkillKey":"ci-wizard-skill","ProposedTrackCodes":[code],"Content":new}
    before=sql('SELECT COUNT(*) FROM "Problems"')
    expect("POST",root,403,{"Items":[row],"Confirm":False},supervisor)
    preview=expect("POST",root,200,{"Items":[row],"Confirm":False},admin)
    assert preview["Created"]==0 and preview["Ready"]==1
    assert sql("""SELECT COUNT(*) FROM "CurriculumDraftItems" WHERE "ContentKey"='ci-wizard-import-one'""")=="0"
    saved=expect("POST",root,200,{"Items":[row],"Confirm":True},admin)
    assert saved["Created"]==1
    assert expect("POST",root,200,{"Items":[row],"Confirm":True},admin)["Created"]==0
    did=saved["DraftIds"][0]
    d=expect("GET",f"/api/editorial/problems/{did}",200,token=admin)
    assert d["Status"]=="Draft" and d["Content"]["TrackIds"]==[track]
    withdrawn=expect("POST",f"/api/editorial/problems/{did}/withdraw",200,{"Revision":0,"Note":"Test withdrawal"},admin)
    assert withdrawn["Status"]=="Withdrawn" and sql('SELECT COUNT(*) FROM "Problems"')==before
    # Direct publish uses the same validation, revision and audit protections.
    row["ContentKey"]="ci-wizard-direct-publish"
    row["Content"]["Question"]={"Ar":"احسب 11 + 11 في اختبار النشر المباشر","En":"What is 11 + 11 in the direct publication fixture?"}
    saved=expect("POST",root,200,{"Items":[row],"Confirm":True},admin)
    did=saved["DraftIds"][0]
    path=f"/api/editorial/problems/{did}/publish"
    expect("POST",path,403,{"Revision":0,"Confirm":True,"DirectApproval":True,"Note":"Reviewed"},supervisor)
    expect("POST",path,409,{"Revision":0,"Confirm":True},admin)
    expect("POST",path,400,{"Revision":0,"Confirm":True,"DirectApproval":True},admin)
    assert sql(f'SELECT "EditorialStatus" FROM "CurriculumDraftItems" WHERE "Id"={did}')=="Draft"
    published=expect("POST",path,200,{"Revision":0,"Confirm":True,"DirectApproval":True,"Note":"Reviewed direct publication"},admin)
    assert published["Status"]=="Published" and published["Revision"]==3
    assert int(sql('SELECT COUNT(*) FROM "Problems"'))==int(before)+1
    expect("POST",path,409,{"Revision":0,"Confirm":True,"DirectApproval":True,"Note":"Reviewed"},admin)
    assert int(sql('SELECT COUNT(*) FROM "Problems"'))==int(before)+1
    print("PASS: Admin-only preview/confirm import, stable-key resolution, idempotent draft creation and withdrawal")

def verify_amendment_import(admin,supervisor,p,track,skill,category):
    import copy
    root="/api/editorial/problems/amend/import"
    q=copy.deepcopy(p)
    q["Title"]={"Ar":"اختبار استيراد تعديل","En":"Amendment import fixture"}
    q["Question"]={"Ar":"احسب 14+8 في اختبار التعديل","En":"Calculate 14+8 in the amendment import fixture"}
    old_ar="نجمع 14 و8 فنحصل على 22."
    old_en="Add 14 and 8 to obtain 22."
    problem=expect("POST","/api/admin/problems",201,{
        "TitleAr":q["Title"]["Ar"],"TitleEn":q["Title"]["En"],
        "QuestionTextAr":q["Question"]["Ar"],"QuestionTextEn":q["Question"]["En"],
        "DetailedSolutionAr":old_ar,"DetailedSolutionEn":old_en,
        "StageId":q["StageId"],"CategoryId":category,"Points":q["Points"],
        "Options":[{"LatexCode":o["LatexCode"],"IsCorrect":o["IsCorrect"],"Order":i+1} for i,o in enumerate(q["Options"])]},admin)
    pid=problem["Id"]
    # Legacy create derives titles from question text, not the input Title.
    # Import deliberately checks the actual persisted source title.
    import json
    q["Title"]=json.loads(sql(f"""SELECT json_build_object('Ar',"TitleAr",'En',"TitleEn") FROM "Problems" WHERE "Id"={pid}"""))
    q["Solution"]["Steps"]=[{"Ar":"اجمع 14 و8","En":"Add 14 and 8"}]
    q["Solution"]["Substitution"]={"Ar":"14 + 8","En":"14 + 8"}
    q["Solution"]["Verification"]={"Ar":"22 - 8 = 14","En":"22 - 8 = 14"}
    sql(f'INSERT INTO "CurriculumProblemSkills" ("ProblemId","SkillId","IsPrimary") VALUES ({pid},{skill},true)')
    option_ids=[int(i) for i in sql(f'SELECT "Id" FROM "QuestionOptions" WHERE "ProblemId"={pid} ORDER BY "Order","Id"').splitlines()]
    row={"ProblemId":pid,"ExpectedOptionIds":option_ids,"ExpectedLegacySolution":{"Ar":old_ar,"En":old_en},
         "PrimarySkillKey":"ci-wizard-skill","Content":q,"Status":"StructuredAmendmentCandidateNotImported"}
    before=sql('SELECT COUNT(*) FROM "Problems"')
    expect("POST",root,403,{"Items":[row]},supervisor)
    bad=copy.deepcopy(row);bad["ExpectedOptionIds"].reverse()
    expect("POST",root,400,{"Items":[bad],"Confirm":True},admin)
    bad=copy.deepcopy(row);bad["Status"]="HeldStructuredCandidateNotImportable"
    expect("POST",root,400,{"Items":[bad],"Confirm":True},admin)
    preview=expect("POST",root,200,{"Items":[row]},admin)
    assert preview["Created"]==0 and preview["Ready"]==1
    assert sql(f'SELECT COUNT(*) FROM "CurriculumDraftItems" WHERE "SourceProblemId"={pid}')=="0"
    saved=expect("POST",root,200,{"Items":[row],"Confirm":True},admin)
    assert saved["Created"]==1
    did=saved["DraftIds"][0]
    assert expect("POST",root,200,{"Items":[row],"Confirm":True},admin)["Created"]==0
    d=expect("GET",f"/api/editorial/problems/{did}",200,token=admin)
    assert d["Content"]["TrackIds"]==[] and d["Content"]["PrimarySkillId"]==skill
    expect("POST",f"/api/editorial/problems/{did}/submit",400,{"Revision":0},admin)
    assert sql('SELECT COUNT(*) FROM "Problems"')==before
    assert sql(f'SELECT "DetailedSolutionEn" FROM "Problems" WHERE "Id"={pid}')==old_en
    print("PASS: guarded batch amendment preview/confirm, held rejection, no track override, idempotency, no live changes")


def verify_hint_only_import(admin,supervisor,p,skill,category):
    import copy
    root="/api/editorial/problems/hints/import"
    q=copy.deepcopy(p)
    q["Question"]={"Ar":"احسب 15+7 في اختبار التلميحات","En":"Calculate 15+7 in the hint-only fixture"}
    old_ar="نجمع 15 و7 فنحصل على 22."
    old_en="Add 15 and 7 to obtain 22."
    problem=expect("POST","/api/admin/problems",201,{
        "QuestionTextAr":q["Question"]["Ar"],"QuestionTextEn":q["Question"]["En"],
        "DetailedSolutionAr":old_ar,"DetailedSolutionEn":old_en,
        "StageId":q["StageId"],"CategoryId":category,"Points":q["Points"],
        "Options":[{"LatexCode":o["LatexCode"],"IsCorrect":o["IsCorrect"],"Order":i+1} for i,o in enumerate(q["Options"])]},admin)
    pid=problem["Id"]
    sql(f'INSERT INTO "CurriculumProblemSkills" ("ProblemId","SkillId","IsPrimary") VALUES ({pid},{skill},true)')
    options=sql(f'SELECT string_agg("Id"::text,\',\' ORDER BY "Id") FROM "QuestionOptions" WHERE "ProblemId"={pid}')
    row={"ProblemId":pid,"PrimarySkillKey":"ci-wizard-skill","Question":q["Question"],"Hints":q["Hints"]}
    expect("POST",root,403,{"Items":[row]},supervisor)
    bad=copy.deepcopy(row);bad["TaxonomyReviewPending"]=True
    expect("POST",root,400,{"Items":[bad]},admin)
    bad=copy.deepcopy(row);bad["Question"]["En"]="Stale question"
    expect("POST",root,400,{"Items":[bad]},admin)
    bad=copy.deepcopy(row);bad["Hints"][1]=bad["Hints"][0]
    expect("POST",root,400,{"Items":[bad]},admin)
    preview=expect("POST",root,200,{"Items":[row]},admin)
    assert preview["Applied"]==0 and preview["Ready"]==1
    assert sql(f'SELECT COUNT(*) FROM "Problems" WHERE "Id"={pid} AND "EditorialDetailsJson" IS NULL')=="1"
    payload={"Items":[row],"Confirm":True,"ReviewNote":"Reviewed hint-only content","PreviewToken":preview["PreviewToken"]}
    bad=copy.deepcopy(payload);bad["Items"][0]["Hints"][1]["En"]="Changed after preview"
    expect("POST",root,409,bad,admin)
    expect("POST",root,400,{"Items":[row],"Confirm":True},admin)
    assert expect("POST",root,200,payload,admin)["Applied"]==1
    assert sql(f'SELECT "DetailedSolutionEn" FROM "Problems" WHERE "Id"={pid}')==old_en
    assert sql(f'SELECT "DetailedSolutionAr" FROM "Problems" WHERE "Id"={pid}')==old_ar
    assert sql(f'SELECT string_agg("Id"::text,\',\' ORDER BY "Id") FROM "QuestionOptions" WHERE "ProblemId"={pid}')==options
    assert sql(f'SELECT COUNT(*) FROM "CurriculumDraftItems" WHERE "SourceProblemId"={pid}')=="0"
    retry=expect("POST",root,200,{"Items":[row]},admin)
    assert retry["Ready"]==0 and retry["Items"][0]["Status"]=="AlreadyExists"
    bad=copy.deepcopy(row);bad["Hints"][1]["En"]="Replace existing hints"
    expect("POST",root,400,{"Items":[bad]},admin)
    d=expect("POST",f"/api/editorial/problems/amend/{pid}",201,{},supervisor)
    assert d["Content"]["Hints"]==q["Hints"] and d["Content"].get("Solution") is None
    print("PASS: reviewed hint-only publication preserves legacy solution and options, rejects held/stale rows, requires exact preview, permits full amendment")

def verify_held_wording(admin, package):
    """Exact fixed source fixture in the disposable integration database only."""
    import json
    from integration_learning_tracks import literal, fixture_sql
    from integration_problem_history import BASE
    assert BASE.startswith(("http://127.0.0.1:","http://localhost:"))
    row=next(r for r in package["Items"] if r["ProblemId"]==153)
    p=row["Content"];pid=row["ProblemId"];skill=p["PrimarySkillId"];category=p["CategoryId"];stage=p["StageId"]
    track=int(sql(f"""SELECT "Id" FROM "LearningTracks" WHERE "StageId"={stage} AND "Code"={literal(row["ProposedTrackCode"])} AND NOT "IsPublished" """))
    rev=int(sql(f'SELECT "Revision" FROM "LearningTracks" WHERE "Id"={track}'))
    assert sql(f'SELECT COUNT(*) FROM "Problems" WHERE "Id"={pid}')=="0"
    assert sql(f'SELECT COUNT(*) FROM "QuestionOptions" WHERE "Id" IN ({",".join(map(str,row["ExpectedOptionIds"]))})')=="0"
    add_category=sql(f'SELECT COUNT(*) FROM "Categories" WHERE "Id"={category}')=="0"
    add_skill=sql(f'SELECT COUNT(*) FROM "CurriculumSkills" WHERE "Id"={skill}')=="0"
    domain=None
    if add_category:
        sql(f"""INSERT INTO "Categories" ("Id","StageId","NameAr","NameEn","Icon","Order","DescriptionAr","DescriptionEn") VALUES ({category},{stage},'اختبار صياغة','Wording fixture','test',100,'','')""")
    if add_skill:
        domain=int(sql("""INSERT INTO "CurriculumDomains" ("StableKey","NameAr","NameEn","IsPublished") VALUES ('ci-held-wording','اختبار صياغة','Wording fixture',true) RETURNING "Id" """).splitlines()[0])
        sql(f"""INSERT INTO "CurriculumSkills" ("Id","StableKey","DomainId","StageId","CategoryId","NameAr","NameEn","IsPublished") VALUES ({skill},{literal(row["PrimarySkillKey"])},{domain},{stage},{category},'اختبار صياغة','Wording fixture',true)""")
    else:
        assert sql(f"""SELECT "StableKey" FROM "CurriculumSkills" WHERE "Id"={skill} AND "CategoryId"={category} AND "StageId"={stage}""")==row["PrimarySkillKey"]
    had_category=sql(f'SELECT COUNT(*) FROM "LearningTrackCategories" WHERE "TrackId"={track} AND "CategoryId"={category}')=="1"
    had_skill=sql(f'SELECT COUNT(*) FROM "LearningTrackSkills" WHERE "TrackId"={track} AND "SkillId"={skill}')=="1"
    original=row["ExpectedLegacySolution"]
    sql(f"""INSERT INTO "Problems" ("Id","StageId","CategoryId","Points","TitleAr","TitleEn","QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn","ViewsCount","SolvedCount","CreatedAt") VALUES ({pid},{stage},{category},{p["Points"]},{literal(p["Title"]["Ar"])},{literal(p["Title"]["En"])},{literal(p["Question"]["Ar"])},{literal(p["Question"]["En"])},{literal(original["Ar"])},{literal(original["En"])},0,0,now())""")
    sql(f'INSERT INTO "CurriculumProblemSkills" ("ProblemId","SkillId","IsPrimary") VALUES ({pid},{skill},true)')
    for order,(oid,o) in enumerate(zip(row["ExpectedOptionIds"],p["Options"]),1):
        sql(f"""INSERT INTO "QuestionOptions" ("Id","ProblemId","LatexCode","IsCorrect","Order") VALUES ({oid},{pid},{literal(o["LatexCode"])},{str(o["IsCorrect"]).lower()},{order})""")
    root="/api/editorial/problems/held-wording/import"
    def question():
        return sql(f'SELECT "QuestionTextEn" FROM "Problems" WHERE "Id"={pid}')
    def options():
        return sql(f"""SELECT string_agg("Id"::text||':'||"LatexCode"||':'||"IsCorrect"::text,',' ORDER BY "Order","Id") FROM "QuestionOptions" WHERE "ProblemId"={pid}""")
    old_options=options()
    uid=int(sql("""SELECT "Id" FROM "Users" WHERE "Role"='Student' ORDER BY "Id" LIMIT 1"""))
    # Session-only reference must also block correction, even without an attempt.
    session='f2c4f7c0-7115-47b4-8f42-0ae050009153'
    request='f2c4f7c0-7115-47b4-8f42-0ae050009154'
    def add_session():
        snapshot=literal(json.dumps([{"Id":q,"Fingerprint":"fixture"} for q in (pid,910001,910002,910003,910004)]))
        sql(f"""INSERT INTO "LearningSessions" ("Id","UserId","StageId","Kind","ScopeKey","StartRequestId","QuestionsJson","Total","Completed","HintsRevealed","CreatedAtUtc","AbandonedAtUtc") VALUES ('{session}',{uid},{stage},'practice','ci-wording-history','{request}',{snapshot},5,0,0,now(),now())""")
    def clear_session():
        sql(f"""DELETE FROM "LearningSessions" WHERE "Id"='{session}'""")
    try:
        assert question()==p["Question"]["En"]
        add_session()
        expect("POST",root,400,{"ProblemIds":[pid]},admin)
        clear_session()
        # Published tracks can receive wording fixes only inside existing scope.
        if not had_category:
            sql(f'UPDATE "LearningTracks" SET "IsPublished"=true WHERE "Id"={track}')
            expect("POST",root,400,{"ProblemIds":[pid]},admin)
            sql(f'INSERT INTO "LearningTrackCategories" ("TrackId","CategoryId") VALUES ({track},{category})')
        if not had_skill:
            sql(f'UPDATE "LearningTracks" SET "IsPublished"=true WHERE "Id"={track}')
            expect("POST",root,400,{"ProblemIds":[pid]},admin)
            sql(f'INSERT INTO "LearningTrackSkills" ("TrackId","SkillId") VALUES ({track},{skill})')
        sql(f'UPDATE "LearningTracks" SET "IsPublished"=true WHERE "Id"={track}')
        preview=expect("POST",root,200,{"ProblemIds":[pid]},admin)
        assert preview["Ready"]==1 and preview["Created"]==0
        assert question()==p["Question"]["En"] and options()==old_options
        saved=expect("POST",root,200,{"ProblemIds":[pid],"Confirm":True},admin)
        did=saved["DraftIds"][0]
        assert saved["Created"]==1 and expect("POST",root,200,{"ProblemIds":[pid],"Confirm":True},admin)["Created"]==0
        dpath=f"/api/editorial/problems/{did}"
        draft=expect("GET",dpath,200,token=admin)
        assert draft["Content"]["Question"]==row["ProposedQuestion"]
        assert question()==p["Question"]["En"] and options()==old_options
        expect("POST",dpath+"/submit",200,{"Revision":0},admin)
        expect("POST",dpath+"/review",200,{"Revision":1,"Confirm":True,"Note":"CI reviewed exact wording"},admin)
        # A session created AFTER approval blocks publication and leaves the
        # exact source and approved draft intact.
        add_session()
        expect("POST",dpath+"/publish",409,{"Revision":2,"Confirm":True},admin)
        assert question()==p["Question"]["En"] and options()==old_options
        assert expect("GET",dpath,200,token=admin)["Status"]=="Approved"
        clear_session()
        published=expect("POST",dpath+"/publish",200,{"Revision":2,"Confirm":True},admin)
        assert published["PublishedProblemId"]==pid and question()==row["ProposedQuestion"]["En"] and options()==old_options
        assert sql(f'SELECT COUNT(*) FROM "Problems" WHERE "Id"={pid} AND "EditorialDetailsJson" IS NOT NULL')=="1"
        assert sql(f'SELECT COUNT(*) FROM "LearningTrackProblems" WHERE "TrackId"={track} AND "ProblemId"={pid}')=="1"
        assert sql(f'SELECT COUNT(*) FROM "LearningTracks" WHERE "Id"={track} AND "IsPublished"')=="1"
        expect("POST",dpath+"/publish",409,{"Revision":3,"Confirm":True},admin)
        print("PASS: held wording exact-source preview, draft/review, new session history blocks publication, unchanged option identities and published track scope")
    finally:
        clear_session()
        fixture_sql(f"""BEGIN;
DELETE FROM "CurriculumDraftItems" WHERE "ContentKey"='g1-wording-{pid}';
DELETE FROM "LearningTrackProblems" WHERE "TrackId"={track} AND "ProblemId"={pid};
""" + (f'DELETE FROM "LearningTrackSkills" WHERE "TrackId"={track} AND "SkillId"={skill};\n' if not had_skill else "") + (f'DELETE FROM "LearningTrackCategories" WHERE "TrackId"={track} AND "CategoryId"={category};\n' if not had_category else "") + f"""
UPDATE "LearningTracks" SET "Revision"={rev},"IsPublished"=false WHERE "Id"={track};
DELETE FROM "Problems" WHERE "Id"={pid};
""" + (f'DELETE FROM "CurriculumSkills" WHERE "Id"={skill};\nDELETE FROM "CurriculumDomains" WHERE "Id"={domain};\n' if add_skill else "") + (f'DELETE FROM "Categories" WHERE "Id"={category};\n' if add_category else "")+"COMMIT;")
