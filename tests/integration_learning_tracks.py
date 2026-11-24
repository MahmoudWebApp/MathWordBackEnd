"""Track mapping integration, invoked inside the existing disposable journey suite."""
import os, subprocess
from integration_learning_journey import expect, BASE
def sql(q):
    assert BASE.startswith(("http://127.0.0.1:","http://localhost:"))
    return subprocess.check_output(["psql","-X","-h","127.0.0.1","-U","postgres","-d","mathworld_ci","-v","ON_ERROR_STOP=1","-Atc",q],env={**os.environ,"PGPASSWORD":"ci_only_password"},text=True).strip()
def verify_tracks(admin, student, uid, stage1, stage2):
    root="/api/admin/learning-tracks"
    all_tracks=expect("GET",root,200,token=admin)["Items"]
    assert len(all_tracks)==17 and all(not x["Track"]["IsPublished"] for x in all_tracks)
    assert expect("GET",f"/api/stages/{stage1}/tracks",200)["Items"]==[]
    assert expect("GET","/api/users/learning-track",200,token=student).get("TrackId") is None
    expect("GET",root,403,token=student)
    t=next(x["Track"] for x in all_tracks if x["Track"]["StageId"]==stage1)
    tid=t["Id"]
    expect("PUT",f"{root}/{tid}/publication",409,{"Revision":0,"Publish":True},admin)
    expect("GET",f"/api/learning-tracks/{tid}",404)
    expect("PUT","/api/users/learning-track",404,{"TrackId":tid},student)
    # Test-only explicit content linkage, never a production inference.
    category=expect("GET",f"/api/stages/{stage1}/free-categories",200)["FreeCategoryIds"][0]
    problem=expect("POST","/api/admin/problems",201,{
        "TitleAr":"اختبار الصف","TitleEn":"Grade fixture","QuestionTextAr":"ما نتيجة 1 + 1؟",
        "QuestionTextEn":"What is 1 + 1?","DetailedSolutionAr":"الجمع: 1 + 1 = 2",
        "DetailedSolutionEn":"Addition: 1 + 1 = 2","StageId":stage1,"CategoryId":category,"Points":10,
        "Options":[{"LatexCode":str(i),"IsCorrect":i==2,"Order":i} for i in range(1,5)]},admin)
    pid=problem["Id"]
    domain=int(sql("""INSERT INTO "CurriculumDomains" ("StableKey","NameAr","NameEn","DescriptionAr","DescriptionEn","SortOrder","IsPublished") VALUES ('ci-track-domain','اختبار','Test','','',0,true) RETURNING "Id" """).splitlines()[0])
    skill=int(sql(f"""INSERT INTO "CurriculumSkills" ("StableKey","DomainId","StageId","CategoryId","NameAr","NameEn","DescriptionAr","DescriptionEn","SortOrder","IsPublished") VALUES ('ci-track-skill',{domain},{stage1},{category},'جمع','Addition','','',0,true) RETURNING "Id" """).splitlines()[0])
    sql(f'INSERT INTO "CurriculumProblemSkills" ("ProblemId","SkillId","IsPrimary") VALUES ({pid},{skill},true)')
    wrong=int(sql(f'SELECT "Id" FROM "Categories" WHERE "StageId"={stage2} LIMIT 1'))
    expect("PUT",f"{root}/{tid}/mapping",400,{"Revision":0,"CategoryIds":[wrong],"SkillIds":[skill],"ProblemIds":[pid]},admin)
    mapped=expect("PUT",f"{root}/{tid}/mapping",200,{"Revision":0,"CategoryIds":[category],"SkillIds":[skill],"ProblemIds":[pid]},admin)
    assert mapped["Revision"]==1
    expect("PUT",f"{root}/{tid}/metadata",409,{"Revision":0,"NameAr":"اختبار","NameEn":"Test"},admin)
    expect("PUT",f"{root}/{tid}/metadata",200,{"Revision":1,"NameAr":"الصف التجريبي","NameEn":"Grade fixture","SortOrder":1},admin)
    expect("PUT",f"{root}/{tid}/publication",200,{"Revision":2,"Publish":True},admin)
    assert len(expect("GET",f"/api/stages/{stage1}/tracks",200)["Items"])==1
    detail=expect("GET",f"/api/learning-tracks/{tid}",200)
    assert detail["Categories"][0]["IsFree"] and detail["Categories"][0]["ProblemsCount"]==1
    assert all(set(x)<={"Id","CategoryId","TitleAr","TitleEn"} for x in detail["Examples"])
    expect("PUT","/api/users/learning-track",200,{"TrackId":tid},student)
    assert expect("GET","/api/users/learning-track",200,token=student)["TrackId"]==tid
    assert expect("GET",f"/api/users/learning-tracks/{tid}/progress",200,token=student)["Solved"]==0
    journey=expect("GET",f"/api/users/journey?stageId={stage1}",200,token=student)
    assert journey["TrackId"]==tid and journey["TotalProblems"]==1
    expect("POST","/api/users/practice/reset",409,{"StageId":stage1},student)
    expect("GET","/api/users/learning-tracks/continue",403,token=student)
    practice=f"/api/users/learning-tracks/{tid}/categories/{category}/problems"
    assert expect("GET",practice,200,token=student)["Items"][0]["Id"]==pid
    detail=expect("GET",f"/api/problems/{pid}",200,token=admin)
    option=next(x["Id"] for x in detail["Options"] if x["IsCorrect"])
    expect("POST","/api/problems/submit",200,{"ProblemId":pid,"SelectedOptionId":option,"TimeSpentSeconds":4},student)
    assert expect("GET",practice,200,token=student)["Items"][0]["IsSolved"]
    assert expect("GET",f"/api/users/learning-tracks/{tid}/progress",200,token=student)["Solved"]==1
    assert expect("GET",f"/api/users/journey?stageId={stage1}",200,token=student)["SolvedProblems"]==1
    assert expect("GET","/api/users/dashboard",200,token=student)["SolvedProblemsCount"]==1
    other=next(x["Track"] for x in all_tracks if x["Track"]["StageId"]==stage1 and x["Track"]["Id"]!=tid)
    oid=other["Id"]
    expect("PUT",f"{root}/{oid}/mapping",200,{"Revision":0,"CategoryIds":[category],"SkillIds":[skill],"ProblemIds":[pid]},admin)
    expect("PUT",f"{root}/{oid}/publication",200,{"Revision":1,"Publish":True},admin)
    expect("PUT","/api/users/learning-track",200,{"TrackId":oid},student)
    assert expect("GET",f"/api/users/learning-tracks/{oid}/progress",200,token=student)["Solved"]==1
    assert sql(f'SELECT COUNT(*) FROM "UserProgresses" WHERE "UserId"={uid} AND "ProblemId"={pid}')=="1"
    expect("PUT",f"{root}/{oid}/publication",200,{"Revision":2,"Publish":False},admin)
    expect("PUT","/api/users/learning-track",200,{"TrackId":tid},student)
    expect("PUT","/api/users/learning-stage",200,{"StageId":stage2},student)
    assert expect("GET","/api/users/learning-track",200,token=student).get("TrackId") is None
    expect("PUT","/api/users/learning-track",200,{"TrackId":tid},student)
    expect("PUT",f"{root}/{tid}/mapping",409,{"Revision":3,"CategoryIds":[],"SkillIds":[],"ProblemIds":[]},admin)
    expect("PUT",f"{root}/{tid}/publication",200,{"Revision":3,"Publish":False},admin)
    assert expect("GET",f"/api/stages/{stage1}/tracks",200)["Items"]==[]
    assert expect("GET","/api/users/learning-track",200,token=student).get("TrackId") is None
    # Keep journey suite's original stage and fixture assumptions.
    expect("PUT","/api/users/learning-stage",200,{"StageId":stage2},student)
    expect("PUT","/api/users/learning-stage",200,{"StageId":stage1},student)
    sql(f'DELETE FROM "ProblemAttempts" WHERE "ProblemId"={pid}; DELETE FROM "UserProgresses" WHERE "ProblemId"={pid}; DELETE FROM "Problems" WHERE "Id"={pid}; DELETE FROM "CurriculumSkills" WHERE "Id"={skill}; DELETE FROM "CurriculumDomains" WHERE "Id"={domain}')
    print("PASS: 17 unpublished tracks, validated mapping, no empty public tracks, original stage Free policy, selection and legacy stage switch")
