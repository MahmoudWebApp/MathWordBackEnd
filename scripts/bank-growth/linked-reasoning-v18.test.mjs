import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import {test} from 'node:test';
import {linkedReasoningV18} from './linked-reasoning-v18.mjs';

const fraction = (numerator, denominator) => '\\frac{' + numerator + '}{' + denominator + '}';
const sequence = (length, start = 0) => Array.from({length}, (_, i) => i + start);
const minutesToClock = (minutes) =>
  Math.floor(minutes / 60) + '{:}' + String(minutes % 60).padStart(2, '0');
const binaryStrings = (length) => sequence(2 ** length).map(
  (value) => value.toString(2).padStart(length, '0')
);

test('V18 answers agree with independent reconstructions from prompt data', () => {
  const buttons = new Set(sequence(6));
  const moved = new Set([0, 2, 5]);
  const rows = [new Set([...buttons].filter(x => !moved.has(x))), moved];
  const halfArea = 12 * 5 / 2;
  const thread = sequence(12).slice(4).slice(2);

  // Integrate polynomial terms from their endpoint primitives, without using symmetry.
  const thirdPowerPrimitive = (x) => x ** 4 / 4;
  const rectangleIntegral = (thirdPowerPrimitive(2) - thirdPowerPrimitive(-2)) * 1.5
    + (2 - (-2)) * (1 ** 2 - 0 ** 2) / 2;

  // Construct two vectors realizing the given sum and difference lengths.
  const u = (7 + 5) / 2;
  const v = 7 - u;

  const left = new Set('ABE');
  const graphEdges = ['AB', 'AC', 'AD', 'BC', 'BD', 'CE', 'DE'];
  const convexWitness = (x) => 10 - x;
  assert.deepEqual([convexWitness(0), convexWitness(8)], [10, 2]);

  let rootEstimate = 11;
  let newtonSteps = 0;
  while (Math.abs(rootEstimate - 3) > 0.5) {
    const value = rootEstimate ** 2 - 6 * rootEstimate + 9;
    rootEstimate -= value / (2 * rootEstimate - 6);
    newtonSteps++;
  }

  // Enumerate ordered draws to derive E[Xbar²] and E[Xbar] separately.
  const population = [0, 2, 4, 6];
  const means = population.flatMap(
    x => population.filter(y => y !== x).map(y => (x + y) / 2)
  );
  const mean = means.reduce((sum, value) => sum + value, 0) / means.length;
  const centeredSquareTotal = means.reduce((sum, value) => sum + value ** 2, 0)
    - means.length * mean ** 2;
  assert.equal(centeredSquareTotal, 20);

  const successCounts = binaryStrings(4).map(s => [...s].filter(x => x === '1').length);
  const threshold = sequence(5).find(k =>
    successCounts.filter(n => n >= k).length <= 0.10 * successCounts.length
  );
  const roundedBagCount = [21, 31, 41, 51].reduce(
    (sum, value) => sum + value - value % 10 + (value % 10 >= 5 ? 10 : 0), 4
  );
  const aboveThreshold = sequence(12, 1).filter(n => 23 - 2 * n > 15);
  const possibleCorrections = sequence(7).filter(y => 2 * 2 + y === 7 && 2 + 3 * y === 11);

  const slopes = [-0.001, -0.003, 0.007, 0.005].map(h => h ** 2 * Math.cos(1 / h) / h);
  for (const [i, h] of [-0.001, -0.003, 0.007, 0.005].entries()) {
    assert.ok(Math.abs(slopes[i]) <= Math.abs(h));
  }

  const answer = new Map([
    ['recount-after-rearrangement', new Set([...rows[0], ...rows[1]]).size],
    ['first-aligned-strip-endpoints', sequence(48, 1).find(x => x % 4 === 0 && x % 6 === 0)],
    ['equal-area-altitude-with-different-bases', sequence(15).find(h => 15 * h / 2 === halfArea)],
    ['recover-fraction-after-changing-reference', fraction(thread.length / 6, 12 / 6)],
    ['double-integral-cancel-odd-part', rectangleIntegral],
    ['oscillator-reflected-initial-time', 3 * Math.cos(2 * (-Math.PI / 4 - Math.PI / 4))],
    ['dot-product-from-two-diagonal-norms', u * v],
    ['bipartition-minimum-edge-deletions', graphEdges.filter(([a,b]) => left.has(a) === left.has(b)).length],
    ['sharp-convex-chord-upper-bound', convexWitness(2)],
    ['newton-error-halving-at-double-root', newtonSteps],
    ['sample-mean-variance-enumerated-finite-population', fraction(centeredSquareTotal / 4, means.length / 4)],
    ['one-sided-exact-test-boundary-count', threshold],
    ['slow-clock-cross-hour', minutesToClock(9 * 60 + 58 + 7)],
    ['select-safe-estimate-for-stock', roundedBagCount],
    ['latest-whole-minute-before-strict-temperature', aboveThreshold.at(-1)],
    ['half-life-compare-different-counts', fraction((15 * 4) / 20, 40 / 20)],
    ['one-coordinate-residual-correction', possibleCorrections[0]],
    ['differentiability-by-oscillation-bound', 0],
    ['recover-exponent-from-common-base-quotient', sequence(9, -4).find(n => 16 ** n === 4 * 8 ** 2)],
    ['unchanged-mean-replacing-different-sized-groups',
      sequence(24).find(x => ([14, 14, 14, 14, x].reduce((a,b) => a + b, 0) / 5) === 12)],
    ['recover-midpoint-from-agreeing-quadratures', 3 + (9 - 3) * (2 - 0) / (4 - 0)],
    ['binary-strings-separated-ones-by-gaps',
      binaryStrings(7).filter(s => !s.includes('11') && [...s].filter(x => x === '1').length === 3).length],
  ]);
  const inventory = JSON.parse(readFileSync(new URL('./inventory-20261125.json', import.meta.url)));
  const candidates = linkedReasoningV18();
  assert.equal(candidates.length, answer.size);
  for (const {Family, Content, PrimarySkillKey, ProposedTrackCodes} of candidates) {
    const expected = String(answer.get(Family));
    assert.equal(Content.Solution.Result.En, expected, Family);
    assert.deepEqual(Content.Options.filter(o => o.IsCorrect).map(o => o.LatexCode), [expected], Family);
    assert.equal(new Set(Content.Options.map(o => o.LatexCode)).size, 4, Family);
    assert.equal(Content.Hints.length, 2, Family);
    const {StageId, CategoryId, PrimarySkillId} = Content;
    assert.ok(inventory.some(r =>
      r.track === ProposedTrackCodes[0] && r.stage === StageId && r.categoryId === CategoryId
      && r.skills.some(s => s.id === PrimarySkillId && s.key === PrimarySkillKey)
    ), Family);
  }
});
