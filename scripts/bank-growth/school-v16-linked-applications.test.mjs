import assert from 'node:assert/strict';
import test from 'node:test';
import {linkedApplicationWave} from './school-v16-linked-applications.mjs';

test('V16 linked applications agree with enumerated solutions', () => {
  const coordinates = [0, 1, 2, 3, 4];
  const perimeter = coordinates.flatMap(x => coordinates.filter(y =>
    x === 0 || x === 4 || y === 0 || y === 4));
  const possibleBatches = Array.from({length: 30}, (_, n) => n).filter(n =>
    Array(n).fill(4).reduce((a, b) => a + b, 5) >= 31 && n <= (29 - 2) / 3);
  const expected = {
    'signed-work-opposing-force-component': Array(3).fill(-6).concat(Array(4).fill(2))
      .reduce((a, b) => a + b),
    'multiply-hollow-display-layers': Array(6).fill(perimeter).flat().length,
    'intersect-integer-production-bounds': possibleBatches.length,
  };
  for (const row of linkedApplicationWave()) {
    assert.equal(Number(row.Content.Options.find(o => o.IsCorrect).LatexCode), expected[row.Family]);
  }
});
