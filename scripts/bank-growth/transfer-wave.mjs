import {authoredCandidate} from './authored-candidate.mjs';

const items = [
  {
    scope: ["grade-12", 3, 88, 328, "circles"],
    family: "circle-vertical-line-chord", difficulty: 4,
    title: ["طول وتر من معادلة دائرة", "Chord length from a circle equation"],
    question: ["يقطع المستقيم x = 5 الدائرة (x − 2)² + (y + 1)² = 25. كم وحدة يبلغ طول الوتر بين نقطتي التقاطع؟",
      "The line x = 5 crosses the circle (x − 2)² + (y + 1)² = 25. How many units long is the chord between the intersection points?"],
    hints: [["عوّض قيمة x في معادلة الدائرة.", "Substitute the fixed x-coordinate into the circle equation."],
      ["خذ الإشارتين للجذر، ثم احسب المسافة الرأسية بين النقطتين.", "Take both signs of the root, then find the vertical distance between the points."]],
    formula: "L=2\\sqrt{r^2-d^2}",
    steps: [["بعد التعويض نحصل على (y + 1)² = 25 − 9 = 16.", "Substitution gives (y + 1)² = 25 − 9 = 16."],
      ["قيمتا y هما 3 و−5. المسافة الرأسية هي الفرق بينهما.", "The y-values are 3 and −5. Their difference is the vertical separation."]],
    substitution: "3-(-5)=8", answer: "8", unit: ["وحدة طول", "length units"],
    verify: ["المسافة من المركز إلى منتصف الوتر 3، ونصف الوتر 4، وبالتالي 3² + 4² = 5².", "The centre-to-chord distance is 3 and half the chord is 4, so 3² + 4² = 5²."],
    wrong: [["4", "أجاب بنصف طول الوتر.", "Reports half the chord length."],
      ["10", "حسب القطر رغم أن المستقيم لا يمر بالمركز.", "Uses the diameter although the line misses the centre."],
      ["16", "أجاب بمربع نصف الوتر قبل أخذ الجذر.", "Reports the squared half-length before taking its square root."]],
  },
  {
    scope: ["calculus", 4, 13, 59, "university-gradient"],
    family: "gradient-normal-level-set", difficulty: 4,
    title: ["متجه عمودي على منحنى مستوى", "A normal to a level curve"],
    question: ["لتكن f(x,y) = x² + 2y². أيٌّ من المتجهات الآتية عمودي على منحنى المستوى f = 6 عند (2، 1)؟",
      "Let f(x,y) = x² + 2y². Which listed vector is normal to the level curve f = 6 at (2, 1)?"],
    hints: [["ابحث عن متجه مشتقتيه الجزئيتين.", "Find the vector of the two partial derivatives."],
      ["على منحنى المستوى، يكون متجه التدرّج غير الصفري عمودياً على المماس.", "A nonzero gradient is perpendicular to the tangent of the level curve."]],
    formula: "\\nabla f=(2x,4y)",
    steps: [["النقطة على المنحنى لأن 2² + 2(1²) = 6.", "The point lies on the curve because 2² + 2(1²) = 6."],
      ["عوّض إحداثيي النقطة في مركبتي التدرّج.", "Substitute the point into both gradient components."]],
    substitution: "\\nabla f(2,1)=(4,4)", answer: "(4,4)",
    verify: ["بالاشتقاق الضمني، ميل المماس عند النقطة −1، وبالتالي (1، −1) مماس وجداؤه النقطي مع (4، 4) صفر.", "Implicit differentiation gives tangent slope −1, so tangent (1, −1) has zero dot product with (4, 4)."],
    wrong: [["(1,-1)", "اختار متجه المماس.", "Chooses the tangent vector."],
      ["(4,2)", "أسقط المعامل 2 من حد y قبل الاشتقاق.", "Drops the coefficient 2 of the y-term before differentiating."],
      ["(2,1)", "اختار متجه الموضع من نقطة الأصل.", "Chooses the position vector from the origin."]],
  },
  {
    scope: ["discrete-mathematics", 4, 24, 105, "u-discrete-math-graphs"],
    family: "graph-odd-degrees-parity", difficulty: 4,
    title: ["زوجية عدد الرؤوس ذات الدرجة الفردية", "Parity of the odd-degree vertex count"],
    question: ["لرسم بياني بسيط غير موجه خمسة رؤوس. درجات أربعة منها هي 3 و3 و2 و1. أي خيار يمكن أن يكون الدرجة الخامسة؟",
      "A simple undirected graph has five vertices. Four have degrees 3, 3, 2 and 1. Which option can be the fifth degree?"],
    hints: [["كل حافة تضيف اثنين إلى مجموع الدرجات.", "Each edge contributes two to the degree sum."],
      ["اجمع الدرجات الأربع وافحص ما يلزم ليصبح المجموع الكلي زوجياً.", "Add the four known degrees and determine what makes the full sum even."]],
    formula: "\\sum_{v\\in V}\\deg(v)=2|E|",
    steps: [["مجموع الدرجات المعروفة 9 وهو فردي.", "The known degrees sum to 9, which is odd."],
      ["الدرجة المفقودة فردية ولا تتجاوز 4؛ الخيار الوحيد الذي يحقق الشرطين هو 1.", "The missing degree is odd and at most 4; the only listed option meeting both conditions is 1."]],
    substitution: "9+d\\equiv0\\pmod 2\\Rightarrow d\\equiv1\\pmod 2", answer: "1",
    verify: ["يوجد رسم بهذه الدرجات عند d = 1: الحواف AB وAC وAD وBC وBE تعطي الدرجات 3،3،2،1،1.", "Existence holds at d = 1: edges AB, AC, AD, BC and BE give degrees 3, 3, 2, 1, 1."],
    wrong: [["2", "اختار درجة زوجية، فيبقى مجموع الدرجات فردياً.", "Chooses an even degree, leaving the total odd."],
      ["0", "افترض إمكان عزل الرأس الخامس، فيبقى مجموع الدرجات 9.", "Assumes the fifth vertex can be isolated, leaving the degree sum at 9."],
      ["5", "اختار عدداً فردياً يتجاوز الدرجة الممكنة في رسم بسيط من خمسة رؤوس.", "Chooses an odd number exceeding the maximum degree in a simple five-vertex graph."]],
  },
  {
    scope: ["probability-statistics", 4, 89, 318, "hypothesis-testing"],
    family: "recover-type-two-error-from-power", difficulty: 3,
    title: ["خطأ النوع الثاني من القوة", "Type II error from power"],
    question: ["عند قيمة محددة للمعلمة تحت الفرضية البديلة، ما احتمال عدم رفض الفرضية الصفرية إذا كانت قوة الاختبار عند تلك القيمة 0.87؟",
      "At a specified parameter value under the alternative, what is the chance of failing to reject the null if the power at that value is 0.87?"],
    hints: [["عند ثبوت القيمة تحت الفرض البديل، حدّد حدثي القرار المتكاملين.", "Fix the parameter value under the alternative and identify the two complementary decisions."],
      ["اطرح احتمال الرفض عند هذه القيمة من واحد.", "Subtract the rejection probability at that value from one."]],
    formula: "\\beta=1-\\mathrm{Power}",
    steps: [["تعني القوة احتمال رفض الفرضية الصفرية عند القيمة البديلة المحددة.", "Power is the probability of rejecting the null at the specified alternative."],
      ["عدم الرفض هو المتمم عند القيمة نفسها.", "Failure to reject is the complement at that same value."]],
    substitution: "1-0.87=0.13", answer: "0.13",
    verify: ["احتمالا القرارين يجمعان إلى 0.13 + 0.87 = 1.", "The two decision probabilities sum to 0.13 + 0.87 = 1."],
    wrong: [["0.87", "أجاب باحتمال الرفض نفسه.", "Reports the rejection probability."],
      ["0.43", "خلط قوة الاختبار باحتمال أحد ذيلي توزيع.", "Treats power as a tail probability to be split."],
      ["0.50", "افترض أن القرارين متساويا الاحتمال.", "Assumes both decisions are equally likely."]],
  },
];

export function transferWave() {
  return items.map((row, position) => authoredCandidate("v10", position, row));
}

// The same complementary-event reasoning already appears in G1 hypothesis-testing.
export const transferHolds = ["recover-type-two-error-from-power"];
