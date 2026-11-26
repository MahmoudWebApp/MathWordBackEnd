import test from 'node:test';import assert from 'node:assert/strict';import {generate,wave2,validate,plan,selectCandidates} from './pipeline.mjs';test('pilot deterministic and bounded',()=>{const r=generate();assert.equal(r.length,30);assert.deepEqual(r,generate());assert.deepEqual(validate(r),[]);assert.equal(new Set(r.map(x=>x.Family)).size,10);});test('detect corrupt answer and duplicates',()=>{let r=generate();r[0].Content.Options.find(x=>x.IsCorrect).LatexCode='999';assert.ok(validate(r).length);r=generate();assert.ok(validate([...r,r[0]]).length);assert.ok(validate(r,[r[0].Content.Question]).length);});test('oversupply cannot hide shortage',()=>{assert.equal(plan([{track:'x',stage:1,categoryId:1,questions:200},{track:'x',stage:1,categoryId:2,questions:3}])[0].additionalAssignments,401);assert.equal(plan([{track:'y',stage:1,categoryId:null,questions:0}])[0].additionalAssignments,505);});

import {independentlySolve} from './independent-solver.mjs';
import {readFileSync} from 'node:fs';
test('independent solver checks the actual bilingual candidate catalog English questions',()=>{const rows=generate();const saved=JSON.parse(readFileSync(new URL('../../content/editorial/growth-pilot-v1.json',import.meta.url),'utf8')).Items;assert.deepEqual(rows,saved);for(const row of rows)assert.equal(String(independentlySolve(row)),row.Check.expected,row.ContentKey);const altered=structuredClone(rows[0]);altered.Content.Question.En=altered.Content.Question.En.replace('18','19');assert.notEqual(String(independentlySolve(altered)),altered.Check.expected);});

test('all school grades covered by pilot and second wave',()=>{const rows=[...generate(),...wave2()];assert.equal(rows.length,72);assert.equal(new Set(rows.map(x=>x.ProposedTrackCodes[0])).size,12);assert.equal(new Set(rows.map(x=>x.Family)).size,31);assert.deepEqual(validate(rows),[]);assert.deepEqual(wave2(),wave2());});

test('taxonomy and target gating',()=>{const rows=generate();const r=rows[0];const c=r.Content;const catalog=[{track:r.ProposedTrackCodes[0],stage:c.StageId,categoryId:c.CategoryId,questions:100,skills:[{id:c.PrimarySkillId,key:r.PrimarySkillKey}]}];const result=selectCandidates(rows,catalog);assert.equal(result.selected.length,1);assert.ok(result.held.some(x=>x.reason==='CategoryTargetReached'));assert.ok(result.held.some(x=>x.reason==='UnlinkedTrackCategory'));assert.equal(selectCandidates(rows,[{...catalog[0],skills:[]}]).selected.length,0);});

import {universityWave,solveUniversity} from './university-wave.mjs';
test('university wave covers seven existing courses',()=>{const r=universityWave();assert.equal(r.length,45);assert.equal(new Set(r.map(x=>x.ProposedTrackCodes[0])).size,7);assert.equal(new Set(r.map(x=>x.Family)).size,15);assert.deepEqual(validate([...generate(),...wave2(),...r]),[]);for(const row of r)assert.equal(String(solveUniversity(row)),row.Check.expected,row.ContentKey);const inventory=JSON.parse(readFileSync(new URL('./inventory-20261125.json',import.meta.url),'utf8'));assert.equal(selectCandidates(r,inventory).selected.length,45);assert.deepEqual(r,universityWave());});

import {depthWave} from './depth-wave.mjs';
test('depth wave adds 69 bounded candidates on linked skills',()=>{const r=depthWave();assert.equal(r.length,69);assert.deepEqual(r,depthWave());assert.deepEqual(validate([...generate(),...wave2(),...universityWave(),...r]),[]);const inv=JSON.parse(readFileSync(new URL('./inventory-20261125.json',import.meta.url),'utf8'));assert.equal(selectCandidates(r,inv).selected.length,r.length);});

import {coverageWave} from './coverage-wave.mjs';
function solveDepth(row){
 const [a,b,c,d,e]=row.Check.operands;
 switch(row.Family){
 case "count-forward-steps":return Array.from({length:b},(_,i)=>a+i+1).at(-1);
 case "join-two-collections":return a+b;
 case "hundreds-expanded-value":return Number(`${a}${b}${c}`);
 case "array-row-total":return Array(a).fill(b).reduce((s,x)=>s+x,0);
 case "capacity-remainder":return a*1000-b;
 case "equivalent-numerator":return a/b*(b*c);
 case "third-triangle-angle":return 180-(a+b);
 case "median-unsorted-five":return [a,b,c,d,e].sort((x,y)=>x-y)[2];
 case "decimal-hundredths":return c;
 case "triangle-area-direct":return a*b/2;
 case "recurring-events-lcm":{let x=a;while(x%b!==0)x+=a;return x;}
 case "unit-price":return b/a;
 case "same-base-quotient-exponent":return Math.log2(2**a/2**b);
 case "increase-final-quantity":return a*(100+b)/100;
 case "quadratic-negative-input":return a*d**2+b*d+c;
 case "similar-scale-side":return b*c;
 case "arithmetic-sequence-index":{const term=a+(c-1)*b;let n=1;for(let x=a;x<term;x+=b)n++;return n;}
 case "committee-pair-unordered":{let n=0;for(let i=0;i<a;i++)for(let j=i+1;j<a;j++)n++;return n;}
 case "circle-radius-from-equation":return Math.sqrt(c*c);
 case "constant-rectangle-integral":return a*b*c;
 case "orthogonal-missing-component":return -(a*c)/b;
 case "bisection-first-midpoint":return a+(b-a)/2;
 case "cartesian-product-size":return a*b;
 default:throw Error("unknown family "+row.Family);
 }
}
test('depth wave independently checks operand calculations and saved manifest',()=>{const rows=depthWave();const saved=JSON.parse(readFileSync(new URL('../../content/editorial/growth-depth-v4.json',import.meta.url),'utf8')).Items;assert.deepEqual(rows,saved);for(const row of rows)assert.equal(String(solveDepth(row)),row.Check.expected,row.ContentKey);});
test('coverage wave adds 57 bounded candidates on existing skills',()=>{const rows=coverageWave();assert.equal(rows.length,57);assert.equal(new Set(rows.map(r=>r.Family)).size,19);assert.equal(new Set(rows.map(r=>r.ProposedTrackCodes[0])).size,19);assert.deepEqual(rows,coverageWave());assert.deepEqual(rows.map(r=>Number(r.Check.expected)),[8,11,15,11,17,21,29,28,44,300,700,900,19,13,19,48,72,96,-4,-6,-8,36,120,105,15,28,48,7,9,12,-5,-7,-9,120,144,224,62,60,73,3,4,5,11,13,16,4,6,7,7,11,13,6,7,8,12,20,30]);assert.deepEqual(validate([...generate(),...wave2(),...universityWave(),...depthWave(),...rows]),[]);const inv=JSON.parse(readFileSync(new URL('./inventory-20261125.json',import.meta.url),'utf8'));assert.equal(selectCandidates([...generate(),...wave2(),...universityWave(),...depthWave(),...rows],inv).selected.length,243);});

import {authorQueue} from './author-queue.mjs';
test('large authoring queue reserves existing candidates and never invents category links',()=>{const inv=JSON.parse(readFileSync(new URL('./inventory-20261125.json',import.meta.url),'utf8'));const rows=[...generate(),...wave2(),...universityWave(),...depthWave(),...coverageWave()];const q=authorQueue(inv,rows);assert.equal(q.plannedFamilies,200);assert.equal(q.plannedCandidates,600);assert.equal(q.remainingLinkedAssignments,6509);assert.equal(q.missingCategories.reduce((n,x)=>n+x.missing,0),33);assert.deepEqual(q,authorQueue(inv,rows));for(const j of q.jobs){assert.ok(inv.some(s=>s.track===j.track&&s.categoryId===j.categoryId&&s.skills.some(k=>k.id===j.skillId&&k.key===j.skillKey)));assert.ok(j.variants<=3);}});
