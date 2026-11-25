import assert from 'node:assert/strict';
import test from 'node:test';
import {upperWave} from './school-v15-upper.mjs';

test('upper school transfer answers agree with direct constructions', () => {
  const integers = Array.from({length: 41}, (_, i) => i - 20);
  const mean = values => values.reduce((sum, x) => sum + x, 0) / values.length;
  const variance = values => {
    const center = mean(values);
    return mean(values.map(x => (x - center) ** 2));
  };
  // For a tangent with unit slope, use f'(x)=2x-3=1.
  const xContact = (1 + 3) / 2;
  const heights = integers.filter(y => Math.hypot(4, y - 2) === Math.abs(y + 2));
  assert.equal(heights.length, 1);

  let displays = 0;
  for (let i = 1; i <= 7; i++) {
    for (let j = i + 2; j <= 7; j++) {
      for (let k = j + 2; k <= 7; k++) displays++;
    }
  }
  const group1 = [7, 9, 11, 13];
  const group2 = [11, 13, 15, 17];
  assert.equal(variance(group1), 5);
  assert.equal(variance(group2), 5);
  const terms = [];
  for (let n = 1; n <= 10; n++) {
    const previousTotal = terms.reduce((total, value) => total + value, 0);
    terms.push(2 * n * n + n - previousTotal);
  }
  const litresPerHour = [2, 5, 1];
  const measured = Array.from({length: 7}, (_, i) => litresPerHour[(i + 3) % 3]);
  let distanceLeft = 96;
  let moveLength = 48;
  let moves = 0;
  while (distanceLeft >= 4) {
    distanceLeft -= moveLength;
    moveLength /= 2;
    moves++;
  }
  const answers = {
    'line-height-for-single-parabola-contact': xContact ** 2 - 3 * xContact + 5 - xContact,
    'equal-point-and-line-distance': heights[0],
    'choose-nonadjacent-display-spaces': displays,
    'pool-variance-with-separated-group-means': variance([...group1, ...group2]),
    'recover-individual-term-from-partial-sums': terms.at(-1),
    'integrate-periods-and-a-shifted-remainder': measured.reduce((sum, x) => sum + x, 0),
    'squared-trig-difference-from-sum': ((3 - 4) / 5) ** 2,
    'least-terms-for-geometric-tail-tolerance': moves,
  };
  const rows = upperWave();
  assert.deepEqual(rows.map(row => row.Family).sort(), Object.keys(answers).sort());
  for (const row of rows) {
    const correct = row.Content.Options.filter(option => option.IsCorrect);
    assert.equal(correct.length, 1);
    assert.ok(Math.abs(Number(correct[0].LatexCode) - answers[row.Family]) < 1e-10, row.Family);
  }
});
