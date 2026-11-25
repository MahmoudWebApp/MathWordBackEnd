"""Track mapping integration, invoked inside the existing disposable journey suite."""
import os, subprocess, io, zipfile, urllib.request, json
from pathlib import Path
from integration_learning_journey import expect, BASE
def sql(q):
    assert BASE.startswith(("http://127.0.0.1:","http://localhost:"))
    return subprocess.check_output(["psql","-X","-h","127.0.0.1","-U","postgres","-d","mathworld_ci","-v","ON_ERROR_STOP=1","-Atc",q],env={**os.environ,"PGPASSWORD":"ci_only_password"},text=True).strip()
def fixture_sql(q):
    # Large bilingual fixture data exceeds the OS limit for a single argv entry.
    # Always use the same disposable local DB as sql(), never a deployment URL.
    assert BASE.startswith(("http://127.0.0.1:","http://localhost:"))
    subprocess.run(["psql","-X","-h","127.0.0.1","-U","postgres","-d","mathworld_ci","-v","ON_ERROR_STOP=1"],
        input=q,text=True,check=True,env={**os.environ,"PGPASSWORD":"ci_only_password"},stdout=subprocess.DEVNULL)

def literal(value):
    return "'" + value.replace("'", "''") + "'"

def verify_reviewed_batch(admin, student, all_tracks):
    # The migration-only database has no published production bank. Build exact
    # source-match fixtures from the embedded package, then remove only those
    # fixture rows. This tests the real endpoint, not a test-only API override.
    manifest=json.loads((Path(__file__).resolve().parents[1]/"content/editorial/g1-track-draft-batch-20261124.json").read_text(encoding="utf-8"))
    groups=manifest["Tracks"]
    rows=[(group["StageId"],row) for group in groups for row in group["Rows"]]
    ids=",".join(str(row["ProblemId"]) for _,row in rows)
    skills={row["PrimarySkillId"]:(stage,row["CategoryId"],row["StableKey"]) for stage,row in rows}
    skill_ids=",".join(map(str,skills))
    categories={row["CategoryId"]:stage for stage,row in rows}
    cat_ids=",".join(map(str,categories))
    expected_count=len(rows)
    # Explicitly create the two missing identities via the same admin endpoint.
    new_tracks=[]
    for code in ('numerical-analysis','mathematical-optimization'):
        created=expect('POST','/api/admin/learning-tracks',201,{'StageId':4,'Code':code,'Kind':'course','NameAr':'مساق تجريبي','NameEn':code,'SortOrder':99},admin)
        new_tracks.append({'Track':created})
    all_tracks=all_tracks+new_tracks
    assert expected_count+manifest["ExcludedCount"]==773 and len(groups)==19
    assert len({row["ProblemId"] for _,row in rows})==expected_count
    assert sql(f'SELECT COUNT(*) FROM "Problems" WHERE "Id" IN ({ids})')=="0"
    assert sql(f'SELECT COUNT(*) FROM "CurriculumSkills" WHERE "Id" IN ({skill_ids})')=="0"
    assert all(x["Track"]["Revision"]==0 and not x["Track"]["IsPublished"] for x in all_tracks)
    existing={int(x) for x in sql(f'SELECT "Id" FROM "Categories" WHERE "Id" IN ({cat_ids})').splitlines()}
    added=[(cid,stage) for cid,stage in categories.items() if cid not in existing]
    assert sql('SELECT COUNT(*) FROM "LearningTrackProblems"')=="0"
    domain=int(sql("""INSERT INTO "CurriculumDomains" ("StableKey","NameAr","NameEn","IsPublished") VALUES ('ci-reviewed-batch','اختبار','CI fixture',true) RETURNING "Id" """).splitlines()[0])
    statements=["BEGIN;","SET LOCAL standard_conforming_strings=on;"]
    for cid,stage in added:
        statements.append(f'''INSERT INTO "Categories" ("Id","NameAr","NameEn","Icon","Order","StageId","DescriptionAr","DescriptionEn") VALUES ({cid},'اختبار','CI fixture','test',100,{stage},'','');''')
    for sid,(stage,cid,key) in skills.items():
        statements.append(f'''INSERT INTO "CurriculumSkills" ("Id","StableKey","DomainId","StageId","CategoryId","NameAr","NameEn","IsPublished") VALUES ({sid},{literal(key)},{domain},{stage},{cid},'اختبار','CI fixture',true);''')
    for stage,row in rows:
        pid,cid,sid=row["ProblemId"],row["CategoryId"],row["PrimarySkillId"]
        ar,en=literal(row["ExpectedQuestionAr"]),literal(row["ExpectedQuestionEn"])
        statements.append(f'''INSERT INTO "Problems" ("Id","TitleAr","TitleEn","QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn","StageId","CategoryId","Points","ViewsCount","SolvedCount","CreatedAt") VALUES ({pid},'اختبار','CI fixture',{ar},{en},'اختبار','CI fixture',{stage},{cid},10,0,0,now());''')
        statements.append(f'''INSERT INTO "CurriculumProblemSkills" ("ProblemId","SkillId","IsPrimary") VALUES ({pid},{sid},true);''')
    statements.append("COMMIT;")
    fixture_sql("\n".join(statements))
    root="/api/admin/learning-tracks/reviewed-draft-batch"
    def link_count():
        return int(sql('SELECT COUNT(*) FROM "LearningTrackProblems"'))
    try:
        preview=expect("POST",root,200,{"Confirm":False},admin)
        assert not preview["Confirmed"] and preview["AppliedTracks"]==0
        assert len(preview["Items"])==19 and sum(x["Problems"] for x in preview["Items"])==expected_count
        assert all(x["Status"]=="Ready" for x in preview["Items"])
        assert link_count()==0
        revisions=[{"Id":x["Id"],"Revision":x["Revision"]} for x in preview["Items"]]
        confirm={"Confirm":True,"Revisions":revisions}
        expect("POST",root,403,confirm,student)
        expect("POST",root,400,{"Confirm":True,"Revisions":[None]+revisions[1:]},admin)
        expect("POST",root,400,{"Confirm":True,"Revisions":[dict(revisions[0],Revision=-1)]+revisions[1:]},admin)
        stale=[dict(x) for x in revisions]
        stale[0]["Revision"]+=1
        expect("POST",root,409,{"Confirm":True,"Revisions":stale},admin)
        assert link_count()==0
        # A source changed after preview must abort the whole confirmation.
        row=rows[0][1]
        pid=row["ProblemId"]
        sql(f'''UPDATE "Problems" SET "QuestionTextEn"='changed after preview' WHERE "Id"={pid}''')
        expect("POST",root,409,confirm,admin)
        assert link_count()==0
        sql(f'''UPDATE "Problems" SET "QuestionTextEn"={literal(row["ExpectedQuestionEn"])} WHERE "Id"={pid}''')
        saved=expect("POST",root,200,confirm,admin)
        assert saved["Confirmed"] and saved["AppliedTracks"]==19
        assert link_count()==expected_count
        assert int(sql('SELECT COUNT(*) FROM "LearningTrackCategories"'))==sum(len({r["CategoryId"] for r in g["Rows"]}) for g in groups)
        assert int(sql('SELECT COUNT(*) FROM "LearningTrackSkills"'))==sum(len({r["PrimarySkillId"] for r in g["Rows"]}) for g in groups)
        assert sql('SELECT COUNT(*) FROM "LearningTracks" WHERE "IsPublished"')=="0"
        assert sql('SELECT COUNT(*) FROM "LearningTracks" WHERE "Revision"=1')=="19"
        expect("POST",root,409,confirm,admin)
        repeat=expect("POST",root,200,{"Confirm":False},admin)
        assert all(x["Status"]=="AlreadyMapped" for x in repeat["Items"])
        again=expect("POST",root,200,{"Confirm":True,"Revisions":[{"Id":x["Id"],"Revision":x["Revision"]} for x in repeat["Items"]]},admin)
        assert again["AppliedTracks"]==0 and link_count()==expected_count
        assert sql('SELECT COUNT(*) FROM "LearningTracks" WHERE "Revision"=1')=="19"
        print(f"PASS: reviewed {expected_count}-question batch preview, stale/source rejection, atomic mapping and idempotence; no publication")
    finally:
        track_ids=",".join(str(x["Track"]["Id"]) for x in all_tracks)
        fixture_sql(f'''BEGIN;
DELETE FROM "LearningTrackProblems" WHERE "TrackId" IN ({track_ids});
DELETE FROM "LearningTrackSkills" WHERE "TrackId" IN ({track_ids});
DELETE FROM "LearningTrackCategories" WHERE "TrackId" IN ({track_ids});
UPDATE "LearningTracks" SET "Revision"=0 WHERE "Id" IN ({track_ids}) AND NOT "IsPublished";
DELETE FROM "PlatformActivityEvents" WHERE "Action"='LearningTrackReviewedDraftMapped' AND "Resource"='LearningTrack';
DELETE FROM "Problems" WHERE "Id" IN ({ids});
DELETE FROM "CurriculumSkills" WHERE "Id" IN ({skill_ids});
DELETE FROM "CurriculumDomains" WHERE "Id"={domain};
DELETE FROM "LearningTracks" WHERE "Id" IN ({",".join(str(x["Track"]["Id"]) for x in new_tracks)});
''' + (f'DELETE FROM "Categories" WHERE "Id" IN ({",".join(str(cid) for cid,_ in added)});\n' if added else "") + "COMMIT;")

def verify_tracks(admin, student, uid, stage1, stage2):
    root="/api/admin/learning-tracks"
    all_tracks=expect("GET",root,200,token=admin)["Items"]
    assert len(all_tracks)==17 and all(not x["Track"]["IsPublished"] for x in all_tracks)
    assert expect("GET",f"/api/stages/{stage1}/tracks",200)["Items"]==[]
    assert expect("GET","/api/users/learning-track",200,token=student).get("TrackId") is None
    expect("GET",root,403,token=student)
    expect("POST",root+"/reviewed-draft-batch",403,{"Confirm":False},student)
    expect("POST",root+"/reviewed-draft-batch",400,{"Confirm":True},admin)
    # The production manifest is not valid against this disposable fixture.
    expect("POST",root+"/reviewed-draft-batch",409,{"Confirm":False},admin)
    assert sql('SELECT COUNT(*) FROM "LearningTrackProblems"')=="0"
    verify_reviewed_batch(admin, student, all_tracks)
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
    assert journey["TrackId"]==tid and journey["TotalProblems"]==1 and journey["TrackPracticeIsolationEnabled"]
    scoped=expect("GET",f"/api/problems/search?stageId={stage1}",200,token=student)
    assert scoped["Total"]==1 and scoped["Results"][0]["Id"]==pid
    outside=sql(f'SELECT "Id" FROM "Problems" WHERE "StageId"={stage1} AND "CategoryId"={category} AND "Id"<>{pid} LIMIT 1')
    if outside:
        expect("GET",f"/api/problems/{outside}",403,token=student)
        expect("POST","/api/problems/submit",403,{"ProblemId":int(outside),"SelectedOptionId":1,"TimeSpentSeconds":1},student)
        expect("GET",f"/api/problems/{outside}/diagram",403,token=student)
    expect("POST","/api/users/practice/reset",409,{"StageId":stage1},student)
    expect("GET","/api/users/learning-tracks/continue",403,token=student)
    # Disposable fixture only: verify Premium's scoped resume, challenge and
    # report do not return unrelated problems in the same stage.
    sql(f"""UPDATE "Users" SET "SubscriptionType"='Premium',"PremiumExpiresAtUtc"=NULL WHERE "Id"={uid}""")
    resume=expect("GET","/api/users/learning-tracks/continue",200,token=student)
    assert resume["TrackId"]==tid and resume["Problem"]["Id"]==pid
    expect("GET",f"/api/problems/{pid}/hints?practiceScopeId=0",409,token=student)
    expect("POST",f"/api/problems/{pid}/hints",409,{"Level":1,"PracticeScopeId":0},student)
    expect("GET",f"/api/problems/{pid}/hints?practiceScopeId={tid}",200,token=student)
    challenge=expect("GET","/api/users/daily-challenge",200,token=student)
    assert challenge["TrackId"]==tid and [p["Id"] for p in challenge["Problems"]]==[pid]
    report=expect("GET",f"/api/users/premium-report?stageId={stage1}",200,token=student)
    assert report["TrackId"]==tid and report["TotalProblems"]==1
    historical=expect("GET",f"/api/users/journey?stageId={stage2}",200,token=student)
    assert historical.get("TrackId") is None and historical["StageId"]==stage2
    sql(f"""UPDATE "Users" SET "SubscriptionType"='Free' WHERE "Id"={uid}""")
    practice=f"/api/users/learning-tracks/{tid}/categories/{category}/problems"
    assert expect("GET",practice,200,token=student)["Items"][0]["Id"]==pid
    detail=expect("GET",f"/api/problems/{pid}",200,token=admin)
    option=next(x["Id"] for x in detail["Options"] if x["IsCorrect"])
    assert expect("GET",f"/api/problems/{pid}",200,token=student)["PracticeScopeId"]==tid
    expect("POST","/api/problems/submit",409,{"ProblemId":pid,"SelectedOptionId":option,"TimeSpentSeconds":4},student)
    expect("POST","/api/problems/submit",200,{"ProblemId":pid,"SelectedOptionId":option,"TimeSpentSeconds":4,"PracticeScopeId":tid},student)
    assert expect("GET",practice,200,token=student)["Items"][0]["IsSolved"]
    assert expect("GET",f"/api/users/learning-tracks/{tid}/progress",200,token=student)["Solved"]==1
    assert expect("GET",f"/api/users/journey?stageId={stage1}",200,token=student)["SolvedProblems"]==1
    assert expect("GET","/api/users/dashboard",200,token=student)["SolvedProblemsCount"]==1
    other=next(x["Track"] for x in all_tracks if x["Track"]["StageId"]==stage1 and x["Track"]["Id"]!=tid)
    oid=other["Id"]
    expect("PUT",f"{root}/{oid}/mapping",200,{"Revision":0,"CategoryIds":[category],"SkillIds":[skill],"ProblemIds":[pid]},admin)
    expect("PUT",f"{root}/{oid}/publication",200,{"Revision":1,"Publish":True},admin)
    public_tracks=expect("GET",f"/api/stages/{stage1}/tracks",200)["Items"]
    assert {x["Id"] for x in public_tracks}=={tid,oid}
    assert all(x["ProblemsCount"]==x["CategoriesCount"]==x["SkillsCount"]==x["FreeProblemsCount"]==1 for x in public_tracks)
    expect("PUT","/api/users/learning-track",200,{"TrackId":oid},student)
    expect("GET",practice,403,token=student)
    assert expect("GET",f"/api/users/learning-tracks/{oid}/progress",200,token=student)["Solved"]==0
    expect("POST","/api/users/favorite/toggle",200,{"ProblemId":pid,"IsFavorite":True},student)
    wrong_option=next(x["Id"] for x in detail["Options"] if not x["IsCorrect"])
    assert expect("GET",f"/api/problems/{pid}",200,token=student)["PracticeScopeId"]==oid
    expect("POST","/api/problems/submit",409,{"ProblemId":pid,"SelectedOptionId":wrong_option,"TimeSpentSeconds":3,"PracticeScopeId":tid},student)
    expect("POST","/api/problems/submit",409,{"ProblemId":pid,"SelectedOptionId":wrong_option,"TimeSpentSeconds":3,"PracticeScopeId":0},student)
    wrong=expect("POST","/api/problems/submit",200,{"ProblemId":pid,"SelectedOptionId":wrong_option,"TimeSpentSeconds":3,"PracticeScopeId":oid},student)
    assert not wrong["IsCorrect"]
    assert expect("GET",f"/api/users/journey?stageId={stage1}",200,token=student)["SolvedProblems"]==0
    assert len(expect("GET","/api/users/error-notebook",200,token=student))==1
    sql(f"""UPDATE "Users" SET "SubscriptionType"='Premium',"PremiumExpiresAtUtc"=NULL WHERE "Id"={uid}""")
    old_report=expect("GET",f"/api/users/premium-analytics?trackId={tid}",200,token=student)
    new_report=expect("GET",f"/api/users/premium-analytics?trackId={oid}",200,token=student)
    assert sum(c["ErrorNotebookProblems"] for c in old_report["Categories"])==0
    assert sum(c["ErrorNotebookProblems"] for c in new_report["Categories"])==1
    assert old_report["Attempts"]==1 and old_report["CorrectAttempts"]==1 and old_report["IncorrectAttempts"]==0
    assert new_report["Attempts"]==1 and new_report["CorrectAttempts"]==0 and new_report["IncorrectAttempts"]==1
    assert old_report["SolvedProblems"]==1 and new_report["SolvedProblems"]==0
    assert old_report["AwardedPoints"]>0 and new_report["AwardedPoints"]==0
    filtered=expect("GET",f"/api/users/premium-analytics?trackId={tid}&days=7",200,token=student)
    assert filtered["FilterTrackNameEn"]=="Grade fixture" and filtered["WindowDays"]==7
    assert filtered["WindowStartUtc"] and filtered["FilterTrackId"]==tid
    # Verify the actual downloaded workbook carries the selected track and
    # measurement caveats, not just the JSON endpoint.
    request=urllib.request.Request(BASE+f"/api/users/premium-analytics/export.xlsx?trackId={tid}&days=7&lang=en",
        headers={"Authorization":"Bearer "+student})
    with urllib.request.urlopen(request,timeout=30) as response:
        archive=response.read()
    with zipfile.ZipFile(io.BytesIO(archive)) as book:
        xml=book.read("xl/sharedStrings.xml").decode()
        assert "Grade fixture" in xml and "Period (UTC)" in xml
        assert "Guided-session attempts" in xml and "current state" in xml
    eligibility=expect("GET",f"/api/users/certificates/eligibility?stageId={stage1}&trackId={oid}&categoryId={category}",200,token=student)
    assert eligibility["SolvedProblems"]==0 and eligibility["IndependentSkills"]==0
    sql(f"""UPDATE "Users" SET "SubscriptionType"='Free' WHERE "Id"={uid}""")
    expect("POST","/api/users/practice/reset",409,{"StageId":stage1,"TrackId":tid},student)
    expect("PUT","/api/users/learning-track",200,{"TrackId":tid},student)
    assert expect("GET",f"/api/users/learning-tracks/{tid}/progress",200,token=student)["Solved"]==1
    assert expect("GET","/api/users/error-notebook",200,token=student)==[]
    assert expect("GET",f"/api/users/favorite/check/{pid}",200,token=student)["IsFavorite"]
    changed=expect("POST","/api/users/practice/reset",200,{"StageId":stage1,"TrackId":tid,"CategoryId":category},student)
    assert changed["ResetSolved"]==1 and changed["PreservedFavorites"]==1
    assert expect("GET",practice,200,token=student)["Items"][0]["IsSolved"] is False
    expect("PUT","/api/users/learning-track",200,{"TrackId":oid},student)
    assert len(expect("GET","/api/users/error-notebook",200,token=student))==1
    again=expect("POST","/api/problems/submit",200,{"ProblemId":pid,"SelectedOptionId":option,"TimeSpentSeconds":4,"PracticeScopeId":oid},student)
    assert again["IsCorrect"] and again["PointsEarned"]==0
    assert expect("GET","/api/users/error-notebook",200,token=student)==[]
    assert expect("GET",f"/api/users/learning-tracks/{tid}/progress",200,token=student)["Solved"]==0
    assert expect("GET",f"/api/users/learning-tracks/{oid}/progress",200,token=student)["Solved"]==1
    assert sql(f'SELECT COUNT(*) FROM "UserProgresses" WHERE "UserId"={uid} AND "ProblemId"={pid}')=="3"
    assert sql(f'SELECT COUNT(DISTINCT "PracticeScopeId") FROM "ProblemAttempts" WHERE "UserId"={uid} AND "ProblemId"={pid}')=="2"
    expect("PUT",f"{root}/{oid}/publication",200,{"Revision":2,"Publish":False},admin)
    expect("PUT","/api/users/learning-track",200,{"TrackId":tid},student)
    expect("PUT","/api/users/learning-stage",200,{"StageId":stage2},student)
    assert expect("GET","/api/users/learning-track",200,token=student).get("TrackId") is None
    expect("PUT","/api/users/learning-track",200,{"TrackId":tid},student)
    expect("PUT",f"{root}/{tid}/mapping",409,{"Revision":3,"CategoryIds":[],"SkillIds":[],"ProblemIds":[]},admin)
    expect("PUT",f"{root}/{tid}/publication",200,{"Revision":3,"Publish":False},admin)
    assert expect("GET",f"/api/stages/{stage1}/tracks",200)["Items"]==[]
    assert expect("GET","/api/users/learning-track",200,token=student).get("TrackId") is None
    verify_premium_only_course(admin,student,uid,stage1,all_tracks)
    # Keep journey suite's original stage and fixture assumptions.
    expect("PUT","/api/users/learning-stage",200,{"StageId":stage2},student)
    expect("PUT","/api/users/learning-stage",200,{"StageId":stage1},student)
    # Disposable fixture cleanup only; the permanent ledger intentionally
    # survives removal of mutable progress and catalog objects.
    assert sql(f'SELECT COUNT(*) FROM "PermanentProblemAchievements" WHERE "UserId"={uid} AND "ProblemId"={pid}')=="1"
    sql(f'DELETE FROM "PermanentProblemAchievements" WHERE "UserId"={uid} AND "ProblemId"={pid}; DELETE FROM "ProblemAttempts" WHERE "ProblemId"={pid}; DELETE FROM "UserProgresses" WHERE "ProblemId"={pid}; DELETE FROM "Problems" WHERE "Id"={pid}; DELETE FROM "CurriculumSkills" WHERE "Id"={skill}; DELETE FROM "CurriculumDomains" WHERE "Id"={domain}')
    print("PASS: 17 unpublished tracks, validated mapping, no empty public tracks, original stage Free policy, selection and legacy stage switch")


def verify_premium_only_course(admin,student,uid,stage1,all_tracks):
    root="/api/admin/learning-tracks"
    stage=4
    course=next(x["Track"] for x in all_tracks if x["Track"]["StageId"]==stage and x["Track"]["Kind"]=="course")
    tid=course["Id"]
    free=expect("GET",f"/api/stages/{stage}/free-categories",200)["FreeCategoryIds"]
    assert len(free)==2
    category=int(sql(f'SELECT "Id" FROM "Categories" WHERE "StageId"={stage} AND "Id" NOT IN ({",".join(map(str,free))}) ORDER BY "Id" LIMIT 1'))
    problem=expect("POST","/api/admin/problems",201,{
        "QuestionTextAr":"اختبار المساق المميز: ما ناتج 2+3؟","QuestionTextEn":"Premium course fixture: what is 2+3?",
        "DetailedSolutionAr":"نجمع العددين فنحصل على 5.","DetailedSolutionEn":"Add the two numbers to obtain 5.",
        "StageId":stage,"CategoryId":category,"Points":10,
        "Options":[{"LatexCode":str(i),"IsCorrect":i==5,"Order":n+1} for n,i in enumerate((4,5,6,7))]},admin)
    pid=problem["Id"]
    domain=int(sql("""INSERT INTO "CurriculumDomains" ("StableKey","NameAr","NameEn","DescriptionAr","DescriptionEn","SortOrder","IsPublished") VALUES ('ci-premium-course-domain','اختبار','Test','','',0,true) RETURNING "Id" """).splitlines()[0])
    skill=int(sql(f"""INSERT INTO "CurriculumSkills" ("StableKey","DomainId","StageId","CategoryId","NameAr","NameEn","DescriptionAr","DescriptionEn","SortOrder","IsPublished") VALUES ('ci-premium-course-skill',{domain},{stage},{category},'جمع','Addition','','',0,true) RETURNING "Id" """).splitlines()[0])
    sql(f'INSERT INTO "CurriculumProblemSkills" ("ProblemId","SkillId","IsPrimary") VALUES ({pid},{skill},true)')
    expect("PUT",f"{root}/{tid}/mapping",200,{"Revision":0,"CategoryIds":[category],"SkillIds":[skill],"ProblemIds":[pid]},admin)
    expect("PUT",f"{root}/{tid}/publication",409,{"Revision":1,"Publish":True},admin)
    expect("PUT",f"{root}/{tid}/publication",403,{"Revision":1,"Publish":True,"ConfirmPremiumOnlyCourse":True},student)
    expect("PUT",f"{root}/{tid}/publication",200,{"Revision":1,"Publish":True,"ConfirmPremiumOnlyCourse":True},admin)
    public=expect("GET",f"/api/stages/{stage}/tracks",200)["Items"]
    item=next(x for x in public if x["Id"]==tid)
    assert item["FreeProblemsCount"]==0 and item["ProblemsCount"]==1
    detail=expect("GET",f"/api/learning-tracks/{tid}",200)
    assert not detail["Categories"][0]["IsFree"] and all(set(x)<={"Id","CategoryId","TitleAr","TitleEn"} for x in detail["Examples"])
    expect("PUT","/api/users/learning-track",200,{"TrackId":tid},student)
    progress=expect("GET",f"/api/users/learning-tracks/{tid}/progress",200,token=student)
    assert progress["Categories"][0]["IsLocked"]
    expect("GET",f"/api/users/learning-tracks/{tid}/categories/{category}/problems",403,token=student)
    expect("GET",f"/api/problems/{pid}",403,token=student)
    correct=int(sql(f'SELECT "Id" FROM "QuestionOptions" WHERE "ProblemId"={pid} AND "IsCorrect"'))
    expect("POST","/api/problems/submit",403,{"ProblemId":pid,"SelectedOptionId":correct,"TimeSpentSeconds":1,"PracticeScopeId":tid},student)
    sql(f"""UPDATE "Users" SET "SubscriptionType"='Premium',"PremiumExpiresAtUtc"=NULL WHERE "Id"={uid}""")
    assert not expect("GET",f"/api/users/learning-tracks/{tid}/progress",200,token=student)["Categories"][0]["IsLocked"]
    expect("GET",f"/api/users/learning-tracks/{tid}/categories/{category}/problems",200,token=student)
    expect("GET",f"/api/problems/{pid}",200,token=student)
    sql(f"""UPDATE "Users" SET "SubscriptionType"='Free' WHERE "Id"={uid}""")
    assert expect("GET",f"/api/stages/{stage}/free-categories",200)["FreeCategoryIds"]==free
    expect("PUT","/api/users/learning-stage",200,{"StageId":stage1},student)
    expect("PUT",f"{root}/{tid}/publication",200,{"Revision":2,"Publish":False},admin)
    expect("PUT",f"{root}/{tid}/mapping",200,{"Revision":3,"CategoryIds":[],"SkillIds":[],"ProblemIds":[]},admin)
    sql(f'DELETE FROM "Problems" WHERE "Id"={pid}; DELETE FROM "CurriculumSkills" WHERE "Id"={skill}; DELETE FROM "CurriculumDomains" WHERE "Id"={domain}')
    print("PASS: explicit university Premium-only catalog publication; Free practice remains forbidden; Premium allowed; Free categories unchanged")
