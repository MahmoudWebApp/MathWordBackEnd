import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import {test} from 'node:test';
import {launchReasoningV19} from './launch-reasoning-v19.mjs';

const integers = (first, last) => Array.from({length: last - first + 1}, (_, index) => first + index);
const fraction = (numerator, denominator) =>
  (numerator < 0 ? '-' : '') + '\\frac{' + Math.abs(numerator) + '}{' + denominator + '}';

test('V19 answers and curriculum links agree with independent checks', () => {
  const stars = [true, true, true, true, true];
  for (const index of [0, 1, 2, 1]) stars[index] = !stars[index];
  const strips = [9, 12, 15, 18].filter(length => length <= 14);

  const observations = [2, 6, 4, 8, 2, 6, 4, 8, 2, 6, 4, 4];
  const frequency = value => observations.filter(observation => observation === value).length;
  const mode = [...new Set(observations)].sort((a, b) => frequency(b) - frequency(a))[0];
  const stickers = [24, 25, 27, 28].filter(total =>
    Math.floor(total / 6) === 4 && [2, 3].includes(total % 6));
  assert.equal(stickers.length, 1);

  const interval = integers(-8, 8).map(n => n / 2)
    .filter(x => x >= -6 / 2 && x <= 12 / 3);
  const eligibleTeams = integers(0, 5).flatMap(a =>
    integers(a + 1, 5).flatMap(b => integers(b + 1, 5).map(c => [a, b, c])))
    .filter(team => new Set(team.map(person => Math.floor(person / 2))).size === 2);
  const pairs = [0, 3, 5].flatMap(a => [0, 2, 5].map(b => a + b));

  const expected = new Map([
    ['count-visible-faces-on-turning-cards', stars.filter(Boolean).length],
    ['strip-length-closest-without-going-over', Math.max(...strips)],
    ['complete-breaks-before-finish-boundary', [915, 930, 945].filter(time => time < 945).length],
    ['combined-mode-neither-separate-mode', mode],
    ['feasible-sticker-total-with-quotient-and-remainder-limit', stickers[0]],
    ['compare-formulas-after-swapping-input-roles', (7 - 4) * (3 - 2)],
    ['area-of-triangle-with-equal-perpendicular-legs-from-sum', (18 / 2) ** 2 / 2],
    ['equal-distance-opposite-side-coordinates', 2 * (-2) - (-7)],
    ['map-scale-rectangular-area-converts-both-dimensions', 6 * 200 ** 2 / 1_000_000],
    ['all-inputs-for-two-sided-nonnegative-linear-slacks', '[' + interval[0] + ',' + interval.at(-1) + ']'],
    ['scalar-multiple-from-one-component-cancelled', fraction(integers(-4, 4).find(n => 2 + 4 * n / 2 === 0), 2)],
    ['combinations-avoid-three-way-unanimity', eligibleTeams.length],
    ['recover-cosine-from-tangent-and-quadrant', fraction(-4, Math.hypot(4, 3))],
    ['regroup-into-tens-without-using-hundreds', Math.floor(324 / 10)],
    ['balance-pans-infer-added-two-equal-weights', integers(100, 240).find(m => 240 + m + m === 600)],
    ['distinct-sums-from-nonuniform-two-spinners', new Set(pairs).size],
    ['circle-radius-from-horizontal-line-tangency', Math.hypot(-2 - (-2), 3 - (-1))],
  ]);

  const inventory = JSON.parse(readFileSync(new URL('./inventory-20261125.json', import.meta.url)));
  const wave = launchReasoningV19();
  assert.equal(wave.length, expected.size);
  for (const item of wave) {
    const {Family, Content, PrimarySkillKey, ProposedTrackCodes} = item;
    const answer = String(expected.get(Family));
    assert.ok(expected.has(Family), Family);
    assert.equal(Content.Solution.Result.Ar, answer, Family);
    assert.equal(Content.Solution.Result.En, answer, Family);
    assert.deepEqual(Content.Options.filter(option => option.IsCorrect).map(option => option.LatexCode), [answer], Family);
    assert.equal(Content.Options.length, 4, Family);
    assert.equal(new Set(Content.Options.map(option => option.LatexCode)).size, 4, Family);
    assert.equal(Content.Hints.length, 2, Family);
    assert.ok(inventory.some(row =>
      row.track === ProposedTrackCodes[0] && row.stage === Content.StageId &&
      row.categoryId === Content.CategoryId && row.skills.some(skill =>
        skill.id === Content.PrimarySkillId && skill.key === PrimarySkillKey)
    ), Family);
  }
});
