# MathWorld bank — Work / ChatGPT handoff
Updated 2026-11-25. This is a shared handoff, not a scheduler or autonomous agent.
## Start here
- Read docs/MASTER_DELIVERY_LEDGER.md and scripts/bank-growth/README.md.
- PR 178 (feat/bank-university-families, base main): checkpoint 77b7eae35956a78309dc0e0a231f13cd7e2d6dc5, four CI checks green.
- PR 179 (feat/bank-growth-bulk-preparation, base feat/bank-university-families): checkpoint 1ace69eb3c661d4272aa9284904b72535d17e976, three recorded CI checks green.
- Use PR 179 branch for further offline work; re-read actual head and checks before starting. Do not force-push, merge blindly or modify main. Only one authoring session writes the branch at a time.
## Current state
267 authored candidates, 252 active offline candidates, 15 held for potential semantic overlap; none of these counts mean imported or published. 96 named families, not proof of distinct pedagogical ideas. Existing live snapshot: 773 problems, 728 track assignments. Historical coverage goal: 101 published distinct problems per linked track/category, at least five populated categories per track, including 12 school grades and seven university courses; target 11,413 assignments, remaining snapshot deficit 10,685, 33 missing category links. Refresh live inventory before actual import. Do not invent taxonomy.
## Next work
1. Complete existing-bank correction and review preparation first: reconcile existing 728 eligible amendments and holds/new drafts against actual state (see master ledger). Keep attempts, option identities and published mappings intact.
2. Generate author queue using node scripts/bank-growth/cli.mjs queue scripts/bank-growth/inventory-20261125.json <new-output-file> 200. 200 families / up to 600 questions is a target, not generated content.
3. Author new genuinely distinct reasoning families in parallel offline, at most 3 variants per family. Bilingual AR/EN, appropriate difficulty, unique distractors with misconception reasons, progressive hints, law/formula, worked steps, units, verification and skills. Independently recompute results, check semantics, hold uncertain items. No filler, no number-only inflation. Use actual inventory links.
4. Integrate authored wave modules or committed JSON via bulk-prepare; test and keep records of holds. Run node --test scripts/bank-growth/*.test.mjs and the CLI pilot in a new empty directory. Fresh live/draft duplicate checks and educational approval required before import. Confirm:false payloads only, 50 rows max, 1.8MB. The artifact-upload workflow modification is NOT yet in this branch; verify permission and CI before declaring enabled.
5. Record handoff after each coherent wave: commit SHA or PR head, files changed, actual authored/active/held counts, independent test results and CI state, exact next tasks, blockers. Push via normal non-force update with expected head; verify remote. If a write fails, record the exact recoverable commit or patch, don't count unlinked changes as saved.
## Safety and scope
No secrets in files/logs, no DB mutation or publishing unreviewed items, no production load test, no unrelated UI/mobile changes or redundant Vercel/Render builds. Use authorized admin path and bounded serial writes only for approved material; stop on errors/pressure. No concurrent agents editing the same branch. If blocked, continue safe independent offline work and preserve the checkpoint. No claims of asynchronous work after a session ends.
## Resume instruction
Read this file, current PR heads and ledger; verify what actually changed, then continue the highest-priority unfinished safe work without waiting for repeated 'continue' prompts. Before the session ends, update this file with concrete checkpoint and next task.
