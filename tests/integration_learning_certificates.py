"""Disposable DB fixture: certificate approval, privacy, replay and preservation."""
from integration_learning_journey import expect,call
from integration_learning_tracks import sql
import json

ROOT="/api/users/certificates"
def verify_certificates(admin,learner,other,stage):
    expect("GET",ROOT,401)
    expect("GET",ROOT,403,token=admin)
    assert expect("GET",ROOT,200,token=learner)["Items"]==[]
    assert expect("GET","/api/users/journey",200,token=other)["CertificatesEnabled"] is True
    category=int(sql(f"""INSERT INTO "Categories" ("StageId","NameAr","NameEn","Icon","Order","DescriptionAr","DescriptionEn") VALUES ({stage},'اختبار الشهادة','Certificate fixture','math',999,'','') RETURNING "Id" """).splitlines()[0])
    domain=int(sql("""INSERT INTO "CurriculumDomains" ("StableKey","NameAr","NameEn","DescriptionAr","DescriptionEn","SortOrder","IsPublished") VALUES ('ci-cert-domain','اختبار','Test','','',0,true) RETURNING "Id" """).splitlines()[0])
    skill=int(sql(f"""INSERT INTO "CurriculumSkills" ("StableKey","DomainId","StageId","CategoryId","NameAr","NameEn","DescriptionAr","DescriptionEn","SortOrder","IsPublished") VALUES ('ci-cert-skill',{domain},{stage},{category},'جمع','Addition','','',0,true) RETURNING "Id" """).splitlines()[0])
    scope={"StageId":stage,"CategoryId":category}
    query=f"{ROOT}/eligibility?stageId={stage}&categoryId={category}"
    expect("POST",ROOT+"/issue",409,scope,other)
    for n in range(70,75):
        problem=expect("POST","/api/admin/problems",201,{"StageId":stage,"CategoryId":category,"Points":5,
            "QuestionTextAr":f"اختبار شهادة: ما نتيجة {n} + 1؟","QuestionTextEn":f"Certificate fixture: what is {n} + 1?",
            "DetailedSolutionAr":f"الجمع: {n}+1={n+1}","DetailedSolutionEn":f"Addition: {n}+1={n+1}",
            "Options":[{"LatexCode":str(v),"IsCorrect":v==n+1,"Order":i} for i,v in enumerate(range(n,n+4),1)]},admin)
        pid=problem["Id"]
        sql(f'INSERT INTO "CurriculumProblemSkills" ("ProblemId","SkillId","IsPrimary") VALUES ({pid},{skill},true)')
        detail=expect("GET",f"/api/problems/{pid}",200,token=admin)
        correct=next(o["Id"] for o in detail["Options"] if o["IsCorrect"])
        expect("POST","/api/problems/submit",200,{"ProblemId":pid,"SelectedOptionId":correct,"TimeSpentSeconds":3},other)
    eligibility=expect("GET",query,200,token=other)
    assert eligibility["Eligible"] and eligibility["SolvedProblems"]==5 and eligibility["IndependentSkills"]==1,eligibility
    issued=expect("POST",ROOT+"/issue",200,scope,other)
    assert issued["Kind"]=="category" and issued["TotalProblems"]==5 and len(issued["VerificationCode"])==32
    assert expect("POST",ROOT+"/issue",200,scope,other)==issued
    assert expect("GET",ROOT,200,token=other)["Items"]==[issued]
    verify="/api/certificates/verify/"+issued["VerificationCode"]
    public=expect("GET",verify,200)
    assert public["Valid"] and "StudentName" not in public and "UserId" not in public and "Id" not in public
    expect("GET","/api/certificates/verify/"+"0"*32,404)
    expect("GET",ROOT+"/"+issued["Id"]+"/pdf?lang=en",404,token=learner)
    # Download binary with urllib rather than JSON helper.
    from integration_learning_journey import BASE
    from urllib.request import Request,urlopen
    for lang in ("ar","en"):
        with urlopen(Request(BASE+ROOT+"/"+issued["Id"]+"/pdf?lang="+lang,headers={"Authorization":"Bearer "+other}),timeout=45) as response:
            assert response.headers.get_content_type()=="application/pdf"
            assert response.read(5)==b"%PDF-"
    expect("POST","/api/users/practice/reset",200,scope,other)
    expect("PUT","/api/users/learning-stage",200,{"StageId":1},other)
    assert expect("GET",ROOT,200,token=other)["Items"]==[issued]
    assert expect("GET",verify,200)==public
    print("PASS: certificate eligibility, duplicate protection, owner-only bilingual PDF and minimal public verification; reset/stage persistence")
