# G1 hint-only publication route (not deployed)

The canonical inventory contains 732 eligible rows and 41 held rows across the two files. Use the 72 full structured amendments through the existing draft-only workflow first or reserve them; the remaining eligible rows may use the Admin-only hint-only route. Do not upload held records or change a held marker. The route accepts up to 50 exact source-bound records and requires a preview followed by an identical payload, the preview token, and a nonempty review note. A changed source, changed skill, open amendment, invalid options, or conflicting metadata blocks the whole batch. No schema migration. The legacy solution, correct answer, points, options, category, and learner history are not written. The metadata stores only the bilingual hints, without invented difficulty or structured solution. Existing full editorial amendment workflow remains available for later improvement. Deployment and authenticated Admin approval are required before any live application.

Endpoint: POST /api/editorial/problems/hints/import

Payload: Items (ProblemId, PrimarySkillKey, Question, Hints, TaxonomyReviewPending), Confirm=false. Re-submit the same Items with Confirm=true, PreviewToken from preview, and ReviewNote after review. For already applied rows, obtain a new preview; existing metadata is never overwritten by this route. The preview token binds the actor, current source fingerprint, primary skill and exact hints. The audit event records only actor and problem ID, not review note or content. The client must retain the review note in its editorial record.

No production database write was performed in preparing this change.

## Deterministic offline preparation

Run `python3 scripts/prepare_g1_publication_batches.py --output private-g1-preview` from the backend repository root. Keep the output private: the amendment files contain answers and explanations. This generates 14 hint-only preview payloads for 660 problems, two structured amendment preview payloads for 72 problems, and a list of the 41 excluded problem IDs. All payloads use Confirm=false; the script never connects to the server. The structured amendment payloads go to /api/editorial/problems/amend/import (draft creation only after review and confirmation). Hint-only payloads go to /api/editorial/problems/hints/import. Review and approve each response separately using an authenticated Admin session; do not copy a preview token from a different batch. The route must be deployed and CI green first.

## New question preparation and track readiness

Run `python3 scripts/prepare_g1_new_content.py --output private-g1-new-preview`.
This generates two draft-only import preview batches (50 + 1 candidates) for track identities present in the reviewed snapshot, and a separate blocked batch of 8 questions targeting the two missing draft identities (numerical analysis and mathematical optimization). Recheck actual track IDs and states before import. No requests are sent. The blocked batch must not be submitted until these identities exist as reviewed draft tracks.
The 19-track readiness report reconciles the 773 existing problems, 59 new draft assignments and 41 held existing problems. Five university courses still lack Free-category overlap; no access policy change is authorized by this report. A reviewed placement and publication operation remain mandatory. These are private admin files, not public question bank downloads.

## Existing-question track mapping preparation

Run `python3 scripts/prepare_g1_track_mapping.py --output private-g1-mappings`.
The generated mapping-proposal-732.json can prefill the existing admin track mapping UI, one track at a time, for review. It excludes all 41 held IDs and preserves the original category/skill links. It does not approve the mapping. Before saving, inspect the current draft revision and any existing links; the mapping endpoint replaces the draft links, so never overwrite additional reviewed content or student-visible mappings. Import the two missing draft identities only after confirming neither already exists via the admin catalog. Do not publish until grade/course quality and access decisions have been approved. Five courses still have no Free overlap; the two-category entitlement and publication gate are unchanged. New questions and held resolutions are separate workflows.
