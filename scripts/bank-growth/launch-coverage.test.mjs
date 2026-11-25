import test from 'node:test';
import assert from 'node:assert/strict';
import {launchCoverage} from './launch-coverage.mjs';
const row=(id,questions)=>({track:'grade-1',stage:1,categoryId:id,questions,skills:[]});
test('prefer five nearest populated categories, not every linked category',()=>{
 const result=launchCoverage([row(1,25),row(2,19),row(3,17),row(4,20),row(5,18),row(6,1)]);
 assert.deepEqual(result.tracks[0].priority.map(x=>x.categoryId),[1,4,2,5,3]);
 assert.equal(result.totalMinimumAdditionalAssignments,6);
 assert.equal(result.tracks[0].remainingLinkedCategories[0].categoryId,6);
});
test('missing links are counted, never invented',()=>{
 const result=launchCoverage([row(1,20),row(2,10)]);
 assert.equal(result.missingCategorySlots,3);
 assert.equal(result.totalMinimumAdditionalAssignments,70);
 assert.equal(result.readyTracks,0);
});
test('empty track is preserved; duplicates fail closed',()=>{
 assert.equal(launchCoverage([row(null,0)]).totalMinimumAdditionalAssignments,100);
 assert.throws(()=>launchCoverage([row(1,2),row(1,2)]),/duplicate/);
});
