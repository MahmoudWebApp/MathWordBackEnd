export function authorQueue(inventory,candidates,maxFamilies=200){
 if(!Number.isInteger(maxFamilies)||maxFamilies<1||maxFamilies>1000)throw Error("Invalid family limit");
 const slots=new Map(),tracks=new Map(),families=new Set(),keys=new Set();
 for(const r of inventory){
  if(!tracks.has(r.track))tracks.set(r.track,0);
  if(r.categoryId===null)continue;
  const key=r.track+":"+r.categoryId,n=Number(r.questions);
  if(slots.has(key)||!Number.isSafeInteger(n)||n<0||!Array.isArray(r.skills))throw Error("Invalid inventory");
  tracks.set(r.track,tracks.get(r.track)+1);
  slots.set(key,{track:r.track,stage:r.stage,categoryId:r.categoryId,remaining:Math.max(0,101-n),skills:r.skills.map(s=>({...s,families:0,queued:0}))});
 }
 for(const row of candidates){
  if(keys.has(row.ContentKey))throw Error("Duplicate candidate key");keys.add(row.ContentKey);
  const c=row.Content,s=slots.get(row.ProposedTrackCodes[0]+":"+c.CategoryId),k=s?.skills.find(x=>x.id===c.PrimarySkillId&&x.key===row.PrimarySkillKey);
  if(!k||s.stage!==c.StageId)continue;
  s.remaining=Math.max(0,s.remaining-1);
  const f=s.track+":"+s.categoryId+":"+row.Family;if(!families.has(f)){families.add(f);k.families++;}
 }
 const jobs=[],blocked=[...slots.values()].filter(s=>s.remaining&&!s.skills.length).map(s=>({track:s.track,categoryId:s.categoryId,remaining:s.remaining}));
 while(jobs.length<maxFamilies){
  const s=[...slots.values()].filter(x=>x.remaining&&x.skills.length).sort((a,b)=>b.remaining-a.remaining||a.track.localeCompare(b.track)||a.categoryId-b.categoryId)[0];if(!s)break;
  const k=[...s.skills].sort((a,b)=>a.families+a.queued-b.families-b.queued||a.id-b.id)[0],variants=Math.min(3,s.remaining);
  s.remaining-=variants;k.queued++;
  jobs.push({job:jobs.length+1,track:s.track,stage:s.stage,categoryId:s.categoryId,skillId:k.id,skillKey:k.key,variants,requirement:"New reasoning family, Arabic and English, four unique choices, two progressive hints, law, worked solution, verification, misconceptions; no repeated family."});
 }
 return {plannedFamilies:jobs.length,plannedCandidates:jobs.reduce((n,j)=>n+j.variants,0),jobs,blocked,missingCategories:[...tracks].filter(([,n])=>n<5).map(([track,n])=>({track,missing:5-n})),remainingLinkedAssignments:[...slots.values()].reduce((n,s)=>n+s.remaining,0),status:"Authoring plan only; no new questions or production writes."};
}
