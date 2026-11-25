import test from 'node:test';
import assert from 'node:assert/strict';
import {launchCoverage,selectLaunchCandidates} from './launch-coverage.mjs';
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

test('launch preview respects exact slot capacity and linked skills',()=>{
 const inventory=[row(1,19),row(2,18),row(3,17),row(4,16),row(5,15),row(6,1)].map(r=>({...r,skills:[{id:1,key:'skill'}]}));
 const candidate=(key,id,skill=1)=>({ContentKey:key,PrimarySkillKey:'skill',ProposedTrackCodes:['grade-1'],Content:{StageId:1,CategoryId:id,PrimarySkillId:skill}});
 const result=selectLaunchCandidates([candidate('a',1),candidate('b',1),candidate('c',6),candidate('d',2,9),candidate('e',2),candidate('f',99)],inventory);
 assert.deepEqual(result.selected.map(r=>r.ContentKey),['a','e']);
 assert.deepEqual(result.held.map(r=>[r.key,r.reason]),[['b','CategoryTargetReached'],['c','DeferredUntilLaunchCoverage'],['d','UnlinkedSkill'],['f','UnlinkedTrackCategory']]);
});
