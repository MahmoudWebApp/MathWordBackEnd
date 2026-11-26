import {readFileSync,writeFileSync} from 'node:fs';
import {pathToFileURL} from 'node:url';
import {selectCandidates} from './pipeline.mjs';

export function launchCoverage(rows,minimum=20,minCategories=5){
 if(!Array.isArray(rows)||!Number.isSafeInteger(minimum)||minimum<1||!Number.isSafeInteger(minCategories)||minCategories<1)throw Error('Invalid coverage target or inventory');
 const tracks=new Map();
 for(const row of rows){
  if(typeof row.track!=='string'||!row.track)throw Error('Missing track');
  if(!tracks.has(row.track))tracks.set(row.track,{track:row.track,stage:row.stage,categories:new Map()});
  const t=tracks.get(row.track);
  if(t.stage!==row.stage)throw Error('Conflicting stages');
  if(row.categoryId===null)continue;
  const id=Number(row.categoryId),questions=Number(row.questions);
  if(!Number.isSafeInteger(id)||id<1||!Number.isSafeInteger(questions)||questions<0||t.categories.has(id))throw Error('Invalid or duplicate category inventory');
  t.categories.set(id,{...row,categoryId:id,questions,deficit:Math.max(0,minimum-questions)});
 }
 const coverage=[...tracks.values()].map(t=>{
  const ranked=[...t.categories.values()].sort((a,b)=>a.deficit-b.deficit||b.questions-a.questions||a.categoryId-b.categoryId);
  const priority=ranked.slice(0,minCategories);
  const missingCategorySlots=Math.max(0,minCategories-priority.length);
  return {track:t.track,stage:t.stage,priority,remainingLinkedCategories:ranked.slice(minCategories),missingCategorySlots,existingSlotDeficit:priority.reduce((n,c)=>n+c.deficit,0),minimumAdditionalAssignments:priority.reduce((n,c)=>n+c.deficit,0)+missingCategorySlots*minimum,ready:missingCategorySlots===0&&priority.every(c=>c.deficit===0)};
 });
 return {minimum,minCategories,scope:'PlanningOnly',tracks:coverage,totalMinimumAdditionalAssignments:coverage.reduce((n,t)=>n+t.minimumAdditionalAssignments,0),missingCategorySlots:coverage.reduce((n,t)=>n+t.missingCategorySlots,0),readyTracks:coverage.filter(t=>t.ready).length};
}
// Only prepare candidates for the existing priority slots. A missing link
// remains a curriculum decision; the long-term preparation path is unchanged.
export function selectLaunchCandidates(rows,inventory,minimum=20,minCategories=5){
 const coverage=launchCoverage(inventory,minimum,minCategories);
 const slots=coverage.tracks.flatMap(t=>t.priority);
 const selected=selectCandidates(rows,slots,minimum,{uniqueFamilies:true});
 const priority=new Map(slots.map(s=>[s.track+':'+s.categoryId,s.deficit]));
 const linked=new Set(inventory.filter(s=>s.categoryId!==null).map(s=>s.track+':'+s.categoryId));
 const key=r=>r.ProposedTrackCodes[0]+':'+r.Content.CategoryId;
 const byKey=new Map(rows.map(r=>[r.ContentKey,r]));
 return {
  selected:selected.selected.sort((a,b)=>priority.get(key(a))-priority.get(key(b))),
  held:selected.held.map(h=>h.reason==='UnlinkedTrackCategory'&&linked.has(key(byKey.get(h.key)))?{...h,reason:'DeferredUntilLaunchCoverage'}:h),
 };
}
if(process.argv[1]&&import.meta.url===pathToFileURL(process.argv[1]).href){
 const [input,output]=process.argv.slice(2);
 if(!input||!output)throw Error('Usage: node launch-coverage.mjs INVENTORY OUTPUT');
 writeFileSync(output,JSON.stringify(launchCoverage(JSON.parse(readFileSync(input,'utf8'))),null,2)+'\n',{flag:'wx'});
}
