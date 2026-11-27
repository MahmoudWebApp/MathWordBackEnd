-- One-time owner-authorized import AND publication from reviewed v17/v19 school waves.
-- Existing skills and tracks only; explicit source keys, no duplicate imports.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v19-grade-2-strip-length-closest-without-going-over-1$mw$,$mw$strip-length-closest-without-going-over$mw$,$mw$length$mw$,$mw$grade-2$mw$,2,1,82,321,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":321,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"الشريط الأقرب إلى طول الإطار","En":"The closest strip that fits the frame"},"Question":{"Ar":"طول الحافة التي تريد يارا تغطيتها ١٤ سم. ستختار شريطاً واحداً من الأطوال الآتية. يجب ألّا يبرز الشريط عن الحافة، وتريد أن يبقى أقصر جزء ممكن من الحافة بلا تغطية. ما طول الشريط الذي تختاره؟","En":"Yara wants to cover a 14 cm edge with one of the following strips. The strip cannot extend past the edge, and she wants to leave as little of the edge uncovered as possible. What strip length should she choose?"},"Options":[{"LatexCode":"15","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"اختار أقرب طول إجمالاً من دون تطبيق شرط عدم البروز.","En":"Chooses the closest length overall without applying the no-overhang rule."}},{"LatexCode":"12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"اختار الشريط الأقصر بدلاً من أقل فراغ ممكن.","En":"Chooses the shortest strip instead of the smallest uncovered gap."}},{"LatexCode":"18","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"اختار الشريط الأطول من دون التأكد من ملاءمته.","En":"Chooses the longest strip without checking that it fits."}}],"Hints":[{"Ar":"استبعد الأطوال التي تتجاوز ١٤ سم.","En":"Rule out lengths greater than 14 cm."},{"Ar":"قارن ما يبقى مكشوفاً بعد وضع كل شريط يصلح.","En":"Compare how much edge each strip that fits would leave exposed."}],"Solution":{"Idea":{"Ar":"نقارن الفراغ المتبقي بين الشرائط التي لا تتجاوز طول الحافة فقط.","En":"Compare uncovered lengths only among strips that do not exceed the edge."},"FormulaLatex":"g=14-L,\\quad L\\le 14","Steps":[{"Ar":"الشريطان ١٥ و١٨ سم أطول من الحافة.","En":"The 15 cm and 18 cm strips are too long."},{"Ar":"يترك شريط ١٢ سم مقدار ٢ سم، ويترك شريط ٩ سم مقدار ٥ سم.","En":"The 12 cm strip leaves 2 cm exposed, and the 9 cm strip leaves 5 cm exposed."}],"Substitution":{"Ar":"$14-12=2<14-9=5$","En":"$14-12=2<14-9=5$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"١٢ + ٢ = ١٤، ولا يوجد في الخيارات طول بين ١٢ و١٤ سم.","En":"12 + 2 = 14, and no option has a length between 12 and 14 cm."},"CommonError":{"Ar":"اختار أقرب طول إجمالاً من دون تطبيق شرط عدم البروز.","En":"Chooses the closest length overall without applying the no-overhang rule."}}}$mw$::jsonb,$mw$نقارن الفراغ المتبقي بين الشرائط التي لا تتجاوز طول الحافة فقط.

$g=14-L,\quad L\le 14$

1. الشريطان ١٥ و١٨ سم أطول من الحافة.

2. يترك شريط ١٢ سم مقدار ٢ سم، ويترك شريط ٩ سم مقدار ٥ سم.

$14-12=2<14-9=5$

$12$ سم

١٢ + ٢ = ١٤، ولا يوجد في الخيارات طول بين ١٢ و١٤ سم.

اختار أقرب طول إجمالاً من دون تطبيق شرط عدم البروز.$mw$,$mw$Compare uncovered lengths only among strips that do not exceed the edge.

$g=14-L,\quad L\le 14$

1. The 15 cm and 18 cm strips are too long.

2. The 12 cm strip leaves 2 cm exposed, and the 9 cm strip leaves 5 cm exposed.

$14-12=2<14-9=5$

$12$ cm

12 + 2 = 14, and no option has a length between 12 and 14 cm.

Chooses the closest length overall without applying the no-overhang rule.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"استبعد الأطوال التي تتجاوز ١٤ سم.","En":"Rule out lengths greater than 14 cm."},{"Ar":"قارن ما يبقى مكشوفاً بعد وضع كل شريط يصلح.","En":"Compare how much edge each strip that fits would leave exposed."}],"Solution":{"Idea":{"Ar":"نقارن الفراغ المتبقي بين الشرائط التي لا تتجاوز طول الحافة فقط.","En":"Compare uncovered lengths only among strips that do not exceed the edge."},"FormulaLatex":"g=14-L,\\quad L\\le 14","Steps":[{"Ar":"الشريطان ١٥ و١٨ سم أطول من الحافة.","En":"The 15 cm and 18 cm strips are too long."},{"Ar":"يترك شريط ١٢ سم مقدار ٢ سم، ويترك شريط ٩ سم مقدار ٥ سم.","En":"The 12 cm strip leaves 2 cm exposed, and the 9 cm strip leaves 5 cm exposed."}],"Substitution":{"Ar":"$14-12=2<14-9=5$","En":"$14-12=2<14-9=5$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"١٢ + ٢ = ١٤، ولا يوجد في الخيارات طول بين ١٢ و١٤ سم.","En":"12 + 2 = 14, and no option has a length between 12 and 14 cm."},"CommonError":{"Ar":"اختار أقرب طول إجمالاً من دون تطبيق شرط عدم البروز.","En":"Chooses the closest length overall without applying the no-overhang rule."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"اختار أقرب طول إجمالاً من دون تطبيق شرط عدم البروز.","En":"Chooses the closest length overall without applying the no-overhang rule."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"اختار الشريط الأقصر بدلاً من أقل فراغ ممكن.","En":"Chooses the shortest strip instead of the smallest uncovered gap."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"اختار الشريط الأطول من دون التأكد من ملاءمته.","En":"Chooses the longest strip without checking that it fits."},"Order":4}]}$mw$),
($mw$growth-v19-grade-4-feasible-sticker-total-with-quotient-and-remainder-limit-1$mw$,$mw$feasible-sticker-total-with-quotient-and-remainder-limit$mw$,$mw$primary-division$mw$,$mw$grade-4$mw$,4,1,33,5,$mw${"StageId":1,"CategoryId":33,"PrimarySkillId":5,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"مجموع الملصقات المناسب","En":"A feasible sticker total"},"Question":{"Ar":"يوزّع هشام كل الملصقات الممكنة على ستة أظرف بالتساوي ثم يترك الباقي جانباً. وجد في كل ظرف ٤ ملصقات وبقي جانباً أكثر من ملصق وأقل من ٤ ملصقات. أي عدد من الخيارات يمكن أن يكون العدد الأصلي؟","En":"Hisham shares as many stickers as possible equally among six envelopes and sets the rest aside. Each envelope has 4 stickers, and more than one but fewer than four stickers are left aside. Which option could be the original number?"},"Options":[{"LatexCode":"27","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"24","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل الملصقات الباقية.","En":"Omits the leftover stickers."}},{"LatexCode":"25","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"سمح بباقٍ يساوي ١ رغم الشرط الصارم.","En":"Allows a remainder of 1 despite the strict bound."}},{"LatexCode":"28","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"سمح بباقٍ يساوي ٤ رغم الشرط الصارم.","En":"Allows a remainder of 4 despite the strict bound."}}],"Hints":[{"Ar":"احسب أولاً الملصقات التي دخلت الأظرف.","En":"First count the stickers placed in the envelopes."},{"Ar":"جرّب إضافة باقي يحقق الشرط إلى عدد الملصقات الموزعة.","En":"Add a remainder that meets the condition to the number distributed."}],"Solution":{"Idea":{"Ar":"العدد الكلي يساوي العدد الموزّع بالتساوي مضافاً إليه الباقي الصحيح الذي يحقق الشرط.","En":"The original count equals the distributed amount plus an integer remainder satisfying the restriction."},"FormulaLatex":"N=6\\times4+r,\\quad 1<r<4","Steps":[{"Ar":"تحتوي الأظرف مجتمعة على ٢٤ ملصقاً.","En":"The envelopes contain 24 stickers altogether."},{"Ar":"الباقي ٢ أو ٣، فيكون المجموع الممكن ٢٦ أو ٢٧. يظهر ٢٧ فقط في الخيارات.","En":"The remainder can be 2 or 3, giving totals of 26 or 27. Only 27 appears among the options."}],"Substitution":{"Ar":"$27=6\\times4+3$","En":"$27=6\\times4+3$"},"Result":{"Ar":"$27$","En":"$27$"},"Unit":{"Ar":"ملصقاً","En":"stickers"},"Verification":{"Ar":"قسمة ٢٧ على ٦ تعطي ٤ والباقي ٣، وهو أكبر من ١ وأصغر من ٤.","En":"Dividing 27 by 6 gives quotient 4 and remainder 3, which lies strictly between 1 and 4."},"CommonError":{"Ar":"أهمل الملصقات الباقية.","En":"Omits the leftover stickers."}}}$mw$::jsonb,$mw$العدد الكلي يساوي العدد الموزّع بالتساوي مضافاً إليه الباقي الصحيح الذي يحقق الشرط.

$N=6\times4+r,\quad 1<r<4$

1. تحتوي الأظرف مجتمعة على ٢٤ ملصقاً.

2. الباقي ٢ أو ٣، فيكون المجموع الممكن ٢٦ أو ٢٧. يظهر ٢٧ فقط في الخيارات.

$27=6\times4+3$

$27$ ملصقاً

قسمة ٢٧ على ٦ تعطي ٤ والباقي ٣، وهو أكبر من ١ وأصغر من ٤.

أهمل الملصقات الباقية.$mw$,$mw$The original count equals the distributed amount plus an integer remainder satisfying the restriction.

$N=6\times4+r,\quad 1<r<4$

1. The envelopes contain 24 stickers altogether.

2. The remainder can be 2 or 3, giving totals of 26 or 27. Only 27 appears among the options.

$27=6\times4+3$

$27$ stickers

Dividing 27 by 6 gives quotient 4 and remainder 3, which lies strictly between 1 and 4.

Omits the leftover stickers.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"احسب أولاً الملصقات التي دخلت الأظرف.","En":"First count the stickers placed in the envelopes."},{"Ar":"جرّب إضافة باقي يحقق الشرط إلى عدد الملصقات الموزعة.","En":"Add a remainder that meets the condition to the number distributed."}],"Solution":{"Idea":{"Ar":"العدد الكلي يساوي العدد الموزّع بالتساوي مضافاً إليه الباقي الصحيح الذي يحقق الشرط.","En":"The original count equals the distributed amount plus an integer remainder satisfying the restriction."},"FormulaLatex":"N=6\\times4+r,\\quad 1<r<4","Steps":[{"Ar":"تحتوي الأظرف مجتمعة على ٢٤ ملصقاً.","En":"The envelopes contain 24 stickers altogether."},{"Ar":"الباقي ٢ أو ٣، فيكون المجموع الممكن ٢٦ أو ٢٧. يظهر ٢٧ فقط في الخيارات.","En":"The remainder can be 2 or 3, giving totals of 26 or 27. Only 27 appears among the options."}],"Substitution":{"Ar":"$27=6\\times4+3$","En":"$27=6\\times4+3$"},"Result":{"Ar":"$27$","En":"$27$"},"Unit":{"Ar":"ملصقاً","En":"stickers"},"Verification":{"Ar":"قسمة ٢٧ على ٦ تعطي ٤ والباقي ٣، وهو أكبر من ١ وأصغر من ٤.","En":"Dividing 27 by 6 gives quotient 4 and remainder 3, which lies strictly between 1 and 4."},"CommonError":{"Ar":"أهمل الملصقات الباقية.","En":"Omits the leftover stickers."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أهمل الملصقات الباقية.","En":"Omits the leftover stickers."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"سمح بباقٍ يساوي ١ رغم الشرط الصارم.","En":"Allows a remainder of 1 despite the strict bound."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"سمح بباقٍ يساوي ٤ رغم الشرط الصارم.","En":"Allows a remainder of 4 despite the strict bound."},"Order":4}]}$mw$),
($mw$growth-v19-grade-7-equal-distance-opposite-side-coordinates-1$mw$,$mw$equal-distance-opposite-side-coordinates$mw$,$mw$absolute-value$mw$,$mw$grade-7$mw$,7,2,83,307,$mw${"StageId":2,"CategoryId":83,"PrimarySkillId":307,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"قراءتان على بُعد واحد من المرجع","En":"Two readings equally far from a reference"},"Question":{"Ar":"على خط الأعداد، تقع النقطة $A$ عند $-7$ والنقطة المرجعية $R$ عند $-2$. تقع النقطة $B$ على الجانب الآخر من $R$ وعلى البعد نفسه من $R$ مثل $A$. ما إحداثي $B$؟","En":"On a number line, A is at −7 and the reference point R is at −2. B lies on the opposite side of R and is the same distance from R as A. What is the coordinate of B?"},"Options":[{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى المسافة من ر بدلاً من إحداثي ب.","En":"Reports the distance from R instead of the coordinate of B."}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عكس إشارة إحداثي أ كأن المرجع هو الصفر.","En":"Reverses the sign of A as if the reference point were zero."}},{"LatexCode":"-7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تحرك المسافة الصحيحة إلى اليسار بدلاً من اليمين.","En":"Moves the correct distance to the left instead of the right."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"احسب القيمة المطلقة للفرق بين إحداثيي $A$ و$R$.","En":"Find the absolute difference between the coordinates of A and R."},{"Ar":"انتقل من −٢ إلى اليمين بهذا البعد.","En":"Move right from −2 by that distance."}],"Solution":{"Idea":{"Ar":"نقيس البعد عن نقطة المرجع، ثم نتحرك بالمقدار نفسه في الاتجاه المعاكس.","En":"Measure the distance from the reference, then move equally far in the opposite direction."},"FormulaLatex":"|b-(-2)|=|-7-(-2)|,\\quad b>-2","Steps":[{"Ar":"تبعد النقطة $A$ عن $R$ خمس وحدات.","En":"A is five units from R."},{"Ar":"تقع $B$ إلى يمين $R$، لذا نضيف خمس وحدات إلى $-2$.","En":"B is to the right of R, so add five units to $-2$."}],"Substitution":{"Ar":"$-2+5=3$","En":"$-2+5=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"وحدات على خط الأعداد","En":"number-line units"},"Verification":{"Ar":"المسافتان |٣−(−٢)| و|−٧−(−٢)| تساويان ٥، و٣ إلى يمين −٢.","En":"Both |3−(−2)| and |−7−(−2)| equal 5, and 3 lies to the right of −2."},"CommonError":{"Ar":"أعطى المسافة من ر بدلاً من إحداثي ب.","En":"Reports the distance from R instead of the coordinate of B."}}}$mw$::jsonb,$mw$نقيس البعد عن نقطة المرجع، ثم نتحرك بالمقدار نفسه في الاتجاه المعاكس.

$|b-(-2)|=|-7-(-2)|,\quad b>-2$

1. تبعد النقطة $A$ عن $R$ خمس وحدات.

2. تقع $B$ إلى يمين $R$، لذا نضيف خمس وحدات إلى $-2$.

$-2+5=3$

$3$ وحدات على خط الأعداد

المسافتان |٣−(−٢)| و|−٧−(−٢)| تساويان ٥، و٣ إلى يمين −٢.

أعطى المسافة من ر بدلاً من إحداثي ب.$mw$,$mw$Measure the distance from the reference, then move equally far in the opposite direction.

$|b-(-2)|=|-7-(-2)|,\quad b>-2$

1. A is five units from R.

2. B is to the right of R, so add five units to $-2$.

$-2+5=3$

$3$ number-line units

Both |3−(−2)| and |−7−(−2)| equal 5, and 3 lies to the right of −2.

Reports the distance from R instead of the coordinate of B.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"احسب القيمة المطلقة للفرق بين إحداثيي $A$ و$R$.","En":"Find the absolute difference between the coordinates of A and R."},{"Ar":"انتقل من −٢ إلى اليمين بهذا البعد.","En":"Move right from −2 by that distance."}],"Solution":{"Idea":{"Ar":"نقيس البعد عن نقطة المرجع، ثم نتحرك بالمقدار نفسه في الاتجاه المعاكس.","En":"Measure the distance from the reference, then move equally far in the opposite direction."},"FormulaLatex":"|b-(-2)|=|-7-(-2)|,\\quad b>-2","Steps":[{"Ar":"تبعد النقطة $A$ عن $R$ خمس وحدات.","En":"A is five units from R."},{"Ar":"تقع $B$ إلى يمين $R$، لذا نضيف خمس وحدات إلى $-2$.","En":"B is to the right of R, so add five units to $-2$."}],"Substitution":{"Ar":"$-2+5=3$","En":"$-2+5=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"وحدات على خط الأعداد","En":"number-line units"},"Verification":{"Ar":"المسافتان |٣−(−٢)| و|−٧−(−٢)| تساويان ٥، و٣ إلى يمين −٢.","En":"Both |3−(−2)| and |−7−(−2)| equal 5, and 3 lies to the right of −2."},"CommonError":{"Ar":"أعطى المسافة من ر بدلاً من إحداثي ب.","En":"Reports the distance from R instead of the coordinate of B."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أعطى المسافة من ر بدلاً من إحداثي ب.","En":"Reports the distance from R instead of the coordinate of B."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"عكس إشارة إحداثي أ كأن المرجع هو الصفر.","En":"Reverses the sign of A as if the reference point were zero."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"تحرك المسافة الصحيحة إلى اليسار بدلاً من اليمين.","En":"Moves the correct distance to the left instead of the right."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v19-grade-8-map-scale-rectangular-area-converts-both-dimensions-1$mw$,$mw$map-scale-rectangular-area-converts-both-dimensions$mw$,$mw$middle-map-scale$mw$,$mw$grade-8$mw$,8,2,7,33,$mw${"StageId":2,"CategoryId":7,"PrimarySkillId":33,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"المساحة الحقيقية من خريطة","En":"Actual area from a map"},"Question":{"Ar":"يمثّل كل ١ سم على خريطة مسافة ٢٠٠ م على الأرض. تظهر حديقة مستطيلة على الخريطة بطول ٣ سم وعرض ٢ سم. ما مساحتها الحقيقية بالكيلومتر المربع؟","En":"Each 1 cm on a map represents 200 m on the ground. A rectangular park measures 3 cm by 2 cm on the map. What is its actual area in square kilometres?"},"Options":[{"LatexCode":"0.24","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"1.2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ضرب مساحة الخريطة في معامل الطول مرة واحدة.","En":"Applies the linear scale factor only once to the map area."}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب محيط الحديقة بالكيلومتر بدلاً من مساحتها.","En":"Computes the perimeter in kilometres instead of the area."}},{"LatexCode":"240","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قسم الأمتار المربعة على معامل تحويل الأطوال ١٬٠٠٠.","En":"Divides square metres by the linear conversion factor of 1,000."}}],"Hints":[{"Ar":"حوّل كل بُعد على الخريطة إلى مسافة حقيقية بمفرده.","En":"Convert each map dimension to an actual distance separately."},{"Ar":"حوّل ٦٠٠ و٤٠٠ متر إلى كيلومترات ثم اضرب البعدين.","En":"Convert 600 m and 400 m to kilometres, then multiply the dimensions."}],"Solution":{"Idea":{"Ar":"مقياس الطول يُطبّق على كل بُعد على حدة، لذلك يتربع معامل الطول عند تحويل المساحة.","En":"Apply the linear scale to each dimension; the area scale is the square of the length scale."},"FormulaLatex":"A=(3\\times0.2)(2\\times0.2)","Steps":[{"Ar":"في الواقع البعدان ٦٠٠ م و٤٠٠ م.","En":"The actual dimensions are 600 m and 400 m."},{"Ar":"يساويان ٠٫٦ كم و٠٫٤ كم، وحاصل ضربهما هو المساحة.","En":"These are 0.6 km and 0.4 km. Their product is the area."}],"Substitution":{"Ar":"$0.6\\times0.4=0.24$","En":"$0.6\\times0.4=0.24$"},"Result":{"Ar":"$0.24$","En":"$0.24$"},"Unit":{"Ar":"كم²","En":"km²"},"Verification":{"Ar":"٦٠٠ × ٤٠٠ = ٢٤٠٬٠٠٠ م²، ونقسم على مليون لأن الكيلومتر المربع يساوي مليون متر مربع.","En":"600 × 400 = 240,000 m². Divide by one million because a square kilometre contains a million square metres."},"CommonError":{"Ar":"ضرب مساحة الخريطة في معامل الطول مرة واحدة.","En":"Applies the linear scale factor only once to the map area."}}}$mw$::jsonb,$mw$مقياس الطول يُطبّق على كل بُعد على حدة، لذلك يتربع معامل الطول عند تحويل المساحة.

$A=(3\times0.2)(2\times0.2)$

1. في الواقع البعدان ٦٠٠ م و٤٠٠ م.

2. يساويان ٠٫٦ كم و٠٫٤ كم، وحاصل ضربهما هو المساحة.

$0.6\times0.4=0.24$

$0.24$ كم²

٦٠٠ × ٤٠٠ = ٢٤٠٬٠٠٠ م²، ونقسم على مليون لأن الكيلومتر المربع يساوي مليون متر مربع.

ضرب مساحة الخريطة في معامل الطول مرة واحدة.$mw$,$mw$Apply the linear scale to each dimension; the area scale is the square of the length scale.

$A=(3\times0.2)(2\times0.2)$

1. The actual dimensions are 600 m and 400 m.

2. These are 0.6 km and 0.4 km. Their product is the area.

$0.6\times0.4=0.24$

$0.24$ km²

600 × 400 = 240,000 m². Divide by one million because a square kilometre contains a million square metres.

Applies the linear scale factor only once to the map area.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"حوّل كل بُعد على الخريطة إلى مسافة حقيقية بمفرده.","En":"Convert each map dimension to an actual distance separately."},{"Ar":"حوّل ٦٠٠ و٤٠٠ متر إلى كيلومترات ثم اضرب البعدين.","En":"Convert 600 m and 400 m to kilometres, then multiply the dimensions."}],"Solution":{"Idea":{"Ar":"مقياس الطول يُطبّق على كل بُعد على حدة، لذلك يتربع معامل الطول عند تحويل المساحة.","En":"Apply the linear scale to each dimension; the area scale is the square of the length scale."},"FormulaLatex":"A=(3\\times0.2)(2\\times0.2)","Steps":[{"Ar":"في الواقع البعدان ٦٠٠ م و٤٠٠ م.","En":"The actual dimensions are 600 m and 400 m."},{"Ar":"يساويان ٠٫٦ كم و٠٫٤ كم، وحاصل ضربهما هو المساحة.","En":"These are 0.6 km and 0.4 km. Their product is the area."}],"Substitution":{"Ar":"$0.6\\times0.4=0.24$","En":"$0.6\\times0.4=0.24$"},"Result":{"Ar":"$0.24$","En":"$0.24$"},"Unit":{"Ar":"كم²","En":"km²"},"Verification":{"Ar":"٦٠٠ × ٤٠٠ = ٢٤٠٬٠٠٠ م²، ونقسم على مليون لأن الكيلومتر المربع يساوي مليون متر مربع.","En":"600 × 400 = 240,000 m². Divide by one million because a square kilometre contains a million square metres."},"CommonError":{"Ar":"ضرب مساحة الخريطة في معامل الطول مرة واحدة.","En":"Applies the linear scale factor only once to the map area."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"ضرب مساحة الخريطة في معامل الطول مرة واحدة.","En":"Applies the linear scale factor only once to the map area."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"حسب محيط الحديقة بالكيلومتر بدلاً من مساحتها.","En":"Computes the perimeter in kilometres instead of the area."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"قسم الأمتار المربعة على معامل تحويل الأطوال ١٬٠٠٠.","En":"Divides square metres by the linear conversion factor of 1,000."},"Order":4}]}$mw$),
($mw$growth-v19-grade-10-scalar-multiple-from-one-component-cancelled-1$mw$,$mw$scalar-multiple-from-one-component-cancelled$mw$,$mw$vector-components$mw$,$mw$grade-10$mw$,10,3,87,340,$mw${"StageId":3,"CategoryId":87,"PrimarySkillId":340,"SecondarySkillIds":[],"TrackIds":[10],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"مضاعف يلغي المركبة الرأسية","En":"A multiple that cancels the vertical component"},"Question":{"Ar":"إذا كان $u=(3,2)$ و$v=(-1,4)$، فما قيمة العدد الحقيقي $k$ الذي يجعل المتجه $u+kv$ أفقياً؟","En":"If u=(3,2) and v=(−1,4), what real scalar k makes the vector u + kv horizontal?"},"Options":[{"LatexCode":"\\frac{1}{2}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب نسبة المقدارين وأغفل إشارة الإلغاء.","En":"Finds the ratio of magnitudes and misses the cancellation sign."}},{"LatexCode":"-2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عامل مركبة v الرأسية كأنها ١ بدلاً من ٤.","En":"Treats the vertical component of v as 1 instead of 4."}},{"LatexCode":"-\\frac{1}{2}","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ألغى المركبة الأفقية فحصل على اتجاه رأسي.","En":"Cancels the horizontal component and obtains a vertical direction."}}],"Hints":[{"Ar":"ما المركبة التي تساوي صفراً في متجه أفقي؟","En":"Which component is zero in a horizontal vector?"},{"Ar":"اكتب المركبة الثانية للمتجه u + kv واجعلها تساوي صفراً.","En":"Write the second component of u + kv and set it to zero."}],"Solution":{"Idea":{"Ar":"المتجه الأفقي غير الصفري له مركبة رأسية تساوي صفراً.","En":"A nonzero horizontal vector has zero vertical component."},"FormulaLatex":"u+kv=(3-k,2+4k)","Steps":[{"Ar":"المركبة الرأسية للمجموع هي 2+4k.","En":"The vertical component of the sum is 2+4k."},{"Ar":"إذا كانت تساوي صفراً فإن 4k=−2.","En":"Setting it to zero gives 4k=−2."}],"Substitution":{"Ar":"$2+4k=0\\Rightarrow k=-\\frac12$","En":"$2+4k=0\\Rightarrow k=-\\frac12$"},"Result":{"Ar":"$-\\frac{1}{2}$","En":"$-\\frac{1}{2}$"},"Unit":{"Ar":"دون وحدة","En":"unitless"},"Verification":{"Ar":"بالتعويض نحصل على (7/2,0)، وهو متجه أفقي غير صفري.","En":"Substitution gives (7/2,0), a nonzero horizontal vector."},"CommonError":{"Ar":"حسب نسبة المقدارين وأغفل إشارة الإلغاء.","En":"Finds the ratio of magnitudes and misses the cancellation sign."}}}$mw$::jsonb,$mw$المتجه الأفقي غير الصفري له مركبة رأسية تساوي صفراً.

$u+kv=(3-k,2+4k)$

1. المركبة الرأسية للمجموع هي 2+4k.

2. إذا كانت تساوي صفراً فإن 4k=−2.

$2+4k=0\Rightarrow k=-\frac12$

$-\frac{1}{2}$ دون وحدة

بالتعويض نحصل على (7/2,0)، وهو متجه أفقي غير صفري.

حسب نسبة المقدارين وأغفل إشارة الإلغاء.$mw$,$mw$A nonzero horizontal vector has zero vertical component.

$u+kv=(3-k,2+4k)$

1. The vertical component of the sum is 2+4k.

2. Setting it to zero gives 4k=−2.

$2+4k=0\Rightarrow k=-\frac12$

$-\frac{1}{2}$ unitless

Substitution gives (7/2,0), a nonzero horizontal vector.

Finds the ratio of magnitudes and misses the cancellation sign.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"ما المركبة التي تساوي صفراً في متجه أفقي؟","En":"Which component is zero in a horizontal vector?"},{"Ar":"اكتب المركبة الثانية للمتجه u + kv واجعلها تساوي صفراً.","En":"Write the second component of u + kv and set it to zero."}],"Solution":{"Idea":{"Ar":"المتجه الأفقي غير الصفري له مركبة رأسية تساوي صفراً.","En":"A nonzero horizontal vector has zero vertical component."},"FormulaLatex":"u+kv=(3-k,2+4k)","Steps":[{"Ar":"المركبة الرأسية للمجموع هي 2+4k.","En":"The vertical component of the sum is 2+4k."},{"Ar":"إذا كانت تساوي صفراً فإن 4k=−2.","En":"Setting it to zero gives 4k=−2."}],"Substitution":{"Ar":"$2+4k=0\\Rightarrow k=-\\frac12$","En":"$2+4k=0\\Rightarrow k=-\\frac12$"},"Result":{"Ar":"$-\\frac{1}{2}$","En":"$-\\frac{1}{2}$"},"Unit":{"Ar":"دون وحدة","En":"unitless"},"Verification":{"Ar":"بالتعويض نحصل على (7/2,0)، وهو متجه أفقي غير صفري.","En":"Substitution gives (7/2,0), a nonzero horizontal vector."},"CommonError":{"Ar":"حسب نسبة المقدارين وأغفل إشارة الإلغاء.","En":"Finds the ratio of magnitudes and misses the cancellation sign."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"حسب نسبة المقدارين وأغفل إشارة الإلغاء.","En":"Finds the ratio of magnitudes and misses the cancellation sign."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"عامل مركبة v الرأسية كأنها ١ بدلاً من ٤.","En":"Treats the vertical component of v as 1 instead of 4."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ألغى المركبة الأفقية فحصل على اتجاه رأسي.","En":"Cancels the horizontal component and obtains a vertical direction."},"Order":4}]}$mw$),
($mw$growth-v19-grade-11-combinations-avoid-three-way-unanimity-1$mw$,$mw$combinations-avoid-three-way-unanimity$mw$,$mw$secondary-combinations$mw$,$mw$grade-11$mw$,11,3,12,56,$mw${"StageId":3,"CategoryId":12,"PrimarySkillId":56,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"فريق يضم عضوين على الأقل من مجموعة واحدة","En":"A team with at least two members from one group"},"Question":{"Ar":"يختار النادي فريقاً من ثلاثة أشخاص من ثلاث مجموعات منفصلة، في كل مجموعة شخصان. ترتيب أعضاء الفريق غير مهم. كم فريقاً يضم شخصين على الأقل من المجموعة نفسها؟","En":"A club chooses a team of three from three disjoint groups of two people each. Team order does not matter. How many teams include at least two people from the same group?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"اختار مجموعة الزوج وأغفل العضو الثالث.","En":"Chooses the pair’s group but skips the third member."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدّ فرق المتممة التي تضم عضواً من كل مجموعة.","En":"Counts the complementary teams with one member from each group."}},{"LatexCode":"20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدّ جميع الفرق من دون تطبيق الشرط.","En":"Counts all teams without applying the condition."}},{"LatexCode":"12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"حدّد كم شخصاً يمكن أخذه من مجموعة واحدة.","En":"Decide how many members can come from any one group."},{"Ar":"اختر المجموعة التي ينتمي إليها الشخصان، ثم اختر العضو الثالث من خارجها.","En":"Choose the group that supplies the pair, then choose the third member from outside it."}],"Solution":{"Idea":{"Ar":"الفريق المطلوب يحتوي زوجاً من مجموعة واحدة وعضواً من مجموعة أخرى، دون اعتبار للترتيب.","En":"A qualifying team has a pair from one group and one person from another, regardless of order."},"FormulaLatex":"3\\binom{2}{2}\\binom{4}{1}","Steps":[{"Ar":"هناك ثلاث طرق لاختيار المجموعة التي تمدّنا بالشخصين، ويُختار الاثنان معاً.","En":"There are three choices of group to supply the pair, and both people from it are selected."},{"Ar":"يبقى أربعة أشخاص خارج المجموعة لاختيار عضو ثالث. لا يمكن لفريق من ثلاثة أن يحتوي زوجين من مجموعتين مختلفتين.","En":"Four people outside it can be the third member. A three-person team cannot include pairs from two different groups."}],"Substitution":{"Ar":"$3\\times1\\times4=12$","En":"$3\\times1\\times4=12$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"فريقاً","En":"teams"},"Verification":{"Ar":"هناك ٢٠ فريقاً إجمالاً. ثمانية منها تضم واحداً من كل مجموعة، فيتبقى ١٢.","En":"There are 20 teams in all. Eight have one member from each group, leaving 12."},"CommonError":{"Ar":"اختار مجموعة الزوج وأغفل العضو الثالث.","En":"Chooses the pair’s group but skips the third member."}}}$mw$::jsonb,$mw$الفريق المطلوب يحتوي زوجاً من مجموعة واحدة وعضواً من مجموعة أخرى، دون اعتبار للترتيب.

$3\binom{2}{2}\binom{4}{1}$

1. هناك ثلاث طرق لاختيار المجموعة التي تمدّنا بالشخصين، ويُختار الاثنان معاً.

2. يبقى أربعة أشخاص خارج المجموعة لاختيار عضو ثالث. لا يمكن لفريق من ثلاثة أن يحتوي زوجين من مجموعتين مختلفتين.

$3\times1\times4=12$

$12$ فريقاً

هناك ٢٠ فريقاً إجمالاً. ثمانية منها تضم واحداً من كل مجموعة، فيتبقى ١٢.

اختار مجموعة الزوج وأغفل العضو الثالث.$mw$,$mw$A qualifying team has a pair from one group and one person from another, regardless of order.

$3\binom{2}{2}\binom{4}{1}$

1. There are three choices of group to supply the pair, and both people from it are selected.

2. Four people outside it can be the third member. A three-person team cannot include pairs from two different groups.

$3\times1\times4=12$

$12$ teams

There are 20 teams in all. Eight have one member from each group, leaving 12.

Chooses the pair’s group but skips the third member.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"حدّد كم شخصاً يمكن أخذه من مجموعة واحدة.","En":"Decide how many members can come from any one group."},{"Ar":"اختر المجموعة التي ينتمي إليها الشخصان، ثم اختر العضو الثالث من خارجها.","En":"Choose the group that supplies the pair, then choose the third member from outside it."}],"Solution":{"Idea":{"Ar":"الفريق المطلوب يحتوي زوجاً من مجموعة واحدة وعضواً من مجموعة أخرى، دون اعتبار للترتيب.","En":"A qualifying team has a pair from one group and one person from another, regardless of order."},"FormulaLatex":"3\\binom{2}{2}\\binom{4}{1}","Steps":[{"Ar":"هناك ثلاث طرق لاختيار المجموعة التي تمدّنا بالشخصين، ويُختار الاثنان معاً.","En":"There are three choices of group to supply the pair, and both people from it are selected."},{"Ar":"يبقى أربعة أشخاص خارج المجموعة لاختيار عضو ثالث. لا يمكن لفريق من ثلاثة أن يحتوي زوجين من مجموعتين مختلفتين.","En":"Four people outside it can be the third member. A three-person team cannot include pairs from two different groups."}],"Substitution":{"Ar":"$3\\times1\\times4=12$","En":"$3\\times1\\times4=12$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"فريقاً","En":"teams"},"Verification":{"Ar":"هناك ٢٠ فريقاً إجمالاً. ثمانية منها تضم واحداً من كل مجموعة، فيتبقى ١٢.","En":"There are 20 teams in all. Eight have one member from each group, leaving 12."},"CommonError":{"Ar":"اختار مجموعة الزوج وأغفل العضو الثالث.","En":"Chooses the pair’s group but skips the third member."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"اختار مجموعة الزوج وأغفل العضو الثالث.","En":"Chooses the pair’s group but skips the third member."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"عدّ فرق المتممة التي تضم عضواً من كل مجموعة.","En":"Counts the complementary teams with one member from each group."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"عدّ جميع الفرق من دون تطبيق الشرط.","En":"Counts all teams without applying the condition."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v19-grade-3-regroup-into-tens-without-using-hundreds-1$mw$,$mw$regroup-into-tens-without-using-hundreds$mw$,$mw$place-value$mw$,$mw$grade-3$mw$,3,1,81,305,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":305,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"تفكيك عدد إلى عشرات وآحاد","En":"Showing a number using tens and ones"},"Question":{"Ar":"تريد مريم تمثيل العدد ٣٢٤ بألواح عشرات ومكعبات آحاد فقط. ستستخدم ٤ مكعبات آحاد. كم لوح عشرات تحتاج؟","En":"Mariam wants to represent 324 using only ten-rods and single cubes. She will use 4 single cubes. How many ten-rods does she need?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قرأ رقم العشرات وحده ولم يستبدل المئات.","En":"Reads the tens digit alone without trading the hundreds."}},{"LatexCode":"32","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"30","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حوّل المئات وأغفل العشرتين الأصليتين.","En":"Trades the hundreds and misses the two original tens."}},{"LatexCode":"320","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى عدد الآحاد المكافئ للعشرات بدلاً من عدد الألواح.","En":"Gives the units represented by the rods instead of the rod count."}}],"Hints":[{"Ar":"كل مئة تعادل عشر عشرات.","En":"One hundred can be traded for ten tens."},{"Ar":"استبدل المئات الثلاث بعشرات، ثم أضف العشرتين الموجودتين أصلاً.","En":"Trade all three hundreds for tens, then add the two tens already present."}],"Solution":{"Idea":{"Ar":"يمكن إعادة تجميع كل مئة إلى عشر عشرات دون تغيير قيمة العدد.","En":"Regroup each hundred into ten tens without changing the total value."},"FormulaLatex":"324=3\\times100+2\\times10+4","Steps":[{"Ar":"٣ مئات تساوي ٣٠ عشرة.","En":"Three hundreds are worth 30 tens."},{"Ar":"مع العشرتين نحصل على ٣٢ عشرة، وتبقى الآحاد الأربعة كما هي.","En":"Adding the original two tens gives 32 tens. The four ones stay as they are."}],"Substitution":{"Ar":"$(324-4)/10=32$","En":"$(324-4)/10=32$"},"Result":{"Ar":"$32$","En":"$32$"},"Unit":{"Ar":"لوح عشرات","En":"ten-rods"},"Verification":{"Ar":"٣٢ لوحاً تعطي ٣٢٠، ومع ٤ آحاد يكون المجموع ٣٢٤.","En":"32 rods give 320, and four ones bring the total to 324."},"CommonError":{"Ar":"قرأ رقم العشرات وحده ولم يستبدل المئات.","En":"Reads the tens digit alone without trading the hundreds."}}}$mw$::jsonb,$mw$يمكن إعادة تجميع كل مئة إلى عشر عشرات دون تغيير قيمة العدد.

$324=3\times100+2\times10+4$

1. ٣ مئات تساوي ٣٠ عشرة.

2. مع العشرتين نحصل على ٣٢ عشرة، وتبقى الآحاد الأربعة كما هي.

$(324-4)/10=32$

$32$ لوح عشرات

٣٢ لوحاً تعطي ٣٢٠، ومع ٤ آحاد يكون المجموع ٣٢٤.

قرأ رقم العشرات وحده ولم يستبدل المئات.$mw$,$mw$Regroup each hundred into ten tens without changing the total value.

$324=3\times100+2\times10+4$

1. Three hundreds are worth 30 tens.

2. Adding the original two tens gives 32 tens. The four ones stay as they are.

$(324-4)/10=32$

$32$ ten-rods

32 rods give 320, and four ones bring the total to 324.

Reads the tens digit alone without trading the hundreds.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"كل مئة تعادل عشر عشرات.","En":"One hundred can be traded for ten tens."},{"Ar":"استبدل المئات الثلاث بعشرات، ثم أضف العشرتين الموجودتين أصلاً.","En":"Trade all three hundreds for tens, then add the two tens already present."}],"Solution":{"Idea":{"Ar":"يمكن إعادة تجميع كل مئة إلى عشر عشرات دون تغيير قيمة العدد.","En":"Regroup each hundred into ten tens without changing the total value."},"FormulaLatex":"324=3\\times100+2\\times10+4","Steps":[{"Ar":"٣ مئات تساوي ٣٠ عشرة.","En":"Three hundreds are worth 30 tens."},{"Ar":"مع العشرتين نحصل على ٣٢ عشرة، وتبقى الآحاد الأربعة كما هي.","En":"Adding the original two tens gives 32 tens. The four ones stay as they are."}],"Substitution":{"Ar":"$(324-4)/10=32$","En":"$(324-4)/10=32$"},"Result":{"Ar":"$32$","En":"$32$"},"Unit":{"Ar":"لوح عشرات","En":"ten-rods"},"Verification":{"Ar":"٣٢ لوحاً تعطي ٣٢٠، ومع ٤ آحاد يكون المجموع ٣٢٤.","En":"32 rods give 320, and four ones bring the total to 324."},"CommonError":{"Ar":"قرأ رقم العشرات وحده ولم يستبدل المئات.","En":"Reads the tens digit alone without trading the hundreds."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"قرأ رقم العشرات وحده ولم يستبدل المئات.","En":"Reads the tens digit alone without trading the hundreds."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"حوّل المئات وأغفل العشرتين الأصليتين.","En":"Trades the hundreds and misses the two original tens."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أعطى عدد الآحاد المكافئ للعشرات بدلاً من عدد الألواح.","En":"Gives the units represented by the rods instead of the rod count."},"Order":4}]}$mw$),
($mw$growth-v19-grade-9-distinct-sums-from-nonuniform-two-spinners-1$mw$,$mw$distinct-sums-from-nonuniform-two-spinners$mw$,$mw$sample-spaces$mw$,$mw$grade-9$mw$,9,2,85,336,$mw${"StageId":2,"CategoryId":85,"PrimarySkillId":336,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"عدد المجاميع المختلفة على قرصين","En":"Distinct totals from two spinners"},"Question":{"Ar":"يدور قرصان مرة واحدة لكل منهما. يحمل الأول الأعداد ٠ و٣ و٥، ويحمل الثاني الأعداد ٠ و٢ و٥. كل عدد مدوّن نتيجة ممكنة. كم قيمة مختلفة يمكن أن يأخذها مجموع الرقمين؟","En":"Two spinners are spun once each. The first is labelled 0, 3 and 5, and the second is labelled 0, 2 and 5. Every label is possible. How many distinct values can the sum take?"},"Options":[{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدّ أزواج الأرقام بدلاً من قيم المجاميع.","En":"Counts ordered label pairs instead of distinct sums."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حذف ظهوراً مكرراً واحداً فقط من التكرارات الثلاثة للقيمة ٥.","En":"Removes only one duplicate occurrence of the total 5."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استبعد القيمة ٥ كلها لأن لها أكثر من طريقة ظهور.","En":"Drops the total 5 entirely because several pairs produce it."}},{"LatexCode":"7","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"لكل رقم في القرص الأول، جرّب الأرقام الثلاثة في القرص الثاني.","En":"For each label on the first spinner, try all three on the second."},{"Ar":"اكتب قائمة المجاميع واحذف التكرارات قبل العد.","En":"List the totals and remove duplicates before counting."}],"Solution":{"Idea":{"Ar":"نعد قيم المجاميع المختلفة لا عدد الأزواج التي تنتجها؛ قد تتكرر القيمة نفسها.","En":"Count distinct sum values rather than producing pairs; multiple pairs can yield the same sum."},"FormulaLatex":"S=\\{a+b:a\\in\\{0,3,5\\},\\ b\\in\\{0,2,5\\}\\}","Steps":[{"Ar":"المجاميع بحسب الرقم الأول هي (٠، ٢، ٥)، و(٣، ٥، ٨)، و(٥، ٧، ١٠).","En":"Grouped by the first label, the totals are (0, 2, 5), (3, 5, 8), and (5, 7, 10)."},{"Ar":"يظهر ٥ في ثلاث خانات، لذا نعدّه مرة واحدة. نحصل على ٠، ٢، ٣، ٥، ٧، ٨، ١٠.","En":"The total 5 appears three times, so count it once. The distinct totals are 0, 2, 3, 5, 7, 8 and 10."}],"Substitution":{"Ar":"$9-(3-1)=7$","En":"$9-(3-1)=7$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"قيم مختلفة","En":"distinct values"},"Verification":{"Ar":"لكل مجموع من السبعة زوج يحققه في القوائم، وتغطي القوائم الأزواج التسعة كلها.","En":"Each of the seven totals has a producing pair in the lists, which cover all nine pairs."},"CommonError":{"Ar":"عدّ أزواج الأرقام بدلاً من قيم المجاميع.","En":"Counts ordered label pairs instead of distinct sums."}}}$mw$::jsonb,$mw$نعد قيم المجاميع المختلفة لا عدد الأزواج التي تنتجها؛ قد تتكرر القيمة نفسها.

$S=\{a+b:a\in\{0,3,5\},\ b\in\{0,2,5\}\}$

1. المجاميع بحسب الرقم الأول هي (٠، ٢، ٥)، و(٣، ٥، ٨)، و(٥، ٧، ١٠).

2. يظهر ٥ في ثلاث خانات، لذا نعدّه مرة واحدة. نحصل على ٠، ٢، ٣، ٥، ٧، ٨، ١٠.

$9-(3-1)=7$

$7$ قيم مختلفة

لكل مجموع من السبعة زوج يحققه في القوائم، وتغطي القوائم الأزواج التسعة كلها.

عدّ أزواج الأرقام بدلاً من قيم المجاميع.$mw$,$mw$Count distinct sum values rather than producing pairs; multiple pairs can yield the same sum.

$S=\{a+b:a\in\{0,3,5\},\ b\in\{0,2,5\}\}$

1. Grouped by the first label, the totals are (0, 2, 5), (3, 5, 8), and (5, 7, 10).

2. The total 5 appears three times, so count it once. The distinct totals are 0, 2, 3, 5, 7, 8 and 10.

$9-(3-1)=7$

$7$ distinct values

Each of the seven totals has a producing pair in the lists, which cover all nine pairs.

Counts ordered label pairs instead of distinct sums.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"لكل رقم في القرص الأول، جرّب الأرقام الثلاثة في القرص الثاني.","En":"For each label on the first spinner, try all three on the second."},{"Ar":"اكتب قائمة المجاميع واحذف التكرارات قبل العد.","En":"List the totals and remove duplicates before counting."}],"Solution":{"Idea":{"Ar":"نعد قيم المجاميع المختلفة لا عدد الأزواج التي تنتجها؛ قد تتكرر القيمة نفسها.","En":"Count distinct sum values rather than producing pairs; multiple pairs can yield the same sum."},"FormulaLatex":"S=\\{a+b:a\\in\\{0,3,5\\},\\ b\\in\\{0,2,5\\}\\}","Steps":[{"Ar":"المجاميع بحسب الرقم الأول هي (٠، ٢، ٥)، و(٣، ٥، ٨)، و(٥، ٧، ١٠).","En":"Grouped by the first label, the totals are (0, 2, 5), (3, 5, 8), and (5, 7, 10)."},{"Ar":"يظهر ٥ في ثلاث خانات، لذا نعدّه مرة واحدة. نحصل على ٠، ٢، ٣، ٥، ٧، ٨، ١٠.","En":"The total 5 appears three times, so count it once. The distinct totals are 0, 2, 3, 5, 7, 8 and 10."}],"Substitution":{"Ar":"$9-(3-1)=7$","En":"$9-(3-1)=7$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"قيم مختلفة","En":"distinct values"},"Verification":{"Ar":"لكل مجموع من السبعة زوج يحققه في القوائم، وتغطي القوائم الأزواج التسعة كلها.","En":"Each of the seven totals has a producing pair in the lists, which cover all nine pairs."},"CommonError":{"Ar":"عدّ أزواج الأرقام بدلاً من قيم المجاميع.","En":"Counts ordered label pairs instead of distinct sums."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"عدّ أزواج الأرقام بدلاً من قيم المجاميع.","En":"Counts ordered label pairs instead of distinct sums."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"حذف ظهوراً مكرراً واحداً فقط من التكرارات الثلاثة للقيمة ٥.","En":"Removes only one duplicate occurrence of the total 5."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"استبعد القيمة ٥ كلها لأن لها أكثر من طريقة ظهور.","En":"Drops the total 5 entirely because several pairs produce it."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v19-grade-12-circle-radius-from-horizontal-line-tangency-1$mw$,$mw$circle-radius-from-horizontal-line-tangency$mw$,$mw$circles$mw$,$mw$grade-12$mw$,12,3,88,328,$mw${"StageId":3,"CategoryId":88,"PrimarySkillId":328,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"نصف قطر دائرة تمس مستقيماً أفقياً","En":"Radius of a circle tangent to a horizontal line"},"Question":{"Ar":"مركز دائرة هو $(-2,3)$، وتمس الدائرة المستقيم الأفقي $y=-1$. ما نصف قطرها؟","En":"A circle is centred at (−2,3) and is tangent to the horizontal line y=−1. What is its radius?"},"Options":[{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استخدم قيمة الإحداثي الأفقي للمركز بدلاً من المسافة الرأسية.","En":"Uses the magnitude of the centre’s x-coordinate instead of the vertical distance."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب المسافة من المركز إلى المحور الأفقي y=0.","En":"Measures from the centre to the x-axis y=0."}},{"LatexCode":"16","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى مربع نصف القطر بدلاً من نصف القطر.","En":"Gives the radius squared instead of the radius."}}],"Hints":[{"Ar":"نصف القطر إلى نقطة التماس عمودي على المماس.","En":"The radius to the point of tangency is perpendicular to the tangent."},{"Ar":"انزل رأسياً من المركز إلى y=−1، واحسب الفرق بين الإحداثيين الرأسيين.","En":"Move vertically from the centre to y=−1 and find the difference in heights."}],"Solution":{"Idea":{"Ar":"نصف القطر إلى نقطة التماس عمودي على المماس، لذا يساوي المسافة الرأسية من المركز إلى المستقيم الأفقي.","En":"The radius to the tangent point is perpendicular to the tangent, so it equals the vertical distance from the centre to the horizontal line."},"FormulaLatex":"r=|y_C-y_{\\mathrm{line}}|","Steps":[{"Ar":"المماس أفقي، لذلك نقطة التماس لها الإحداثي الأفقي نفسه للمركز، أي $-2$.","En":"The tangent is horizontal, so the contact point has the centre's x-coordinate, $-2$."},{"Ar":"احسب المسافة الرأسية من $y=3$ إلى $y=-1$.","En":"Calculate the vertical distance from $y=3$ to $y=-1$."}],"Substitution":{"Ar":"$|3-(-1)|=4$","En":"$|3-(-1)|=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"وحدات طول","En":"length units"},"Verification":{"Ar":"على المستقيم y=−1 تختزل معادلة الدائرة إلى (x+2)²+16=16، فتوجد نقطة تقاطع واحدة.","En":"On y=−1, the circle equation reduces to (x+2)²+16=16, so there is exactly one intersection."},"CommonError":{"Ar":"استخدم قيمة الإحداثي الأفقي للمركز بدلاً من المسافة الرأسية.","En":"Uses the magnitude of the centre’s x-coordinate instead of the vertical distance."}}}$mw$::jsonb,$mw$نصف القطر إلى نقطة التماس عمودي على المماس، لذا يساوي المسافة الرأسية من المركز إلى المستقيم الأفقي.

$r=|y_C-y_{\mathrm{line}}|$

1. المماس أفقي، لذلك نقطة التماس لها الإحداثي الأفقي نفسه للمركز، أي $-2$.

2. احسب المسافة الرأسية من $y=3$ إلى $y=-1$.

$|3-(-1)|=4$

$4$ وحدات طول

على المستقيم y=−1 تختزل معادلة الدائرة إلى (x+2)²+16=16، فتوجد نقطة تقاطع واحدة.

استخدم قيمة الإحداثي الأفقي للمركز بدلاً من المسافة الرأسية.$mw$,$mw$The radius to the tangent point is perpendicular to the tangent, so it equals the vertical distance from the centre to the horizontal line.

$r=|y_C-y_{\mathrm{line}}|$

1. The tangent is horizontal, so the contact point has the centre's x-coordinate, $-2$.

2. Calculate the vertical distance from $y=3$ to $y=-1$.

$|3-(-1)|=4$

$4$ length units

On y=−1, the circle equation reduces to (x+2)²+16=16, so there is exactly one intersection.

Uses the magnitude of the centre’s x-coordinate instead of the vertical distance.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"نصف القطر إلى نقطة التماس عمودي على المماس.","En":"The radius to the point of tangency is perpendicular to the tangent."},{"Ar":"انزل رأسياً من المركز إلى y=−1، واحسب الفرق بين الإحداثيين الرأسيين.","En":"Move vertically from the centre to y=−1 and find the difference in heights."}],"Solution":{"Idea":{"Ar":"نصف القطر إلى نقطة التماس عمودي على المماس، لذا يساوي المسافة الرأسية من المركز إلى المستقيم الأفقي.","En":"The radius to the tangent point is perpendicular to the tangent, so it equals the vertical distance from the centre to the horizontal line."},"FormulaLatex":"r=|y_C-y_{\\mathrm{line}}|","Steps":[{"Ar":"المماس أفقي، لذلك نقطة التماس لها الإحداثي الأفقي نفسه للمركز، أي $-2$.","En":"The tangent is horizontal, so the contact point has the centre's x-coordinate, $-2$."},{"Ar":"احسب المسافة الرأسية من $y=3$ إلى $y=-1$.","En":"Calculate the vertical distance from $y=3$ to $y=-1$."}],"Substitution":{"Ar":"$|3-(-1)|=4$","En":"$|3-(-1)|=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"وحدات طول","En":"length units"},"Verification":{"Ar":"على المستقيم y=−1 تختزل معادلة الدائرة إلى (x+2)²+16=16، فتوجد نقطة تقاطع واحدة.","En":"On y=−1, the circle equation reduces to (x+2)²+16=16, so there is exactly one intersection."},"CommonError":{"Ar":"استخدم قيمة الإحداثي الأفقي للمركز بدلاً من المسافة الرأسية.","En":"Uses the magnitude of the centre’s x-coordinate instead of the vertical distance."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"استخدم قيمة الإحداثي الأفقي للمركز بدلاً من المسافة الرأسية.","En":"Uses the magnitude of the centre’s x-coordinate instead of the vertical distance."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"حسب المسافة من المركز إلى المحور الأفقي y=0.","En":"Measures from the centre to the x-axis y=0."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أعطى مربع نصف القطر بدلاً من نصف القطر.","En":"Gives the radius squared instead of the radius."},"Order":4}]}$mw$);
DO $growth$
DECLARE b record; did bigint; pid int; actor int;
BEGIN
 SELECT d."OwnerUserId" INTO STRICT actor FROM public."CurriculumDraftItems" d JOIN public."Users" u ON u."Id"=d."OwnerUserId" WHERE d."Id"=1088 AND d."EditorialStatus"='Published' AND d."PublishedProblemId"=1806 AND u."Role"='Admin' AND u."IsActive" AND NOT u."StaffSetupPending";
 FOR b IN SELECT * FROM growth_batch ORDER BY track,key LOOP
  PERFORM 1 FROM public."LearningTracks" WHERE "Id"=b.track FOR UPDATE;
  IF NOT EXISTS(SELECT 1 FROM public."LearningTracks" WHERE "Id"=b.track AND "Code"=b.track_code AND "StageId"=b.stage AND "IsPublished" AND "Revision"<2147483647) OR NOT EXISTS(SELECT 1 FROM public."Categories" WHERE "Id"=b.category AND "StageId"=b.stage) OR NOT EXISTS(SELECT 1 FROM public."CurriculumSkills" s JOIN public."CurriculumDomains" dm ON dm."Id"=s."DomainId" WHERE s."Id"=b.skill AND s."StableKey"=b.skill_key AND s."StageId"=b.stage AND s."CategoryId"=b.category AND s."IsPublished" AND dm."IsPublished") OR NOT EXISTS(SELECT 1 FROM public."LearningTrackCategories" WHERE "TrackId"=b.track AND "CategoryId"=b.category) OR NOT EXISTS(SELECT 1 FROM public."LearningTrackSkills" WHERE "TrackId"=b.track AND "SkillId"=b.skill) THEN RAISE EXCEPTION 'Scope changed %',b.key; END IF;
  IF EXISTS(SELECT 1 FROM public."CurriculumDraftItems" WHERE "ContentKey"=b.key) OR EXISTS(SELECT 1 FROM public."Problems" q WHERE upper(regexp_replace(btrim(q."QuestionTextAr"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(b.wizard#>>'{Question,Ar}'),'[[:space:]]+',' ','g')) OR upper(regexp_replace(btrim(q."QuestionTextEn"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(b.wizard#>>'{Question,En}'),'[[:space:]]+',' ','g'))) OR EXISTS(SELECT 1 FROM public."CurriculumDraftItems" q WHERE q."EditorialStatus"<>'Withdrawn' AND q."WizardJson" IS NOT NULL AND (upper(regexp_replace(btrim(q."QuestionTextAr"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(b.wizard#>>'{Question,Ar}'),'[[:space:]]+',' ','g')) OR upper(regexp_replace(btrim(q."QuestionTextEn"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(b.wizard#>>'{Question,En}'),'[[:space:]]+',' ','g')))) THEN RAISE EXCEPTION 'Duplicate %',b.key; END IF;
  INSERT INTO public."CurriculumDraftItems"("ContentKey","PrimarySkillKey","TemplateFamilyKey","DifficultyLevel","PisaProcess","LearningObjectiveAr","LearningObjectiveEn","QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn","OptionsJson","EditorialStatus","WizardJson","OwnerUserId","LastEditorUserId","Revision") VALUES(b.key,b.skill_key,'',(b.wizard->>'DifficultyLevel')::int,'','','',b.wizard#>>'{Question,Ar}',b.wizard#>>'{Question,En}','','','[]'::jsonb,'Draft',b.wizard::text,actor,actor,0) RETURNING "Id" INTO did;
  INSERT INTO public."Problems"("TitleAr","TitleEn","QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn","StageId","CategoryId","Points","ViewsCount","SolvedCount","CreatedAt","EditorialDetailsJson") VALUES(b.wizard#>>'{Title,Ar}',b.wizard#>>'{Title,En}',b.wizard#>>'{Question,Ar}',b.wizard#>>'{Question,En}',b.flat_ar,b.flat_en,b.stage,b.category,10,0,0,now(),b.metadata) RETURNING "Id" INTO pid;
  INSERT INTO public."QuestionOptions"("ProblemId","Order","LatexCode","IsCorrect") SELECT pid,ord::int,o->>'LatexCode',(o->>'IsCorrect')::boolean FROM jsonb_array_elements(b.wizard->'Options') WITH ORDINALITY AS x(o,ord);
  INSERT INTO public."CurriculumProblemSkills"("ProblemId","SkillId","IsPrimary") VALUES(pid,b.skill,true);
  INSERT INTO public."LearningTrackProblems"("TrackId","ProblemId") VALUES(b.track,pid);
  UPDATE public."LearningTracks" SET "Revision"="Revision"+1 WHERE "Id"=b.track;
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of repository v17/v19 candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
