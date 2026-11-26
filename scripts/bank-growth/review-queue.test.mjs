import assert from 'node:assert/strict';
import test from 'node:test';
import {reviewQueue} from './review-queue.mjs';

const row = (key, family, Ar, En) => ({
  Family: family, ContentKey: key, ProposedTrackCodes: ['grade-2'], PrimarySkillKey: 'length',
  Content: {CategoryId: 82, Question: {Ar, En}},
});
test('review families once and surface numeric rewrites in either language', () => {
  const a = row('a', 'ruler', 'أين ينتهي قلم طوله ٣ سم؟', 'Where does a pencil of length 3 cm end?');
  const b = row('b', 'ruler', 'أين ينتهي قلم طوله ٨ سم؟', 'Where does a pencil of length 8 cm end?');
  const held = row('held', 'previous', 'اين ينتهي قلم طوله ١٠ سم؟', 'An entirely different English stem');
  const known = [{Ar: 'ما نوع المثلث؟', En: 'Where does a pencil of length 13 cm end?'}];
  const result = reviewQueue([a, b, held], [a, b], known);
  assert.equal(result.familyCount, 1);
  assert.equal(result.candidateCount, 2);
  const [first] = result.families;
  assert.deepEqual(first.relatedVariantKeys, ['b']);
  assert.equal(first.comparisons.Ar[0].source, 'held');
  assert.equal(first.comparisons.En[0].source, 'live-or-draft');
  assert.equal(first.comparisons.Ar[0].score, 1);
  assert.equal(first.comparisons.En[0].score, 1);
  assert.throws(() => reviewQueue([a], [b], known), /Unknown candidate/);
  assert.throws(() => reviewQueue([a, a], [a], known), /Duplicate catalog/);
});
