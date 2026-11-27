"""Exercise real onboarding gates with all three requirements enabled (local CI only)."""
import time
from integration_learning_journey import call,expect
from integration_learning_tracks import sql

def main():
    for _ in range(90):
        try:
            if call("GET","/health/ready")[0]==200: break
        except Exception: pass
        time.sleep(1)
    else: raise AssertionError("Local API not ready")
    stage=expect("GET","/api/stages",200)[0]["Id"]
    admin=expect("POST","/api/auth/login",200,{"Email":"ci-admin@mathworld.test","Password":"CI_TEST_ADMIN_PASSWORD_12345"})["Token"]
    email="onboarding-perf@mathworld.test"
    learner=expect("POST","/api/auth/register",201,{"FullName":"Onboarding Fixture","Email":email,"Password":"CI_TEST_PASSWORD_2026"})
    uid,token=learner["Id"],learner["Token"]
    route="/api/users/onboarding"
    def state(step,blocked=True):
        actual=expect("GET",route,200,token=token)
        assert actual["NextStep"]==step,actual
        if blocked:
            error=expect("GET","/api/users/journey",403,token=token)
            assert error["NextStep"]==step,error
    state("VerifyEmail")
    sql(f'UPDATE "Users" SET "VerifiedNotificationEmail"="Email" WHERE "Id"={uid}')
    state("SelectStage")
    expect("PUT","/api/users/learning-stage",200,{"StageId":stage},token)
    state("SelectTrack")
    category=int(sql(f'SELECT "Id" FROM "Categories" WHERE "StageId"={stage} ORDER BY "Order","Id" LIMIT 1'))
    domain=int(sql("""INSERT INTO "CurriculumDomains" ("StableKey","NameAr","NameEn","DescriptionAr","DescriptionEn","SortOrder","IsPublished") VALUES ('ci-onboard-domain','اختبار','Test','','',0,true) RETURNING "Id" """).splitlines()[0])
    skill=int(sql(f"""INSERT INTO "CurriculumSkills" ("StableKey","DomainId","StageId","CategoryId","NameAr","NameEn","DescriptionAr","DescriptionEn","SortOrder","IsPublished") VALUES ('ci-onboard-skill',{domain},{stage},{category},'جمع','Addition','','',0,true) RETURNING "Id" """).splitlines()[0])
    problem=expect("POST","/api/admin/problems",201,{"StageId":stage,"CategoryId":category,"Points":5,
      "QuestionTextAr":"اختبار التسجيل: ما ناتج 91 + 2؟","QuestionTextEn":"Onboarding fixture: what is 91 + 2?",
      "DetailedSolutionAr":"نجمع 91 و2 فنحصل على 93.","DetailedSolutionEn":"Add 91 and 2 to obtain 93.",
      "Options":[{"LatexCode":str(v),"IsCorrect":v==93,"Order":n+1} for n,v in enumerate(range(91,95))]},admin)
    pid=problem["Id"]
    sql(f'INSERT INTO "CurriculumProblemSkills" ("ProblemId","SkillId","IsPrimary") VALUES ({pid},{skill},true)')
    items=expect("GET","/api/admin/learning-tracks",200,token=admin)["Items"]
    t=next(x["Track"] for x in items if x["Track"]["StageId"]==stage and not x["Track"]["IsPublished"])
    tid=t["Id"];root=f"/api/admin/learning-tracks/{tid}"
    mapped=expect("PUT",root+"/mapping",200,{"Revision":t["Revision"],"CategoryIds":[category],"SkillIds":[skill],"ProblemIds":[pid]},admin)
    published=expect("PUT",root+"/publication",200,{"Revision":mapped["Revision"],"Publish":True},admin)
    expect("PUT","/api/users/learning-track",200,{"TrackId":tid},token)
    state("Complete",False)
    expect("GET","/api/users/journey",200,token=token)
    # Live catalog invalidation must be effective on the next request.
    sql(f'UPDATE "CurriculumSkills" SET "IsPublished"=false WHERE "Id"={skill}')
    state("SelectTrack")
    sql(f'UPDATE "CurriculumSkills" SET "IsPublished"=true WHERE "Id"={skill}')
    state("Complete",False)
    sql(f'UPDATE "Users" SET "VerifiedNotificationEmail"=NULL WHERE "Id"={uid}')
    state("VerifyEmail")
    print("PASS: onboarding priority, live catalog invalidation and protected journey")

if __name__=="__main__": main()
