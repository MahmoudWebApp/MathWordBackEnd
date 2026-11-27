-- One-time owner-authorized v78 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v78-grade-3-overlap-of-two-activities-1$mw$,$mw$overlap-of-two-activities$mw$,$mw$time$mw$,$mw$grade-3$mw$,3,1,82,324,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":324,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"وقت اللعب معاً","En":"Time playing together"},"Question":{"Ar":"لعبت مها من 3:10 إلى 3:40 بعد الظهر. ولعبت هناء من 3:25 إلى 3:50 بعد الظهر. كم دقيقة كانتا تلعبان معاً؟","En":"Maha played from 3:10 to 3:40 in the afternoon. Hana played from 3:25 to 3:50. For how many minutes were both playing?"},"Options":[{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عشر دقائق هي المدة بعد مغادرة مها.","En":"Ten minutes is the time after Maha leaves."}},{"LatexCode":"15","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"25","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه مدة لعب هناء كلها.","En":"This is Hana’s entire play time."}},{"LatexCode":"40","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه المدة من أول بداية إلى آخر نهاية.","En":"This is the span from the first start to the last finish."}}],"Hints":[{"Ar":"متى كانت كلتاهما قد بدأت اللعب؟","En":"When had both players started?"},{"Ar":"من غادرت أولاً؟","En":"Who left first?"}],"Solution":{"Idea":{"Ar":"تبدأ المدة المشتركة عند وصول الثانية وتنتهي عند مغادرة الأولى.","En":"The shared time starts when the second player joins and ends when the first leaves."},"FormulaLatex":"40-25=15","Steps":[{"Ar":"بدأتا اللعب معاً عند 3:25.","En":"Both are playing from 3:25."},{"Ar":"عند 3:40 انتهت مدة اللعب معاً.","En":"Their time together ends at 3:40."}],"Substitution":{"Ar":"$40-25=15$","En":"$40-25=15$"},"Result":{"Ar":"$15$","En":"$15$"},"Unit":{"Ar":"دقيقة","En":"minutes"},"Verification":{"Ar":"بعد ربع ساعة من 3:25 تصبح الساعة 3:40.","En":"A quarter hour after 3:25 is 3:40."},"CommonError":{"Ar":"عشر دقائق هي المدة بعد مغادرة مها.","En":"Ten minutes is the time after Maha leaves."}}}$mw$::jsonb,$mw$تبدأ المدة المشتركة عند وصول الثانية وتنتهي عند مغادرة الأولى.

$40-25=15$

1. بدأتا اللعب معاً عند 3:25.

2. عند 3:40 انتهت مدة اللعب معاً.

$15$

بعد ربع ساعة من 3:25 تصبح الساعة 3:40.

عشر دقائق هي المدة بعد مغادرة مها.$mw$,$mw$The shared time starts when the second player joins and ends when the first leaves.

$40-25=15$

1. Both are playing from 3:25.

2. Their time together ends at 3:40.

$15$

A quarter hour after 3:25 is 3:40.

Ten minutes is the time after Maha leaves.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"متى كانت كلتاهما قد بدأت اللعب؟","En":"When had both players started?"},{"Ar":"من غادرت أولاً؟","En":"Who left first?"}],"Solution":{"Idea":{"Ar":"تبدأ المدة المشتركة عند وصول الثانية وتنتهي عند مغادرة الأولى.","En":"The shared time starts when the second player joins and ends when the first leaves."},"FormulaLatex":"40-25=15","Steps":[{"Ar":"بدأتا اللعب معاً عند 3:25.","En":"Both are playing from 3:25."},{"Ar":"عند 3:40 انتهت مدة اللعب معاً.","En":"Their time together ends at 3:40."}],"Substitution":{"Ar":"$40-25=15$","En":"$40-25=15$"},"Result":{"Ar":"$15$","En":"$15$"},"Unit":{"Ar":"دقيقة","En":"minutes"},"Verification":{"Ar":"بعد ربع ساعة من 3:25 تصبح الساعة 3:40.","En":"A quarter hour after 3:25 is 3:40."},"CommonError":{"Ar":"عشر دقائق هي المدة بعد مغادرة مها.","En":"Ten minutes is the time after Maha leaves."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"عشر دقائق هي المدة بعد مغادرة مها.","En":"Ten minutes is the time after Maha leaves."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذه مدة لعب هناء كلها.","En":"This is Hana’s entire play time."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذه المدة من أول بداية إلى آخر نهاية.","En":"This is the span from the first start to the last finish."},"Order":4}]}$mw$),
($mw$growth-v78-grade-3-midpoint-of-time-slot-1$mw$,$mw$midpoint-of-time-slot$mw$,$mw$time$mw$,$mw$grade-3$mw$,3,1,82,324,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":324,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"منتصف الحصة","En":"Halfway through a lesson"},"Question":{"Ar":"بدأت حصة عند 9:40 صباحاً وانتهت عند 10:20. بعد كم دقيقة من بدايتها حلّ منتصف الحصة؟","En":"A lesson began at 9:40 a.m. and ended at 10:20. How many minutes after it began was the lesson halfway over?"},"Options":[{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عشر دقائق هي ربع الحصة.","En":"Ten minutes is a quarter of the lesson."}},{"LatexCode":"30","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ثلاثون دقيقة تتجاوز المنتصف.","En":"Thirty minutes passes the halfway point."}},{"LatexCode":"20","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"40","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أربعون دقيقة هي مدة الحصة كلها.","En":"Forty minutes is the entire lesson."}}],"Hints":[{"Ar":"ارسم خطاً زمنياً وضع علامة عند الساعة العاشرة.","En":"Draw a timeline and mark ten o’clock."},{"Ar":"أين تجد مدتين متساويتين على الخط؟","En":"Where do you see two equal durations?"}],"Solution":{"Idea":{"Ar":"عند المنتصف يتساوى الزمن الماضي والزمن الباقي.","En":"At halfway, the elapsed and remaining times are equal."},"FormulaLatex":"40/2=20","Steps":[{"Ar":"قبل العاشرة عشرون دقيقة، وبعدها عشرون دقيقة أخرى.","En":"There are twenty minutes before ten and twenty more after ten."},{"Ar":"نقسم مدة الحصة إلى نصفين متساويين.","En":"Split the lesson into two equal durations."}],"Substitution":{"Ar":"$40/2=20$","En":"$40/2=20$"},"Result":{"Ar":"$20$","En":"$20$"},"Unit":{"Ar":"دقيقة","En":"minutes"},"Verification":{"Ar":"عند 10:00 تكون قد مضت عشرون دقيقة وتبقى عشرون.","En":"At 10:00 twenty minutes have passed and twenty remain."},"CommonError":{"Ar":"عشر دقائق هي ربع الحصة.","En":"Ten minutes is a quarter of the lesson."}}}$mw$::jsonb,$mw$عند المنتصف يتساوى الزمن الماضي والزمن الباقي.

$40/2=20$

1. قبل العاشرة عشرون دقيقة، وبعدها عشرون دقيقة أخرى.

2. نقسم مدة الحصة إلى نصفين متساويين.

$20$

عند 10:00 تكون قد مضت عشرون دقيقة وتبقى عشرون.

عشر دقائق هي ربع الحصة.$mw$,$mw$At halfway, the elapsed and remaining times are equal.

$40/2=20$

1. There are twenty minutes before ten and twenty more after ten.

2. Split the lesson into two equal durations.

$20$

At 10:00 twenty minutes have passed and twenty remain.

Ten minutes is a quarter of the lesson.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ارسم خطاً زمنياً وضع علامة عند الساعة العاشرة.","En":"Draw a timeline and mark ten o’clock."},{"Ar":"أين تجد مدتين متساويتين على الخط؟","En":"Where do you see two equal durations?"}],"Solution":{"Idea":{"Ar":"عند المنتصف يتساوى الزمن الماضي والزمن الباقي.","En":"At halfway, the elapsed and remaining times are equal."},"FormulaLatex":"40/2=20","Steps":[{"Ar":"قبل العاشرة عشرون دقيقة، وبعدها عشرون دقيقة أخرى.","En":"There are twenty minutes before ten and twenty more after ten."},{"Ar":"نقسم مدة الحصة إلى نصفين متساويين.","En":"Split the lesson into two equal durations."}],"Substitution":{"Ar":"$40/2=20$","En":"$40/2=20$"},"Result":{"Ar":"$20$","En":"$20$"},"Unit":{"Ar":"دقيقة","En":"minutes"},"Verification":{"Ar":"عند 10:00 تكون قد مضت عشرون دقيقة وتبقى عشرون.","En":"At 10:00 twenty minutes have passed and twenty remain."},"CommonError":{"Ar":"عشر دقائق هي ربع الحصة.","En":"Ten minutes is a quarter of the lesson."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"عشر دقائق هي ربع الحصة.","En":"Ten minutes is a quarter of the lesson."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"ثلاثون دقيقة تتجاوز المنتصف.","En":"Thirty minutes passes the halfway point."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أربعون دقيقة هي مدة الحصة كلها.","En":"Forty minutes is the entire lesson."},"Order":4}]}$mw$),
($mw$growth-v78-grade-3-hour-hand-between-digits-1$mw$,$mw$hour-hand-between-digits$mw$,$mw$time$mw$,$mw$grade-3$mw$,3,1,82,324,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":324,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"قراءة عقرب الساعات","En":"Reading the hour hand"},"Question":{"Ar":"عقرب الدقائق عند الرقم 9، وعقرب الساعات بين 4 و5 على ساعة عادية. كم دقيقة بقيت حتى الساعة الخامسة؟","En":"On an ordinary clock the minute hand points to 9 and the hour hand is between 4 and 5. How many minutes remain until five o’clock?"},"Options":[{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الرقم 9 موقع العقرب وليس مدة الانتظار.","En":"The numeral 9 labels the hand’s position, not the wait."}},{"LatexCode":"15","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"45","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"خمس وأربعون دقيقة مضت بعد الرابعة.","En":"Forty-five minutes have passed since four."}},{"LatexCode":"51","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح 9 من 60 يعامل رقم الساعة كأنه عدد دقائق.","En":"Subtracting 9 from 60 treats the clock numeral as minutes."}}],"Hints":[{"Ar":"هل وصل عقرب الساعات إلى 5 بعد؟","En":"Has the hour hand reached 5 yet?"},{"Ar":"تتبع عقرب الدقائق من 9 حتى 12.","En":"Trace the minute hand from 9 to 12."}],"Solution":{"Idea":{"Ar":"بين رقمين متتاليين على وجه الساعة خمس دقائق لعقرب الدقائق.","En":"The minute hand takes five minutes to move between neighboring numerals."},"FormulaLatex":"3\\times5=15","Steps":[{"Ar":"الساعة الآن الرابعة وخمس وأربعون دقيقة.","En":"The time is now four forty-five."},{"Ar":"بقيت ثلاث مسافات من 9 إلى 12، بكل منها خمس دقائق.","En":"Three spaces remain from 9 to 12, each worth five minutes."}],"Substitution":{"Ar":"$3\\times5=15$","En":"$3\\times5=15$"},"Result":{"Ar":"$15$","En":"$15$"},"Unit":{"Ar":"دقيقة","En":"minutes"},"Verification":{"Ar":"خمس وأربعون دقيقة ماضية وخمس عشرة باقية تكملان الساعة.","En":"Forty-five elapsed minutes and fifteen remaining minutes make a full hour."},"CommonError":{"Ar":"الرقم 9 موقع العقرب وليس مدة الانتظار.","En":"The numeral 9 labels the hand’s position, not the wait."}}}$mw$::jsonb,$mw$بين رقمين متتاليين على وجه الساعة خمس دقائق لعقرب الدقائق.

$3\times5=15$

1. الساعة الآن الرابعة وخمس وأربعون دقيقة.

2. بقيت ثلاث مسافات من 9 إلى 12، بكل منها خمس دقائق.

$15$

خمس وأربعون دقيقة ماضية وخمس عشرة باقية تكملان الساعة.

الرقم 9 موقع العقرب وليس مدة الانتظار.$mw$,$mw$The minute hand takes five minutes to move between neighboring numerals.

$3\times5=15$

1. The time is now four forty-five.

2. Three spaces remain from 9 to 12, each worth five minutes.

$15$

Forty-five elapsed minutes and fifteen remaining minutes make a full hour.

The numeral 9 labels the hand’s position, not the wait.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"هل وصل عقرب الساعات إلى 5 بعد؟","En":"Has the hour hand reached 5 yet?"},{"Ar":"تتبع عقرب الدقائق من 9 حتى 12.","En":"Trace the minute hand from 9 to 12."}],"Solution":{"Idea":{"Ar":"بين رقمين متتاليين على وجه الساعة خمس دقائق لعقرب الدقائق.","En":"The minute hand takes five minutes to move between neighboring numerals."},"FormulaLatex":"3\\times5=15","Steps":[{"Ar":"الساعة الآن الرابعة وخمس وأربعون دقيقة.","En":"The time is now four forty-five."},{"Ar":"بقيت ثلاث مسافات من 9 إلى 12، بكل منها خمس دقائق.","En":"Three spaces remain from 9 to 12, each worth five minutes."}],"Substitution":{"Ar":"$3\\times5=15$","En":"$3\\times5=15$"},"Result":{"Ar":"$15$","En":"$15$"},"Unit":{"Ar":"دقيقة","En":"minutes"},"Verification":{"Ar":"خمس وأربعون دقيقة ماضية وخمس عشرة باقية تكملان الساعة.","En":"Forty-five elapsed minutes and fifteen remaining minutes make a full hour."},"CommonError":{"Ar":"الرقم 9 موقع العقرب وليس مدة الانتظار.","En":"The numeral 9 labels the hand’s position, not the wait."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"الرقم 9 موقع العقرب وليس مدة الانتظار.","En":"The numeral 9 labels the hand’s position, not the wait."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"خمس وأربعون دقيقة مضت بعد الرابعة.","En":"Forty-five minutes have passed since four."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"طرح 9 من 60 يعامل رقم الساعة كأنه عدد دقائق.","En":"Subtracting 9 from 60 treats the clock numeral as minutes."},"Order":4}]}$mw$),
($mw$growth-v78-grade-3-seconds-countdown-cross-minute-1$mw$,$mw$seconds-countdown-cross-minute$mw$,$mw$time$mw$,$mw$grade-3$mw$,3,1,82,324,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":324,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"نهاية العدّ التنازلي","En":"A countdown crosses a minute"},"Question":{"Ar":"تعرض شاشة مؤقت الدقائق والثواني. كانت القراءة دقيقة و8 ثوانٍ ثم أصبحت 49 ثانية. كم ثانية مضت؟","En":"A timer counts down in minutes and seconds. It showed 1 minute 8 seconds, then it showed 49 seconds. How many seconds passed?"},"Options":[{"LatexCode":"19","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"41","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح 8 من 49 وأهمل الدقيقة.","En":"This subtracts 8 from 49 and leaves out the minute."}},{"LatexCode":"59","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا ناتج طرح 49 من 108 باعتبار الدقيقة مئة ثانية.","En":"This subtracts 49 from 108 as if a minute had a hundred seconds."}},{"LatexCode":"17","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه المدة تترك 51 ثانية على المؤقت.","En":"This would leave 51 seconds on the timer."}}],"Hints":[{"Ar":"كم ثانية في الدقيقة؟","En":"How many seconds make one minute?"},{"Ar":"هل تزيد قراءة المؤقت أم تنقص؟","En":"Does a countdown reading increase or decrease?"}],"Solution":{"Idea":{"Ar":"نحوّل القراءتين إلى الوحدة نفسها.","En":"Express both readings in the same unit."},"FormulaLatex":"60+8-49=19","Steps":[{"Ar":"دقيقة و8 ثوانٍ تساوي 68 ثانية.","En":"One minute eight seconds is 68 seconds."},{"Ar":"نطرح قراءة النهاية 49 من قراءة البداية 68.","En":"Subtract the final reading of 49 from the initial 68."}],"Substitution":{"Ar":"$60+8-49=19$","En":"$60+8-49=19$"},"Result":{"Ar":"$19$","En":"$19$"},"Unit":{"Ar":"ثانية","En":"seconds"},"Verification":{"Ar":"إذا أضفنا 19 إلى 49 حصلنا على 68 ثانية.","En":"Adding 19 to 49 gives 68 seconds."},"CommonError":{"Ar":"طرح 8 من 49 وأهمل الدقيقة.","En":"This subtracts 8 from 49 and leaves out the minute."}}}$mw$::jsonb,$mw$نحوّل القراءتين إلى الوحدة نفسها.

$60+8-49=19$

1. دقيقة و8 ثوانٍ تساوي 68 ثانية.

2. نطرح قراءة النهاية 49 من قراءة البداية 68.

$19$

إذا أضفنا 19 إلى 49 حصلنا على 68 ثانية.

طرح 8 من 49 وأهمل الدقيقة.$mw$,$mw$Express both readings in the same unit.

$60+8-49=19$

1. One minute eight seconds is 68 seconds.

2. Subtract the final reading of 49 from the initial 68.

$19$

Adding 19 to 49 gives 68 seconds.

This subtracts 8 from 49 and leaves out the minute.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم ثانية في الدقيقة؟","En":"How many seconds make one minute?"},{"Ar":"هل تزيد قراءة المؤقت أم تنقص؟","En":"Does a countdown reading increase or decrease?"}],"Solution":{"Idea":{"Ar":"نحوّل القراءتين إلى الوحدة نفسها.","En":"Express both readings in the same unit."},"FormulaLatex":"60+8-49=19","Steps":[{"Ar":"دقيقة و8 ثوانٍ تساوي 68 ثانية.","En":"One minute eight seconds is 68 seconds."},{"Ar":"نطرح قراءة النهاية 49 من قراءة البداية 68.","En":"Subtract the final reading of 49 from the initial 68."}],"Substitution":{"Ar":"$60+8-49=19$","En":"$60+8-49=19$"},"Result":{"Ar":"$19$","En":"$19$"},"Unit":{"Ar":"ثانية","En":"seconds"},"Verification":{"Ar":"إذا أضفنا 19 إلى 49 حصلنا على 68 ثانية.","En":"Adding 19 to 49 gives 68 seconds."},"CommonError":{"Ar":"طرح 8 من 49 وأهمل الدقيقة.","En":"This subtracts 8 from 49 and leaves out the minute."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"طرح 8 من 49 وأهمل الدقيقة.","En":"This subtracts 8 from 49 and leaves out the minute."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا ناتج طرح 49 من 108 باعتبار الدقيقة مئة ثانية.","En":"This subtracts 49 from 108 as if a minute had a hundred seconds."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذه المدة تترك 51 ثانية على المؤقت.","En":"This would leave 51 seconds on the timer."},"Order":4}]}$mw$),
($mw$growth-v78-grade-3-twenty-four-hour-display-1$mw$,$mw$twenty-four-hour-display$mw$,$mw$time$mw$,$mw$grade-3$mw$,3,1,82,324,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":324,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"شاشة محطة الحافلات","En":"The station display"},"Question":{"Ar":"تعرض ساعة المحطة الوقت بنظام 24 ساعة. وعدت المعلمة بمقابلة الصف عند السادسة والربع مساءً. أي قراءة توافق هذا الموعد؟","En":"The station clock uses 24-hour time. A teacher will meet her class at quarter past six in the evening. Which display matches the meeting time?"},"Options":[{"LatexCode":"06{:}15","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه قراءة السادسة والربع صباحاً.","En":"This shows quarter past six in the morning."}},{"LatexCode":"18{:}45","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه قراءة السادسة وخمس وأربعين دقيقة مساءً.","En":"This shows six forty-five in the evening."}},{"LatexCode":"18{:}15","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"16{:}15","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه قراءة الرابعة والربع مساءً.","En":"This shows quarter past four in the afternoon."}}],"Hints":[{"Ar":"كيف تظهر ساعة الظهر على شاشة المحطة؟","En":"How does the station clock show noon?"},{"Ar":"ماذا تعني كلمة الربع في جزء الدقائق؟","En":"What does a quarter mean for the minutes?"}],"Solution":{"Idea":{"Ar":"نعدّ الساعات بعد الظهر ونحوّل ربع الساعة إلى دقائق.","En":"Count the hours after noon and express a quarter hour in minutes."},"FormulaLatex":"12+6=18","Steps":[{"Ar":"الساعة السادسة مساءً تظهر 18 على الشاشة.","En":"Six in the evening displays as hour 18."},{"Ar":"ربع الساعة خمس عشرة دقيقة.","En":"A quarter hour is fifteen minutes."}],"Substitution":{"Ar":"$12+6=18$","En":"$12+6=18$"},"Result":{"Ar":"$18{:}15$","En":"$18{:}15$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"إذا طرحنا 12 من 18 عدنا إلى السادسة مساءً، والدقائق تبقى 15.","En":"Subtracting 12 from 18 returns six in the evening, with the minutes still 15."},"CommonError":{"Ar":"هذه قراءة السادسة والربع صباحاً.","En":"This shows quarter past six in the morning."}}}$mw$::jsonb,$mw$نعدّ الساعات بعد الظهر ونحوّل ربع الساعة إلى دقائق.

$12+6=18$

1. الساعة السادسة مساءً تظهر 18 على الشاشة.

2. ربع الساعة خمس عشرة دقيقة.

$18{:}15$

إذا طرحنا 12 من 18 عدنا إلى السادسة مساءً، والدقائق تبقى 15.

هذه قراءة السادسة والربع صباحاً.$mw$,$mw$Count the hours after noon and express a quarter hour in minutes.

$12+6=18$

1. Six in the evening displays as hour 18.

2. A quarter hour is fifteen minutes.

$18{:}15$

Subtracting 12 from 18 returns six in the evening, with the minutes still 15.

This shows quarter past six in the morning.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كيف تظهر ساعة الظهر على شاشة المحطة؟","En":"How does the station clock show noon?"},{"Ar":"ماذا تعني كلمة الربع في جزء الدقائق؟","En":"What does a quarter mean for the minutes?"}],"Solution":{"Idea":{"Ar":"نعدّ الساعات بعد الظهر ونحوّل ربع الساعة إلى دقائق.","En":"Count the hours after noon and express a quarter hour in minutes."},"FormulaLatex":"12+6=18","Steps":[{"Ar":"الساعة السادسة مساءً تظهر 18 على الشاشة.","En":"Six in the evening displays as hour 18."},{"Ar":"ربع الساعة خمس عشرة دقيقة.","En":"A quarter hour is fifteen minutes."}],"Substitution":{"Ar":"$12+6=18$","En":"$12+6=18$"},"Result":{"Ar":"$18{:}15$","En":"$18{:}15$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"إذا طرحنا 12 من 18 عدنا إلى السادسة مساءً، والدقائق تبقى 15.","En":"Subtracting 12 from 18 returns six in the evening, with the minutes still 15."},"CommonError":{"Ar":"هذه قراءة السادسة والربع صباحاً.","En":"This shows quarter past six in the morning."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذه قراءة السادسة والربع صباحاً.","En":"This shows quarter past six in the morning."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذه قراءة السادسة وخمس وأربعين دقيقة مساءً.","En":"This shows six forty-five in the evening."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذه قراءة الرابعة والربع مساءً.","En":"This shows quarter past four in the afternoon."},"Order":4}]}$mw$),
($mw$growth-v78-grade-3-activity-fits-opening-1$mw$,$mw$activity-fits-opening$mw$,$mw$time$mw$,$mw$grade-3$mw$,3,1,82,324,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":324,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"فسحة قبل الحافلة","En":"Time before the bus"},"Question":{"Ar":"الساعة 4:12 عصراً. تغادر الحافلة عند 4:30. تريد هبة إنهاء لعبة كاملة ثم المشي 4 دقائق إلى الحافلة. أي لعبة من الخيارات تستغرق أطول مدة ممكنة تسمح لها بالوصول في الموعد؟ الخيارات مدد بالدقائق.","En":"It is 4:12 p.m. The bus leaves at 4:30. Hiba wants to finish a game and then walk four minutes to the bus. Which listed game lasts the longest while still letting her arrive on time? The choices are durations in minutes."},"Options":[{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تتسع المدة للعبة أطول من عشر دقائق.","En":"There is time for a game longer than ten minutes."}},{"LatexCode":"14","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"16","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ستصل بعد موعد المغادرة بدقيقتين.","En":"This makes her arrive two minutes after departure."}},{"LatexCode":"18","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يستهلك كل الوقت قبل المشي.","En":"This uses all the time before the walk."}}],"Hints":[{"Ar":"كم دقيقة بقيت حتى المغادرة؟","En":"How many minutes remain until departure?"},{"Ar":"هل تستطيع هبة استعمال كل تلك الدقائق للعب؟","En":"Can she spend all those minutes playing?"}],"Solution":{"Idea":{"Ar":"نحجز وقت المشي قبل اختيار أطول لعبة.","En":"Reserve walking time before selecting the longest game."},"FormulaLatex":"18-4=14","Steps":[{"Ar":"بقيت 18 دقيقة حتى موعد الحافلة.","En":"Eighteen minutes remain until departure."},{"Ar":"بعد تخصيص أربع دقائق للمشي تتبقى 14 دقيقة للعبة.","En":"Reserving four minutes to walk leaves fourteen for the game."}],"Substitution":{"Ar":"$18-4=14$","En":"$18-4=14$"},"Result":{"Ar":"$14$","En":"$14$"},"Unit":{"Ar":"دقيقة","En":"minutes"},"Verification":{"Ar":"تنتهي اللعبة عند 4:26 وتصل هبة عند 4:30.","En":"She finishes playing at 4:26 and arrives at 4:30."},"CommonError":{"Ar":"تتسع المدة للعبة أطول من عشر دقائق.","En":"There is time for a game longer than ten minutes."}}}$mw$::jsonb,$mw$نحجز وقت المشي قبل اختيار أطول لعبة.

$18-4=14$

1. بقيت 18 دقيقة حتى موعد الحافلة.

2. بعد تخصيص أربع دقائق للمشي تتبقى 14 دقيقة للعبة.

$14$

تنتهي اللعبة عند 4:26 وتصل هبة عند 4:30.

تتسع المدة للعبة أطول من عشر دقائق.$mw$,$mw$Reserve walking time before selecting the longest game.

$18-4=14$

1. Eighteen minutes remain until departure.

2. Reserving four minutes to walk leaves fourteen for the game.

$14$

She finishes playing at 4:26 and arrives at 4:30.

There is time for a game longer than ten minutes.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم دقيقة بقيت حتى المغادرة؟","En":"How many minutes remain until departure?"},{"Ar":"هل تستطيع هبة استعمال كل تلك الدقائق للعب؟","En":"Can she spend all those minutes playing?"}],"Solution":{"Idea":{"Ar":"نحجز وقت المشي قبل اختيار أطول لعبة.","En":"Reserve walking time before selecting the longest game."},"FormulaLatex":"18-4=14","Steps":[{"Ar":"بقيت 18 دقيقة حتى موعد الحافلة.","En":"Eighteen minutes remain until departure."},{"Ar":"بعد تخصيص أربع دقائق للمشي تتبقى 14 دقيقة للعبة.","En":"Reserving four minutes to walk leaves fourteen for the game."}],"Substitution":{"Ar":"$18-4=14$","En":"$18-4=14$"},"Result":{"Ar":"$14$","En":"$14$"},"Unit":{"Ar":"دقيقة","En":"minutes"},"Verification":{"Ar":"تنتهي اللعبة عند 4:26 وتصل هبة عند 4:30.","En":"She finishes playing at 4:26 and arrives at 4:30."},"CommonError":{"Ar":"تتسع المدة للعبة أطول من عشر دقائق.","En":"There is time for a game longer than ten minutes."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"تتسع المدة للعبة أطول من عشر دقائق.","En":"There is time for a game longer than ten minutes."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"ستصل بعد موعد المغادرة بدقيقتين.","En":"This makes her arrive two minutes after departure."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا يستهلك كل الوقت قبل المشي.","En":"This uses all the time before the walk."},"Order":4}]}$mw$),
($mw$growth-v78-grade-3-same-time-of-day-next-day-1$mw$,$mw$same-time-of-day-next-day$mw$,$mw$time$mw$,$mw$grade-3$mw$,3,1,82,324,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":324,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"ساعة في اليوم التالي","En":"The clock the next day"},"Question":{"Ar":"سقت نور النبتة الثلاثاء عند 7:00 مساءً ثم الأربعاء عند 6:00 مساءً. كم ساعة مضت بين المرتين؟","En":"Nour watered a plant at 7:00 p.m. on Tuesday and at 6:00 p.m. on Wednesday. How many hours passed between waterings?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"فرق رقمي الساعتين وحده لا يحسب مرور يوم.","En":"The difference between the clock numerals alone misses the change of day."}},{"LatexCode":"23","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"24","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يمر يوم كامل عند السابعة مساء الأربعاء.","En":"A full day would end at 7 p.m. Wednesday."}},{"LatexCode":"25","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه مدة الانتظار حتى الثامنة مساء الأربعاء.","En":"This would take her to 8 p.m. Wednesday."}}],"Hints":[{"Ar":"متى تنتهي 24 ساعة كاملة؟","En":"When would a full 24 hours end?"},{"Ar":"هل موعد الأربعاء قبل ذلك الوقت أم بعده؟","En":"Is Wednesday’s watering before or after that time?"}],"Solution":{"Idea":{"Ar":"نبدأ بيوم كامل ثم نعدّل ساعة النهاية.","En":"Start with one full day and adjust for the ending hour."},"FormulaLatex":"24-1=23","Steps":[{"Ar":"من السابعة مساء الثلاثاء إلى السابعة مساء الأربعاء 24 ساعة.","En":"Tuesday 7 p.m. to Wednesday 7 p.m. spans 24 hours."},{"Ar":"السقي الثاني حدث قبل نهاية تلك المدة بساعة.","En":"The second watering is one hour before the end of that span."}],"Substitution":{"Ar":"$24-1=23$","En":"$24-1=23$"},"Result":{"Ar":"$23$","En":"$23$"},"Unit":{"Ar":"ساعة","En":"hours"},"Verification":{"Ar":"بعد 23 ساعة يكون الوقت السادسة مساءً، وبعد ساعة أخرى يعود إلى السابعة.","En":"After 23 hours it is 6 p.m. One more hour brings it back to 7 p.m."},"CommonError":{"Ar":"فرق رقمي الساعتين وحده لا يحسب مرور يوم.","En":"The difference between the clock numerals alone misses the change of day."}}}$mw$::jsonb,$mw$نبدأ بيوم كامل ثم نعدّل ساعة النهاية.

$24-1=23$

1. من السابعة مساء الثلاثاء إلى السابعة مساء الأربعاء 24 ساعة.

2. السقي الثاني حدث قبل نهاية تلك المدة بساعة.

$23$

بعد 23 ساعة يكون الوقت السادسة مساءً، وبعد ساعة أخرى يعود إلى السابعة.

فرق رقمي الساعتين وحده لا يحسب مرور يوم.$mw$,$mw$Start with one full day and adjust for the ending hour.

$24-1=23$

1. Tuesday 7 p.m. to Wednesday 7 p.m. spans 24 hours.

2. The second watering is one hour before the end of that span.

$23$

After 23 hours it is 6 p.m. One more hour brings it back to 7 p.m.

The difference between the clock numerals alone misses the change of day.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"متى تنتهي 24 ساعة كاملة؟","En":"When would a full 24 hours end?"},{"Ar":"هل موعد الأربعاء قبل ذلك الوقت أم بعده؟","En":"Is Wednesday’s watering before or after that time?"}],"Solution":{"Idea":{"Ar":"نبدأ بيوم كامل ثم نعدّل ساعة النهاية.","En":"Start with one full day and adjust for the ending hour."},"FormulaLatex":"24-1=23","Steps":[{"Ar":"من السابعة مساء الثلاثاء إلى السابعة مساء الأربعاء 24 ساعة.","En":"Tuesday 7 p.m. to Wednesday 7 p.m. spans 24 hours."},{"Ar":"السقي الثاني حدث قبل نهاية تلك المدة بساعة.","En":"The second watering is one hour before the end of that span."}],"Substitution":{"Ar":"$24-1=23$","En":"$24-1=23$"},"Result":{"Ar":"$23$","En":"$23$"},"Unit":{"Ar":"ساعة","En":"hours"},"Verification":{"Ar":"بعد 23 ساعة يكون الوقت السادسة مساءً، وبعد ساعة أخرى يعود إلى السابعة.","En":"After 23 hours it is 6 p.m. One more hour brings it back to 7 p.m."},"CommonError":{"Ar":"فرق رقمي الساعتين وحده لا يحسب مرور يوم.","En":"The difference between the clock numerals alone misses the change of day."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"فرق رقمي الساعتين وحده لا يحسب مرور يوم.","En":"The difference between the clock numerals alone misses the change of day."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يمر يوم كامل عند السابعة مساء الأربعاء.","En":"A full day would end at 7 p.m. Wednesday."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذه مدة الانتظار حتى الثامنة مساء الأربعاء.","En":"This would take her to 8 p.m. Wednesday."},"Order":4}]}$mw$),
($mw$growth-v78-grade-3-largest-gap-in-logged-events-1$mw$,$mw$largest-gap-in-logged-events$mw$,$mw$time$mw$,$mw$grade-3$mw$,3,1,82,324,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":324,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"أطول فترة انتظار","En":"Longest wait between visits"},"Question":{"Ar":"زارت ثلاث عصافير نافذة عند 8:52 صباحاً ثم 9:06 ثم 9:25. كم دقيقة كانت أطول فترة بين زيارتين متتاليتين؟","En":"Three birds visited a window at 8:52 a.m., then 9:06, then 9:25. How many minutes was the longest wait between consecutive visits?"},"Options":[{"LatexCode":"14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أربع عشرة دقيقة هي الفترة الأقصر.","En":"Fourteen minutes is the shorter gap."}},{"LatexCode":"19","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"33","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ثلاث وثلاثون دقيقة تشمل الفترتين.","En":"Thirty-three minutes covers both waits."}},{"LatexCode":"25","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"خمس وعشرون دقيقة تبدأ عند 9:00 ولم يصل طائر عندها.","En":"Twenty-five minutes starts from 9:00, when no bird arrived."}}],"Hints":[{"Ar":"كم فترة تفصل الزيارات الثلاث؟","En":"How many gaps separate three visits?"},{"Ar":"قس الفترة التي تعبر الساعة التاسعة على جزأين.","En":"Split the wait that crosses nine o’clock into two parts."}],"Solution":{"Idea":{"Ar":"نقيس كل فترة بين زيارتين متتاليتين ونقارن.","En":"Measure each gap between neighboring visits and compare."},"FormulaLatex":"8+6=14,\\quad25-6=19","Steps":[{"Ar":"من 8:52 إلى 9:06 ثماني دقائق حتى التاسعة ثم ست دقائق.","En":"From 8:52 to 9:06 there are eight minutes to nine and then six more."},{"Ar":"من 9:06 إلى 9:25 تسع عشرة دقيقة، وهي الفترة الأطول.","En":"From 9:06 to 9:25 there are nineteen minutes, the longer gap."}],"Substitution":{"Ar":"$8+6=14,\\quad25-6=19$","En":"$8+6=14,\\quad25-6=19$"},"Result":{"Ar":"$19$","En":"$19$"},"Unit":{"Ar":"دقيقة","En":"minutes"},"Verification":{"Ar":"مجموع الفترتين 33 دقيقة، وهي المدة من الزيارة الأولى إلى الأخيرة.","En":"The waits total 33 minutes, matching the span from first visit to last."},"CommonError":{"Ar":"أربع عشرة دقيقة هي الفترة الأقصر.","En":"Fourteen minutes is the shorter gap."}}}$mw$::jsonb,$mw$نقيس كل فترة بين زيارتين متتاليتين ونقارن.

$8+6=14,\quad25-6=19$

1. من 8:52 إلى 9:06 ثماني دقائق حتى التاسعة ثم ست دقائق.

2. من 9:06 إلى 9:25 تسع عشرة دقيقة، وهي الفترة الأطول.

$19$

مجموع الفترتين 33 دقيقة، وهي المدة من الزيارة الأولى إلى الأخيرة.

أربع عشرة دقيقة هي الفترة الأقصر.$mw$,$mw$Measure each gap between neighboring visits and compare.

$8+6=14,\quad25-6=19$

1. From 8:52 to 9:06 there are eight minutes to nine and then six more.

2. From 9:06 to 9:25 there are nineteen minutes, the longer gap.

$19$

The waits total 33 minutes, matching the span from first visit to last.

Fourteen minutes is the shorter gap.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم فترة تفصل الزيارات الثلاث؟","En":"How many gaps separate three visits?"},{"Ar":"قس الفترة التي تعبر الساعة التاسعة على جزأين.","En":"Split the wait that crosses nine o’clock into two parts."}],"Solution":{"Idea":{"Ar":"نقيس كل فترة بين زيارتين متتاليتين ونقارن.","En":"Measure each gap between neighboring visits and compare."},"FormulaLatex":"8+6=14,\\quad25-6=19","Steps":[{"Ar":"من 8:52 إلى 9:06 ثماني دقائق حتى التاسعة ثم ست دقائق.","En":"From 8:52 to 9:06 there are eight minutes to nine and then six more."},{"Ar":"من 9:06 إلى 9:25 تسع عشرة دقيقة، وهي الفترة الأطول.","En":"From 9:06 to 9:25 there are nineteen minutes, the longer gap."}],"Substitution":{"Ar":"$8+6=14,\\quad25-6=19$","En":"$8+6=14,\\quad25-6=19$"},"Result":{"Ar":"$19$","En":"$19$"},"Unit":{"Ar":"دقيقة","En":"minutes"},"Verification":{"Ar":"مجموع الفترتين 33 دقيقة، وهي المدة من الزيارة الأولى إلى الأخيرة.","En":"The waits total 33 minutes, matching the span from first visit to last."},"CommonError":{"Ar":"أربع عشرة دقيقة هي الفترة الأقصر.","En":"Fourteen minutes is the shorter gap."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أربع عشرة دقيقة هي الفترة الأقصر.","En":"Fourteen minutes is the shorter gap."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"ثلاث وثلاثون دقيقة تشمل الفترتين.","En":"Thirty-three minutes covers both waits."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"خمس وعشرون دقيقة تبدأ عند 9:00 ولم يصل طائر عندها.","En":"Twenty-five minutes starts from 9:00, when no bird arrived."},"Order":4}]}$mw$);
DO $$ BEGIN IF EXISTS (SELECT 1 FROM (SELECT track, category, count(*) n FROM growth_batch GROUP BY 1,2) b WHERE b.n+(SELECT count(*) FROM "LearningTrackProblems" tp JOIN "Problems" p ON p."Id"=tp."ProblemId" WHERE tp."TrackId"=b.track AND p."CategoryId"=b.category)>20) THEN RAISE EXCEPTION 'Target already filled'; END IF; END $$;
CREATE TEMP TABLE growth_seen ON COMMIT DROP AS SELECT upper(regexp_replace(btrim(ar),'[[:space:]]+',' ','g')) ar,upper(regexp_replace(btrim(en),'[[:space:]]+',' ','g')) en FROM (SELECT "QuestionTextAr" ar,"QuestionTextEn" en FROM public."Problems" UNION ALL SELECT "QuestionTextAr","QuestionTextEn" FROM public."CurriculumDraftItems" WHERE "EditorialStatus"<>'Withdrawn' AND "WizardJson" IS NOT NULL UNION ALL SELECT "WizardJson"::jsonb#>>'{Question,Ar}',"WizardJson"::jsonb#>>'{Question,En}' FROM public."CurriculumDraftItems" WHERE "EditorialStatus"<>'Withdrawn') q;
DO $growth$
DECLARE b record; did bigint; pid int; actor int;
BEGIN
 SELECT d."OwnerUserId" INTO STRICT actor FROM public."CurriculumDraftItems" d JOIN public."Users" u ON u."Id"=d."OwnerUserId" WHERE d."Id"=1088 AND d."EditorialStatus"='Published' AND d."PublishedProblemId"=1806 AND u."Role"='Admin' AND u."IsActive" AND NOT u."StaffSetupPending";
 FOR b IN SELECT * FROM growth_batch ORDER BY track,key LOOP
  PERFORM 1 FROM public."LearningTracks" WHERE "Id"=b.track FOR UPDATE;
  IF NOT EXISTS(SELECT 1 FROM public."LearningTracks" WHERE "Id"=b.track AND "Code"=b.track_code AND "StageId"=b.stage AND "IsPublished" AND "Revision"<2147483647) OR NOT EXISTS(SELECT 1 FROM public."Categories" WHERE "Id"=b.category AND "StageId"=b.stage) OR NOT EXISTS(SELECT 1 FROM public."CurriculumSkills" s JOIN public."CurriculumDomains" dm ON dm."Id"=s."DomainId" WHERE s."Id"=b.skill AND s."StableKey"=b.skill_key AND s."StageId"=b.stage AND s."CategoryId"=b.category AND s."IsPublished" AND dm."IsPublished") OR NOT EXISTS(SELECT 1 FROM public."LearningTrackCategories" WHERE "TrackId"=b.track AND "CategoryId"=b.category) OR NOT EXISTS(SELECT 1 FROM public."LearningTrackSkills" WHERE "TrackId"=b.track AND "SkillId"=b.skill) THEN RAISE EXCEPTION 'Scope changed %',b.key; END IF;
  IF EXISTS(SELECT 1 FROM public."CurriculumDraftItems" WHERE "ContentKey"=b.key) OR EXISTS(SELECT 1 FROM growth_seen q WHERE q.ar=upper(regexp_replace(btrim(b.wizard#>>'{Question,Ar}'),'[[:space:]]+',' ','g')) OR q.en=upper(regexp_replace(btrim(b.wizard#>>'{Question,En}'),'[[:space:]]+',' ','g'))) THEN RAISE EXCEPTION 'Duplicate %',b.key; END IF;
  INSERT INTO growth_seen VALUES (upper(regexp_replace(btrim(b.wizard#>>'{Question,Ar}'),'[[:space:]]+',' ','g')),upper(regexp_replace(btrim(b.wizard#>>'{Question,En}'),'[[:space:]]+',' ','g')));
  INSERT INTO public."CurriculumDraftItems"("ContentKey","PrimarySkillKey","TemplateFamilyKey","DifficultyLevel","PisaProcess","LearningObjectiveAr","LearningObjectiveEn","QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn","OptionsJson","EditorialStatus","WizardJson","OwnerUserId","LastEditorUserId","Revision") VALUES(b.key,b.skill_key,'',(b.wizard->>'DifficultyLevel')::int,'','','',b.wizard#>>'{Question,Ar}',b.wizard#>>'{Question,En}','','','[]'::jsonb,'Draft',b.wizard::text,actor,actor,0) RETURNING "Id" INTO did;
  INSERT INTO public."Problems"("TitleAr","TitleEn","QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn","StageId","CategoryId","Points","ViewsCount","SolvedCount","CreatedAt","EditorialDetailsJson") VALUES(b.wizard#>>'{Title,Ar}',b.wizard#>>'{Title,En}',b.wizard#>>'{Question,Ar}',b.wizard#>>'{Question,En}',b.flat_ar,b.flat_en,b.stage,b.category,10,0,0,now(),b.metadata) RETURNING "Id" INTO pid;
  INSERT INTO public."QuestionOptions"("ProblemId","Order","LatexCode","IsCorrect") SELECT pid,ord::int,o->>'LatexCode',(o->>'IsCorrect')::boolean FROM jsonb_array_elements(b.wizard->'Options') WITH ORDINALITY AS x(o,ord);
  INSERT INTO public."CurriculumProblemSkills"("ProblemId","SkillId","IsPrimary") VALUES(pid,b.skill,true);
  INSERT INTO public."LearningTrackProblems"("TrackId","ProblemId") VALUES(b.track,pid);
  UPDATE public."LearningTracks" SET "Revision"="Revision"+1 WHERE "Id"=b.track;
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v78 targeted depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
