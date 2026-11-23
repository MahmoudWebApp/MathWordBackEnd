# MathWorld — audit of worked-solution law explanations (23 Nov 2026)

## Objective

Every student-facing worked solution should show the actual **mathematical
law or principle used** when a law applies, followed by the substitution,
intermediate steps, final answer and an explanation of units or constraints.

An algorithmic or conceptual problem may need a named **rule** rather than
a symbolic law. Do not invent a formula to make every explanation look alike.

## Read-only database baseline

SQL audited all 601 student-facing `Problems` on 23 November 2026.
The metric **short** counts non-blank solution texts shorter than 55
characters; it is a triage indicator, not proof of wrong mathematics.

| Stage | Published problems | Arabic solutions under 55 chars | English solutions under 55 chars |
|---|---:|---:|---:|
| Primary | 151 | 96 | 94 |
| Lower secondary | 140 | 90 | 87 |
| Upper secondary | 150 | 90 | 80 |
| University | 160 | 80 | 68 |
| **Total** | **601** | **356** | **329** |

Zero published Arabic solutions currently start with an explicit
`القانون المستخدم:` label. This does **not** mean every solution lacks
a correct formula: many display the mathematical work without a heading,
and some tasks are conceptual. Each requires direct editorial review.

## Implemented on current editorial wave

- All **56** new bilingual items in wave four have a specific `القانون المستخدم:`
  and `Rule used:` section before the original worked steps.
- Reviewed principles include positional value, rounding, conditional and
  independent probability, vector norms and dot products, determinant-based
  areas, derivative tests, Hessians, and constrained inequalities.
- Updated only `CurriculumDraftItems` matching new `mw-wave4-%` keys
  with `EditorialStatus='Draft'`; existing `Problems` are untouched.
- The new questions remain **unpublished** and still require bilingual
  mathematical education review.

## Required production content review

1. Audit each of the **601** published solutions for mathematical accuracy,
   conceptual coverage, appropriate named law, and correct bilingual notation.
2. Prioritize 356 short Arabic explanations and 329 short English explanations
   while also reviewing longer texts with missing principles.
3. Do **not** mass-prepend an unrelated skill-wide formula to a problem.
   Use item-specific independent calculations, explanations of assumptions,
   and consistent math rendering with RichText.
4. Stage revised published-question explanations using immutable IDs and
   before/after diff. Verify that all four answer choices and the correct
   option remain unchanged, unless a separately reviewed correction is needed.
5. Re-run math oracle and bilingual rendering checks; release through the
   original one-site deployment path with existing progress, attempts and
   access policy preserved.

The audit does not certify any curriculum or represent expert approval.
