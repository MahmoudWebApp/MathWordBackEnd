import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import test from 'node:test';
import {selectCandidates, validate} from './pipeline.mjs';
import {schoolHolds, schoolWave} from './school-wave.mjs';
import {courseWave} from './course-wave.mjs';
import {schoolApplicationWave} from './school-application-wave.mjs';
import {transferWave, transferHolds} from './transfer-wave.mjs';

const inventory = JSON.parse(readFileSync(new URL('./inventory-20261125.json', import.meta.url), 'utf8'));

test('school wave uses linked skills and independently checked answers', () => {
  const rows = schoolWave();
  const answers = {
    'reverse-queue-rank': Array.from({length: 14}, (_, i) => 14 - i).indexOf(6) + 1,
    'compare-after-both-change': (9 + 4) - (34 - 28),
    'division-ceiling-capacity': [3, 5, 6, 8].find(n => 8 * n >= 43),
    'remaining-fraction-same-whole': `\\frac{${12 - 12 / 4 - 12 / 3}}{12}`,
    'area-model-omitted-cell': 26 * 34 - (600 + 80 + 180),
    'successive-percents-new-base': 80 * (125 * 80 / 10000),
    'annulus-area-coefficient': (9 - 4) * (9 + 4),
    'recover-total-from-relative-frequency': Array.from({length: 101}, (_, i) => i).find(n => n * 3 === 180),
    'intersect-two-linear-integer-bounds': Array.from({length: 41}, (_, i) => i - 20)
      .filter(x => 3 * x - 2 > 7 && 2 * x + 1 <= 13).length,
    'line-intersection-ordinate': 13 - ((13 - 1) / 3),
    'affine-population-variance': [1, 7, 13, 19].reduce((sum, value) => sum + (value - 10) ** 2, 0) / 4,
    'secant-from-tangent-sign': `-\\frac{${Math.hypot(3, 4)}}{3}`,
  };
  assert.equal(rows.length, 12);
  assert.equal(new Set(rows.map(row => row.Family)).size, 12);
  assert.equal(new Set(rows.map(row => row.ProposedTrackCodes[0])).size, 12);
  assert.deepEqual(validate(rows), []);
  assert.equal(selectCandidates(rows, inventory).selected.length, rows.length);
  for (const row of rows) assert.equal(row.Check.expected, String(answers[row.Family]), row.ContentKey);
  assert.deepEqual(schoolHolds, ['division-ceiling-capacity', 'affine-population-variance']);
});

test('course wave covers seven linked courses and verifies all answers', () => {
  const rows = courseWave();
  const f = (x, y) => x * (x + y);
  const along = t => f(2 + 3 * t / 5, 1 + 4 * t / 5);
  const determinant = a =>
    a[0][0] * (a[1][1] * a[2][2] - a[1][2] * a[2][1]) -
    a[0][1] * (a[1][0] * a[2][2] - a[1][2] * a[2][0]) +
    a[0][2] * (a[1][0] * a[2][1] - a[1][1] * a[2][0]);
  const answers = {
    'oblique-direction-normalization': `\\frac{${Math.round((along(1) - along(-1)) * 5 / 2)}}{5}`,
    'monotone-sequence-supremum': 7,
    'relaxation-deviation-half-time': [1, 2].reduce(value => (value + 20) / 2, 44),
    'initial-curvature-second-order': [0, 4, 8, 14].find(a => a + 4 * (-1) + 3 * 2 === 10),
    'transitive-closure-extra-pairs': [1, 2, 3, 4]
      .flatMap(i => [1, 2, 3, 4].filter(j => j - i > 1)).length,
    'determinant-composed-row-operations': determinant([[0, 9, 0], [1, 0, 0], [0, 18, -2]]),
    'coefficient-from-linear-dependence': [4, 9, 12, 24].find(a => 2 * a - 8 * 3 === 0),
    'linear-optimum-two-active-constraints': Math.max(...[[0, 0], [5, 0], [5, 3], [0, 8]].map(([x, y]) => 3 * x + 2 * y)),
    'convexity-chord-bound': 3 + 2 * ((19 - 3) / 8),
    'linear-system-residual-correction': (3 * 12 + 14 - (3 * 2 + 3) * 5) / 5,
    'interval-error-bound-from-rounding': (4.25 + 7.35 - 11.5).toFixed(2),
    'additional-sample-for-target-precision': [324, 288, 72, 108].find(additional => Math.sqrt(36 + additional) === 18),
  };
  assert.equal(rows.length, 12);
  assert.equal(new Set(rows.map(row => row.Family)).size, rows.length);
  assert.equal(new Set(rows.map(row => row.ProposedTrackCodes[0])).size, 7);
  assert.deepEqual(validate([...schoolWave(), ...rows]), []);
  assert.equal(selectCandidates(rows, inventory).selected.length, rows.length);
  for (const row of rows) assert.equal(row.Check.expected, String(answers[row.Family]), row.ContentKey);
});

test('school application wave adds distinct linked reasoning', () => {
  const rows = schoolApplicationWave();
  const colours = ['B', 'B', 'B', 'W', 'W'];
  const different = colours.flatMap((first, i) =>
    colours.slice(i + 1).filter(second => second !== first)).length;
  const answers = {
    'swap-hundreds-tens-difference': 200 - 20,
    'repair-one-addend-in-total': 1418 + (526 - 562),
    'minimum-budget-rounded-up': 191 + (8 + 4 + 7),
    'shared-height-area-difference': (11 * 6) / 2 - (7 * 6) / 2,
    'chain-ratios-common-middle': `${2 * (12 / 3)}:${5 * (12 / 4)}`,
    'pool-unequal-relative-frequencies': 0.5 * 40 + 0.2 * 60,
    'unordered-two-color-without-replacement': `\\frac{${different / 2}}{${(5 * 4 / 2) / 2}}`,
    'stationary-seed-for-recurrence': [0, 4, 6, 12].find(n => (n + 12) / 3 === n),
    'telescoping-tail-from-shift': '\\frac{1}{4}',
  };
  const partial = Array.from({length: 10000}, (_, i) => i + 4)
    .reduce((sum, n) => sum + 1 / (n * (n + 1)), 0);
  assert.ok(0 < 1 / 4 - partial && 1 / 4 - partial < 0.0001);
  assert.equal(rows.length, 9);
  assert.equal(new Set(rows.map(row => row.Family)).size, 9);
  assert.deepEqual(validate([...schoolWave(), ...courseWave(), ...rows]), []);
  assert.equal(selectCandidates(rows, inventory).selected.length, rows.length);
  for (const row of rows) assert.equal(row.Check.expected, String(answers[row.Family]), row.ContentKey);
});

test('transfer wave independently checks geometry, gradient, graph feasibility and probability', () => {
  const rows = transferWave();
  const intersections = Array.from({length: 21}, (_, i) => i - 10)
    .filter(y => (5 - 2) ** 2 + (y + 1) ** 2 === 25);
  const edges = ['AB', 'AC', 'AD', 'BC', 'BE'];
  const degrees = [...'ABCDE'].map(vertex => edges.filter(edge => edge.includes(vertex)).length);
  assert.deepEqual(degrees, [3, 3, 2, 1, 1]);
  const answers = {
    'circle-vertical-line-chord': intersections[1] - intersections[0],
    'gradient-normal-level-set': [[1, -1], [4, 2], [2, 1], [4, 4]]
      .filter(([x, y]) => x - y === 0).map(v => `(${v.join(',')})`)[0],
    'graph-odd-degrees-parity': degrees[4],
    'recover-type-two-error-from-power': ((100 - 87) / 100).toFixed(2),
  };
  assert.equal(rows.length, 4);
  assert.deepEqual(validate([...schoolWave(), ...courseWave(), ...schoolApplicationWave(), ...rows]), []);
  assert.equal(selectCandidates(rows, inventory).selected.length, rows.length);
  for (const row of rows) assert.equal(row.Check.expected, String(answers[row.Family]), row.ContentKey);
  assert.deepEqual(transferHolds, ['recover-type-two-error-from-power']);
});
