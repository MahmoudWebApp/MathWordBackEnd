# University two-level transition (2026-11-26)
Status: owner approved two levels as the same LearningTrack abstraction as school grades. The category mapping below is a review proposal, not a production migration.

## Proposed taxonomy crosswalk
Basis: bank branch scripts/bank-growth/inventory-20261125.json and docs/BANK_LAUNCH_UNIVERSITY_CURRICULUM_GAPS.md (archived inventory; refresh before writes).
Use two stable track codes university-level-1 and university-level-2. Keep existing stage ID and problem/category/skill IDs. The existing course codes are retained for historical compatibility; do not delete them.

| Level | Existing category ID | Subject | Archived mapped count |
|---|---:|---|---:|
| 1 | 16 | Limits and continuity | 18 |
| 1 | 36 | Sequences and convergence | 22 |
| 1 | 14 | Linear algebra | 31 |
| 1 | 24 | Logic and discrete mathematics | 32 |
| 1 | TBD | Probability foundations | 0 / proposed |
| 2 | 13 | Multivariable calculus | 28 |
| 2 | 15 | Differential equations | 32 |
| 2 | 89 | Mathematical statistics | 3 |
| 2 | 90 | Numerical analysis | 12 |
| 2 | 91 | Mathematical optimization | 15 |

Probability foundations is a proposed coherent new category, not an existing category ID. Review against CUPM and existing statistics skills before creating it; no duplicate questions, skills or arbitrary category split. Existing statistics questions must not be relabelled as introductory probability without editorial evidence. Review difficulty/prerequisites in every existing category, not just its title.

## Transition gates
1. Read-only inventory of the seven course identities, source problem/category/skill mappings, published visibility, current student selections and all historical practice scopes. Compare live inventory with current bank PR; no parallel writer on the bank branch.
2. Prepare an exact source-locked mapping manifest with revisions and counts; require preview and independent review. Verify all existing valid mapped problem IDs survive in the new levels; no copy of Problems or attempt records. Do not create empty public levels.
3. Preserve old course IDs and all UserProgresses, ProblemAttempts, permanent achievements, report and certificate references. Track-scoped progress is not automatically shared by a new track ID. Design and test historical read compatibility and deterministic selection migration (calculus spans both levels; do not silently assign its students). Do not overwrite or merge scoped attempt histories. Provide explicit choice when ambiguous.
4. Verify server-side Free access uses the first two populated categories of each selected track, ordered by editorial Order then Id; Premium can practice all mapped categories within the active scope. Retain legacy stage catalog and history. Public catalog and both clients must show the same lock status.
5. Web and Flutter display university level labels, selection and navigation, not course-only wording; test Arabic and English, fresh registration, existing student, Free and Premium, switching levels, progress, reports and return to practice.
6. Only after successful integration and production read-only validation, perform bounded, transactional approved mapping and visibility cutover with an explicit rollback plan. Never delete old tracks, reset progress or modify attempts. Verify all old IDs remain recoverable and public navigation lists only the two new levels.

## Launch coverage
14 tracks (12 school grades + 2 university levels) × 5 categories × 20 distinct problems per track/category = 1,400 assignments. Recalculate deficits against the reviewed live mappings; do not treat archived course coverage or offline proposals as newly published. The bank's existing seven-course authoring manifests must be crosswalked before changing their target codes. No production write is authorized by this document alone.
