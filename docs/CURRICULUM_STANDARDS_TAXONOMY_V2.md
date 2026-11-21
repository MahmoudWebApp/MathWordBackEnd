# MathWorld — Standards-aligned curriculum taxonomy (design v2)
Status: **design approved in principle; not migrated, seeded, or published**. Date: 2026-11-21.

## Governing decisions
- The number of categories is determined by coherent mathematical concepts and age-appropriate curricular outcomes, never by a fixed target of ten per stage.
- The number of problems is determined by coverage and learning evidence per skill, never an arbitrary identical quota per category.
- Reference **CCSS Mathematics** for grade/domain/cluster/standard and learning practices; cross-check curricular progression against **Cambridge International Primary/Lower Secondary Mathematics**; use **OECD PISA mathematics** for mathematical reasoning, application, and real-world contexts. These are references, **not official accreditation, endorsement, or an assertion of exact equivalence**.
- Existing stage/category/problem IDs, attempted answers, progress, Free selections and subscriptions must remain stable. Never rename/move/delete live content without mapping and preview.
- **Free**: exactly the two configured categories per stage, unlimited attempts in unlocked content. **Premium**: all categories, unlimited attempts. **No ten-per-day limit**. Retain the existing backend entitlement enforcement.
- Arabic and English parity for all student-facing descriptions and explanations; RTL-friendly math notation, accessible icons, stage colors and responsive UI on Next.js and Flutter.

## Content ontology
EducationalStage -> MathematicalDomain -> Category (coherent topic) -> LearningObjective/Skill -> Problem.
Each skill may map to multiple external standards and prerequisites; each problem must have a primary skill, optionally multiple secondary skills. Separate reusable cross-cutting tags: conceptual understanding, procedural fluency, reasoning, modelling, representation, application, misconception.
Do not make a new category for each difficulty or each numerical variant. A category should represent a bounded, recognizable topic; split it when objectives/prerequisites become incompatible. Examples: Fractions -> compare fractions, equivalent fractions, adding like denominators, adding unlike denominators; ratios and percentages belong in their own coherent category unless their curriculum placement demands a different presentation.

## Proposed additive schema, subject to a real DB audit
- MathematicalDomain: Id, StableKey unique, NameAr/En, DescriptionAr/En, SortOrder, IsPublished.
- LearningObjective: Id, StableKey unique, DomainId, CategoryId, StageId, NameAr/En, DescriptionAr/En, SortOrder, IsPublished, CurriculumVersion.
- ObjectiveStandardMapping: ObjectiveId, Framework (CCSS/Cambridge/PISA), StandardCode, ReferenceUrl, MappingType (direct/related), EvidenceNote. Never claim PISA categories are grade-level standards.
- ObjectivePrerequisite: ObjectiveId, PrerequisiteObjectiveId (same or earlier stage), with cycle rejection.
- ProblemObjective: ProblemId, ObjectiveId, IsPrimary; retain current CategoryId and StageId for compatibility.
- ProblemEditorialMetadata: ProblemId, CanonicalConceptKey, TemplateFingerprint, DifficultyBand, CognitiveDemand, ContextTag, MisconceptionTag, ReviewStatus, ReviewedBy, ReviewedAt, Revision; use existing problem storage for bilingual statements, options and solutions.
- Optional ObjectiveMastery: UserId, ObjectiveId, EvidenceCount, LastEvidenceAt, MasteryState and historical evidence mapping; **derived from actual attempts**, not number of views.
All changes must use EF Core migrations, unique/index constraints, rollback and a read-only dry-run mapping report before any production data writes.

## Editorial audit before new content
1. Export actual stages/categories/problems from Supabase (not guessed IDs), including question/option/solution text and usage counts; snapshot/backup.
2. Map each current category to domain and each existing problem to one primary objective; report ambiguous, orphaned, overbroad or empty categories.
3. Flag exact duplicates and near-duplicates based on normalized Arabic/English text, expression structure, template fingerprints and equivalent solution paths. Human editor makes the final decision.
4. Check correctness mathematically; exactly one valid answer for single-answer items, distinct plausible distractors, consistent units, readable LaTeX, clear reasoning and appropriate grade.
5. Publish gap/coverage report before selecting categories to add. Preserve existing content and user history through stable IDs.

## Item-bank construction and student progression
For each objective: provide a small diverse initial set covering conceptual recognition, procedural application, reasoning, realistic context and common errors; add more only where distinct learning evidence is needed. A sample target mix of 20% concepts, 30% procedures, 25% reasoning, 15% application and 10% advanced is **internal starting guidance**, not a global standard or rigid quota. Some objectives need fewer/more items.
Avoid numerical clones and fatigue: diversify representations, solution paths and contexts; don't repeat recently mastered equivalent templates except deliberate spaced review. Track item exposure and meaningful new-concept coverage. Use calibrated diagnostic checks; propose mastery only with repeated accurate evidence across formats, not one lucky answer. Wrong responses prompt explanation, targeted practice and review. Make spaced-review cadence adaptive, not compulsory repetition.
Show a student's objective progress, strengths, improvement areas, recommended next skill and Continue Learning; keep solved/history/attempts intact. Student-facing categories should stay readable, not expose all ontology nodes in the main grid.

## Web and mobile explanation
Both public website and authenticated dashboard, and Flutter:
- Small entry-point link labelled AR "كيف ننظّم تعلّم الرياضيات؟" / EN "How our math curriculum is organised".
- Explain reference frameworks accurately: "نُنظّم محتوى MathWorld بالاستناد إلى معايير CCSS التعليمية، وتسلسل مهارات Cambridge، وإطار PISA للتفكير والتطبيق. نحن لسنا جهة اعتماد رسمية لهذه المؤسسات." Localise English equivalently.
- Each stage/category page: bilingual dynamic overview from API; what you'll learn, prerequisite concepts, number of available objectives/problems, progress and next recommendation. No hardcoded category counts, empty category cards, invented accreditation badges or claims that every skill maps directly to all three frameworks.
- Keep only two Free categories accessible per stage, visible Premium locks with informative upgrade modal; preserve public browse-vs-authenticated-detail boundary.
- Shared API is the source of taxonomy/order/description; same stable icon key maps to coherent SVG assets on web and Flutter. Ensure accessible labels, RTL/LTR, light/dark theme, SEO structured page text and internal links for public pages.
- Admin pages need objective mapping/review UI, coverage gaps, duplicates, status and staged publish workflow.

## Rollout gates
1. Read-only DB/content audit, bilingual mapping and approval.
2. Additive schema/API and backfill (idempotent, reversible); tests for stage/category ownership, cycles, authorization and attempts preservation.
3. Admin curriculum/content review workflow and publication safeguards.
4. Next.js/Flutter parity with category icon and dynamic description, Free/Premium behaviour, SEO and curriculum explanation.
5. Original, reviewed content batches by actual gaps; manual math review, UX QA and build checks on both platforms before deployment.
6. Measure per-skill mastery, non-redundant exposure and engagement; revise catalogue without breaking IDs.
No statement of completed app changes or content publication is valid until separately verified.

## Official references
- https://www.thecorestandards.org/Math/Content/introduction/how-to-read-the-grade-level-standards/
- https://www.thecorestandards.org/developers-and-publishers/
- https://www.cambridgeinternational.org/programmes-and-qualifications/cambridge-primary/curriculum/mathematics/
- https://www.cambridgeinternational.org/programmes-and-qualifications/cambridge-lower-secondary/curriculum/mathematics/
- https://www.oecd.org/en/publications/pisa-2022-assessment-and-analytical-framework_dfe0bf9c-en/full-report/component-3.html
