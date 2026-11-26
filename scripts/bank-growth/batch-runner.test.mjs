import test from 'node:test';import assert from 'node:assert/strict';import {chunkImports,selectReviewed,preview,publish,digest} from './batch-runner.mjs';
const draft=(id,status='Draft',matches=true)=>({Id:id,Revision:1,ContentKey:'g1-amend-'+id,Status:status,MatchesCandidate:matches,PublishedProblemId:status==='Published'?id:null});
const batch={Kind:'amendments',Number:1,MissingMappings:0,Items:[{ProblemId:1},{ProblemId:2},{ProblemId:3},{ProblemId:4}],Drafts:[draft(1),draft(2,'Published'),draft(3,'Draft',false)]};
test('1000 candidates packed into 20 requests within server limits',()=>{const chunks=chunkImports(Array.from({length:1000},(_,i)=>({id:i})));assert.equal(chunks.length,20);assert.ok(chunks.every(x=>x.length===50));assert.equal(chunkImports([{x:'x'.repeat(40)},{x:'x'.repeat(40)}],50,100).length,2);});
test('only exact reviewed candidates are eligible',()=>{const p=selectReviewed(batch);assert.deepEqual(p.ready.map(x=>x.id),[1]);assert.equal(p.published,1);assert.equal(p.held.length,2);assert.equal(selectReviewed({...batch,MissingMappings:1}).ready.length,0);});
test('publication requires approval and matching revision',async()=>{let writes=0;const req=async(method,route)=>{if(route==='/reviewed-bank')return {PublicationEnabled:true,Batches:[{Kind:'amendments',Number:1}]};if(method==='GET')return batch;writes++;return {Status:'Published',PublishedProblemId:1};};const p=await preview(req);await assert.rejects(()=>publish(req,p,{approvedDigest:'bad',note:'Reviewed candidate content',delay:0}));assert.equal(writes,0);assert.equal(await publish(req,p,{approvedDigest:digest(p),note:'Reviewed candidate content',delay:0}),1);assert.equal(writes,1);const stale=async(method)=>method==='GET'?{...batch,Drafts:[{...draft(1),Revision:2},draft(2,'Published'),draft(3,'Draft',false)]}:assert.fail('must not write stale revision');await assert.rejects(()=>publish(stale,p,{approvedDigest:digest(p),note:'Reviewed candidate content',delay:0}));});

import {pressureController} from './batch-runner.mjs';
test('adaptive pacing slows down and stops after sustained or severe latency',()=>{const p=pressureController();assert.equal(p.observe(100).delay,200);assert.equal(p.observe(2200).delay,500);assert.equal(p.observe(2300).delay,1000);assert.equal(p.observe(2400).stopped,true);assert.equal(pressureController().observe(8000).stopped,true);const q=pressureController();q.observe(3000);assert.equal(q.observe(100).delay,400);});
test('confirmed write is journaled before pressure stop; no second write or retry',async()=>{const b={...batch,Items:[{ProblemId:1},{ProblemId:2}],Drafts:[draft(1),draft(2)]};let writes=0;const req=async(method,route)=>{if(route==='/reviewed-bank')return {PublicationEnabled:true,Batches:[{Kind:'amendments',Number:1}]};if(method==='GET')return b;writes++;return {Status:'Published',PublishedProblemId:1};};const p=await preview(req);let ticks=[0,100,100,8500],events=[];await assert.rejects(()=>publish(req,p,{approvedDigest:digest(p),note:'Reviewed candidate content',now:()=>ticks.shift(),sleep:async()=>{},onEvent:e=>events.push(e)}),/Pressure threshold/);assert.equal(writes,1);assert.equal(events.length,1);});
test('no retry on uncertain write outcome',async()=>{let writes=0;const req=async(method,route)=>{if(route==='/reviewed-bank')return {PublicationEnabled:true,Batches:[{Kind:'amendments',Number:1}]};if(method==='GET')return batch;writes++;throw Error('HTTP 503');};const p=await preview(req);await assert.rejects(()=>publish(req,p,{approvedDigest:digest(p),note:'Reviewed candidate content',sleep:async()=>{}}),/503/);assert.equal(writes,1);});

test('staged editorial holds stay excluded from preview and a saved publication plan', async () => {
 const heldKeys = ['g1-grade-gap-reverse-percentage', 'g1-university-depth-circle-linear-objective'];
 const drafts = heldKeys.map((ContentKey, index) => ({...draft(992 + index), ContentKey}));
 const staged = {
  Kind: 'new-existing', Number: 1, MissingMappings: 0,
  Items: heldKeys.map(ContentKey => ({ContentKey})), Drafts: drafts
 };
 const request = async (method, route) => {
  assert.equal(method, 'GET', 'held drafts must not be published');
  return route === '/reviewed-bank'
   ? {PublicationEnabled: true, Batches: [{Kind: staged.Kind, Number: staged.Number}]}
   : staged;
 };
 const plan = await preview(request);
 assert.deepEqual(plan.ready, []);
 assert.deepEqual(plan.held, heldKeys);
 const savedPlan = {
  ...plan,
  ready: [{id: drafts[1].Id, key: heldKeys[1], revision: 1, status: 'Draft', kind: staged.Kind, number: 1}]
 };
 await assert.rejects(
  () => publish(request, savedPlan, {approvedDigest: digest(savedPlan), note: 'Reviewed candidate content', delay: 0}),
  /Plan changed/
 );
});

test('legacy amendment holds use source IDs and preserve published counts', () => {
 const sourceHeld = {...draft(212), Id: 423};
 const otherSource = {...draft(423), Id: 710};
 const alreadyPublished = {...draft(340, 'Published'), Id: 546};
 const report = selectReviewed({
  Kind: 'amendments', Number: 1, MissingMappings: 0,
  Items: [{ProblemId: 212}, {ProblemId: 423}, {ProblemId: 340}],
  Drafts: [sourceHeld, otherSource, alreadyPublished],
 });
 assert.deepEqual(report.held, ['g1-amend-212']);
 assert.deepEqual(report.ready.map(item => item.id), [710]);
 assert.equal(report.published, 1);
});
