# MathWorld school launch coverage · 2026-11-25

The proposed launch floor is **five curriculum-aligned categories with at least 20 distinct published problems in each of grades 1–12**. This requires at least 1,200 track/category assignments across selected categories. University and the longer-term expansion target are outside this launch calculation. Categories are selected by the coverage projected from eligible pending work. Keep selections stable once approved.

## Verified starting queue

The read-only inventory contained 831 published problems and 786 track assignments across all 19 tracks. The 890-pair comparison corpus matched the prior fingerprint. All 59 expected G1 draft records were still Draft. Each matched its repository content digest, difficulty and proposed tracks, and no separate live or draft record had an exact match in either language after whitespace and case normalization. The school queue excludes out-of-scope drafts, missing track/skill links and four newly recorded semantic holds. The 20 selected existing drafts are retained by ID and revision for review. The 171 selected growth proposals are in four local Confirm=false files. None of these candidates count as published.

| Grade | Category links missing | Published gap in selected linked categories | Existing drafts to review | Growth proposals to review | Linked gap if all selected pass |
|---|---:|---:|---:|---:|---:|
| 1 | 3 | 36 | 3 | 13 | 20 |
| 2 | 2 | 40 | 0 | 18 | 22 |
| 3 | 0 | 59 | 0 | 28 | 31 |
| 4 | 0 | 54 | 4 | 13 | 37 |
| 5 | 0 | 49 | 2 | 11 | 36 |
| 6 | 2 | 43 | 0 | 10 | 33 |
| 7 | 0 | 32 | 3 | 8 | 21 |
| 8 | 0 | 37 | 0 | 15 | 22 |
| 9 | 0 | 74 | 1 | 20 | 53 |
| 10 | 0 | 38 | 0 | 8 | 30 |
| 11 | 0 | 47 | 5 | 12 | 30 |
| 12 | 0 | 59 | 2 | 15 | 42 |
| **Total** | **7** | **568** | **20** | **171** | **377** |

The seven missing links reserve 140 assignments. The selected-category published deficit is 708. Selecting only for existing published coverage yields 706, while the table selects categories that close the most gaps with the current queue. The best-case deficit after all 191 selected records pass review and are published is 517. Future authoring, suitable existing-problem links and any revised approvals can reduce it.

## First production publication

The owner authorized direct production publication of three existing grade-1 drafts. A no-write validation pass confirmed their source fingerprints, revision, existing track/category/skill links, bilingual question and solution, correct answer and duplicate checks. A single transaction published draft 985 as problem 1785, draft 990 as problem 1786, and draft 1001 as problem 1787. The production readback confirmed Published revision 3, the Arabic and English stems, four ordered options and answer flags, structured hints and solution, primary skill, grade-1 track assignment, and all three audit events for each draft. No category or skill links were created.

Grade 1 now has seven published assignments across its two linked launch categories. Against the selected launch scope in the table, the outstanding published deficit fell from 708 to 705. The remaining priority queue is 17 staged drafts and 171 growth candidates before refreshing the inventory and comparison pairs. The 517 best-case gap already assumed these three publications. Skip the published drafts on future runs and reconcile the live state before another release.

## Category decisions

| Grade | Proposed category or decision | Evidence and scope for review |
|---|---|---|
| 1 | Early Algebraic Thinking (2) | Drafts 986 and 987 support a missing addend and skip-counting. Review skills 7 and 8 within small whole numbers. |
| 1 | Measurement & Units (82) | Drafts 991 and 1000 support length comparison and measuring between marks. Review length skill 321, using one unit per item. |
| 1 | Fifth category pending | Select a first-grade outcome with an existing age-appropriate skill. Check shape recognition or elementary data as possible directions before proposing a catalog link. |
| 2 | Early Algebraic Thinking (2), provisional | Grade 3 links this category. Review age-appropriate one-step addition and subtraction using skill 7. |
| 2 | Geometry & Measurement (3), provisional | Grade 3 links perimeter and rectangle area. Review simple boundary lengths with whole-number units as scope for skill 12 before using it in grade 2. |
| 6 | Data & Basic Probability (4) | Draft 1005 supports basic probability (skill 17). Draft 1002 remains held for similarity to an existing missing-mean problem. |
| 6 | Measurement & Units (82), provisional | Grade 5 links length and metric conversion. Review skill 323 for conversions in multistep applications. |

The first decision set covers grade 1 categories 2 and 82 and grade 6 category 4. The other proposals require curriculum scope decisions. Each category needs distinct published problems appropriate for the grade. Existing published problems may count after any new track assignment has been individually reviewed for scope and approved. Preserve existing learner attempts and Free category ordering. No category or problem writes were made during this planning pass.

## Reproduce privately

Export current inventory using [inventory.sql](../scripts/bank-growth/inventory.sql) and refresh bilingual comparison pairs. Run the standard bulk preview before projecting school coverage. Prepare the private matched draft input as an array of source G1 candidate objects enriched with current numeric DraftId and Revision after matching the stored wizard digest, difficulty and track codes. Exclude non-open drafts, existing publications and other exact stem matches in either language using a separate comparison against existing problems and other drafts. Recompute the comparison whenever the source changes.

```sh
node scripts/bank-growth/cli.mjs bulk-prepare BULK_PREVIEW_DIR INVENTORY KNOWN
node scripts/bank-growth/school-launch.mjs INVENTORY BULK_PREVIEW_DIR MATCHED_DRAFTS NEW_OUT_DIR
```

Keep all outputs private. The plan splits the existing-draft review queue from new-content previews, caps contributions at 20 per category and reserves uncovered capacity for unlinked categories. It contains no approval or publish action. Recheck draft revision, scope and semantic overlap before any authorized publication. Begin editorial review with the grade-1 linked candidates while curriculum decisions for grades 1, 2 and 6 are pending.
