import assert from 'node:assert/strict';
import {test} from 'node:test';
import {schoolLaunchPlan} from './school-launch.mjs';

const inventorySlot = (categoryId, questions) => ({
  track: 'grade-1', stage: 1, categoryId, questions,
  skills: [{id: 3, key: 'test-skill'}],
});
const item = (ContentKey, CategoryId, PrimarySkillId = 3) => ({
  ContentKey, ProposedTrackCodes: ['grade-1'], PrimarySkillKey: 'test-skill',
  Content: {StageId: 1, CategoryId, PrimarySkillId},
});

test('school launch plan prefers staged matches, caps each category and isolates holds and unlinked drafts', () => {
  const slots = [inventorySlot(1, 18), inventorySlot(2, 1)];
  const growth = [item('growth-first', 1), item('growth-surplus', 1), item('growth-other', 2)];
  const staged = [
    {...item('staged-first', 1), DraftId: 1, Revision: 2},
    {...item('staged-unlinked-skill', 2, 4), DraftId: 2, Revision: 2},
    {...item('g1-grade-gap-two-step-notebooks', 2), DraftId: 3, Revision: 2},
  ];
  const {plan, growthForReview} = schoolLaunchPlan(slots, growth, staged);
  const grade = plan.byGrade[0];
  assert.deepEqual(growthForReview.map(row => row.ContentKey), ['growth-first', 'growth-other']);
  assert.equal(grade.missingCategories, 3);
  assert.equal(grade.remainingOnLinkedCategories, 18);
  assert.deepEqual(grade.categories[0].stagedForReview, [{DraftId: 1, Revision: 2, ContentKey: 'staged-first'}]);
  assert.deepEqual(grade.categories[1].stagedForReview, []);
  assert.equal(plan.summary.requiredAssignments, 1200);
  assert.equal(plan.summary.remainingIfAllSelectedPass, 1178);
});

test('school launch plan chooses five linked categories and rejects scope drift', () => {
  const slots = [1, 2, 3, 4, 5, 6].map(id => inventorySlot(id, id));
  const {plan} = schoolLaunchPlan(slots, [], []);
  assert.deepEqual(plan.byGrade[0].categories.map(row => row.categoryId), [6, 5, 4, 3, 2]);
  assert.throws(() => schoolLaunchPlan(slots, [item('bad-scope', 7)], []), /outside linked school taxonomy/);
  assert.throws(() => schoolLaunchPlan(slots, [item('same-key', 1), item('same-key', 2)], []), /Duplicate/);
});
