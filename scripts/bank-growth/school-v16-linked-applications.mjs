import {authoredCandidate} from './authored-candidate.mjs';

const rows = [
  {
    scope: ["grade-12", 3, 87, 338, "dot-product"],
    family: "signed-work-opposing-force-component",
    difficulty: 3,
    title: ["شغل قوة مائلة", "Work by an angled force"],
    question: ["أثرت قوة ثابتة مركبتاها (−6، 2) نيوتن على جسم إزاحته (3، 4) أمتار في الإحداثيات نفسها. ما الشغل الموقّع الذي بذلته القوة؟", "A constant force has components (−6, 2) N and its point of application moves by displacement (3, 4) m in the same coordinates. What signed work does the force do?"],
    hints: [["ما إشارة مساهمة المركبة الأفقية؟", "What sign should the horizontal contribution have?"], ["اضرب كل مركبة قوة في مركبة الإزاحة على المحور نفسه ثم اجمع.", "Multiply each force component by the displacement along the same axis, then add."]],
    formula: "W=\\vec F\\cdot\\vec d",
    steps: [["المركبة الأفقية تعاكس الإزاحة الأفقية، فمساهمتها −18 جولاً.", "The horizontal component opposes the horizontal displacement, contributing −18 J."], ["المركبة الرأسية تساهم بـ8 جول. حاصل الجمع سالب.", "The vertical component contributes 8 J. Their sum is negative."]],
    substitution: "(-6)(3)+2(4)=-10",
    answer: "-10",
    unit: ["جول", "J"],
    verify: ["حركة 3 م أفقياً ثم 4 م رأسياً تؤدي إلى الشغل نفسه لأن القوة ثابتة.", "Moving 3 m horizontally and then 4 m vertically gives the same work because the force is constant."],
    wrong: [["10", "أخذ مقدار الناتج وحذف إشارته.", "Reports the magnitude and drops its sign."], ["26", "عامل المساهمتين كلتيهما كموجبتين.", "Treats both component contributions as positive."], ["-18", "حسب المساهمة الأفقية وحدها.", "Counts only the horizontal contribution."]],
  },
  {
    scope: ["grade-5", 1, 33, 4, "primary-multiplication"],
    family: "multiply-hollow-display-layers",
    difficulty: 3,
    title: ["طبقات حول فراغ مركزي", "Layers around a central opening"],
    question: ["يتكوّن مجسّم من ست طبقات متطابقة. كل طبقة شبكة 5 × 5 من المكعبات الصغيرة، مع ترك المربع المركزي 3 × 3 فارغاً في كل طبقة. كم مكعباً صغيراً في المجسّم؟", "A model has six identical layers. Each layer is a 5 by 5 grid of small cubes with the central 3 by 3 square left empty. How many small cubes are in the model?"],
    hints: [["احسب عدد المواقع المشغولة في طبقة واحدة.", "Find how many positions are occupied in one layer."], ["اطرح المواقع التسعة الفارغة من مواقع الشبكة ثم كرر العدد لكل الطبقات.", "Subtract the nine empty positions from the grid and repeat that count for all layers."]],
    formula: "N=L(a^2-b^2)",
    steps: [["في كل طبقة 25 موقعاً منها 9 فارغة، فتبقى 16 مكعباً.", "Each layer has 25 positions, nine empty, leaving 16 cubes."], ["نضرب عدد مكعبات الطبقة في عدد الطبقات الست.", "Multiply the number of cubes per layer by the six layers."]],
    substitution: "6(25-9)=96",
    answer: "96",
    unit: ["مكعباً", "cubes"],
    verify: ["في كل طبقة 10 مكعبات في الصفين الخارجيين و6 في نهاية الصفوف الثلاثة الوسطى، أي 16.", "Each layer has ten cubes in the outside rows plus six at the ends of the three middle rows, making 16."],
    wrong: [["150", "حسب الشبكات كاملة وتجاهل الفراغ.", "Counts full grids and ignores the opening."], ["54", "حسب عدد المواقع الفارغة عبر الطبقات.", "Counts the empty positions across the layers."], ["16", "توقّف بعد حساب طبقة واحدة.", "Stops after counting one layer."]],
  },
  {
    scope: ["grade-9", 2, 84, 327, "solve-linear-inequalities"],
    family: "intersect-integer-production-bounds",
    difficulty: 4,
    title: ["عدد دفعات يقع بين شرطين", "A batch count under two requirements"],
    question: ["لدى فريق 5 قطع جاهزة، ويضيف كل تشغيل 4 قطع. يجب أن ينتهي الفريق ومعه 31 قطعة على الأقل. يستهلك كل تشغيل 3 وحدات طاقة بعد استهلاك ابتدائي قدره 2، والحد المتاح 29 وحدة. كم عدداً صحيحاً مختلفاً من التشغيلات يحقق الشرطين؟", "A team starts with 5 finished parts and adds 4 per batch. It must finish with at least 31 parts. Each batch uses 3 energy units after a fixed setup cost of 2 units, and the available total is 29. How many different whole batch counts meet both requirements?"],
    hints: [["أي شرط يضع حداً أدنى وأيهما يضع حداً أعلى؟", "Which requirement gives a lower bound and which gives an upper bound?"], ["حوّل الشرطين إلى متباينتين ثم عد الأعداد الصحيحة في تقاطعهما.", "Write both inequalities and count the integers in their intersection."]],
    formula: "5+4n\\ge31,\\quad 2+3n\\le29",
    steps: [["يتطلب عدد القطع أربعاً لكل دفعة حتى نغطي نقص 26 قطعة، فيلزم سبع دفعات على الأقل.", "The parts requirement needs at least seven batches because each batch covers four of the 26 missing parts."], ["تبقى 27 وحدة بعد الإعداد، فتسمح بتسع دفعات على الأكثر.", "After setup, 27 units allow at most nine batches."]],
    substitution: "n\\in\\{7,8,9\\}",
    answer: "3",
    unit: ["خيارات لعدد الدفعات", "possible batch counts"],
    verify: ["ست دفعات تعطي 29 قطعة فقط، وعشر دفعات تستهلك 32 وحدة. الأعداد 7 و8 و9 تحقق الحدين.", "Six batches yield only 29 parts, and ten use 32 units. Seven, eight and nine meet both bounds."],
    wrong: [["2", "طرح الحدين من دون احتساب طرفي المجال معاً.", "Subtracts the endpoint counts without including both endpoints."], ["4", "ضمّ ست دفعات بعد تقريب الحد الأدنى لأسفل.", "Rounds the lower bound down and includes six batches."], ["9", "أعطى أكبر عدد تشغيلات ممكن بدلاً من عدد الخيارات.", "Reports the largest feasible batch count instead of the number of choices."]],
  },
];

export function linkedApplicationWave() {
  return rows.map((row, index) => authoredCandidate('v16', index, row));
}
