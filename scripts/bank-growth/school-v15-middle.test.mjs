import assert from 'node:assert/strict';
import test from 'node:test';
import {middleWave} from './school-v15-middle.mjs';

test('middle school V15 answers from enumeration and conservation', () => {
  const integers = Array.from({length: 51}, (_, n) => n);
  const positions = new Set();
  for (let p = 0; !positions.has(p); p = (p + 6) % 18) positions.add(p);

  const die = [1, 2, 3, 4, 5, 6];
  const eligible = die.flatMap(r => die.map(b => [r, b])).filter(pair => Math.max(...pair) === 3);
  const medians = [];
  for (let fifth = 10; fifth <= 19; fifth++) {
    for (let sixth = 20; sixth <= 29; sixth++) {
      medians.push((fifth + sixth) / 2);
    }
  }
  const answers = {
    'wheel-visit-cycle': positions.size,
    'strict-fare-crossover': integers.find(n => 18 + 2 * n < 5 * n),
    'subtract-nested-running-counts': integers.filter(rank => rank > 11 && rank <= 29).length,
    'reprinted-map-scale-denominator': [10000, 40000, 60000, 90000]
      .find(n => n * 6 === 4 * 60000),
    'restricted-dice-maximum': 100 * eligible.filter(([r, b]) => r === b).length / eligible.length,
    'equivalent-area-single-pond': integers.find(r => r * r - 8 ** 2 === 6 ** 2),
    'minimum-median-grouped-integers': Math.min(...medians),
    'opposite-input-readings-linear-term': integers.find(b =>
      [-3, 1, 4].every(a => {
        const f = x => a * x ** 2 + b * x + 7;
        return f(3) === f(-3) + 24;
      })),
  };
  const rows = middleWave();
  assert.deepEqual(rows.map(r => r.Family).sort(), Object.keys(answers).sort());
  for (const row of rows) {
    const options = row.Content.Options;
    assert.equal(new Set(options.map(o => o.LatexCode)).size, 4);
    assert.deepEqual(options.filter(o => o.IsCorrect).map(o => Number(o.LatexCode)), [answers[row.Family]], row.Family);
  }
});
