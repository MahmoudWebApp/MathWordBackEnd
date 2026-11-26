-- Owner-authorized, reviewed, solution-only maintenance.
-- Immutable source hashes and exact option IDs/flags; abort all three on mismatch.
-- Historical editorial records are retained unchanged; no new questions or options.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='20s';
DO $audit$
DECLARE n integer;
BEGIN
 PERFORM pg_advisory_xact_lock(-987654319::bigint);
 PERFORM pg_advisory_xact_lock(-154::bigint);
 UPDATE public."Problems" p SET
 "EditorialDetailsJson"=jsonb_set(p."EditorialDetailsJson"::jsonb,'{Solution,Steps,0,Ar}',to_jsonb($mw$عوّض $x=5$، ثم احسب $2\times5=10$ واطرح $3$ لتحصل على $7$.$mw$::text),false)::text,
 "DetailedSolutionAr"=replace(p."DetailedSolutionAr",$mw$عوّض س بـ5 ثم اضربها في 2 واطرح 3.$mw$,$mw$عوّض $x=5$، ثم احسب $2\times5=10$ واطرح $3$ لتحصل على $7$.$mw$)
 WHERE p."Id"=154
 AND md5(p."EditorialDetailsJson")='16d0e11298ae0d8975f4d3ccf1429f36'
 AND md5(p."DetailedSolutionAr")='ba29847b85fad02a60e15cf1af404ab8'
 AND md5(p."DetailedSolutionEn")='6e3caf03085161c44a1b87bfb0417eba'
 AND p."EditorialDetailsJson"::jsonb#>>'{Solution,Steps,0,Ar}'=$mw$عوّض س بـ5 ثم اضربها في 2 واطرح 3.$mw$
 AND strpos(p."DetailedSolutionAr",$mw$عوّض س بـ5 ثم اضربها في 2 واطرح 3.$mw$)>0
 AND (SELECT jsonb_agg(jsonb_build_object('id',o."Id",'code',o."LatexCode",'correct',o."IsCorrect") ORDER BY o."Order",o."Id") FROM public."QuestionOptions" o WHERE o."ProblemId"=p."Id")=$mw$[{"id":605,"code":"8","correct":false},{"id":606,"code":"10","correct":false},{"id":607,"code":"5","correct":false},{"id":608,"code":"7","correct":true}]$mw$::jsonb
 AND NOT EXISTS (SELECT 1 FROM public."CurriculumDraftItems" d WHERE d."SourceProblemId"=p."Id" AND d."EditorialStatus" NOT IN ('Published','Withdrawn'));
 GET DIAGNOSTICS n=ROW_COUNT;
 IF n<>1 THEN RAISE EXCEPTION 'Problem 154: stale or conflicting source; abort entire batch'; END IF;
 PERFORM pg_advisory_xact_lock(-166::bigint);
 UPDATE public."Problems" p SET
 "EditorialDetailsJson"=jsonb_set(p."EditorialDetailsJson"::jsonb,'{Solution,Steps,0,Ar}',to_jsonb($mw$عوّض $x=6$، ثم احسب $2\times6=12$ واطرح $4$ لتحصل على $8$.$mw$::text),false)::text,
 "DetailedSolutionAr"=replace(p."DetailedSolutionAr",$mw$عوّض س بـ6 ثم اضربها في 2 واطرح 4.$mw$,$mw$عوّض $x=6$، ثم احسب $2\times6=12$ واطرح $4$ لتحصل على $8$.$mw$)
 WHERE p."Id"=166
 AND md5(p."EditorialDetailsJson")='63771c3695c776f17dd1b4509b83ed33'
 AND md5(p."DetailedSolutionAr")='a8a8dfdddc1cb25de5591146a67f4264'
 AND md5(p."DetailedSolutionEn")='71415ea2965a214266042d90dd425e51'
 AND p."EditorialDetailsJson"::jsonb#>>'{Solution,Steps,0,Ar}'=$mw$عوّض س بـ6 ثم اضربها في 2 واطرح 4.$mw$
 AND strpos(p."DetailedSolutionAr",$mw$عوّض س بـ6 ثم اضربها في 2 واطرح 4.$mw$)>0
 AND (SELECT jsonb_agg(jsonb_build_object('id',o."Id",'code',o."LatexCode",'correct',o."IsCorrect") ORDER BY o."Order",o."Id") FROM public."QuestionOptions" o WHERE o."ProblemId"=p."Id")=$mw$[{"id":653,"code":"11","correct":false},{"id":654,"code":"6","correct":false},{"id":655,"code":"8","correct":true},{"id":656,"code":"9","correct":false}]$mw$::jsonb
 AND NOT EXISTS (SELECT 1 FROM public."CurriculumDraftItems" d WHERE d."SourceProblemId"=p."Id" AND d."EditorialStatus" NOT IN ('Published','Withdrawn'));
 GET DIAGNOSTICS n=ROW_COUNT;
 IF n<>1 THEN RAISE EXCEPTION 'Problem 166: stale or conflicting source; abort entire batch'; END IF;
 PERFORM pg_advisory_xact_lock(-178::bigint);
 UPDATE public."Problems" p SET
 "EditorialDetailsJson"=jsonb_set(p."EditorialDetailsJson"::jsonb,'{Solution,Steps,0,Ar}',to_jsonb($mw$عوّض $x=7$، ثم احسب $2\times7=14$ واطرح $5$ لتحصل على $9$.$mw$::text),false)::text,
 "DetailedSolutionAr"=replace(p."DetailedSolutionAr",$mw$ضع 7 مكان س، ثم احسب حاصل الضرب واطرح 5.$mw$,$mw$عوّض $x=7$، ثم احسب $2\times7=14$ واطرح $5$ لتحصل على $9$.$mw$)
 WHERE p."Id"=178
 AND md5(p."EditorialDetailsJson")='caa6c7dc928386c72c238b8daf5514f6'
 AND md5(p."DetailedSolutionAr")='e4f0654caef85894b129a6ac17045360'
 AND md5(p."DetailedSolutionEn")='97a6847222e665f23fa1c45dd04f7086'
 AND p."EditorialDetailsJson"::jsonb#>>'{Solution,Steps,0,Ar}'=$mw$ضع 7 مكان س، ثم احسب حاصل الضرب واطرح 5.$mw$
 AND strpos(p."DetailedSolutionAr",$mw$ضع 7 مكان س، ثم احسب حاصل الضرب واطرح 5.$mw$)>0
 AND (SELECT jsonb_agg(jsonb_build_object('id',o."Id",'code',o."LatexCode",'correct',o."IsCorrect") ORDER BY o."Order",o."Id") FROM public."QuestionOptions" o WHERE o."ProblemId"=p."Id")=$mw$[{"id":701,"code":"7","correct":false},{"id":702,"code":"9","correct":true},{"id":703,"code":"10","correct":false},{"id":704,"code":"12","correct":false}]$mw$::jsonb
 AND NOT EXISTS (SELECT 1 FROM public."CurriculumDraftItems" d WHERE d."SourceProblemId"=p."Id" AND d."EditorialStatus" NOT IN ('Published','Withdrawn'));
 GET DIAGNOSTICS n=ROW_COUNT;
 IF n<>1 THEN RAISE EXCEPTION 'Problem 178: stale or conflicting source; abort entire batch'; END IF;
END
$audit$;
COMMIT;
