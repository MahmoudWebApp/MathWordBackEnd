import assert from 'node:assert/strict';
import test from 'node:test';
import {v17DWave} from './v17-university.mjs';

test('V17 university answers satisfy independent constructions', () => {
  const readings = [2, 5, 4, 1, 6];
  const roots = readings.slice(1).map((value, i) =>
    i + (3 - readings[i]) / (value - readings[i]));
  const crossings = roots.filter((root, i) => root > i && root < i + 1).length;

  const partial = n => Array.from({length: n}, (_, i) => (-1) ** i / (i + 1))
    .reduce((a, b) => a + b, 0);

  const firstZero = Math.PI / 6;
  const oscillation = t => 2 * Math.cos(3 * t);
  const epsilon = 1e-5;
  const speed = Math.round(Math.abs((oscillation(firstZero + epsilon)
    - oscillation(firstZero - epsilon)) / (2 * epsilon)));

  const vertices = [0, 1, 2, 3, 4];
  const edges = vertices.flatMap(x => vertices.filter(y => y > x).map(y => [x, y]));
  const deletions = Math.min(...Array.from({length: 32}, (_, colors) =>
    edges.filter(([x, y]) => ((colors >> x) & 1) === ((colors >> y) & 1)).length));

  const matrix = [[1, 0, 1], [1, 1, 0], [0, 1, 1]];
  const [a, b, c] = matrix;
  const determinant = a[0] * (b[1] * c[2] - b[2] * c[1])
    - a[1] * (b[0] * c[2] - b[2] * c[0]) + a[2] * (b[0] * c[1] - b[1] * c[0]);
  assert.notEqual(determinant, 0);

  const points = Array.from({length: 401}, (_, i) => (i - 200) / 20);
  const f = x => x ** 4 - 4 * x ** 3;
  const minimizer = points.reduce((x, y) => f(x) < f(y) ? x : y);
  const errors = [3.5, 4.5].flatMap(u => [5.5, 6.5].map(v => Math.abs(u * v - 24)));
  const atLeastAsFar = Array.from({length: 64}, (_, x) =>
    x.toString(2).replaceAll('0', '').length).filter(k => Math.abs(k - 3) >= 3).length;

  const rows = new Map(v17DWave().map(row => [row.Family, row.Content.Options.find(option => option.IsCorrect).LatexCode]));
  const numericAnswers = {
    'minimum-level-crossings-from-table': crossings,
    'harmonic-oscillator-speed-at-center': speed,
    'minimum-bipartite-edge-repair': deletions,
    'basis-from-pairwise-sums': matrix.length,
    'flat-stationary-point-global-minimum': minimizer,
    'asymmetric-product-error-bound': Math.max(...errors),
  };
  for (const [family, result] of Object.entries(numericAnswers)) {
    assert.equal(Number(rows.get(family)), result, family);
  }

  const bounds = [...rows.get('signed-alternating-tail-interval').matchAll(/\\frac\{(\d+)\}\{(\d+)\}/g)]
    .map(([, numerator, denominator]) => Number(numerator) / Number(denominator));
  assert.equal(bounds.length, 2);
  assert.ok(Math.abs(bounds[0] - partial(4)) < 1e-12);
  assert.ok(Math.abs(bounds[1] - partial(5)) < 1e-12);

  const [, numerator, denominator] = rows.get('two-sided-exact-test-all-same-outcome')
    .match(/^\\frac\{(\d+)\}\{(\d+)\}$/);
  assert.equal(Number(numerator) / Number(denominator), atLeastAsFar / 64);
  assert.equal(rows.size, 8);
});
