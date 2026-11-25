import assert from 'node:assert/strict';
import {test} from 'node:test';
import {dWave} from './v16-university.mjs';

test('V16 university answers agree with independent calculations', () => {
  const integrate = (rule, from, to, terms) => {
    const width = (to - from) / terms;
    return width * Array.from({length: terms}, (_, i) => rule(from + (i + 0.5) * width))
      .reduce((sum, value) => sum + value, 0);
  };
  const bestCostInput = Array.from({length: 241}, (_, i) => (i - 120) / 20)
    .reduce((best, x) => Math.max(9 - x, 2 * x) < Math.max(9 - best, 2 * best) ? x : best);
  const values = [0, 1];
  const triples = values.flatMap(x => values.flatMap(y => values.map(z => [x, y, z])));
  const pairCount = (a, b) => (b - a) * (b - a - 1) / 2;
  const rows = Object.fromEntries(dWave().map(row => [row.Family,
    row.Content.Options.find(option => option.IsCorrect).LatexCode]));
  assert.equal(Object.keys(rows).length, 8);
  assert.ok(Math.abs(integrate(x => x ** 2 / 2, 0, 3, 1_000) - 4.5) < 0.00001);
  assert.equal(rows['double-integral-reversed-triangle'], '\\frac{9}{2}');
  const next = (2 + 1) * Math.exp(-1);
  assert.equal(rows['integrating-factor-initial-condition'], String(Math.round(next / Math.exp(-1))));
  assert.equal(rows['pairs-disconnected-after-bridge'], String(pairCount(0, 8) - pairCount(0, 3) - pairCount(3, 8)));
  const matrixA = [[1, 0, 0, 0, 0], [0, 0, 0, 0, 0]];
  const matrixB = [[-3, 0], [2, 1], [0, 0], [0, 0], [0, 0]];
  const trace = matrixB.reduce((sum, row, i) => sum + row[0] * matrixA[0][i] + row[1] * matrixA[1][i] + 2, 0);
  assert.equal(rows['trace-rectangular-factor-swap'], String(trace));
  assert.equal(rows['balance-affine-worst-cost'], String(bestCostInput));
  const m = Array.from({length: 9}, (_, i) => i).find(h =>
    integrate(x => x < 1 ? 2 + (h - 2) * x : h + (6 - h) * (x - 1) / 3, 0, 4, 400) - 18 < 1e-9 && h >= 4);
  assert.equal(rows['recover-sample-from-uneven-trapezoids'], String(m));
  const passes = triples.filter(([x, y, z]) => x + y > 0 && y + z > 0).length;
  assert.equal(rows['joint-threshold-two-sample-means'], `\\frac{${passes}}{${triples.length}}`);
  const rejects = [5, 18, 30, 120].filter(p => p * 4 <= 80).length;
  assert.equal(rows['count-rejections-after-bonferroni'], String(rejects));
});
