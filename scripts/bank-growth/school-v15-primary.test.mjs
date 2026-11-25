import assert from 'node:assert/strict';
import test from 'node:test';
import {primaryWave} from './school-v15-primary.mjs';

test('grades 4–6 V15 answers independently reconstructed', () => {
  const numbers = Array.from({length: 51}, (_, i) => i);
  const piles = [3, 6, 10, 13];
  let moves = 0;
  while (Math.min(...piles) !== Math.max(...piles)) {
    piles[piles.indexOf(Math.min(...piles))]++;
    piles[piles.indexOf(Math.max(...piles))]--;
    moves++;
  }
  const hidden = numbers.filter(n => n <= 20);
  const medians = hidden.flatMap(a => hidden.map(b =>
    [4, 9, 15, a, b].sort((x, y) => x - y)[2]));
  const perBlock = numbers.find(v => 350 + 3 * v === 470);
  const validIntersections = numbers.filter(n => n <= 22 && n <= 28 &&
    40 - ((28 - n) + (22 - n) + n) >= 0);
  const answers = {
    'wait-for-both-tasks': numbers.find(t => t - 7 >= 18 && t - 7 >= 25),
    'pay-for-complete-promotional-groups': numbers.filter(i => i >= 1 && i <= 11 && i % 3 !== 0).length * 4,
    'coincident-fraction-marks': numbers.filter(i => i > 0 && i < 12 && (i % 2 === 0 || i % 3 === 0)).length,
    'fewest-transfers-to-level-piles': moves,
    'largest-median-hidden-scores': Math.max(...medians),
    'capacity-displaced-by-submerged-blocks': 1000 - (350 + 5 * perBlock),
    'oblique-triangle-rectangle-complement': Math.abs(3 * 2 - 6 * 8) / 2,
    'minimum-overlap-of-percentage-groups': Math.min(...validIntersections),
  };
  assert.deepEqual(primaryWave().map(row => row.Family).sort(), Object.keys(answers).sort());
  for (const row of primaryWave()) {
    const options = row.Content.Options;
    assert.equal(new Set(options.map(o => o.LatexCode)).size, 4, row.Family);
    assert.deepEqual(options.filter(o => o.IsCorrect).map(o => o.LatexCode),
      [String(answers[row.Family])], row.Family);
  }
});
