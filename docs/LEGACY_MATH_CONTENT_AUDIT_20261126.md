# Legacy solution audit — 2026-11-26
Live read-only snapshot: 849 problems, 613 without EditorialDetailsJson, 129 potential Arabic-variable candidates (heuristic, not confirmed errors), zero missing bilingual solution strings, zero structural option-count/correct-flag/duplicate/blank flags. No odd dollar count in titles. Metadata presence alone is not proof of quality or complete structure. This screening is not a mathematical validation.

| Stage | Total | No metadata | Variable flags |
|---|---:|---:|---:|
| 1 | 215 | 126 | 22 |
| 2 | 195 | 144 | 38 |
| 3 | 217 | 174 | 47 |
| 4 | 222 | 169 | 22 |

## First inspected batch
All 12 correct choices independently recalculated from the live question. Existing draft revisions and IDs below observed in read-only queries; recheck before every publish. No write, no new problem, no completed editorial approval is claimed.
| Problem | Correct option ID | Computation | Existing draft | State |
|---|---:|---|---:|---|
|154|608|2*5-3=7|374|Published; fix Arabic step in new amendment|
|166|655|2*6-4=8|384|Published; fix Arabic step in new amendment|
|178|702|2*7-5=9|394|Published; fix Arabic step in new amendment|
|188|743|(37-7)/5=6|403|Draft rev 0|
|200|790|(50-8)/6=7|413|Draft rev 0|
|212|838|(11-5)/2=3|423|Draft rev 0; exact owner screenshot|
|213|841|(10-4)/(4-1)=2|424|Draft rev 0|
|214|848|2*2^2+3=11|425|Draft rev 0|
|224|885|(18-6)/3=4|435|Draft rev 0|
|225|889|(17-5)/(6-2)=3|436|Draft rev 0|
|226|895|3*3^2+4=31|437|Draft rev 0|
|236|935|(27-7)/4=5|447|Draft rev 0|

The nine Draft solutions already have correct standard notation and independent numerical checks; inspect entire WizardJson (title/question/options/hints/classification/distractor reasons), fingerprint and scope before approval. Their DetailedSolutionAr fields are the legacy source snapshot used for comparison, not the new solution; do not rewrite them blindly. For structured 154,166,178, retain previous published provenance and use new amendments: change Arabic steps to the exact proposed text in the JSON manifest. Do not change options, flags, problem ID, history, stage, category or track membership.

## Permanent workflow
Run the read-only SQL first; partition by existing draft vs new amendment. Check LaTeX rendering, standard Latin/Greek variable symbols inside math, bilingual semantics, laws, independent computation, correct option IDs, plausible distractors, two progressive hints, and full step-by-step verification. A regex flag is not approval. Check existing source locks and publication policy; use reviewed amendment endpoints; coordinate with bank PR 179 rather than creating duplicate drafts or conflicting with active bank work. No blind replacement of Arabic prose. Do not publish if fingerprint, answer or taxonomy changes.


## Production checkpoint — 2026-11-26
Applied the owner-authorized, source-locked, three-row solution-only maintenance script `scripts/apply_reviewed_notation_steps_20261126.sql` (commit 1eff450e6ea3a091db66fef2e017ffd31bed14c9). Readback confirms problems 154, 166, 178 contain the corrected standard-notation Arabic steps in both structured metadata and flat solution text; English hashes and ordered option IDs, text and flags are unchanged. No student rows or historic draft snapshots were modified. This maintenance is logged in Git; do not rerun the one-time SQL.
Nine existing drafts 403, 413, 423, 424, 425, 435, 436, 437, 447 were inspected: revision 0, source legacy solution matches, stage/category/points/question/ordered options match; published category, track, skill and domain links are valid; one open draft per source; all owned by an active administrator. Hints, distractor reasoning and numerical solutions checked. These remain unpublished pending source fingerprint verification and approved publication path. In 425 general formula should use g(x) rather than f(t) for consistency; 436 wording can explicitly use x/y. Do not rewrite legacy source snapshots. Coordinate with #179.
