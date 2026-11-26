import {createHash} from 'node:crypto';
import {readFileSync} from 'node:fs';

export function chunkImports(items,limit=50,maxBytes=1800000){
 if(!Array.isArray(items)||!Number.isInteger(limit)||limit<1||limit>50||!Number.isSafeInteger(maxBytes)||maxBytes<1)throw Error('Invalid import limit');
 const chunks=[];let current=[];
 const overhead=Buffer.byteLength(JSON.stringify({Items:[],Confirm:false}),'utf8');let bytes=overhead;
 for(const item of items){
  const encoded=JSON.stringify(item);if(encoded===undefined)throw Error('Invalid candidate');
  const n=Buffer.byteLength(encoded,'utf8');
  if(overhead+n>maxBytes)throw Error('Candidate too large');
  if(current.length===limit||bytes+n+1>maxBytes){if(current.length)chunks.push(current);current=[];bytes=overhead;}
  bytes+=n+(current.length?1:0);current.push(item);
 }
 if(current.length)chunks.push(current);return chunks;
}
// Latency is a conservative pressure proxy, not a direct database I/O measurement.
// Stop on any failed request; never retry a mutation whose outcome is unknown.
export function pressureController({floor=200,ceiling=5000,slowMs=2000,criticalMs=8000,maxSlow=3}={}){
 if(![floor,ceiling,slowMs,criticalMs,maxSlow].every(Number.isSafeInteger)||floor<0||ceiling<floor||slowMs<1||criticalMs<=slowMs||maxSlow<1)throw Error('Invalid pacing settings');
 let delay=floor,slow=0,stopped=false;
 return {observe(ms){
  if(!Number.isFinite(ms)||ms<0)throw Error('Invalid latency');
  if(ms>=slowMs){slow++;delay=Math.min(ceiling,Math.max(floor,delay*2,500));}
  else{slow=0;delay=Math.max(floor,Math.floor(delay*.8));}
  stopped=stopped||ms>=criticalMs||slow>=maxSlow;
  return {delay,stopped,slow};
 }};
}
const kinds=['amendments','new-existing','new-missing'];
const heldDraftKeys = new Set(
 ['school-launch-draft-holds.json', 'reviewed-staged-holds.json'].flatMap(file =>
  Object.keys(JSON.parse(readFileSync(new URL(file, import.meta.url), 'utf8')))
 )
);

export function selectReviewed(batch){
 if(!kinds.includes(batch.Kind)||!Array.isArray(batch.Items)||!Array.isArray(batch.Drafts)||!Number.isInteger(batch.MissingMappings))throw Error('Invalid catalog response');
 const keys=new Set(batch.Items.map(x=>batch.Kind==='amendments'?'g1-amend-'+x.ProblemId:x.ContentKey));
 const seen=new Set(),ready=[],held=[];let published=0;
 for(const d of batch.Drafts){
  if(!keys.has(d.ContentKey)||seen.has(d.ContentKey))throw Error('Unexpected draft identity');seen.add(d.ContentKey);
  if(d.Status==='Published'){published++;continue;}
  if(heldDraftKeys.has(d.ContentKey)||batch.MissingMappings!==0||d.MatchesCandidate!==true||!['Draft','PendingReview','Approved','NeedsChanges'].includes(d.Status)||d.PublishedProblemId!=null){held.push(d.ContentKey);continue;}
  if(!Number.isSafeInteger(d.Id)||d.Id<=0||!Number.isSafeInteger(d.Revision)||d.Revision<0)throw Error('Invalid draft revision');
  ready.push({id:d.Id,key:d.ContentKey,revision:d.Revision,status:d.Status,kind:batch.Kind,number:batch.Number});
 }
 for(const key of keys)if(!seen.has(key))held.push(key);
 return {ready,held,published};
}
export const digest=plan=>createHash('sha256').update(JSON.stringify(plan)).digest('hex');
export async function preview(request){
 const catalog=await request('GET','/reviewed-bank');
 if(!Array.isArray(catalog.Batches))throw Error('Invalid catalog');
 const plan={enabled:catalog.PublicationEnabled===true,ready:[],held:[],published:0,heldCatalogCount:catalog.HeldCount};
 const ids=new Set();
 for(const b of catalog.Batches){
  if(!kinds.includes(b.Kind))continue;
  if(!Number.isSafeInteger(b.Number)||b.Number<1)throw Error('Invalid batch');
  const data=await request('GET','/reviewed-bank/'+b.Kind+'/'+b.Number);
  if(data.Kind!==b.Kind||data.Number!==b.Number)throw Error('Wrong batch');
  const selected=selectReviewed(data);
  for(const r of selected.ready){if(ids.has(r.id))throw Error('Duplicate draft');ids.add(r.id);plan.ready.push(r);}
  plan.held.push(...selected.held);plan.published+=selected.published;
 }
 return plan;
}
export async function publish(request,plan,{approvedDigest,note,max=500,delay=200,onEvent=()=>{},now=()=>performance.now(),sleep=ms=>new Promise(resolve=>setTimeout(resolve,ms)),onPressure=()=>{}}={}){
 if(!plan.enabled||digest(plan)!==approvedDigest||typeof note!=='string'||note.trim().length<10||note.length>2000||!Number.isSafeInteger(max)||max<1||max>1000)throw Error('Explicit reviewed plan, note and bounded maximum required');
 let group,count=0;const ids=new Set();const pace=pressureController({floor:delay,ceiling:Math.max(5000,delay)});
 const waitForPressure=async ms=>{const state=pace.observe(ms);onPressure(state);if(state.stopped)throw Error('Pressure threshold reached; stop and refresh preview before continuing');if(state.delay>0)await sleep(state.delay);};
 for(const r of plan.ready.slice(0,max)){
  if(ids.has(r.id))throw Error('Duplicate draft');ids.add(r.id);
  const key=r.kind+'/'+r.number;
  if(group!==key){const began=now();const latest=await request('GET','/reviewed-bank/'+key);if(latest.Kind!==r.kind||latest.Number!==r.number)throw Error('Wrong batch');const state=selectReviewed(latest);for(const x of plan.ready.filter(x=>x.kind===r.kind&&x.number===r.number))if(!state.ready.some(y=>y.id===x.id&&y.key===x.key&&y.revision===x.revision&&y.status===x.status))throw Error('Plan changed: refresh preview');group=key;await waitForPressure(now()-began);}
  const draftRoute='/'+r.id;
  const began=now();
  const result=await request('POST',draftRoute+'/publish',{Revision:r.revision,Note:note.trim(),Confirm:true,DirectApproval:r.status!=='Approved'});
  if(result?.Status!=='Published'||result.Id!==r.id||!Number.isSafeInteger(result.Revision)||result.Revision<=r.revision
     ||!Number.isSafeInteger(result.PublishedProblemId)||result.PublishedProblemId<=0){
   throw Error('Publication not confirmed: refresh preview');
  }
  await waitForPressure(now()-began);
  const verificationBegan=now();
  const verified=await request('GET',draftRoute);
  if(verified?.Status!=='Published'||verified.Id!==r.id||verified.Revision!==result.Revision
     ||verified.PublishedProblemId!==result.PublishedProblemId){
   throw Error('Published draft verification failed: refresh preview');
  }
  onEvent({key:r.key,id:r.id,publishedProblemId:verified.PublishedProblemId});count++;
  await waitForPressure(now()-verificationBegan);
 }
 return count;
}
