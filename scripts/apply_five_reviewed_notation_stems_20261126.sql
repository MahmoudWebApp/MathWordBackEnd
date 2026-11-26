-- One-time owner-authorized notation-only maintenance.
-- Exact source and seven history guards; retain historical published amendments.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='25s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE notation_batch(id int, previous bigint, ar_old text,en_old text,ar_new text,en_new text,metadata_hash text,ar_hash text,en_hash text,options jsonb) ON COMMIT DROP;
INSERT INTO notation_batch VALUES (70,296,$mw$حل المعادلة س+7=12.$mw$,$mw$Solve x+7=12.$mw$,$mw$حل المعادلة $x+7=12$.$mw$,$mw$Solve $x+7=12$.$mw$,$mw$5fbbcd9568a3fe50af36ae094a2c8db7$mw$,$mw$fb08daa2c5fe1667fc3d91d652a7fcf8$mw$,$mw$2e5c64cff866062128579c65a0989318$mw$,$mw$[{"id":269,"text":"8","order":1,"correct":false},{"id":270,"text":"3","order":2,"correct":false},{"id":271,"text":"5","order":3,"correct":true},{"id":272,"text":"6","order":4,"correct":false}]$mw$::jsonb),
(85,310,$mw$حل المعادلة س+8=15.$mw$,$mw$Solve x+8=15.$mw$,$mw$حل المعادلة $x+8=15$.$mw$,$mw$Solve $x+8=15$.$mw$,$mw$fea86955c000ff64a40324919c9a188c$mw$,$mw$0cd02ad9936c269a6fe2ad24a58a07d7$mw$,$mw$1c25074fdc3e86067b31fe824ab80da7$mw$,$mw$[{"id":329,"text":"5","order":1,"correct":false},{"id":330,"text":"7","order":2,"correct":true},{"id":331,"text":"8","order":3,"correct":false},{"id":332,"text":"10","order":4,"correct":false}]$mw$::jsonb),
(100,324,$mw$حل المعادلة س+9=18.$mw$,$mw$Solve x+9=18.$mw$,$mw$حل المعادلة $x+9=18$.$mw$,$mw$Solve $x+9=18$.$mw$,$mw$48feb413e9374bfbaa9e473c2e075e5c$mw$,$mw$e562f0af1d9d30fb21c5d3094d6dbf2d$mw$,$mw$7528359d6ed9bbfa6a2806900560f744$mw$,$mw$[{"id":389,"text":"9","order":1,"correct":true},{"id":390,"text":"10","order":2,"correct":false},{"id":391,"text":"12","order":3,"correct":false},{"id":392,"text":"7","order":4,"correct":false}]$mw$::jsonb),
(115,338,$mw$حل المعادلة س+10=21.$mw$,$mw$Solve x+10=21.$mw$,$mw$حل المعادلة $x+10=21$.$mw$,$mw$Solve $x+10=21$.$mw$,$mw$4a99fbdc432a6f65f0ee1f693b92620f$mw$,$mw$778ef5b9a79a6911a27d2286fa442702$mw$,$mw$2d43074497b50a86f3ad7010b08768b6$mw$,$mw$[{"id":449,"text":"12","order":1,"correct":false},{"id":450,"text":"14","order":2,"correct":false},{"id":451,"text":"9","order":3,"correct":false},{"id":452,"text":"11","order":4,"correct":true}]$mw$::jsonb),
(130,352,$mw$حل المعادلة س+11=24.$mw$,$mw$Solve x+11=24.$mw$,$mw$حل المعادلة $x+11=24$.$mw$,$mw$Solve $x+11=24$.$mw$,$mw$15efe0ebd04e72a5d13400122b98e307$mw$,$mw$6f1c598a54a2b6a3086a39a38df1c05f$mw$,$mw$275fa88798ba9a5d3d68fdfa7838647a$mw$,$mw$[{"id":509,"text":"16","order":1,"correct":false},{"id":510,"text":"11","order":2,"correct":false},{"id":511,"text":"13","order":3,"correct":true},{"id":512,"text":"14","order":4,"correct":false}]$mw$::jsonb);
DO $audit$
DECLARE b record; p "Problems"%ROWTYPE; actor int; n int;
BEGIN
 FOR b IN SELECT * FROM notation_batch ORDER BY id LOOP
  PERFORM pg_advisory_xact_lock(-b.id::bigint);
  SELECT * INTO STRICT p FROM "Problems" WHERE "Id"=b.id FOR UPDATE;
  PERFORM 1 FROM "QuestionOptions" WHERE "ProblemId"=b.id FOR UPDATE;
  SELECT d."OwnerUserId" INTO STRICT actor FROM "CurriculumDraftItems" d JOIN "Users" u ON u."Id"=d."OwnerUserId" WHERE d."Id"=b.previous AND d."SourceProblemId"=b.id AND d."PublishedProblemId"=b.id AND d."EditorialStatus"='Published' AND u."Role"='Admin' AND u."IsActive" AND NOT u."StaffSetupPending";
  IF p."TitleAr" IS DISTINCT FROM b.ar_old OR p."QuestionTextAr" IS DISTINCT FROM b.ar_old OR p."TitleEn" IS DISTINCT FROM b.en_old OR p."QuestionTextEn" IS DISTINCT FROM b.en_old OR md5(p."EditorialDetailsJson") IS DISTINCT FROM b.metadata_hash OR md5(p."DetailedSolutionAr") IS DISTINCT FROM b.ar_hash OR md5(p."DetailedSolutionEn") IS DISTINCT FROM b.en_hash OR (SELECT jsonb_agg(jsonb_build_object('id',o."Id",'order',o."Order",'text',o."LatexCode",'correct',o."IsCorrect") ORDER BY o."Order",o."Id") FROM "QuestionOptions" o WHERE o."ProblemId"=b.id) IS DISTINCT FROM b.options OR EXISTS(SELECT 1 FROM "CurriculumDraftItems" WHERE "SourceProblemId"=b.id AND "EditorialStatus" NOT IN ('Published','Withdrawn')) THEN RAISE EXCEPTION 'Stale source or open draft %',b.id; END IF;
  IF EXISTS(SELECT 1 FROM "ProblemAttempts" WHERE "ProblemId"=b.id) OR EXISTS(SELECT 1 FROM "UserProgresses" WHERE "ProblemId"=b.id) OR EXISTS(SELECT 1 FROM "PermanentProblemAchievements" WHERE "ProblemId"=b.id) OR EXISTS(SELECT 1 FROM "LearningSessionAttempts" WHERE "ProblemId"=b.id) OR EXISTS(SELECT 1 FROM "ProblemDiagrams" WHERE "ProblemId"=b.id) OR EXISTS(SELECT 1 FROM "PlatformActivityEvents" WHERE "ActorRole"='Student' AND "Resource"='Problem' AND "ResourceId"=b.id::text) OR EXISTS(SELECT 1 FROM "LearningSessions" WHERE "QuestionsJson"::jsonb @> jsonb_build_array(jsonb_build_object('Id',b.id))) THEN RAISE EXCEPTION 'History guard %',b.id; END IF;
  IF EXISTS(SELECT 1 FROM "Problems" WHERE "Id"<>b.id AND "StageId"=p."StageId" AND ("QuestionTextAr"=b.ar_new OR "QuestionTextEn"=b.en_new)) THEN RAISE EXCEPTION 'Duplicate %',b.id; END IF;
  UPDATE "Problems" SET "TitleAr"=b.ar_new,"QuestionTextAr"=b.ar_new,"TitleEn"=b.en_new,"QuestionTextEn"=b.en_new WHERE "Id"=b.id;
  GET DIAGNOSTICS n=ROW_COUNT;
  IF n<>1 THEN RAISE EXCEPTION 'Unexpected update count %',b.id; END IF;
  INSERT INTO "PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") VALUES(actor,'Admin','ReviewedNotationMaintenance','Problem',b.id::text,'owner_sql',now());
 END LOOP;
END $audit$;
COMMIT;