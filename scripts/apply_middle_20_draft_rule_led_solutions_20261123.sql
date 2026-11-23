-- Exact-source and option-guarded pedagogical improvements for 20 middle-school drafts.
-- Atomic Draft-only transaction; no publication and no changes to correct options.
BEGIN;
DO $mw_middle20_draft_rules$
DECLARE affected integer;
BEGIN
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: جمع عددين صحيحين مختلفي الإشارة يتم بطرح القيمة المطلقة الأصغر من الأكبر، مع الاحتفاظ بإشارة الأكبر قيمةً مطلقة. البداية −7° والتغير +12°؛ نحسب 12 − 7 = 5، وإشارة العدد 12 موجبة. إذن الحرارة النهائية −7 + 12 = 5 درجات مئوية.', "DetailedSolutionEn"='Rule used: Adding signed integers with different signs means subtracting their absolute values and taking the sign of the number with larger magnitude. The temperature starts at −7°C and rises by 12°C. Since 12 − 7 = 5 and the rise is larger, −7 + 12 = +5°C.'
 WHERE "Id"=71 AND "TopicProposalId"=6 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='كانت الحرارة −7 درجات ثم ارتفعت 12 درجة. كم أصبحت؟' AND "QuestionTextEn"='The temperature was −7°C and rose by 12°C. What is it now?'
 AND "DetailedSolutionAr"='نبدأ من −7 درجات ثم نضيف ارتفاعاً مقداره 12 درجة، فنحصل على −7+12=5 درجات.' AND "DetailedSolutionEn"='Start at −7°C and add the 12°C rise, giving −7+12=5°C.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"−19"},{"Order":2,"IsCorrect":false,"LatexCode":"−5"},{"Order":3,"IsCorrect":true,"LatexCode":"5"},{"Order":4,"IsCorrect":false,"LatexCode":"19"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle DraftItem 71 changed or published: rollback'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: طرح عدد سالب يعادل إضافة موجبه؛ أي أ − (−ب) = أ + ب. لذلك −4 − (−9) = −4 + 9. نجمع عددين مختلفي الإشارة، فنطرح 9 − 4 = 5 ونأخذ الإشارة الموجبة لأن 9 أكبر بالقيمة المطلقة. إذن النتيجة = 5.', "DetailedSolutionEn"='Rule used: Subtracting a negative number is equivalent to adding its opposite: a − (−b) = a + b. So −4 − (−9) = −4 + 9. The positive magnitude 9 exceeds 4, and 9 − 4 = 5, giving result +5.'
 WHERE "Id"=72 AND "TopicProposalId"=6 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='احسب −4 − (−9).' AND "QuestionTextEn"='Evaluate −4 − (−9).'
 AND "DetailedSolutionAr"='طرح السالب يعادل الجمع: −4+9=5.' AND "DetailedSolutionEn"='Subtracting a negative is addition: −4+9=5.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"−13"},{"Order":2,"IsCorrect":true,"LatexCode":"5"},{"Order":3,"IsCorrect":false,"LatexCode":"−5"},{"Order":4,"IsCorrect":false,"LatexCode":"13"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle DraftItem 72 changed or published: rollback'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: عند ضرب عددين سالبين يكون الناتج موجباً، لأن إشارتي السالب تتلاشيان في الضرب. نكتب (−3) × (−8) = +(3 × 8). نضرب القيم المطلقة 3 × 8 = 24، وبما أن كلا العاملين سالبان فالنتيجة النهائية +24.', "DetailedSolutionEn"='Rule used: The product of two negative numbers is positive. First multiply their absolute values: |−3| × |−8| = 3 × 8 = 24. Because both factors are negative, their product is positive, so (−3) × (−8) = 24.'
 WHERE "Id"=73 AND "TopicProposalId"=6 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='احسب (−3)×(−8).' AND "QuestionTextEn"='Evaluate (−3)×(−8).'
 AND "DetailedSolutionAr"='حاصل ضرب عددين سالبين موجب؛ 3×8=24.' AND "DetailedSolutionEn"='The product of two negatives is positive; 3×8=24.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"−24"},{"Order":2,"IsCorrect":false,"LatexCode":"11"},{"Order":3,"IsCorrect":true,"LatexCode":"24"},{"Order":4,"IsCorrect":false,"LatexCode":"−11"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle DraftItem 73 changed or published: rollback'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='المبدأ المستخدم: في خط الأعداد تكون القيمة الأصغر إلى اليسار؛ والأعداد السالبة أصغر من الصفر، والعدد السالب الأكبر قيمةً مطلقة هو الأصغر. لذا −8 أصغر من −2، وكلاهما أقل من 0، بينما 4 موجب. الترتيب من الأصغر إلى الأكبر هو −8 < −2 < 0 < 4.', "DetailedSolutionEn"='Rule used: On the number line, values increase from left to right. Any negative number is below zero, and among negatives the number farther from zero has the smaller value. Thus −8 < −2, both precede 0, and +4 is greatest: −8 < −2 < 0 < 4.'
 WHERE "Id"=74 AND "TopicProposalId"=6 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='رتّب الأعداد −8، −2، 4، 0 تصاعدياً.' AND "QuestionTextEn"='Order −8, −2, 4, 0 from least to greatest.'
 AND "DetailedSolutionAr"='الأعداد السالبة أصغر من الصفر، والأبعد عنه إلى اليسار أصغر: −8 < −2 < 0 < 4.' AND "DetailedSolutionEn"='Negative integers lie below zero; farther left means smaller: −8 < −2 < 0 < 4.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"-2<-8<0<4"},{"Order":2,"IsCorrect":true,"LatexCode":"-8<-2<0<4"},{"Order":3,"IsCorrect":false,"LatexCode":"4<0<-2<-8"},{"Order":4,"IsCorrect":false,"LatexCode":"-8<0<-2<4"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle DraftItem 74 changed or published: rollback'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: القيمة المطلقة |أ| تمثل المسافة غير السالبة من العدد أ إلى الصفر، لذا |−13| = 13 و|5| = 5. بعد تطبيق القيمة المطلقة نحسب الفرق: 13 − 5 = 8. لا نحافظ على إشارة −13 داخل القيمة المطلقة لأن المسافة لا تكون سالبة.', "DetailedSolutionEn"='Rule used: Absolute value |a| is the nonnegative distance of a from zero. Therefore |−13| = 13 and |5| = 5. Apply the absolute values before subtraction: 13 − 5 = 8. The minus sign on −13 does not remain after taking absolute value.'
 WHERE "Id"=75 AND "TopicProposalId"=6 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='احسب |−13| − |5|.' AND "QuestionTextEn"='Evaluate |−13| − |5|.'
 AND "DetailedSolutionAr"='القيمة المطلقة تمثل المسافة عن الصفر؛ 13−5=8.' AND "DetailedSolutionEn"='Absolute values are distances from zero; 13−5=8.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"−8"},{"Order":2,"IsCorrect":true,"LatexCode":"8"},{"Order":3,"IsCorrect":false,"LatexCode":"18"},{"Order":4,"IsCorrect":false,"LatexCode":"−18"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle DraftItem 75 changed or published: rollback'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: لجمع كسرين نحتاج إلى مقام مشترك، ثم نجمع البسطين مع إبقاء المقام. المقامان 4 و2؛ نكتب 1/2 = 2/4. إذن −3/4 + 1/2 = −3/4 + 2/4 = (−3 + 2)/4 = −1/4. الإشارة سالبة لأن البسط الناتج −1.', "DetailedSolutionEn"='Rule used: Add fractions by converting to a common denominator and adding their numerators. Here use denominator 4: 1/2 = 2/4. Then −3/4 + 1/2 = −3/4 + 2/4 = (−3 + 2)/4 = −1/4. The final numerator is negative, so the result is −1/4.'
 WHERE "Id"=76 AND "TopicProposalId"=6 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='احسب −3/4 + 1/2.' AND "QuestionTextEn"='Evaluate −3/4 + 1/2.'
 AND "DetailedSolutionAr"='نحوّل النصف إلى 2/4 ثم −3/4+2/4=−1/4.' AND "DetailedSolutionEn"='Rewrite 1/2 as 2/4: −3/4+2/4=−1/4.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"1/4"},{"Order":2,"IsCorrect":false,"LatexCode":"−5/4"},{"Order":3,"IsCorrect":true,"LatexCode":"−1/4"},{"Order":4,"IsCorrect":false,"LatexCode":"−1/2"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle DraftItem 76 changed or published: rollback'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: عند طرح كسور ذات مقامات مختلفة نوحّد المقامات أولاً، ثم نطرح البسطين. لدينا −5/6 − 1/3، ونحوّل 1/3 إلى 2/6. بالتعويض: (−5 − 2)/6 = −7/6. يمكن التحقق تقريبياً: −0.833... − 0.333... = −1.166... وهو −7/6.', "DetailedSolutionEn"='Rule used: Subtract rational fractions by rewriting them over a common denominator. Since 1/3 = 2/6, we have −5/6 − 1/3 = −5/6 − 2/6 = (−5 − 2)/6 = −7/6. The negative result is less than −5/6, which checks the sign.'
 WHERE "Id"=77 AND "TopicProposalId"=6 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='احسب −5/6 − 1/3.' AND "QuestionTextEn"='Evaluate −5/6 − 1/3.'
 AND "DetailedSolutionAr"='1/3=2/6؛ لذا −5/6−2/6=−7/6.' AND "DetailedSolutionEn"='Since 1/3=2/6, −5/6−2/6=−7/6.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"−5/6"},{"Order":2,"IsCorrect":true,"LatexCode":"−7/6"},{"Order":3,"IsCorrect":false,"LatexCode":"−1/2"},{"Order":4,"IsCorrect":false,"LatexCode":"7/6"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle DraftItem 77 changed or published: rollback'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: لجمع عددين عشريين مختلفي الإشارة نطرح القيمة المطلقة الأصغر من الأكبر ونأخذ إشارة الأكبر. العددان −2.50 و+1.75؛ نحسب 2.50 − 1.75 = 0.75. لأن 2.50 أكبر من 1.75 ومصاحب لإشارة سالبة، تكون النتيجة −0.75.', "DetailedSolutionEn"='Rule used: When adding signed decimals with opposite signs, subtract their magnitudes and use the sign of the larger magnitude. Align decimal places: 2.50 − 1.75 = 0.75. Since |−2.50| > |+1.75|, the sum −2.50 + 1.75 = −0.75.'
 WHERE "Id"=78 AND "TopicProposalId"=6 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='ما ناتج −2.5 + 1.75؟' AND "QuestionTextEn"='What is −2.5 + 1.75?'
 AND "DetailedSolutionAr"='−2.50+1.75=−0.75.' AND "DetailedSolutionEn"='−2.50+1.75=−0.75.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"0.75"},{"Order":2,"IsCorrect":false,"LatexCode":"−1.25"},{"Order":3,"IsCorrect":false,"LatexCode":"−4.25"},{"Order":4,"IsCorrect":true,"LatexCode":"−0.75"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle DraftItem 78 changed or published: rollback'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: عند إضافة عدد أو طرحه من طرفي متباينة لا يتغير اتجاه إشارة المقارنة. من س + 5 < 12 نطرح 5 من الطرفين فنحصل على س < 12 − 5 = 7. العدد 7 نفسه غير مشمول لأن الإشارة صارمة، وكل عدد أصغر من 7 يحقق المتباينة.', "DetailedSolutionEn"='Rule used: Adding or subtracting the same number on both sides of an inequality preserves the inequality direction. Starting with x + 5 < 12, subtract 5: x < 12 − 5 = 7. The endpoint 7 is excluded because the inequality is strict.'
 WHERE "Id"=107 AND "TopicProposalId"=10 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='ما حل المتباينة $x+5<12$؟' AND "QuestionTextEn"='Solve the inequality $x+5<12$.'
 AND "DetailedSolutionAr"='نطرح 5 من الطرفين فتصبح $x<7$، دون تغيير اتجاه المتباينة.' AND "DetailedSolutionEn"='Subtract 5 from both sides to obtain $x<7$ without reversing the inequality.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"x<17"},{"Order":2,"IsCorrect":true,"LatexCode":"x<7"},{"Order":3,"IsCorrect":false,"LatexCode":"x>7"},{"Order":4,"IsCorrect":false,"LatexCode":"x\\le7"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle DraftItem 107 changed or published: rollback'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: في المتباينات الخطية، الجمع والطرح والقسمة على عدد موجب لا تغيّر اتجاه الإشارة. لدينا 3س − 4 ≥ 11؛ نضيف 4 للطرفين: 3س ≥ 15. نقسم على 3 الموجب فنحصل على س ≥ 5؛ تشمل مجموعة الحل العدد 5 وكل عدد أكبر منه.', "DetailedSolutionEn"='Rule used: Adding or subtracting a constant and dividing by a positive number preserve the inequality sign. From 3x − 4 ≥ 11, add 4 to obtain 3x ≥ 15. Divide both sides by positive 3: x ≥ 5. The endpoint 5 is included.'
 WHERE "Id"=108 AND "TopicProposalId"=10 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='أوجد جميع الأعداد الحقيقية التي تحقق المتباينة $3x-4\ge11$.' AND "QuestionTextEn"='Find all real values satisfying the inequality $3x-4\ge11$.'
 AND "DetailedSolutionAr"='نضيف 4 فنحصل على $3x\ge15$، ثم نقسم على 3 الموجب: $x\ge5$.' AND "DetailedSolutionEn"='Add 4 to get $3x\ge15$; divide by positive 3 to obtain $x\ge5$.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":true,"LatexCode":"x\\ge5"},{"Order":2,"IsCorrect":false,"LatexCode":"x>5"},{"Order":3,"IsCorrect":false,"LatexCode":"x\\le5"},{"Order":4,"IsCorrect":false,"LatexCode":"x\\ge7"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle DraftItem 108 changed or published: rollback'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: عند ضرب أو قسمة طرفي متباينة على عدد سالب يجب قلب اتجاهها. من −2س + 6 < 10 نطرح 6 فنحصل على −2س < 4. نقسم على −2 ونقلب < إلى >؛ إذن س > −2. التحقق: س = 0 يعطي 6 < 10، وهو ضمن الحل.', "DetailedSolutionEn"='Rule used: Dividing or multiplying both sides of an inequality by a negative number reverses its direction. From −2x + 6 < 10, subtract 6 to get −2x < 4. Divide by −2 and reverse < to >: x > −2. Check x = 0: 6 < 10 is true.'
 WHERE "Id"=109 AND "TopicProposalId"=10 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='أوجد مجموعة حل المتباينة الخطية $-2x+6<10$ مع الانتباه للإشارة.' AND "QuestionTextEn"='Find the solution set of the linear inequality $-2x+6<10$, considering the sign.'
 AND "DetailedSolutionAr"='بطرح 6 نحصل على $-2x<4$. نقسم على عدد سالب ونقلب الإشارة فنحصل على $x>-2$.' AND "DetailedSolutionEn"='Subtract 6: $-2x<4$. Dividing by negative 2 reverses the inequality, so $x>-2$.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"x<-2"},{"Order":2,"IsCorrect":false,"LatexCode":"x\\le-2"},{"Order":3,"IsCorrect":true,"LatexCode":"x>-2"},{"Order":4,"IsCorrect":false,"LatexCode":"x\\ge-2"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle DraftItem 109 changed or published: rollback'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: عند ضرب أو قسمة متباينة في عدد سالب تنعكس الإشارة. من 5 − س ≤ 2 نطرح 5 من الطرفين لنحصل على −س ≤ −3. نضرب في −1 مع قلب ≤ إلى ≥ فنجد س ≥ 3. التحقق عند س = 3: ‏5 − 3 = 2، فتتحقق المساواة.', "DetailedSolutionEn"='Rule used: Multiplying an inequality by a negative reverses the comparison sign. Starting with 5 − x ≤ 2, subtract 5: −x ≤ −3. Multiply by −1 and reverse ≤ to ≥, obtaining x ≥ 3. At x = 3, 5 − 3 = 2, so the included endpoint is valid.'
 WHERE "Id"=110 AND "TopicProposalId"=10 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='حدد جميع القيم الحقيقية التي تحقق المتباينة $5-x\le2$.' AND "QuestionTextEn"='Determine all real values satisfying the inequality $5-x\le2$.'
 AND "DetailedSolutionAr"='نطرح 5: $-x\le-3$، ثم نضرب في -1 ونقلب الإشارة: $x\ge3$.' AND "DetailedSolutionEn"='Subtract 5: $-x\le-3$. Multiply by -1 and reverse the sign: $x\ge3$.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"x\\le3"},{"Order":2,"IsCorrect":false,"LatexCode":"x>3"},{"Order":3,"IsCorrect":false,"LatexCode":"x<-3"},{"Order":4,"IsCorrect":true,"LatexCode":"x\\ge3"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle DraftItem 110 changed or published: rollback'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='المبدأ المستخدم: في تمثيل المتباينات على خط الأعداد، الدائرة المفتوحة تعني استبعاد قيمة الحد، والتظليل يميناً يعني قيماً أكبر منها. بما أن الدائرة مفتوحة عند −3 والتظليل إلى اليمين، فكل عدد س أكبر من −3 يحقق الوصف، ولا يشمل العدد −3 نفسه. إذن س > −3.', "DetailedSolutionEn"='Rule used: An open circle on a number line excludes its boundary value, while shading right selects numbers greater than that boundary. The endpoint −3 is open and the ray points right, so the interval is all x > −3. Equality is excluded.'
 WHERE "Id"=111 AND "TopicProposalId"=10 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='خط أعداد عليه دائرة مفتوحة عند -3 وتظليل إلى اليمين. ما المتباينة الممثلة؟' AND "QuestionTextEn"='A number line has an open circle at -3 and is shaded to the right. Which inequality is represented?'
 AND "DetailedSolutionAr"='الدائرة المفتوحة تستثني -3، والاتجاه يميناً يعني القيم الأكبر، لذلك $x>-3$.' AND "DetailedSolutionEn"='An open circle excludes -3, and shading right means greater values, so $x>-3$.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":true,"LatexCode":"x>-3"},{"Order":2,"IsCorrect":false,"LatexCode":"x\\ge-3"},{"Order":3,"IsCorrect":false,"LatexCode":"x<-3"},{"Order":4,"IsCorrect":false,"LatexCode":"x\\le-3"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle DraftItem 111 changed or published: rollback'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='المبدأ المستخدم: الدائرة المغلقة في خط الأعداد تعني شمول قيمة الحد، والتظليل جهة اليسار يعني القيم الأصغر منه. هنا الحد عند 4 مغلق والتظليل لليسار؛ إذن كل س ≤ 4 يحقق الوصف. نستخدم ≤ وليس < لأن العدد 4 نفسه ضمن الحل.', "DetailedSolutionEn"='Rule used: A filled endpoint on a number line includes its boundary, and shading left selects smaller values. With a filled circle at 4 and shading to the left, the solution is x ≤ 4. Use ≤ rather than < because x = 4 is included.'
 WHERE "Id"=112 AND "TopicProposalId"=10 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='خط أعداد عليه دائرة مغلقة عند 4 والتظليل يساراً. أي متباينة تمثل ذلك؟' AND "QuestionTextEn"='A number line shows a filled circle at 4 with shading to the left. Which inequality describes it?'
 AND "DetailedSolutionAr"='الدائرة المغلقة تشمل 4، والتظليل يساراً يعني الأصغر؛ الحل $x\le4$.' AND "DetailedSolutionEn"='The filled endpoint includes 4, and shading left represents smaller values: $x\le4$.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"x<4"},{"Order":2,"IsCorrect":true,"LatexCode":"x\\le4"},{"Order":3,"IsCorrect":false,"LatexCode":"x\\ge4"},{"Order":4,"IsCorrect":false,"LatexCode":"x>4"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle DraftItem 112 changed or published: rollback'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='المبدأ المستخدم: المتباينة المركبة −2 < س ≤ 2 تعني أن س أكبر من −2 تماماً، وفي الوقت نفسه أصغر من أو يساوي 2. نعد الأعداد الصحيحة فقط داخل المجال: −1 و0 و1 و2. العدد −2 مستبعد و2 مشمول؛ لذلك عدد الحلول الصحيحة 4.', "DetailedSolutionEn"='Rule used: A compound inequality requires both restrictions simultaneously. For −2 < x ≤ 2, exclude −2 and include 2. Enumerate only integer values in the interval: −1, 0, 1 and 2. There are exactly four integers satisfying both conditions.'
 WHERE "Id"=113 AND "TopicProposalId"=10 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='كم عدداً صحيحاً يحقق $-2<x\le2$؟' AND "QuestionTextEn"='How many integers satisfy $-2<x\le2$?'
 AND "DetailedSolutionAr"='الأعداد الصحيحة الممكنة هي -1، 0، 1، 2؛ إذن العدد 4.' AND "DetailedSolutionEn"='The valid integers are -1, 0, 1, and 2: four integers.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"3"},{"Order":2,"IsCorrect":false,"LatexCode":"5"},{"Order":3,"IsCorrect":true,"LatexCode":"4"},{"Order":4,"IsCorrect":false,"LatexCode":"2"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle DraftItem 113 changed or published: rollback'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='المبدأ المستخدم: المجال −2 ≤ س < 3 يشمل −2 ويستبعد 3، ونبحث فقط عن الأعداد الصحيحة. القيم هي −2 و−1 و0 و1 و2. نجمعها: (−2 + 2) + (−1 + 1) + 0 = 0. تلاشت الأزواج المتعاكسة، إذن مجموع الأعداد المطلوبة صفر.', "DetailedSolutionEn"='Rule used: For −2 ≤ x < 3, include −2 but exclude 3, and list integer members: −2, −1, 0, 1, 2. Add by pairing opposites: (−2 + 2) + (−1 + 1) + 0 = 0. Therefore the required integer sum is zero.'
 WHERE "Id"=114 AND "TopicProposalId"=10 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='ما مجموع الأعداد الصحيحة التي تحقق $-2\le x<3$؟' AND "QuestionTextEn"='What is the sum of integers satisfying $-2\le x<3$?'
 AND "DetailedSolutionAr"='الأعداد هي -2 و-1 و0 و1 و2، ومجموعها صفر لأن الموجبات والسوالب تتقابل.' AND "DetailedSolutionEn"='The integers are -2,-1,0,1,2; opposite pairs cancel, so the sum is zero.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"2"},{"Order":2,"IsCorrect":false,"LatexCode":"1"},{"Order":3,"IsCorrect":false,"LatexCode":"-1"},{"Order":4,"IsCorrect":true,"LatexCode":"0"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle DraftItem 114 changed or published: rollback'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: الكلفة الكلية = الرسم الثابت + سعر الكيلومتر × عدد الكيلومترات، ويجب ألا تتجاوز الميزانية. إذا كانت المسافة د، فإن 4 + 2د ≤ 18. بطرح 4: ‏2د ≤ 14؛ ثم نقسم على 2 فنجد د ≤ 7. أكبر عدد صحيح من الكيلومترات هو 7، وكلفته 4 + 2 × 7 = 18.', "DetailedSolutionEn"='Rule used: Total fare = fixed charge + per-kilometre rate × distance, and it must not exceed the budget. Let d be whole kilometres. Then 4 + 2d ≤ 18, so 2d ≤ 14 and d ≤ 7. Maximum whole distance is 7 km, costing exactly 18 units.'
 WHERE "Id"=115 AND "TopicProposalId"=10 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='أجرة سيارة 4 وحدات ثابتة و2 لكل كيلومتر. الميزانية 18 وحدة. ما أكبر عدد صحيح من الكيلومترات؟' AND "QuestionTextEn"='A taxi charges a fixed 4 units plus 2 per kilometer. With a budget of 18, what is the largest whole number of kilometers?'
 AND "DetailedSolutionAr"='تكتب المتباينة $4+2d\le18$، أي $2d\le14$ ثم $d\le7$؛ الحد الأعلى 7.' AND "DetailedSolutionEn"='The condition is $4+2d\le18$, giving $2d\le14$ and $d\le7$; the maximum is 7.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"6"},{"Order":2,"IsCorrect":true,"LatexCode":"7"},{"Order":3,"IsCorrect":false,"LatexCode":"8"},{"Order":4,"IsCorrect":false,"LatexCode":"9"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle DraftItem 115 changed or published: rollback'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: لتحديد الحد الأدنى من المحاولات نكتب متباينة تتضمن شرط «على الأقل». إذا كانت المحاولات الإضافية الصحيحة ن، نحتاج 56 + 5ن ≥ 75. نطرح 56: ‏5ن ≥ 19، فنقسم على 5: ‏ن ≥ 3.8. ن عدد صحيح، لذا نقرّب للأعلى إلى 4؛ وبذلك يصير المجموع 76.', "DetailedSolutionEn"='Rule used: ''At least'' translates to ≥, and the number of additional correct answers must be a whole number. Let n be the count: 56 + 5n ≥ 75. Then 5n ≥ 19 and n ≥ 19/5 = 3.8. Round up to the smallest feasible integer, n = 4; the resulting score is 76.'
 WHERE "Id"=116 AND "TopicProposalId"=10 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='مع طالب 56 نقطة، يحتاج 75 على الأقل، وكل سؤال جديد يضيف 5 نقاط. ما أقل عدد من الأسئلة الصحيحة الإضافية؟' AND "QuestionTextEn"='A student has 56 points and needs at least 75. Each additional correct answer adds 5. What is the minimum number needed?'
 AND "DetailedSolutionAr"='نحتاج $56+5n\ge75$؛ وبالتالي $n\ge19/5=3.8$، ولأن n عدد صحيح فأقله 4.' AND "DetailedSolutionEn"='We need $56+5n\ge75$; thus $n\ge3.8$, and the smallest whole number is 4.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":true,"LatexCode":"4"},{"Order":2,"IsCorrect":false,"LatexCode":"3"},{"Order":3,"IsCorrect":false,"LatexCode":"5"},{"Order":4,"IsCorrect":false,"LatexCode":"6"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle DraftItem 116 changed or published: rollback'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: الوزن الكلي = وزن الصندوق + عدد القطع × وزن القطعة، ويجب ألا يتجاوز 20 كغ. إذا كان عدد القطع ن، فنكتب 3 + 2ن ≤ 20. بطرح 3: ‏2ن ≤ 17، إذن ن ≤ 8.5. العدد الصحيح الأكبر المسموح هو 8، ووزنه الكلي 3 + 2 × 8 = 19 كغ.', "DetailedSolutionEn"='Rule used: Total load = box mass + item mass × item count and cannot exceed the 20 kg limit. Let n be the integer count: 3 + 2n ≤ 20. Subtract 3 and divide by 2: n ≤ 8.5. At most 8 whole items fit, weighing 3 + 2×8 = 19 kg in total.'
 WHERE "Id"=117 AND "TopicProposalId"=10 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='أقصى حمولة 20 كغ، والصندوق نفسه يزن 3 كغ وكل قطعة بداخله تزن 2 كغ. ما أكثر عدد من القطع؟' AND "QuestionTextEn"='A shipment has a 20 kg limit. The box weighs 3 kg and each item 2 kg. What is the most items it can carry?'
 AND "DetailedSolutionAr"='من $3+2n\le20$ نحصل على $n\le8.5$؛ أكبر عدد صحيح مسموح هو 8.' AND "DetailedSolutionEn"='The inequality $3+2n\le20$ gives $n\le8.5$, so at most 8 whole items fit.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"9"},{"Order":2,"IsCorrect":false,"LatexCode":"7"},{"Order":3,"IsCorrect":true,"LatexCode":"8"},{"Order":4,"IsCorrect":false,"LatexCode":"10"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle DraftItem 117 changed or published: rollback'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='المبدأ المستخدم: في ترجمة العبارات إلى متباينات، «على الأكثر» تعني أن القيمة قد تساوي الحد أو تكون أصغر منه، أي ≤. إذا كان الحد الحراري −5 درجات والمتغير T يمثل الحرارة، فالعلاقة الصحيحة T ≤ −5. مثال: −6 يحقق الشرط، و−5 يحققه بالمساواة، أما −4 فلا يحققه.', "DetailedSolutionEn"='Rule used: The phrase ''at most'' means less than or equal to, represented by ≤. If temperature is T and the stated maximum is −5, the inequality is T ≤ −5. Values −6 and −5 satisfy it, but −4 does not.'
 WHERE "Id"=118 AND "TopicProposalId"=10 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='تعني عبارة «درجة الحرارة على الأكثر -5» أي متباينة إذا رمزنا للحرارة بـ $T$؟' AND "QuestionTextEn"='Which inequality expresses ''the temperature is at most -5'' using $T$?'
 AND "DetailedSolutionAr"='عبارة على الأكثر تعني أصغر من أو يساوي؛ بالتالي $T\le-5$.' AND "DetailedSolutionEn"='At most means less than or equal to; therefore $T\le-5$.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"T\\ge-5"},{"Order":2,"IsCorrect":false,"LatexCode":"T>-5"},{"Order":3,"IsCorrect":false,"LatexCode":"T<-5"},{"Order":4,"IsCorrect":true,"LatexCode":"T\\le-5"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle DraftItem 118 changed or published: rollback'; END IF;
END $mw_middle20_draft_rules$;
COMMIT;
