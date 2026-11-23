-- MathWorld primary: 20 source-and-option-guarded law-first editorial DraftItem explanations.
-- Draft-only, atomic transaction; does not publish or alter any answer/learner data.
BEGIN;
DO $mw_primary20_draft_rules$
DECLARE affected integer;
BEGIN
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: قيمة الرقم في العدد = الرقم × قيمة منزلته. في العدد 462,915 يقع الرقم 6 في منزلة عشرات الألوف، وقيمة هذه المنزلة 10,000. لذلك قيمة الرقم 6 هي 6 × 10,000 = 60,000. لا نخلط بينها وبين منزلتي الألوف أو المئات.', "DetailedSolutionEn"='Rule used: Place value = digit × value of its position. In 462,915, the digit 6 occupies the ten-thousands position. Thus its value is 6 × 10,000 = 60,000. It represents sixty thousand, not six thousand or six hundred.'
 WHERE "Id"=63 AND "TopicProposalId"=5 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='في العدد 462,915، ما قيمة الرقم 6؟' AND "QuestionTextEn"='In 462,915, what is the value of the digit 6?'
 AND "DetailedSolutionAr"='الرقم 6 في منزلة عشرات الألوف؛ لذلك قيمته 6×10,000=60,000.' AND "DetailedSolutionEn"='The digit 6 is in the ten-thousands place, so its value is 6×10,000=60,000.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"6,000"},{"Order":2,"IsCorrect":false,"LatexCode":"600"},{"Order":3,"IsCorrect":true,"LatexCode":"60,000"},{"Order":4,"IsCorrect":false,"LatexCode":"600,000"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Primary DraftItem 63 changed: rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='المبدأ المستخدم: كتابة العدد بالصورة التحليلية تعني جمع قيم المنازل المختلفة مع الحفاظ على أصفار المنازل الخالية. نجمع 70,000 + 500 + 40 + 3؛ تمثل 70,000 عشرات الألوف، و500 المئات، و40 العشرات، و3 الآحاد. الناتج 70,543.', "DetailedSolutionEn"='Rule used: Expanded form adds the values of each place to reconstruct a number. Add 70,000 (ten-thousands) + 500 (hundreds) + 40 (tens) + 3 (ones). The thousands place is zero. The reconstructed number is 70,543.'
 WHERE "Id"=64 AND "TopicProposalId"=5 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='ما العدد الناتج من 70,000 + 500 + 40 + 3؟' AND "QuestionTextEn"='Which number equals 70,000 + 500 + 40 + 3?'
 AND "DetailedSolutionAr"='نجمع قيم المنازل: 70,000+500+40+3=70,543.' AND "DetailedSolutionEn"='Add the place values: 70,000+500+40+3=70,543.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"75,043"},{"Order":2,"IsCorrect":true,"LatexCode":"70,543"},{"Order":3,"IsCorrect":false,"LatexCode":"70,453"},{"Order":4,"IsCorrect":false,"LatexCode":"70,053"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Primary DraftItem 64 changed: rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='المبدأ المستخدم: لمقارنة عددين لهما عدد الخانات نفسه، نبدأ من أكبر منزلة وننتقل إلى اليمين حتى أول خانة مختلفة. العددان 58,209 و58,290 يتفقان في عشرات الألوف والألوف والمئات؛ لكن منزلة العشرات 0 في الأول و9 في الثاني. بما أن 0 < 9 إذن 58,209 < 58,290.', "DetailedSolutionEn"='Rule used: Compare equal-length whole numbers from the highest place value to the first different digit. Both 58,209 and 58,290 share the same ten-thousands, thousands and hundreds digits. Their tens digits are 0 and 9 respectively; since 0 < 9, we have 58,209 < 58,290.'
 WHERE "Id"=65 AND "TopicProposalId"=5 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='اختر الرمز الصحيح الذي يملأ المربع: 58,209 □ 58,290.' AND "QuestionTextEn"='Choose the correct comparison symbol: 58,209 □ 58,290.'
 AND "DetailedSolutionAr"='تتساوى المنازل حتى العشرات؛ 0 عشرات أصغر من 9 عشرات، لذا 58,209 < 58,290.' AND "DetailedSolutionEn"='The earlier digits match; 0 tens is less than 9 tens, so 58,209 < 58,290.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":">"},{"Order":2,"IsCorrect":false,"LatexCode":"="},{"Order":3,"IsCorrect":true,"LatexCode":"<"},{"Order":4,"IsCorrect":false,"LatexCode":"≥"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Primary DraftItem 65 changed: rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: التقريب لأقرب مئة يعتمد على رقم العشرات؛ إذا كان أقل من 5 نبقي رقم المئات ونحوّل العشرات والآحاد إلى صفر. العدد 37,648 ورقم عشراته 4 وهو أصغر من 5. لذلك أقرب مئة = 37,600. الفرق بينهما 48، وهو أقل من نصف المئة.', "DetailedSolutionEn"='Rule used: To round to the nearest hundred, inspect the tens digit. If it is below 5, keep the hundreds digit and replace tens and ones with zeros. For 37,648 the tens digit is 4, so the rounded number is 37,600. The difference is 48, less than 50.'
 WHERE "Id"=66 AND "TopicProposalId"=5 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='قرّب العدد 37,648 إلى أقرب مئة.' AND "QuestionTextEn"='Round 37,648 to the nearest hundred.'
 AND "DetailedSolutionAr"='رقم العشرات 4 أصغر من 5؛ تبقى المئات كما هي، فيكون 37,600.' AND "DetailedSolutionEn"='The tens digit is 4, less than 5; keep the hundreds digit and obtain 37,600.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"37,700"},{"Order":2,"IsCorrect":true,"LatexCode":"37,600"},{"Order":3,"IsCorrect":false,"LatexCode":"37,650"},{"Order":4,"IsCorrect":false,"LatexCode":"38,000"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Primary DraftItem 66 changed: rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: عند التقريب لأقرب ألف ننظر إلى رقم المئات؛ إذا كان 5 أو أكثر نزيد منزلة الألوف واحدة ونصفّر المنازل الأصغر. في 9,650 رقم المئات 6، لذا نرفع 9 آلاف إلى 10 آلاف. الناتج 10,000 وليس 9,000.', "DetailedSolutionEn"='Rule used: To round to the nearest thousand, inspect the hundreds digit. If it is 5 or more, increase the thousands count by one and set lower digits to zero. In 9,650 the hundreds digit is 6, so 9,650 rounds up to 10,000.'
 WHERE "Id"=67 AND "TopicProposalId"=5 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='قرّب 9,650 إلى أقرب ألف.' AND "QuestionTextEn"='Round 9,650 to the nearest thousand.'
 AND "DetailedSolutionAr"='رقم المئات 6 يساوي 5 أو يزيد عليه؛ نقرّب 9,650 إلى 10,000.' AND "DetailedSolutionEn"='The hundreds digit is 6, so 9,650 rounds up to 10,000.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"9,000"},{"Order":2,"IsCorrect":false,"LatexCode":"9,600"},{"Order":3,"IsCorrect":true,"LatexCode":"10,000"},{"Order":4,"IsCorrect":false,"LatexCode":"9,700"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Primary DraftItem 67 changed: rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='المبدأ المستخدم: للتقدير بالتقريب أولاً نقرب كل حد إلى المنزلة المطلوبة ثم ننفذ العملية على القيم المقربة. إلى أقرب مئة: 392 تقرب إلى 400 لأن العشرات 9، و614 تقرب إلى 600 لأن العشرات 1. بالتالي تقدير المجموع 400 + 600 = 1,000.', "DetailedSolutionEn"='Rule used: To estimate a sum by rounding, round each addend to the requested place and then add the rounded values. The nearest hundreds are 392 ≈ 400 and 614 ≈ 600. Therefore the estimated total is 400 + 600 = 1,000, rather than the exact sum.'
 WHERE "Id"=68 AND "TopicProposalId"=5 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='لتقدير 392 + 614 بالتقريب إلى أقرب مئة لكل عدد، ما الناتج؟' AND "QuestionTextEn"='Estimate 392 + 614 by rounding each number to the nearest hundred.'
 AND "DetailedSolutionAr"='392≈400 و614≈600؛ المجموع التقديري 1,000.' AND "DetailedSolutionEn"='392≈400 and 614≈600; the estimate is 1,000.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"900"},{"Order":2,"IsCorrect":false,"LatexCode":"1,100"},{"Order":3,"IsCorrect":false,"LatexCode":"1,006"},{"Order":4,"IsCorrect":true,"LatexCode":"1,000"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Primary DraftItem 68 changed: rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='المبدأ المستخدم: لتقدير الطرح نقرب المطروح منه والمطروح إلى المنزلة نفسها ثم نطرح القيم المقربة. عند التقريب لأقرب مئة: 1,508 ≈ 1,500 و692 ≈ 700. لذلك الفرق التقديري = 1,500 − 700 = 800. يجب تقريب كل عدد على حدة قبل طرحه.', "DetailedSolutionEn"='Rule used: To estimate subtraction, round both numbers to the same requested place value, then subtract. Here 1,508 ≈ 1,500 and 692 ≈ 700 to the nearest hundred. Estimated difference = 1,500 − 700 = 800. We round the operands before calculating the estimate.'
 WHERE "Id"=69 AND "TopicProposalId"=5 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='قدّر 1,508 − 692 بتقريب كل عدد لأقرب مئة.' AND "QuestionTextEn"='Estimate 1,508 − 692 by rounding each number to the nearest hundred.'
 AND "DetailedSolutionAr"='1,508≈1,500 و692≈700؛ الفرق التقديري 800.' AND "DetailedSolutionEn"='1,508≈1,500 and 692≈700, giving an estimated difference of 800.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"900"},{"Order":2,"IsCorrect":true,"LatexCode":"800"},{"Order":3,"IsCorrect":false,"LatexCode":"700"},{"Order":4,"IsCorrect":false,"LatexCode":"816"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Primary DraftItem 69 changed: rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: قيمة مجموعات متساوية = عدد المجموعات × عدد العناصر في المجموعة الواحدة. لدينا 40 مجموعة، في كل منها 100 وحدة، لذلك المجموع = 40 × 100 = 4,000 وحدة. ويمكن التحقق: أربع مجموعات من 1,000 تساوي أيضاً 4,000.', "DetailedSolutionEn"='Rule used: Total quantity in equal groups = number of groups × units per group. There are 40 groups of 100, so the total is 40 × 100 = 4,000 units. As a check, forty hundreds are the same as four thousands.'
 WHERE "Id"=70 AND "TopicProposalId"=5 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='كم يساوي أربعون مجموعة من مئة؟' AND "QuestionTextEn"='What is the total value of forty groups of one hundred?'
 AND "DetailedSolutionAr"='أربعون مجموعة من مئة تساوي 40×100=4,000 وحدة.' AND "DetailedSolutionEn"='Forty groups of one hundred give 40×100=4,000 units.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"400"},{"Order":2,"IsCorrect":false,"LatexCode":"40,000"},{"Order":3,"IsCorrect":true,"LatexCode":"4,000"},{"Order":4,"IsCorrect":false,"LatexCode":"440"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Primary DraftItem 70 changed: rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: عند جمع أطوال يجب أن تكون الوحدات متطابقة أولاً. طول الحبل الأول 235 سم والثاني 85 سم، وكلاهما بالسنتيمتر، لذلك يمكن الجمع مباشرة: الطول الكلي = 235 + 85 = 320 سم. لا نحول الوحدات لأنهما موحدتان أصلاً.', "DetailedSolutionEn"='Rule used: Add lengths only after expressing them in the same unit. Both rope lengths are in centimetres, so total length = 235 cm + 85 cm = 320 cm. No conversion is needed because the units already match.'
 WHERE "Id"=95 AND "TopicProposalId"=9 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='حبل طوله 235 سم وصلناه بحبل آخر طوله 85 سم. كم صار الطول الكلي بالسنتيمتر؟' AND "QuestionTextEn"='A 235 cm rope is joined to an 85 cm rope. What is the total length in centimeters?'
 AND "DetailedSolutionAr"='نجمع الطولين بنفس الوحدة: 235 + 85 = 320 سم.' AND "DetailedSolutionEn"='Both lengths are in centimeters: 235 + 85 = 320 cm.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"310"},{"Order":2,"IsCorrect":true,"LatexCode":"320"},{"Order":3,"IsCorrect":false,"LatexCode":"300"},{"Order":4,"IsCorrect":false,"LatexCode":"420"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Primary DraftItem 95 changed: rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: 1 متر = 100 سم، وعند مقارنة طولين نوحّد الوحدة ثم نطرح الأصغر من الأكبر. نحول 1.4 متر إلى 1.4 × 100 = 140 سم. نقارن مع 135 سم؛ الفرق = 140 − 135 = 5 سم. إذن الشريط الأول أطول بخمسة سنتيمترات.', "DetailedSolutionEn"='Rule used: Convert lengths to the same unit before comparing; 1 metre = 100 centimetres. The first ribbon is 1.4 × 100 = 140 cm long. Subtract the second ribbon''s 135 cm: 140 − 135 = 5 cm. The first ribbon is 5 cm longer.'
 WHERE "Id"=96 AND "TopicProposalId"=9 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='شريطان طولاهما 1.4 متر و135 سم. كم يزيد طول الأول بالسنتيمتر؟' AND "QuestionTextEn"='Two ribbons measure 1.4 meters and 135 cm. How many centimeters longer is the first?'
 AND "DetailedSolutionAr"='نحوّل 1.4 متر إلى 140 سم، ثم 140 - 135 = 5 سم.' AND "DetailedSolutionEn"='Convert 1.4 meters to 140 cm; the difference is 140 - 135 = 5 cm.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":true,"LatexCode":"5"},{"Order":2,"IsCorrect":false,"LatexCode":"15"},{"Order":3,"IsCorrect":false,"LatexCode":"35"},{"Order":4,"IsCorrect":false,"LatexCode":"50"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Primary DraftItem 96 changed: rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: عدد القطع المتساوية = طول الحبل الكلي ÷ طول القطعة الواحدة بعد توحيد الوحدات. نحول 12 متراً إلى 12 × 100 = 1,200 سم. طول القطعة 75 سم؛ العدد = 1,200 ÷ 75 = 16 قطعة. التحقق: 16 × 75 = 1,200 سم دون هدر.', "DetailedSolutionEn"='Rule used: Number of equal pieces = total length ÷ length per piece, after converting to a common unit. Twelve metres = 1,200 cm. Each piece is 75 cm, so 1,200 ÷ 75 = 16 complete pieces. Check: 16 × 75 = 1,200 cm with no waste.'
 WHERE "Id"=97 AND "TopicProposalId"=9 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='من حبل طوله 12 متراً نريد قطعاً طول كل منها 75 سم، دون هدر. كم قطعة نحصل؟' AND "QuestionTextEn"='A 12-meter rope is cut into 75 cm pieces with no waste. How many pieces are made?'
 AND "DetailedSolutionAr"='12 متراً تساوي 1200 سم، وعدد القطع 1200 ÷ 75 = 16.' AND "DetailedSolutionEn"='12 meters is 1200 cm; divide 1200 by 75 to obtain 16 pieces.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"12"},{"Order":2,"IsCorrect":false,"LatexCode":"18"},{"Order":3,"IsCorrect":true,"LatexCode":"16"},{"Order":4,"IsCorrect":false,"LatexCode":"24"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Primary DraftItem 97 changed: rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: 1 كغ = 1,000 غ، والكتلة المتبقية = الكتلة الأصلية − الكتلة المستخدمة. الكيس يحتوي 2 كغ و750 غ؛ أي 2 × 1,000 + 750 = 2,750 غ. نطرح 900 غ المستخدمة: 2,750 − 900 = 1,850 غراماً متبقياً.', "DetailedSolutionEn"='Rule used: Convert mass to one unit, then subtract the amount used; 1 kg = 1,000 g. The initial bag contains 2 × 1,000 + 750 = 2,750 g. After using 900 g, the remaining amount is 2,750 − 900 = 1,850 g.'
 WHERE "Id"=98 AND "TopicProposalId"=9 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='كيس أرز وزنه 2 كغ و750 غ. استُخدم منه 900 غ. كم غراماً تبقى؟' AND "QuestionTextEn"='A bag has 2 kg 750 g of rice. After using 900 g, how many grams remain?'
 AND "DetailedSolutionAr"='نحوّل الكتلة إلى غرامات: 2750 - 900 = 1850 غراماً.' AND "DetailedSolutionEn"='Convert to grams: 2750 - 900 = 1850 g.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"1950"},{"Order":2,"IsCorrect":true,"LatexCode":"1850"},{"Order":3,"IsCorrect":false,"LatexCode":"1750"},{"Order":4,"IsCorrect":false,"LatexCode":"900"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Primary DraftItem 98 changed: rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: عدد الأكياس الكاملة = الكتلة الكلية ÷ كتلة الكيس بعد توحيد الوحدات. لدينا 1.5 كغ = 1.5 × 1,000 = 1,500 غ. سعة الكيس 250 غ، لذلك العدد = 1,500 ÷ 250 = 6 أكياس كاملة. التحقق: 6 × 250 = 1,500 غ.', "DetailedSolutionEn"='Rule used: Full bag count = total mass ÷ mass per bag, using one unit. Convert 1.5 kg to 1.5 × 1,000 = 1,500 g. Each bag contains 250 g, so 1,500 ÷ 250 = 6 full bags. Check: 6 × 250 = 1,500 g.'
 WHERE "Id"=99 AND "TopicProposalId"=9 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='لدينا 1.5 كغ من المكسرات، نعبئها في أكياس وزن كل منها 250 غ. كم كيساً كاملاً؟' AND "QuestionTextEn"='We pack 1.5 kg of nuts into 250 g bags. How many full bags can we make?'
 AND "DetailedSolutionAr"='1.5 كغ = 1500 غ، ثم 1500 ÷ 250 = 6 أكياس.' AND "DetailedSolutionEn"='1.5 kg = 1500 g, then 1500 ÷ 250 = 6 full bags.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"4"},{"Order":2,"IsCorrect":false,"LatexCode":"5"},{"Order":3,"IsCorrect":false,"LatexCode":"8"},{"Order":4,"IsCorrect":true,"LatexCode":"6"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Primary DraftItem 99 changed: rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: 1 لتر = 1,000 ملليلتر، وعدد الأكواب الكاملة = الحجم الكلي ÷ سعة الكوب. نحول 2 لتر إلى 2,000 مل، ثم نحسب 2,000 ÷ 250 = 8 أكواب. التحقق: 8 × 250 = 2,000 مل، أي أن الماء يكفي تماماً.', "DetailedSolutionEn"='Rule used: One litre equals 1,000 millilitres, and full cup count = total volume ÷ capacity per cup. Two litres = 2,000 mL. Divide by 250 mL per cup: 2,000 ÷ 250 = 8 cups. Check: 8 × 250 = 2,000 mL.'
 WHERE "Id"=100 AND "TopicProposalId"=9 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='زجاجة فيها 2 لتر ماء. كم كوباً سعة 250 مل يمكن ملؤه بالكامل؟' AND "QuestionTextEn"='A bottle contains 2 liters of water. How many 250 mL cups can it completely fill?'
 AND "DetailedSolutionAr"='2 لتر = 2000 مل، و2000 ÷ 250 = 8 أكواب.' AND "DetailedSolutionEn"='2 liters = 2000 mL; 2000 ÷ 250 = 8 cups.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"6"},{"Order":2,"IsCorrect":true,"LatexCode":"8"},{"Order":3,"IsCorrect":false,"LatexCode":"10"},{"Order":4,"IsCorrect":false,"LatexCode":"12"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Primary DraftItem 100 changed: rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: الحجم المتبقي = الحجم الأصلي − الحجم المصبوب، بعد توحيد الوحدات. نبدأ بـ2 لتر عصير ونحوّله إلى 2 × 1,000 = 2,000 مل. بعد سكب 350 مل نحسب 2,000 − 350 = 1,650 مل. وهكذا يبقى في الوعاء 1,650 مل.', "DetailedSolutionEn"='Rule used: Remaining volume = initial volume − poured volume, after converting to a common unit. The starting 2 litres are 2 × 1,000 = 2,000 mL. Subtract the poured 350 mL: 2,000 − 350 = 1,650 mL remaining.'
 WHERE "Id"=101 AND "TopicProposalId"=9 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='وعاء يحوي 2 لتر عصير، صببنا منه 350 مل. كم مل بقي في الوعاء؟' AND "QuestionTextEn"='A container has 2 liters of juice. After pouring 350 mL, how much remains in mL?'
 AND "DetailedSolutionAr"='نحوّل 2 لتر إلى 2000 مل، ثم نطرح 350 فيتبقى 1650 مل.' AND "DetailedSolutionEn"='Convert 2 liters to 2000 mL and subtract 350 to get 1650 mL.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"1350"},{"Order":2,"IsCorrect":false,"LatexCode":"1750"},{"Order":3,"IsCorrect":true,"LatexCode":"1650"},{"Order":4,"IsCorrect":false,"LatexCode":"2350"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Primary DraftItem 101 changed: rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: عند جمع سعتين نوحّد الوحدات أولاً؛ 1 لتر = 1,000 مل. نحول 0.8 لتر إلى 0.8 × 1,000 = 800 مل. نجمع مع 750 مل ماء: 750 + 800 = 1,550 مل. المجموع يساوي 1.55 لتر، لكن المطلوب بالمليلتر.', "DetailedSolutionEn"='Rule used: Combine liquid volumes only after converting to a common unit; 1 litre = 1,000 mL. Convert 0.8 litres to 0.8 × 1,000 = 800 mL. Add 750 mL + 800 mL = 1,550 mL. Report millilitres as requested.'
 WHERE "Id"=102 AND "TopicProposalId"=9 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='مزجنا 750 مل ماء مع 0.8 لتر عصير. كم مل يبلغ حجم الخليط؟' AND "QuestionTextEn"='We combine 750 mL water with 0.8 liters of juice. What is the total in mL?'
 AND "DetailedSolutionAr"='0.8 لتر = 800 مل، والمجموع 750 + 800 = 1550 مل.' AND "DetailedSolutionEn"='0.8 liters is 800 mL, so 750 + 800 = 1550 mL.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":true,"LatexCode":"1550"},{"Order":2,"IsCorrect":false,"LatexCode":"1500"},{"Order":3,"IsCorrect":false,"LatexCode":"830"},{"Order":4,"IsCorrect":false,"LatexCode":"1750"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Primary DraftItem 102 changed: rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='المبدأ المستخدم: وقت الوصول = وقت المغادرة + مدة الرحلة، مع تحويل كل 60 دقيقة إلى ساعة. المغادرة 09:45 والمدة ساعة و35 دقيقة. نضيف ساعة أولاً فنصل إلى 10:45، ثم 35 دقيقة: 45 + 35 = 80 دقيقة، أي ساعة و20 دقيقة. لذلك وقت الوصول 11:20.', "DetailedSolutionEn"='Rule used: Arrival time = departure time + journey duration, carrying each full 60 minutes into an hour. Start at 09:45. Add one hour to get 10:45, then 35 minutes: 45 + 35 = 80 minutes, which carries one hour and leaves 20 minutes. Arrival is 11:20.'
 WHERE "Id"=103 AND "TopicProposalId"=9 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='غادر قطار الساعة 09:45 واستغرقت الرحلة ساعة و35 دقيقة. ما وقت الوصول؟' AND "QuestionTextEn"='A train leaves at 09:45 and travels for 1 hour 35 minutes. When does it arrive?'
 AND "DetailedSolutionAr"='نضيف ساعة إلى 09:45 فتصبح 10:45، ثم 35 دقيقة فتصبح 11:20.' AND "DetailedSolutionEn"='Add 1 hour to 09:45 to reach 10:45; adding 35 minutes gives 11:20.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"\\text{10:20}"},{"Order":2,"IsCorrect":false,"LatexCode":"\\text{11:10}"},{"Order":3,"IsCorrect":true,"LatexCode":"\\text{11:20}"},{"Order":4,"IsCorrect":false,"LatexCode":"\\text{11:40}"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Primary DraftItem 103 changed: rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='المبدأ المستخدم: مدة النشاط = وقت النهاية − وقت البداية. النشاط من 14:10 حتى 15:05؛ نحسب من 14:10 إلى 15:00 = 50 دقيقة، ثم من 15:00 إلى 15:05 = 5 دقائق. المجموع = 50 + 5 = 55 دقيقة. نراعي انتقال الساعة بدلاً من طرح الدقائق فقط.', "DetailedSolutionEn"='Rule used: Duration = finishing time − starting time. From 14:10 to 15:00 is 50 minutes, and from 15:00 to 15:05 is another 5 minutes. Add 50 + 5 = 55 minutes. This correctly handles the hour boundary.'
 WHERE "Id"=104 AND "TopicProposalId"=9 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='بدأ نشاط الساعة 14:10 وانتهى الساعة 15:05. كم دقيقة استمر؟' AND "QuestionTextEn"='An activity starts at 14:10 and ends at 15:05. How many minutes does it last?'
 AND "DetailedSolutionAr"='من 14:10 إلى 15:00 خمسون دقيقة، وإلى 15:05 خمس دقائق أخرى؛ المجموع 55.' AND "DetailedSolutionEn"='From 14:10 to 15:00 is 50 minutes, plus 5 minutes to 15:05: 55 total.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"45"},{"Order":2,"IsCorrect":false,"LatexCode":"50"},{"Order":3,"IsCorrect":false,"LatexCode":"65"},{"Order":4,"IsCorrect":true,"LatexCode":"55"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Primary DraftItem 104 changed: rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: 1 كيلومتر = 1,000 متر، لذلك للتحويل من الكيلومترات إلى الأمتار نضرب في 1,000. طول المضمار 3.25 كم؛ نحسب 3.25 × 1,000 = 3,250 متراً. انتقلنا إلى وحدة أصغر، لذلك العدد أصبح أكبر بما يتناسب مع عامل التحويل.', "DetailedSolutionEn"='Rule used: One kilometre equals 1,000 metres. To convert kilometres to metres, multiply by 1,000. A 3.25 km running course therefore measures 3.25 × 1,000 = 3,250 m. The numerical value increases because metres are a smaller unit.'
 WHERE "Id"=105 AND "TopicProposalId"=9 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='طول مضمار 3.25 كيلومتر. كم متراً يساوي ذلك؟' AND "QuestionTextEn"='A running course is 3.25 kilometers long. How many meters is that?'
 AND "DetailedSolutionAr"='كل كيلومتر 1000 متر، لذا 3.25 × 1000 = 3250 متر.' AND "DetailedSolutionEn"='Each kilometer is 1000 meters, so 3.25 × 1000 = 3250 meters.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"325"},{"Order":2,"IsCorrect":true,"LatexCode":"3250"},{"Order":3,"IsCorrect":false,"LatexCode":"32500"},{"Order":4,"IsCorrect":false,"LatexCode":"30025"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Primary DraftItem 105 changed: rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: 1 سنتيمتر = 10 مليمترات، لذا نحول من السنتيمترات إلى المليمترات بضرب الطول في 10. عندنا 18 سم، فنحسب 18 × 10 = 180 مم. التحقق: 180 ÷ 10 = 18 سم، لذلك التحويل متسق.', "DetailedSolutionEn"='Rule used: One centimetre equals 10 millimetres. Convert centimetres to millimetres by multiplying by 10. For 18 cm, calculate 18 × 10 = 180 mm. Check the inverse conversion: 180 ÷ 10 = 18 cm.'
 WHERE "Id"=106 AND "TopicProposalId"=9 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='ما طول 18 سنتيمتراً بالمليمتر؟' AND "QuestionTextEn"='How many millimeters are in 18 centimeters?'
 AND "DetailedSolutionAr"='السنتيمتر يساوي 10 مليمترات، إذن 18 × 10 = 180 مليمتر.' AND "DetailedSolutionEn"='There are 10 millimeters in one centimeter, so 18 × 10 = 180 millimeters.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"18"},{"Order":2,"IsCorrect":false,"LatexCode":"1800"},{"Order":3,"IsCorrect":true,"LatexCode":"180"},{"Order":4,"IsCorrect":false,"LatexCode":"108"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Primary DraftItem 106 changed: rollback all'; END IF;
END $mw_primary20_draft_rules$;
COMMIT;
