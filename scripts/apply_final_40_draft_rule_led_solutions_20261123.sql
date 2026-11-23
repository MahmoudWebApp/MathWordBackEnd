-- MathWorld all remaining 40 DraftItem explanations: source/answer/option-guarded.
-- Keep all 160 editorial items as Draft; no user, published problems, answers or skills change.
BEGIN;
DO $mw_final40_draft_rules$
DECLARE affected integer;
BEGIN
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: النمو الأسّي P(t) = P₀ × g^t، حيث P₀ القيمة الابتدائية وg عامل النمو لكل فترة. لدينا P₀ = 250 وg = 1.2 وt = 2؛ نحسب 1.2² = 1.44، ثم P(2) = 250 × 1.44 = 360 فرداً. استعملنا عامل النمو مرتين لأن المدة فترتان.', "DetailedSolutionEn"='Rule used: Exponential growth P(t) = P₀ g^t, where P₀ is initial population and g is the growth factor per period. Here P₀ = 250, g = 1.2 and t = 2. Compute 1.2² = 1.44, then P(2) = 250 × 1.44 = 360 individuals.'
 WHERE "Id"=79 AND "TopicProposalId"=7 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='يُعطى عدد أفراد مستعمرة بالدالة P(t)=250×(1.2)^t. ما P(2)؟' AND "QuestionTextEn"='A colony has P(t)=250×(1.2)^t. Find P(2).'
 AND "DetailedSolutionAr"='عند t=2 نحسب (1.2)^2=1.44، ثم P(2)=250×1.44=360 فرداً.' AND "DetailedSolutionEn"='At t=2, the growth multiplier is (1.2)^2=1.44, so P(2)=250×1.44=360 individuals.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"300"},{"Order":2,"IsCorrect":true,"LatexCode":"360"},{"Order":3,"IsCorrect":false,"LatexCode":"390"},{"Order":4,"IsCorrect":false,"LatexCode":"250"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 79 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: إذا تضاعفت كمية كل ساعة فإن عددها بعد t ساعات = العدد الابتدائي × 2^t. نبدأ بـ80 بكتيريا، وبعد 3 ساعات يكون عامل التضاعف 2³ = 8. إذن العدد = 80 × 8 = 640 بكتيريا. لا نضرب في 3 مباشرة لأن الزيادة مركبة.', "DetailedSolutionEn"='Rule used: A quantity that doubles each hour follows N(t) = N₀ × 2^t. Starting with 80 bacteria and waiting 3 hours gives growth factor 2³ = 8. Therefore N(3) = 80 × 8 = 640 bacteria. Repeated doubling is exponential, not linear.'
 WHERE "Id"=80 AND "TopicProposalId"=7 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='يبدأ عدد البكتيريا بـ80 ويتضاعف كل ساعة. كم يصبح بعد 3 ساعات؟' AND "QuestionTextEn"='A culture starts with 80 bacteria and doubles each hour. How many after 3 hours?'
 AND "DetailedSolutionAr"='بعد ثلاث فترات تضاعف: 80×2^3=640.' AND "DetailedSolutionEn"='After three doublings: 80×2^3=640.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"240"},{"Order":2,"IsCorrect":false,"LatexCode":"320"},{"Order":3,"IsCorrect":true,"LatexCode":"640"},{"Order":4,"IsCorrect":false,"LatexCode":"480"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 80 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: النمو المركب بمعدل r لكل سنة يعطى بالعلاقة A = A₀(1+r)^t. المبلغ الأولي 2,000 والمعدل 10% = 0.10 والسنتان t = 2. نحسب (1.10)² = 1.21، ثم A = 2,000 × 1.21 = 2,420. كل سنة تطبق الزيادة على القيمة الجديدة.', "DetailedSolutionEn"='Rule used: Compound annual growth follows A = A₀(1+r)^t. With initial amount 2,000, annual rate r = 0.10 and t = 2, the multiplier is (1.10)² = 1.21. Thus A = 2,000 × 1.21 = 2,420. Each year''s growth compounds on the updated amount.'
 WHERE "Id"=81 AND "TopicProposalId"=7 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='مبلغ 2,000 ينمو بمعدل 10% سنوياً دون سحب. كم يصبح بعد سنتين؟' AND "QuestionTextEn"='An amount of 2,000 grows by 10% each year. What is it after two years?'
 AND "DetailedSolutionAr"='2,000×(1.10)^2=2,420.' AND "DetailedSolutionEn"='2,000×(1.10)^2=2,420.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"2,200"},{"Order":2,"IsCorrect":true,"LatexCode":"2,420"},{"Order":3,"IsCorrect":false,"LatexCode":"2,400"},{"Order":4,"IsCorrect":false,"LatexCode":"2,600"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 81 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: التناقص الأسّي بنسبة r سنوياً يكتب A = A₀(1−r)^t. البداية 1,200 ونسبة التناقص 10%، لذا عامل البقاء 0.90. بعد سنتين: A = 1,200 × 0.90² = 1,200 × 0.81 = 972. لا نطرح 20% خطياً لأن النقص في السنة الثانية من القيمة المتبقية.', "DetailedSolutionEn"='Rule used: Repeated percentage decay follows A = A₀(1−r)^t. With A₀ = 1,200, r = 0.10 and t = 2, the retained factor is 0.90² = 0.81. The remaining amount is 1,200 × 0.81 = 972. The loss is compounded, not a single 20% subtraction.'
 WHERE "Id"=82 AND "TopicProposalId"=7 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='كم تبقى من 1,200 بعد تناقص 10% سنوياً لمدة سنتين؟' AND "QuestionTextEn"='How much remains of 1,200 after 10% decay each year for two years?'
 AND "DetailedSolutionAr"='نضرب بعامل البقاء 0.9 مرتين: 1,200×0.9^2=972.' AND "DetailedSolutionEn"='Multiply by 0.9 twice: 1,200×0.9^2=972.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"960"},{"Order":2,"IsCorrect":false,"LatexCode":"1,080"},{"Order":3,"IsCorrect":true,"LatexCode":"972"},{"Order":4,"IsCorrect":false,"LatexCode":"980"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 82 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: كمية المادة بعد زمن t مع عمر نصف h هي M(t) = M₀(1/2)^(t/h). من 640 غ إلى 80 غ تكون النسبة 80/640 = 1/8 = (1/2)³؛ إذن مرّت 3 أعمار نصف. كل عمر نصف 4 ساعات، لذلك الزمن = 3 × 4 = 12 ساعة.', "DetailedSolutionEn"='Rule used: Half-life decay is M(t) = M₀(1/2)^(t/h), where h is the half-life. The target fraction is 80/640 = 1/8 = (1/2)³, so three half-lives pass. Each lasts 4 hours, giving t = 3 × 4 = 12 hours.'
 WHERE "Id"=83 AND "TopicProposalId"=7 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='كتلة 640 غراماً ونصف عمرها 4 ساعات. بعد كم ساعة تصبح 80 غراماً؟' AND "QuestionTextEn"='A 640 g sample has a half-life of 4 hours. After how many hours will it reach 80 g?'
 AND "DetailedSolutionAr"='640→320→160→80؛ ثلاث فترات نصف عمر، أي 3×4=12 ساعة.' AND "DetailedSolutionEn"='640→320→160→80 is three half-lives, so 3×4=12 hours.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"8"},{"Order":2,"IsCorrect":false,"LatexCode":"16"},{"Order":3,"IsCorrect":true,"LatexCode":"12"},{"Order":4,"IsCorrect":false,"LatexCode":"20"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 83 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: في النموذج الأسّي Q(t) = Q₀ × g^t، يمثل g نسبة الكمية الباقية بعد كل فترة. عامل التناقص هنا g = 0.7، أي يبقى 70% من الكمية. النسبة المفقودة = (1 − 0.7) × 100% = 30%. إذن الفقد في كل فترة 30%.', "DetailedSolutionEn"='Rule used: In the exponential model Q(t) = Q₀ g^t, factor g represents the proportion retained each period. With g = 0.7, 70% remains. The lost percentage is (1 − 0.7) × 100% = 30%. Thus each period has a 30% decay rate.'
 WHERE "Id"=84 AND "TopicProposalId"=7 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='إذا كانت Q(t)=200×(0.7)^t، فما نسبة النقص في كل فترة؟' AND "QuestionTextEn"='For Q(t)=200×(0.7)^t, what percent is lost each period?'
 AND "DetailedSolutionAr"='يتبقى 70% في كل فترة، فيكون النقص 100%−70%=30%.' AND "DetailedSolutionEn"='70% remains each period, so the loss is 100%−70%=30%.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"70%"},{"Order":2,"IsCorrect":false,"LatexCode":"20%"},{"Order":3,"IsCorrect":false,"LatexCode":"7%"},{"Order":4,"IsCorrect":true,"LatexCode":"30%"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 84 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: في الدالة N(t) = N₀(1+r)^t، يكون عامل النمو 1+r. نقارن النموذج المعطى N(t) = 450 × 1.03^t فنجد 1+r = 1.03، وبالتالي r = 1.03 − 1 = 0.03 = 3%. العدد 450 هو القيمة الابتدائية ولا يغيّر النسبة.', "DetailedSolutionEn"='Rule used: In N(t) = N₀(1+r)^t, the growth factor is 1+r. Comparing with 450 × (1.03)^t gives 1+r = 1.03, so r = 0.03 = 3% per period. The initial quantity 450 does not affect the growth rate.'
 WHERE "Id"=85 AND "TopicProposalId"=7 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='ما نسبة النمو لكل فترة في N(t)=450×(1.03)^t؟' AND "QuestionTextEn"='What is the growth rate per period for N(t)=450×(1.03)^t?'
 AND "DetailedSolutionAr"='المعامل 1.03=1+0.03؛ معدل النمو 3%.' AND "DetailedSolutionEn"='The factor 1.03=1+0.03, so growth is 3%.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"0.3%"},{"Order":2,"IsCorrect":false,"LatexCode":"30%"},{"Order":3,"IsCorrect":true,"LatexCode":"3%"},{"Order":4,"IsCorrect":false,"LatexCode":"103%"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 85 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: الحد العام للمتتالية الهندسية هو aₙ = a₁ × r^(n−1)، حيث a₁ الحد الأول وr النسبة المشتركة. الحدود 2، 6، 18، 54 تبدأ بـ2؛ والنسبة 6/2 = 18/6 = 3. لذلك aₙ = 2 × 3^(n−1). التحقق عند n = 4: ‏2 × 27 = 54.', "DetailedSolutionEn"='Rule used: A geometric sequence has nth term aₙ = a₁ r^(n−1), where a₁ is the first term and r is the common ratio. Here a₁ = 2 and r = 6/2 = 3. Thus aₙ = 2 × 3^(n−1). Check: n = 4 gives 2 × 27 = 54.'
 WHERE "Id"=86 AND "TopicProposalId"=7 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='ما صيغة الحد العام للمتتالية 2، 6، 18، 54، مع بدء الترقيم من n=1؟' AND "QuestionTextEn"='Which formula gives the sequence 2, 6, 18, 54 starting at n=1?'
 AND "DetailedSolutionAr"='النسبة المشتركة 3 والحد الأول 2، لذلك الحد العام هو a_n=2×3^{n−1}.' AND "DetailedSolutionEn"='The common ratio is 3 and the first term is 2, so a_n=2×3^{n−1}.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"a_n=2+3(n-1)"},{"Order":2,"IsCorrect":true,"LatexCode":"a_n=2\\cdot3^{n-1}"},{"Order":3,"IsCorrect":false,"LatexCode":"a_n=3n"},{"Order":4,"IsCorrect":false,"LatexCode":"a_n=2\\cdot2^{n-1}"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 86 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: ميل المستقيم بين نقطتين (س₁،ص₁) و(س₂،ص₂) هو (ص₂−ص₁)/(س₂−س₁)، بشرط اختلاف قيم س. للنقطتين (1،2) و(5،10): ‏م = (10−2)/(5−1) = 8/4 = 2. هذا يعني ارتفاع وحدتين لكل انتقال وحدة واحدة أفقياً.', "DetailedSolutionEn"='Rule used: Slope between two points is m = (y₂−y₁)/(x₂−x₁), provided their x-coordinates differ. For (1,2) and (5,10), m = (10−2)/(5−1) = 8/4 = 2. The line rises two vertical units per horizontal unit.'
 WHERE "Id"=119 AND "TopicProposalId"=11 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='ما ميل المستقيم المار بالنقطتين (1,2) و(5,10)؟' AND "QuestionTextEn"='What is the slope of the line passing through (1,2) and (5,10)?'
 AND "DetailedSolutionAr"='الميل يساوي التغير في y على التغير في x، أي (10-2)/(5-1)=8/4=2.' AND "DetailedSolutionEn"='The slope is rise over run: (10-2)/(5-1)=8/4=2.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"\\frac12"},{"Order":2,"IsCorrect":false,"LatexCode":"4"},{"Order":3,"IsCorrect":true,"LatexCode":"2"},{"Order":4,"IsCorrect":false,"LatexCode":"8"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 119 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: إحداثيا منتصف القطعة المستقيمة هما متوسطا إحداثيي طرفيها: م = ((س₁+س₂)/2، (ص₁+ص₂)/2). للنقطتين (2،6) و(8،0)، نحسب س = (2+8)/2 = 5 وص = (6+0)/2 = 3. إذن المنتصف (5،3).', "DetailedSolutionEn"='Rule used: The midpoint of a segment is the average of the endpoint coordinates: M = ((x₁+x₂)/2, (y₁+y₂)/2). For (2,6) and (8,0), x = (2+8)/2 = 5 and y = (6+0)/2 = 3, so M = (5,3).'
 WHERE "Id"=120 AND "TopicProposalId"=11 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='ما إحداثيا منتصف القطعة الواصلة بين (2,6) و(8,0)؟' AND "QuestionTextEn"='Find the midpoint of the segment joining (2,6) and (8,0).'
 AND "DetailedSolutionAr"='نأخذ متوسط كل إحداثي: x=(2+8)/2=5 وy=(6+0)/2=3، فيكون المنتصف (5,3).' AND "DetailedSolutionEn"='Average the coordinates: x=(2+8)/2=5 and y=(6+0)/2=3, so the midpoint is (5,3).'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"(3,5)"},{"Order":2,"IsCorrect":false,"LatexCode":"(6,3)"},{"Order":3,"IsCorrect":false,"LatexCode":"(5,6)"},{"Order":4,"IsCorrect":true,"LatexCode":"(5,3)"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 120 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: المسافة بين نقطتين في المستوى هي d = √((س₂−س₁)² + (ص₂−ص₁)²). من (0،0) إلى (6،8)، فرق س يساوي 6 وفرق ص يساوي 8. بالتعويض d = √(6²+8²) = √(36+64) = √100 = 10 وحدات.', "DetailedSolutionEn"='Rule used: Distance in the coordinate plane is d = √[(x₂−x₁)² + (y₂−y₁)²]. From (0,0) to (6,8), horizontal and vertical changes are 6 and 8. Thus d = √(6²+8²) = √(36+64) = √100 = 10 units.'
 WHERE "Id"=121 AND "TopicProposalId"=11 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='احسب المسافة بين النقطتين (0,0) و(6,8).' AND "QuestionTextEn"='Find the distance between (0,0) and (6,8).'
 AND "DetailedSolutionAr"='باستخدام فيثاغورس: جذر (6^2+8^2)=جذر 100=10.' AND "DetailedSolutionEn"='By the distance formula, sqrt(6^2+8^2)=sqrt(100)=10.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":true,"LatexCode":"10"},{"Order":2,"IsCorrect":false,"LatexCode":"14"},{"Order":3,"IsCorrect":false,"LatexCode":"12"},{"Order":4,"IsCorrect":false,"LatexCode":"7"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 121 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: صيغة المستقيم بمعلومية الميل والمقطع الصادي هي ص = م س + ب، حيث م هو الميل وب قيمة تقاطع المستقيم مع محور ص. المعطى م = −2 وب = 3. نعوّض مباشرة: ص = −2س + 3. ويمكن التحقق أن المستقيم يقطع محور ص عند (0،3).', "DetailedSolutionEn"='Rule used: Slope-intercept form of a line is y = mx + b, with slope m and y-intercept b. Given m = −2 and b = 3, substitute directly to obtain y = −2x + 3. At x = 0, y = 3, confirming the stated intercept.'
 WHERE "Id"=122 AND "TopicProposalId"=11 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='مستقيم ميله -2 ويقطع محور y عند 3. ما معادلته؟' AND "QuestionTextEn"='A line has slope -2 and y-intercept 3. Which equation represents it?'
 AND "DetailedSolutionAr"='نستخدم y=mx+b مع m=-2 وb=3 فنحصل على y=-2x+3.' AND "DetailedSolutionEn"='Using y=mx+b with m=-2 and b=3 gives y=-2x+3.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"y=2x+3"},{"Order":2,"IsCorrect":true,"LatexCode":"y=-2x+3"},{"Order":3,"IsCorrect":false,"LatexCode":"y=-2x-3"},{"Order":4,"IsCorrect":false,"LatexCode":"y=3x-2"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 122 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: معادلة دائرة مركزها الأصل هي س² + ص² = r²، حيث r نصف القطر غير السالب. بمقارنة س² + ص² = 49 مع الصورة القياسية نحصل على r² = 49. نأخذ الجذر التربيعي الموجب: r = √49 = 7 وحدات.', "DetailedSolutionEn"='Rule used: A circle centered at the origin has equation x² + y² = r², where r is its nonnegative radius. Comparing x² + y² = 49 with the standard equation gives r² = 49. Thus r = √49 = 7 units.'
 WHERE "Id"=123 AND "TopicProposalId"=11 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='ما نصف قطر الدائرة التي معادلتها $x^2+y^2=49$؟' AND "QuestionTextEn"='What is the radius of the circle $x^2+y^2=49$?'
 AND "DetailedSolutionAr"='في المعادلة القياسية x^2+y^2=r^2 نجد r^2=49، إذن r=7.' AND "DetailedSolutionEn"='In standard form x^2+y^2=r^2, r^2=49 and the nonnegative radius is r=7.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"49"},{"Order":2,"IsCorrect":false,"LatexCode":"14"},{"Order":3,"IsCorrect":true,"LatexCode":"7"},{"Order":4,"IsCorrect":false,"LatexCode":"\\sqrt7"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 123 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: معادلة دائرة مركزها (h,k) ونصف قطرها r هي (س−h)²+(ص−k)²=r². المعطى المركز (2،−3) ونصف القطر 4. بالتعويض تصبح (س−2)²+(ص−(−3))²=4²، أي (س−2)²+(ص+3)²=16.', "DetailedSolutionEn"='Rule used: A circle with center (h,k) and radius r satisfies (x−h)² + (y−k)² = r². For center (2,−3) and radius 4, substitute to get (x−2)² + (y+3)² = 4² = 16. The plus sign comes from subtracting −3.'
 WHERE "Id"=124 AND "TopicProposalId"=11 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='أي معادلة تمثل دائرة مركزها (2,-3) ونصف قطرها 4؟' AND "QuestionTextEn"='Which equation describes a circle centered at (2,-3) with radius 4?'
 AND "DetailedSolutionAr"='نطبق (x-h)^2+(y-k)^2=r^2. بوضع h=2 وk=-3 وr=4 نحصل على (x-2)^2+(y+3)^2=16.' AND "DetailedSolutionEn"='Use (x-h)^2+(y-k)^2=r^2 with h=2, k=-3 and r=4: (x-2)^2+(y+3)^2=16.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"(x+2)^2+(y-3)^2=16"},{"Order":2,"IsCorrect":false,"LatexCode":"(x-2)^2+(y-3)^2=16"},{"Order":3,"IsCorrect":false,"LatexCode":"(x-2)^2+(y+3)^2=4"},{"Order":4,"IsCorrect":true,"LatexCode":"(x-2)^2+(y+3)^2=16"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 124 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: مركز الدائرة هو منتصف قطرها، ونصف قطرها يساوي نصف طول القطر. النهايتان (−2،0) و(4،0)، فالمركز ((−2+4)/2،0) = (1،0). طول القطر 6، فنصف القطر 3. معادلة الدائرة: (س−1)² + ص² = 9.', "DetailedSolutionEn"='Rule used: A circle''s center is the midpoint of a diameter, and radius is half its length. The diameter endpoints (−2,0) and (4,0) have midpoint (1,0) and separation 6, so r = 3. Standard circle form gives (x−1)² + y² = 3² = 9.'
 WHERE "Id"=125 AND "TopicProposalId"=11 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='طرفا قطر دائرة هما (-2,0) و(4,0). ما معادلة الدائرة؟' AND "QuestionTextEn"='A circle has diameter endpoints (-2,0) and (4,0). Which is its equation?'
 AND "DetailedSolutionAr"='مركز الدائرة منتصف القطر أي (1,0)، وطول القطر 6 فالنصف قطر 3. المعادلة (x-1)^2+y^2=9.' AND "DetailedSolutionEn"='The diameter midpoint is (1,0) and its length is 6, so radius is 3. Equation: (x-1)^2+y^2=9.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"(x+1)^2+y^2=9"},{"Order":2,"IsCorrect":true,"LatexCode":"(x-1)^2+y^2=9"},{"Order":3,"IsCorrect":false,"LatexCode":"(x-1)^2+y^2=36"},{"Order":4,"IsCorrect":false,"LatexCode":"x^2+y^2=9"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 125 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: تقع نقطة على الدائرة إذا حققت إحداثياتها معادلتها عند التعويض. المعادلة س²+ص²=25؛ نختبر النقطة (3،4) فنحسب 3² + 4² = 9 + 16 = 25. الطرفان متساويان، لذلك تقع النقطة (3،4) على الدائرة.', "DetailedSolutionEn"='Rule used: A point lies on a curve if its coordinates satisfy the curve''s equation. For x² + y² = 25, substitute the point (3,4): 3² + 4² = 9 + 16 = 25. Since the equation holds, (3,4) is on the circle.'
 WHERE "Id"=126 AND "TopicProposalId"=11 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='أي نقطة تقع على الدائرة $x^2+y^2=25$؟' AND "QuestionTextEn"='Which point lies on $x^2+y^2=25$?'
 AND "DetailedSolutionAr"='للزوج (3,4) نجد 3^2+4^2=9+16=25، ولذلك يحقق المعادلة.' AND "DetailedSolutionEn"='For (3,4), 3^2+4^2=9+16=25, so the point lies on the circle.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"(4,4)"},{"Order":2,"IsCorrect":false,"LatexCode":"(1,5)"},{"Order":3,"IsCorrect":true,"LatexCode":"(3,4)"},{"Order":4,"IsCorrect":false,"LatexCode":"(3,3)"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 126 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='المبدأ المستخدم: مجموعة النقاط المتساوية البعد عن نقطتين ثابتتين تشكل العمود المنصف للقطعة الواصلة بينهما. النقطتان (0،0) و(4،0) على خط أفقي، ومنتصفهما (2،0). العمود عليه خط رأسي يمر بالمُنتصف، ولذلك معادلته س = 2.', "DetailedSolutionEn"='Rule used: The locus of points equidistant from two fixed points is the perpendicular bisector of the segment connecting them. The segment from (0,0) to (4,0) is horizontal with midpoint (2,0), so its perpendicular bisector is the vertical line x = 2.'
 WHERE "Id"=127 AND "TopicProposalId"=11 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='ما المعادلة التي تحققها جميع النقاط المتساوية البعد عن (0,0) و(4,0)؟' AND "QuestionTextEn"='Find the locus of points equidistant from (0,0) and (4,0).'
 AND "DetailedSolutionAr"='المنصف العمودي للقطعة الأفقية يمر بمنتصفها (2,0)، وهو المستقيم الرأسي x=2.' AND "DetailedSolutionEn"='The perpendicular bisector of the horizontal segment passes through midpoint (2,0): x=2.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"x=4"},{"Order":2,"IsCorrect":false,"LatexCode":"y=2"},{"Order":3,"IsCorrect":true,"LatexCode":"x=2"},{"Order":4,"IsCorrect":false,"LatexCode":"y=0"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 127 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='المبدأ المستخدم: المستقيم الذي يبعد المسافة نفسها عن مستقيمين أفقيين متوازيين يكون في المنتصف بين قيمتي ص. للمستقيمين ص = 1 وص = 7 نحسب قيمة المنتصف (1+7)/2 = 4. إذن المعادلة ص = 4؛ وبالفعل البعد عن 1 هو 3 وعن 7 هو 3.', "DetailedSolutionEn"='Rule used: A horizontal line equidistant from two parallel horizontal lines has y-coordinate equal to the average of their y-values. Between y = 1 and y = 7, the midpoint level is (1+7)/2 = 4. Thus the line is y = 4, three units from each.'
 WHERE "Id"=128 AND "TopicProposalId"=11 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='ما معادلة الخط الواقع بين المستقيمين $y=1$ و$y=7$ وعلى المسافة نفسها منهما؟' AND "QuestionTextEn"='Find the line midway between $y=1$ and $y=7$, equidistant from both.'
 AND "DetailedSolutionAr"='متوسط الإحداثيين الرأسيين هو (1+7)/2=4، لذلك المستقيم هو y=4.' AND "DetailedSolutionEn"='Take the midpoint of the two y-values: (1+7)/2=4, so the midway line is y=4.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":true,"LatexCode":"y=4"},{"Order":2,"IsCorrect":false,"LatexCode":"y=3"},{"Order":3,"IsCorrect":false,"LatexCode":"x=4"},{"Order":4,"IsCorrect":false,"LatexCode":"y=6"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 128 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: مجموعة نقاط تبعد مسافة ثابتة r عن نقطة (h,k) هي دائرة معادلتها (س−h)²+(ص−k)²=r². المركز (1،2) والمسافة 3؛ بالتعويض (س−1)²+(ص−2)²=3²=9. هذه تمثل جميع النقاط المطلوبة.', "DetailedSolutionEn"='Rule used: The locus of points at fixed distance r from (h,k) is a circle satisfying (x−h)² + (y−k)² = r². With center (1,2) and distance 3, substitute to get (x−1)² + (y−2)² = 9.'
 WHERE "Id"=129 AND "TopicProposalId"=11 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='أي معادلة تمثل مجموعة نقاط تبعد ثلاث وحدات عن (1,2)؟' AND "QuestionTextEn"='Which equation describes all points at distance 3 from (1,2)?'
 AND "DetailedSolutionAr"='هذه دائرة مركزها (1,2) ونصف قطرها 3، لذا (x-1)^2+(y-2)^2=9.' AND "DetailedSolutionEn"='This is a circle centered at (1,2) with radius 3, so (x-1)^2+(y-2)^2=9.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"(x-1)^2+(y-2)^2=3"},{"Order":2,"IsCorrect":false,"LatexCode":"(x+1)^2+(y+2)^2=9"},{"Order":3,"IsCorrect":false,"LatexCode":"(x-1)^2+(y+2)^2=9"},{"Order":4,"IsCorrect":true,"LatexCode":"(x-1)^2+(y-2)^2=9"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 129 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='المبدأ المستخدم: العمود المنصف لقطعة مستقيمة يمر بمنتصفها ويكون عمودياً على اتجاهها. القطعة من (0،−2) إلى (0،6) رأسية، ومنتصفها (0،(−2+6)/2) = (0،2). العمود عليها أفقي، لذا معادلته ص = 2.', "DetailedSolutionEn"='Rule used: A perpendicular bisector passes through a segment''s midpoint and is perpendicular to the segment. From (0,−2) to (0,6) the segment is vertical; its midpoint is (0,(−2+6)/2) = (0,2). The bisector is horizontal: y = 2.'
 WHERE "Id"=130 AND "TopicProposalId"=11 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='طرفا قطعة رأسية هما (0,-2) و(0,6). ما معادلة منصفها العمودي؟' AND "QuestionTextEn"='A vertical segment joins (0,-2) and (0,6). What is its perpendicular bisector?'
 AND "DetailedSolutionAr"='منتصف القطعة هو (0,2). المستقيم العمودي على قطعة رأسية يكون أفقياً، فالمعادلة y=2.' AND "DetailedSolutionEn"='The midpoint is (0,2). A perpendicular to a vertical line is horizontal, hence y=2.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"x=2"},{"Order":2,"IsCorrect":true,"LatexCode":"y=2"},{"Order":3,"IsCorrect":false,"LatexCode":"y=0"},{"Order":4,"IsCorrect":false,"LatexCode":"x=0"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 130 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: الدرجة المعيارية z = (القيمة − متوسط المجتمع) ÷ الانحراف المعياري للمجتمع. المعطيات القيمة 82 والمتوسط 70 والانحراف 6. بالتعويض: z = (82 − 70) ÷ 6 = 12 ÷ 6 = 2. أي أن القيمة أعلى من المتوسط بانحرافين معياريين.', "DetailedSolutionEn"='Rule used: A population z-score is z = (observation − population mean)/population standard deviation. Substitute x = 82, μ = 70, σ = 6: z = (82 − 70)/6 = 12/6 = 2. The observation is two population standard deviations above the mean.'
 WHERE "Id"=87 AND "TopicProposalId"=8 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='في مجتمع متوسطه 70 وانحرافه المعياري 6، ما الدرجة المعيارية للقيمة 82؟' AND "QuestionTextEn"='For a population with mean 70 and standard deviation 6, find the z-score of 82.'
 AND "DetailedSolutionAr"='نطرح متوسط المجتمع من القيمة ثم نقسم على الانحراف المعياري: z=(82−70)/6=2.' AND "DetailedSolutionEn"='Subtract the population mean and divide by the standard deviation: z=(82−70)/6=2.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"1"},{"Order":2,"IsCorrect":true,"LatexCode":"2"},{"Order":3,"IsCorrect":false,"LatexCode":"3"},{"Order":4,"IsCorrect":false,"LatexCode":"−2"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 87 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: الخطأ المعياري لمتوسط العينة مع انحراف معياري للمجتمع معلوم هو SE = σ/√n. لدينا σ = 15 وحجم العينة n = 25؛ نحسب √25 = 5، ثم SE = 15 ÷ 5 = 3. هذا خطأ معياري للمتوسط، وليس الانحراف المعياري للأفراد.', "DetailedSolutionEn"='Rule used: When population standard deviation σ is known, the standard error of the sample mean is SE = σ/√n. Here σ = 15 and n = 25, so √n = 5 and SE = 15/5 = 3. This is the mean''s sampling standard error, not the individuals'' standard deviation.'
 WHERE "Id"=88 AND "TopicProposalId"=8 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='إذا كان σ=15 وحجم العينة n=25، فما الخطأ المعياري للمتوسط؟' AND "QuestionTextEn"='If population σ=15 and sample size n=25, what is the standard error of the sample mean?'
 AND "DetailedSolutionAr"='SE=σ/√n=15/5=3.' AND "DetailedSolutionEn"='SE=σ/√n=15/5=3.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"5"},{"Order":2,"IsCorrect":false,"LatexCode":"0.6"},{"Order":3,"IsCorrect":true,"LatexCode":"3"},{"Order":4,"IsCorrect":false,"LatexCode":"15"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 88 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: النسبة التجريبية للنجاح = عدد الحالات الناجحة ÷ إجمالي مشاهدات العينة. نجح 18 طالباً من 30؛ إذن النسبة = 18/30، وباختزالها نحصل على 3/5 = 0.6. أي 60% تقريباً من العينة، وهي تقدير رصدي لا تعني ضماناً لنجاح المجتمع كله.', "DetailedSolutionEn"='Rule used: An observed sample proportion is successes divided by total sampled observations. With 18 successes among 30 students, p-hat = 18/30 = 3/5 = 0.6, or 60%. This is an empirical sample statistic rather than a guaranteed population rate.'
 WHERE "Id"=89 AND "TopicProposalId"=8 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='نجح 18 طالباً من عينة حجمها 30. ما النسبة المشاهدة للنجاح؟' AND "QuestionTextEn"='18 out of 30 sampled students passed. What is the observed success proportion?'
 AND "DetailedSolutionAr"='نسبة العينة هي 18/30=0.6.' AND "DetailedSolutionEn"='The sample proportion is 18/30=0.6.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"0.18"},{"Order":2,"IsCorrect":false,"LatexCode":"0.3"},{"Order":3,"IsCorrect":true,"LatexCode":"0.6"},{"Order":4,"IsCorrect":false,"LatexCode":"0.8"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 89 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: فترة الثقة الطبيعية لمتوسط مجتمع مع σ معلومة هي متوسط العينة ± z × σ/√n. لدينا المتوسط 100 وσ = 10 وn = 100 وz = 1.96. الخطأ المعياري 10/√100 = 1، والهامش 1.96 × 1 = 1.96. إذن الحدود 100 − 1.96 = 98.04 و100 + 1.96 = 101.96.', "DetailedSolutionEn"='Rule used: A normal confidence interval for a mean with known σ is sample mean ± z × σ/√n. With mean 100, σ = 10, n = 100 and z = 1.96, standard error is 10/10 = 1 and margin is 1.96. The endpoints are 100 − 1.96 = 98.04 and 100 + 1.96 = 101.96.'
 WHERE "Id"=90 AND "TopicProposalId"=8 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='متوسط عينة 100، والانحراف المعياري للمجتمع 10، وحجم العينة 100. بافتراض النموذج الطبيعي، ما فترة الثقة 95% باستخدام z=1.96؟' AND "QuestionTextEn"='The sample mean is 100, population σ=10, n=100. Using the normal approximation and z=1.96, find the 95% confidence interval.'
 AND "DetailedSolutionAr"='الخطأ المعياري 10/√100=1، والهامش 1.96؛ الفترة [98.04,101.96].' AND "DetailedSolutionEn"='SE=10/√100=1; margin=1.96. The interval is [98.04,101.96].'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"[90,110]"},{"Order":2,"IsCorrect":true,"LatexCode":"[98.04,101.96]"},{"Order":3,"IsCorrect":false,"LatexCode":"[99.04,100.96]"},{"Order":4,"IsCorrect":false,"LatexCode":"[96,104]"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 90 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: هامش الخطأ لفترة الثقة الطبيعية = قيمة z الحرجة × σ/√n. نعوّض z = 1.96 والانحراف المعياري σ = 8 وحجم العينة n = 64؛ الجذر √64 = 8. لذا الهامش = 1.96 × 8/8 = 1.96. هذا نصف عرض فترة الثقة وليس عرضها الكامل.', "DetailedSolutionEn"='Rule used: The normal confidence-interval margin of error is E = z × σ/√n. Substituting z = 1.96, σ = 8 and n = 64 gives √n = 8 and E = 1.96 × 8/8 = 1.96. The margin is half the full confidence-interval width.'
 WHERE "Id"=91 AND "TopicProposalId"=8 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='عند σ=8 وn=64 وz=1.96، ما هامش الخطأ لفترة ثقة طبيعية؟' AND "QuestionTextEn"='For σ=8, n=64, and z=1.96, what is the normal confidence-interval margin of error?'
 AND "DetailedSolutionAr"='الهامش z×σ/√n=1.96×8/8=1.96.' AND "DetailedSolutionEn"='Margin = z×σ/√n=1.96×8/8=1.96.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"0.98"},{"Order":2,"IsCorrect":true,"LatexCode":"1.96"},{"Order":3,"IsCorrect":false,"LatexCode":"8"},{"Order":4,"IsCorrect":false,"LatexCode":"15.68"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 91 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='المبدأ المستخدم: عند ثبات مستوى الثقة والانحراف المعياري، يتناسب عرض فترة الثقة عكسياً مع √n، أي W ∝ 1/√n. إذا أصبح حجم العينة 4n، فالعرض الجديد إلى القديم = √n/√(4n) = 1/2. إذن يصبح عرض فترة الثقة نصف العرض الأصلي.', "DetailedSolutionEn"='Rule used: With fixed confidence level and standard deviation, confidence-interval width is inversely proportional to √n: W ∝ 1/√n. Replacing n by 4n multiplies width by √n/√(4n) = 1/2. The interval becomes half as wide.'
 WHERE "Id"=92 AND "TopicProposalId"=8 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='مع ثبات الانحراف المعياري ومستوى الثقة، إذا ضُرب حجم العينة في 4، فبأي عامل يُضرب عرض فترة الثقة؟' AND "QuestionTextEn"='With fixed standard deviation and confidence level, if the sample size is multiplied by 4, what factor multiplies the confidence-interval width?'
 AND "DetailedSolutionAr"='العرض يتناسب مع 1/√n، لذا عند ضرب n في 4 يصبح العرض نصف قيمته.' AND "DetailedSolutionEn"='Interval width scales as 1/√n; quadrupling n halves the width.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"2"},{"Order":2,"IsCorrect":false,"LatexCode":"1"},{"Order":3,"IsCorrect":true,"LatexCode":"1/2"},{"Order":4,"IsCorrect":false,"LatexCode":"1/4"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 92 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: في اختبار الفرضيات نرفض الفرضية الصفرية H₀ إذا كانت قيمة p أقل من أو تساوي مستوى الدلالة المحدد α، وفق قاعدة القرار المعتمدة. هنا p = 0.02 وα = 0.05، وبما أن 0.02 < 0.05 فإن العلاقة الدالة على الرفض هي p < α.', "DetailedSolutionEn"='Rule used: For a standard p-value hypothesis test, reject the null hypothesis when the observed p-value is at or below the chosen significance level α. Here p = 0.02 and α = 0.05; since 0.02 < 0.05, the required inequality is p < α.'
 WHERE "Id"=93 AND "TopicProposalId"=8 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='عندما p=0.02 ومستوى الدلالة α=0.05، أي مقارنة تبرر رفض الفرضية الصفرية؟' AND "QuestionTextEn"='When p=0.02 and significance level α=0.05, which inequality justifies rejecting the null hypothesis?'
 AND "DetailedSolutionAr"='بما أن 0.02<0.05 فإننا نرفض الفرضية الصفرية، دون أن نثبت بديلها قطعياً.' AND "DetailedSolutionEn"='Since 0.02<0.05, reject the null hypothesis; this does not prove the alternative with certainty.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"p>\\alpha"},{"Order":2,"IsCorrect":true,"LatexCode":"p<\\alpha"},{"Order":3,"IsCorrect":false,"LatexCode":"p=\\alpha"},{"Order":4,"IsCorrect":false,"LatexCode":"p=1"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 93 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='المبدأ المستخدم: خطأ النوع الأول يعني رفض الفرضية الصفرية H₀ رغم أنها صحيحة. في الاختبار المضبوط عند مستوى الدلالة α يرمز α إلى احتمال هذا الخطأ أو حدّه المصمم. لذلك الرمز التقليدي المطلوب هو α، أما β فيستخدم لخطأ النوع الثاني.', "DetailedSolutionEn"='Rule used: A Type I error occurs when we reject a true null hypothesis H₀. The conventional notation for the test''s Type I error probability or nominal significance level is α. The symbol β instead denotes the Type II error probability.'
 WHERE "Id"=94 AND "TopicProposalId"=8 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='أي رمز يشير عادةً إلى احتمال الخطأ من النوع الأول، أي رفض فرضية صفرية صحيحة؟' AND "QuestionTextEn"='Which symbol conventionally denotes the probability of a Type I error: rejecting a true null hypothesis?'
 AND "DetailedSolutionAr"='الخطأ من النوع الأول يعني رفض H_0 وهي صحيحة، ويُرمز لاحتمال هذا الخطأ بالحرف α.' AND "DetailedSolutionEn"='Type I error means rejecting a true H_0; its probability is denoted by α.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"\\beta"},{"Order":2,"IsCorrect":false,"LatexCode":"1-\\alpha"},{"Order":3,"IsCorrect":true,"LatexCode":"\\alpha"},{"Order":4,"IsCorrect":false,"LatexCode":"1-\\beta"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 94 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: طريقة التنصيف تبدأ بفترة تحصر جذراً، وتحسب منتصفها m = (a+b)/2. للفترة [1،2] نحسب m = (1 + 2)/2 = 1.5. لأن f(1) = −1 وf(2) = 2 تتبدل الإشارة بين الطرفين، فيناسب استعمال التنصيف ثم اختبار f(1.5) لتحديد النصف التالي.', "DetailedSolutionEn"='Rule used: Bisection uses a bracket [a,b] and first tests its midpoint m = (a+b)/2. For [1,2], m = (1+2)/2 = 1.5. Here f(1) = −1 and f(2) = 2 have opposite signs, so the bracket is valid and the next step evaluates f(1.5).'
 WHERE "Id"=131 AND "TopicProposalId"=12 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='لإيجاد جذر $f(x)=x^2-2$ بطريقة التنصيف على الفترة [1,2]، ما أول نقطة وسطية؟' AND "QuestionTextEn"='Using bisection to find a zero of $f(x)=x^2-2$ on [1,2], what is the first midpoint?'
 AND "DetailedSolutionAr"='نحسب منتصف الفترة: (1+2)/2=1.5. يتم تقييم الدالة عند هذه النقطة بعد ذلك.' AND "DetailedSolutionEn"='The first midpoint is (1+2)/2=1.5, where the function can then be evaluated.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"1"},{"Order":2,"IsCorrect":false,"LatexCode":"1.25"},{"Order":3,"IsCorrect":true,"LatexCode":"1.5"},{"Order":4,"IsCorrect":false,"LatexCode":"2"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 131 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: في طريقة التنصيف المنتصف الأول m = (a+b)/2. حدود الفترة [1،3]، لذلك m = (1+3)/2 = 2. نحسب الدالة f(2) = 2² − 4 = 0، وهكذا وجدنا جذراً دقيقاً من أول اختبار للمنتصف، ولا نحتاج متابعة التنصيف.', "DetailedSolutionEn"='Rule used: The first bisection midpoint is m = (a+b)/2. On [1,3], m = (1+3)/2 = 2. Evaluate the function f(2) = 2² − 4 = 0. The first midpoint is already an exact root, so no further bisection is needed.'
 WHERE "Id"=132 AND "TopicProposalId"=12 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='نبدأ التنصيف للدالة $f(x)=x^2-4$ على [1,3]. ما قيمة أول نقطة وسطية تحقق $f(x)=0$؟' AND "QuestionTextEn"='Start bisection for $f(x)=x^2-4$ on [1,3]. What first midpoint makes $f(x)=0$?'
 AND "DetailedSolutionAr"='منتصف الفترة هو (1+3)/2=2، وعند x=2 نجد f(2)=4-4=0.' AND "DetailedSolutionEn"='The midpoint is (1+3)/2=2, and f(2)=4-4=0.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":true,"LatexCode":"2"},{"Order":2,"IsCorrect":false,"LatexCode":"1.5"},{"Order":3,"IsCorrect":false,"LatexCode":"3"},{"Order":4,"IsCorrect":false,"LatexCode":"4"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 132 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: تكرار نيوتن لإيجاد جذر هو x₁ = x₀ − f(x₀)/f′(x₀). للدالة f(x)=x²−9 مشتقتها f′(x)=2x. عند x₀=4 نجد f(4)=16−9=7 وf′(4)=8. إذن x₁=4−7/8=25/8=3.125. المشتقة غير صفرية، لذا خطوة نيوتن معرفة.', "DetailedSolutionEn"='Rule used: Newton''s iteration is x₁ = x₀ − f(x₀)/f′(x₀). For f(x) = x² − 9, derivative f′(x) = 2x. At x₀ = 4, f(4) = 7 and f′(4) = 8. Therefore x₁ = 4 − 7/8 = 25/8 = 3.125.'
 WHERE "Id"=133 AND "TopicProposalId"=12 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='لدالة $f(x)=x^2-9$ مع $x_0=4$، ما قيمة $x_1$ بطريقة نيوتن؟' AND "QuestionTextEn"='For $f(x)=x^2-9$ with $x_0=4$, compute the first Newton iterate $x_1$.'
 AND "DetailedSolutionAr"='مشتقة الدالة f''(x)=2x. إذن x1=4-(16-9)/(2×4)=4-7/8=3.125.' AND "DetailedSolutionEn"='The derivative is f''(x)=2x. Thus x1=4-(16-9)/8=4-7/8=3.125.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"3.5"},{"Order":2,"IsCorrect":false,"LatexCode":"3"},{"Order":3,"IsCorrect":false,"LatexCode":"3.25"},{"Order":4,"IsCorrect":true,"LatexCode":"3.125"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 133 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: قاعدة شبه المنحرف بلوحة واحدة لتقريب التكامل هي T = (b−a)[f(a)+f(b)]/2. لدينا f(x)=x² وحدود التكامل a=0 وb=2. نحسب f(0)=0 وf(2)=4، ثم T=(2−0)(0+4)/2=4. هذه قيمة تقريبية، وليست التكامل الدقيق بالضرورة.', "DetailedSolutionEn"='Rule used: The one-panel trapezoidal approximation is T = (b−a)[f(a)+f(b)]/2. For f(x) = x² on [0,2], f(0) = 0 and f(2) = 4. Thus T = (2−0)(0+4)/2 = 4. This is the rule''s approximation, not necessarily the exact integral.'
 WHERE "Id"=134 AND "TopicProposalId"=12 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='قدّر التكامل من 0 إلى 2 للدالة $f(x)=x^2$ بقاعدة شبه المنحرف باستخدام فترة واحدة.' AND "QuestionTextEn"='Approximate the integral of $f(x)=x^2$ from 0 to 2 by the trapezoidal rule using one panel.'
 AND "DetailedSolutionAr"='نستخدم (b-a)/2 × [f(a)+f(b)] = (2/2) × [0+4] = 4.' AND "DetailedSolutionEn"='Trapezoid with one panel: (b-a)/2 × [f(a)+f(b)] = (2/2) × [0+4] = 4.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":true,"LatexCode":"4"},{"Order":2,"IsCorrect":false,"LatexCode":"2"},{"Order":3,"IsCorrect":false,"LatexCode":"\\frac83"},{"Order":4,"IsCorrect":false,"LatexCode":"8"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 134 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: قاعدة المنتصف بلوحة واحدة تعطي M = (b−a) × f((a+b)/2). للدالة f(x)=x² على [0،2] نحسب المنتصف (0+2)/2=1، وقيمة الدالة f(1)=1. طول الفترة 2، لذلك M=2×1=2، وهي قيمة التقريب المطلوب.', "DetailedSolutionEn"='Rule used: The single-panel midpoint rule is M = (b−a) f((a+b)/2). On [0,2], the midpoint is 1 and f(1) = 1² = 1. The interval width is 2, so M = 2 × 1 = 2.'
 WHERE "Id"=135 AND "TopicProposalId"=12 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='قدّر التكامل من 0 إلى 2 للدالة $f(x)=x^2$ بقاعدة المنتصف بفترة واحدة.' AND "QuestionTextEn"='Approximate the integral of $f(x)=x^2$ from 0 to 2 using the one-panel midpoint rule.'
 AND "DetailedSolutionAr"='منتصف [0,2] هو 1؛ عرض الفترة 2 وقيمة الدالة 1، لذلك التقريب 2×1=2.' AND "DetailedSolutionEn"='The midpoint is 1, the interval width is 2 and f(1)=1, giving 2×1=2.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"1"},{"Order":2,"IsCorrect":true,"LatexCode":"2"},{"Order":3,"IsCorrect":false,"LatexCode":"4"},{"Order":4,"IsCorrect":false,"LatexCode":"\\frac83"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 135 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: قاعدة سيمبسون 1/3 لفترتين متساويتين تستخدم S = h/3[f(x₀)+4f(x₁)+f(x₂)]، حيث h=(b−a)/2. على [0،2] يكون h=1 والنقاط 0 و1 و2، وقيم الدالة x² هي 0 و1 و4. بالتعويض S=(1/3)(0+4×1+4)=8/3، وهي دقيقة هنا لأن الدالة تربيعية.', "DetailedSolutionEn"='Rule used: Simpson''s 1/3 rule with two equal subintervals is S = h/3[f(x₀)+4f(x₁)+f(x₂)], h=(b−a)/2. For [0,2], h = 1 and f(0)=0, f(1)=1, f(2)=4. Hence S = (1/3)(0+4×1+4) = 8/3, exact for a quadratic.'
 WHERE "Id"=136 AND "TopicProposalId"=12 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='قدّر التكامل من 0 إلى 2 للدالة $f(x)=x^2$ بقاعدة سمبسون 1/3 باستخدام فترتين فرعيتين متساويتين.' AND "QuestionTextEn"='Use Simpson''s 1/3 rule with two equal subintervals to integrate $f(x)=x^2$ from 0 to 2.'
 AND "DetailedSolutionAr"='الخطوة h=1، وسمبسون يعطينا (1/3)[f(0)+4f(1)+f(2)] = (1/3)(0+4+4)=8/3.' AND "DetailedSolutionEn"='With h=1, Simpson gives (1/3)[f(0)+4f(1)+f(2)] = (1/3)(0+4+4)=8/3.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"4"},{"Order":2,"IsCorrect":false,"LatexCode":"2"},{"Order":3,"IsCorrect":false,"LatexCode":"\\frac43"},{"Order":4,"IsCorrect":true,"LatexCode":"\\frac{8}{3}"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 136 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: الخطأ المطلق = |القيمة الحقيقية − القيمة التقريبية|. القيمة الصحيحة 10 والتقريب 9.7، لذا الخطأ = |10 − 9.7| = |0.3| = 0.3. القيمة المطلقة تجعل الخطأ غير سالب مهما كان اتجاه التقريب.', "DetailedSolutionEn"='Rule used: Absolute error is |exact value − approximate value|. With exact value 10 and approximation 9.7, the error is |10 − 9.7| = |0.3| = 0.3. Absolute value removes the direction of the estimation difference.'
 WHERE "Id"=137 AND "TopicProposalId"=12 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='قيمة دقيقة تساوي 10 وقربناها إلى 9.7. ما الخطأ المطلق؟' AND "QuestionTextEn"='An exact value is 10 and its approximation is 9.7. What is the absolute error?'
 AND "DetailedSolutionAr"='الخطأ المطلق هو القيمة المطلقة للفرق: |10-9.7|=0.3.' AND "DetailedSolutionEn"='Absolute error is the magnitude of the difference: |10-9.7|=0.3.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"0.03"},{"Order":2,"IsCorrect":false,"LatexCode":"3"},{"Order":3,"IsCorrect":true,"LatexCode":"0.3"},{"Order":4,"IsCorrect":false,"LatexCode":"0.7"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 137 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: الخطأ النسبي المئوي = (الخطأ المطلق ÷ |القيمة الحقيقية|) × 100%. القيمة الدقيقة 50 والتقريب 49، فالخطأ المطلق |50−49|=1. إذن الخطأ النسبي = 1/50 × 100% = 2%. يجب القسمة على القيمة الحقيقية لا التقريبية.', "DetailedSolutionEn"='Rule used: Percentage relative error = |exact − approximate|/|exact| × 100%. Here |50−49| = 1 and the exact magnitude is 50. Thus relative percentage error = 1/50 × 100% = 2%. The denominator is the exact value.'
 WHERE "Id"=138 AND "TopicProposalId"=12 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='إذا كانت القيمة الدقيقة 50 والتقريب 49، فما الخطأ النسبي بالنسبة المئوية؟' AND "QuestionTextEn"='If the exact value is 50 and the approximation is 49, what is the percentage relative error?'
 AND "DetailedSolutionAr"='الخطأ المطلق 1، ونقسم على القيمة الدقيقة 50: 1/50=0.02=2%.' AND "DetailedSolutionEn"='Absolute error is 1; divide by the exact value 50: 1/50=0.02=2%.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"1\\%"},{"Order":2,"IsCorrect":true,"LatexCode":"2\\%"},{"Order":3,"IsCorrect":false,"LatexCode":"5\\%"},{"Order":4,"IsCorrect":false,"LatexCode":"0.2\\%"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 138 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: الحد الأعلى للخطأ المطلق عند التقريب لأقرب وحدة قياس يساوي نصف حجم خطوة التقريب. التقريب لأقرب جزء من المئة يعني خطوة مقدارها 0.01. لذلك أقصى خطأ مطلق = 0.01/2 = 0.005. هذا حد للخطأ في حالة التقريب المعتادة.', "DetailedSolutionEn"='Rule used: Rounding to the nearest fixed step introduces a maximum absolute error of half that step. Nearest hundredth means step 0.01, so the maximum rounding error is 0.01/2 = 0.005, assuming ordinary nearest-value rounding.'
 WHERE "Id"=139 AND "TopicProposalId"=12 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='عند تقريب قياس إلى أقرب جزء من مئة، ما الحد الأعلى للخطأ المطلق بسبب التقريب؟' AND "QuestionTextEn"='When rounding a measurement to the nearest hundredth, what is the maximum absolute rounding error?'
 AND "DetailedSolutionAr"='المسافة بين قيمتين متتاليتين 0.01، وأكبر خطأ تقريب لا يتجاوز نصفها وهو 0.005.' AND "DetailedSolutionEn"='Adjacent rounded values differ by 0.01; the absolute error is bounded by half of that, 0.005.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"0.01"},{"Order":2,"IsCorrect":false,"LatexCode":"0.05"},{"Order":3,"IsCorrect":false,"LatexCode":"0.001"},{"Order":4,"IsCorrect":true,"LatexCode":"0.005"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 139 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: طريقة جاكوبي تعزل كل متغير وتستعمل قيم التكرار السابق لجميع المعادلات بالتزامن. من 4س+ص=9 نجد س=(9−ص)/4، ومن س+3ص=7 نجد ص=(7−س)/3. عند (س₀،ص₀)=(0،0) نحسب س₁=9/4 وص₁=7/3. لا نستخدم س₁ في حساب ص₁ لأن ذلك يصبح غاوس–سايدل.', "DetailedSolutionEn"='Rule used: Jacobi iteration isolates each variable and computes new values using only the previous iteration. Rearrange 4x+y=9 as x=(9−y)/4 and x+3y=7 as y=(7−x)/3. Starting at (x₀,y₀)=(0,0) gives (x₁,y₁)=(9/4,7/3). Do not use x₁ to compute y₁ in Jacobi.'
 WHERE "Id"=140 AND "TopicProposalId"=12 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='للنظام $4x+y=9$ و$x+3y=7$، نبدأ $x_0=y_0=0$. ما الزوج $(x_1,y_1)$ بطريقة جاكوبي؟' AND "QuestionTextEn"='For $4x+y=9$ and $x+3y=7$, start from $x_0=y_0=0$. What is the first Jacobi iterate $(x_1,y_1)$?'
 AND "DetailedSolutionAr"='نحسب x1=(9-y0)/4=9/4 وy1=(7-x0)/3=7/3 باستخدام القيم القديمة فقط.' AND "DetailedSolutionEn"='Use only the previous iterate: x1=(9-y0)/4=9/4 and y1=(7-x0)/3=7/3.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":true,"LatexCode":"(\\frac94,\\frac73)"},{"Order":2,"IsCorrect":false,"LatexCode":"(\\frac73,\\frac94)"},{"Order":3,"IsCorrect":false,"LatexCode":"(9,7)"},{"Order":4,"IsCorrect":false,"LatexCode":"(\\frac94,\\frac{19}{12})"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 140 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='المبدأ المستخدم: طريقة الحذف لحل نظام معادلتين تلغي أحد المجهولين بجمع المعادلتين بعد جعل معامليه متعاكسين. لدينا 2س+ص=7 و س−ص=2؛ بجمعهما يختفي ص فنحصل على 3س=9. نقسم على 3 فتصبح س=3. التحقق في الثانية: ص=1، والأولى 2×3+1=7.', "DetailedSolutionEn"='Rule used: Elimination solves simultaneous equations by adding equations with opposite coefficients for one variable. Add 2x+y=7 and x−y=2: y cancels and 3x=9, hence x=3. Check: y=1 and 2×3+1=7.'
 WHERE "Id"=141 AND "TopicProposalId"=12 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='باستخدام الحذف، حل النظام $2x+y=7$ و$x-y=2$. ما قيمة $x$؟' AND "QuestionTextEn"='Use elimination to solve $2x+y=7$ and $x-y=2$. What is $x$?'
 AND "DetailedSolutionAr"='نجمع المعادلتين فيزول y: 3x=9، وبالتالي x=3، ومن الثانية y=1.' AND "DetailedSolutionEn"='Add the equations to eliminate y: 3x=9, so x=3 and the other equation gives y=1.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"2"},{"Order":2,"IsCorrect":false,"LatexCode":"4"},{"Order":3,"IsCorrect":false,"LatexCode":"1"},{"Order":4,"IsCorrect":true,"LatexCode":"3"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 141 stale, changed, or published; rollback all'; END IF;
 UPDATE public."CurriculumDraftItems"
 SET "DetailedSolutionAr"='القانون المستخدم: متجه الباقي في حل نظام خطي هو r = b − A x̂، ومعيار اللانهاية يساوي أكبر قيمة مطلقة بين مركبات الباقي. المصفوفة A قطرية (2،3) والتقريب x̂=(2،2)، لذا Ax̂=(4،6)، ومع b=(4،9) نجد r=(0،3). إذن ||r||∞=max(|0|،|3|)=3.', "DetailedSolutionEn"='Rule used: Residual for an approximate linear-system solution is r = b − Ax̂, and its infinity norm is the largest absolute residual component. With A=diag(2,3), x̂=(2,2), Ax̂=(4,6), and b=(4,9), residual is r=(0,3). Therefore ||r||∞ = max(0,3) = 3.'
 WHERE "Id"=142 AND "TopicProposalId"=12 AND "EditorialStatus"='Draft'
 AND "QuestionTextAr"='للنظام $A=diag(2,3)$ و$b=(4,9)$، إذا كان التقريب $x=(2,2)$، فما معيار اللانهاية للمتبقي $r=b-Ax$؟' AND "QuestionTextEn"='For $A=diag(2,3)$, $b=(4,9)$ and approximate solution $x=(2,2)$, find the infinity norm of residual $r=b-Ax$.'
 AND "DetailedSolutionAr"='نحسب Ax=(4,6)، والمتبقي r=(0,3)، وأكبر قيمة مطلقة لعناصره تساوي 3.' AND "DetailedSolutionEn"='Compute Ax=(4,6); residual r=(0,3); its infinity norm is max(|0|,|3|)=3.'
 AND "OptionsJson"='[{"Order":1,"IsCorrect":false,"LatexCode":"0"},{"Order":2,"IsCorrect":false,"LatexCode":"1"},{"Order":3,"IsCorrect":true,"LatexCode":"3"},{"Order":4,"IsCorrect":false,"LatexCode":"9"}]'::jsonb;
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Draft 142 stale, changed, or published; rollback all'; END IF;
END $mw_final40_draft_rules$;
COMMIT;
