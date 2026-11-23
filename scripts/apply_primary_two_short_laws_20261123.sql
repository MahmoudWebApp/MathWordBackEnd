-- Last two brief elementary explanations; exact-match, transactionally guarded. Apply once.
BEGIN;
DO $mw_two$
DECLARE n int;
BEGIN
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: لمقارنة كسر بعدد عشري نحول الاثنين إلى تمثيل عددي واحد. نحسب قيمة الكسر بالقسمة: 3 ÷ 5 = 0.6. العدد الآخر يساوي 0.6 أيضاً، لذلك العلاقة الصحيحة 0.6 = 3/5. التحقق: 0.6 × 5 = 3.', "DetailedSolutionEn"='Rule used: Compare a fraction with a decimal by converting both to the same representation. Divide 3 by 5 to obtain 0.6. Since the other value is also 0.6, the correct comparison is 0.6 = 3/5. Check: 0.6 × 5 = 3.' WHERE "Id"=422 AND "StageId"=1 AND "CategoryId"=21
 AND "QuestionTextAr"='أي علاقة صحيحة بين $0.6$ و$\frac35$؟' AND "QuestionTextEn"='Which comparison of $0.6$ and $\frac35$ is correct?'
 AND "DetailedSolutionAr"='نحوّل $\frac35$ إلى عدد عشري بالقسمة: $3\div5=0.6$، إذن العددان متساويان.' AND "DetailedSolutionEn"='Dividing 3 by 5 gives 0.6, so both values are equal.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=422 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=422 AND o."Id"=1677 AND o."IsCorrect" AND o."LatexCode"='0.6=\frac35');
 GET DIAGNOSTICS n = ROW_COUNT;
 IF n<>1 THEN RAISE EXCEPTION 'Brief primary explanation 422 changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: نسبة المشاركين المئوية = عدد المشاركين ÷ العدد الكلي × 100%. لدينا 12 مشاركاً من 48 طالباً؛ نحسب 12 ÷ 48 = 1/4 = 0.25، ثم 0.25 × 100% = 25%. التحقق: ربع 48 = 12 طالباً.', "DetailedSolutionEn"='Rule used: Participation percentage = participating pupils ÷ total pupils × 100%. With 12 out of 48, calculate 12 ÷ 48 = 1/4 = 0.25. Then 0.25 × 100% = 25%. Check: one quarter of 48 is 12 pupils.' WHERE "Id"=476 AND "StageId"=1 AND "CategoryId"=21
 AND "QuestionTextAr"='في صف مؤلف من 48 طالباً شارك 12 في مسابقة. ما نسبة المشاركين؟' AND "QuestionTextEn"='Twelve of 48 pupils in a class entered a competition. What percentage entered?'
 AND "DetailedSolutionAr"='النسبة $\frac{12}{48}=\frac14=0.25$؛ أي $25\%$.' AND "DetailedSolutionEn"='The proportion is $\frac{12}{48}=\frac14=0.25$, or $25\%$.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=476 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=476 AND o."Id"=1894 AND o."IsCorrect" AND o."LatexCode"='25\%');
 GET DIAGNOSTICS n = ROW_COUNT;
 IF n<>1 THEN RAISE EXCEPTION 'Brief primary explanation 476 changed; abort'; END IF;
END $mw_two$;
COMMIT;
