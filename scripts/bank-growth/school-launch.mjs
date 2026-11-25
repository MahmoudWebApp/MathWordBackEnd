import {mkdirSync, readFileSync, readdirSync, writeFileSync} from 'node:fs';
import {join, resolve} from 'node:path';
import {pathToFileURL} from 'node:url';
import {chunkImports} from './batch-runner.mjs';

const requiredCategories = 5;
const requiredProblems = 20;
const grades = Array.from({length: 12}, (_, index) => 'grade-' + (index + 1));
const keyOf = (track, category) => track + ':' + category;
const heldDrafts = new Set(Object.keys(JSON.parse(
  readFileSync(new URL('./school-launch-draft-holds.json', import.meta.url), 'utf8')
)));

export function schoolLaunchPlan(inventory, growth, staged) {
  const slots = new Map();
  for (const row of inventory) {
    if (!grades.includes(row.track) || row.categoryId === null) continue;
    const key = keyOf(row.track, row.categoryId);
    if (slots.has(key) || !Number.isSafeInteger(row.questions) || row.questions < 0) {
      throw Error('Invalid inventory slot: ' + key);
    }
    slots.set(key, {...row, drafts: [], growth: []});
  }

  const keys = new Set();
  const draftIds = new Set();
  for (const [kind, items] of [['drafts', staged], ['growth', growth]]) {
    for (const item of items) {
      const {ContentKey, Content, ProposedTrackCodes, PrimarySkillKey} = item;
      if (!ContentKey || keys.has(ContentKey)) throw Error('Duplicate or missing content key');
      keys.add(ContentKey);
      if (kind === 'drafts') {
        if (!Number.isSafeInteger(item.DraftId) || item.DraftId < 1 || draftIds.has(item.DraftId)
          || !Number.isSafeInteger(item.Revision) || item.Revision < 0) {
          throw Error('Invalid existing draft identity: ' + ContentKey);
        }
        draftIds.add(item.DraftId);
        if (heldDrafts.has(ContentKey)) continue;
      }
      if (!ProposedTrackCodes.some(track => grades.includes(track))) continue;
      if (ProposedTrackCodes.length !== 1) throw Error('Expected one school track: ' + ContentKey);

      const [track] = ProposedTrackCodes;
      const slot = slots.get(keyOf(track, Content.CategoryId));
      if (slot?.stage !== Content.StageId
        || !slot?.skills.some(skill => skill.id === Content.PrimarySkillId && skill.key === PrimarySkillKey)) {
        if (kind === 'growth') throw Error('Growth candidate outside linked school taxonomy: ' + ContentKey);
        continue;
      }
      slot[kind].push(item);
    }
  }

  const growthForReview = [];
  const byGrade = grades.map(track => {
    const linked = [...slots.values()].filter(slot => slot.track === track && slot.skills.length > 0);
    const missingCategories = Math.max(0, requiredCategories - linked.length);
    const coverage = slot => Math.min(requiredProblems, slot.questions + slot.drafts.length + slot.growth.length);
    const ranked = linked.sort((a, b) =>
      coverage(b) - coverage(a)
      || b.questions - a.questions
      || b.drafts.length - a.drafts.length
      || a.categoryId - b.categoryId
    ).slice(0, requiredCategories);
    const categories = ranked.map(slot => {
      const publishedGap = Math.max(0, requiredProblems - slot.questions);
      const existing = slot.drafts.slice(0, publishedGap);
      const added = slot.growth.slice(0, publishedGap - existing.length);
      growthForReview.push(...added);
      return {
        categoryId: slot.categoryId,
        categoryAr: slot.categoryAr,
        categoryEn: slot.categoryEn,
        published: slot.questions,
        publishedGap,
        stagedForReview: existing.map(({DraftId, Revision, ContentKey}) =>
          ({DraftId, Revision, ContentKey})),
        growthForReview: added.map(item => item.ContentKey),
        stillNeeded: publishedGap - existing.length - added.length,
      };
    });
    return {
      track,
      missingCategories,
      remainingOnLinkedCategories: categories.reduce((sum, row) => sum + row.stillNeeded, 0),
      categories,
    };
  });

  const categories = byGrade.flatMap(row => row.categories);
  const missingCategories = byGrade.reduce((sum, row) => sum + row.missingCategories, 0);
  const summary = {
    gradeCount: grades.length,
    requiredCategoriesPerGrade: requiredCategories,
    requiredProblemsPerCategory: requiredProblems,
    requiredAssignments: grades.length * requiredCategories * requiredProblems,
    missingCategories,
    reservedForUnlinkedCategories: missingCategories * requiredProblems,
    publishedGap: categories.reduce((sum, row) => sum + row.publishedGap, 0) + missingCategories * requiredProblems,
    stagedForReview: categories.reduce((sum, row) => sum + row.stagedForReview.length, 0),
    growthForReview: growthForReview.length,
    remainingOnLinkedCategories: byGrade.reduce((sum, row) => sum + row.remainingOnLinkedCategories, 0),
  };
  summary.remainingIfAllSelectedPass = summary.remainingOnLinkedCategories + summary.reservedForUnlinkedCategories;
  return {plan: {summary, byGrade}, growthForReview};
}

function run(inventoryPath, bulkDir, draftPath, outDir) {
  if (![inventoryPath, bulkDir, draftPath, outDir].every(Boolean)) {
    throw Error('Usage: school-launch.mjs INVENTORY BULK_PREVIEW_DIR MATCHED_DRAFTS NEW_OUT_DIR');
  }
  const read = file => JSON.parse(readFileSync(file, 'utf8'));
  const growth = readdirSync(bulkDir).filter(file => /^batch-\d+\.json$/.test(file))
    .sort((a, b) => a.localeCompare(b, 'en', {numeric: true}))
    .flatMap(file => {
      const batch = read(join(bulkDir, file));
      if (batch.Confirm !== false || !Array.isArray(batch.Items)) throw Error('Expected Confirm=false preview');
      return batch.Items;
    });
  const manifest = read(join(bulkDir, 'manifest.json'));
  const manifestKeys = new Set(manifest.Keys);
  if (growth.length !== manifest.CandidateCount || manifestKeys.size !== growth.length
    || growth.some(item => !manifestKeys.has(item.ContentKey))) {
    throw Error('Bulk files do not match the manifest');
  }
  const inventory = read(inventoryPath);
  const tracks = new Set(inventory.map(row => row.track));
  if (!grades.every(grade => tracks.has(grade))) throw Error('Inventory must include all school grades');
  const {plan, growthForReview} = schoolLaunchPlan(inventory, growth, read(draftPath));
  const previews = chunkImports(growthForReview);
  mkdirSync(outDir);
  const save = (file, value) => writeFileSync(join(outDir, file), JSON.stringify(value) + '\n', {flag: 'wx'});
  save('plan.json', plan);
  for (const [index, Items] of previews.entries()) save('batch-' + (index + 1) + '.json', {Items, Confirm: false});
  console.log(JSON.stringify({...plan.summary, previews: previews.length}));
}

if (process.argv[1] && pathToFileURL(resolve(process.argv[1])).href === import.meta.url) {
  run(...process.argv.slice(2));
}
