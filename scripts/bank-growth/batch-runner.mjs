import {createHash} from 'node:crypto';

export function chunkImports(items,limit=50,maxBytes=1800000){
 if(!Array.isArray(items)||!Number.isInteger(limit)||limit<1||limit>50)throw Error('Invalid import limit');
 const chunks=[];let current=[];
 const size=rows=>Buffer.byteLength(JSON.stringify({Items:rows,Confirm:false}),'utf8');
 for(const item of items){if(size([item])>maxBytes)throw Error('Candidate too large');if(current.length===limit||size([...current,item])>maxBytes){chunks.push(current);current=[];}current.push(item);}
 if(current.length)chunks.push(current);return chunks;
}
const kinds=['amendments','new-existing','new-missing'];
export function selectReviewed(batch){
 if(!kinds.includes(batch.Kind)||!Array.isArray(batch.Items)||!Array.isArray(batch.Drafts)||!Number.isInteger(batch.MissingMappings))throw Error('Invalid catalog response');
 const keys=new Set(batch.Items.map(x=>batch.Kind==='amendments'?'g1-amend-'+x.ProblemId:x.ContentKey));
 const seen=new Set(),ready=[],held=[];let published=0;
 for(const d of batch.Drafts){
  if(!keys.has(d.ContentKey)||seen.has(d.ContentKey))throw Error('Unexpected draft identity');seen.add(d.ContentKey);
  if(d.Status==='Published'){published++;continue;}
  if(batch.MissingMappings!==0||d.MatchesCandidate!==true||!['Draft','PendingReview','Approved','NeedsChanges'].includes(d.Status)||d.PublishedProblemId!=null){held.push(d.ContentKey);continue;}
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
export async function publish(request,plan,{approvedDigest,note,max=500,delay=200,onEvent=()=>{}}={}){
 if(!plan.enabled||digest(plan)!==approvedDigest||typeof note!=='string'||note.trim().length<10||note.length>2000||!Number.isSafeInteger(max)||max<1||max>1000)throw Error('Explicit reviewed plan, note and bounded maximum required');
 let group,count=0;const ids=new Set();
 for(const r of plan.ready.slice(0,max)){
  if(ids.has(r.id))throw Error('Duplicate draft');ids.add(r.id);
  const key=r.kind+'/'+r.number;
  if(group!==key){const latest=await request('GET','/reviewed-bank/'+key);if(latest.Kind!==r.kind||latest.Number!==r.number)throw Error('Wrong batch');const state=selectReviewed(latest);for(const x of plan.ready.filter(x=>x.kind===r.kind&&x.number===r.number))if(!state.ready.some(y=>y.id===x.id&&y.key===x.key&&y.revision===x.revision&&y.status===x.status))throw Error('Plan changed: refresh preview');group=key;}
  const result=await request('POST','/'+r.id+'/publish',{Revision:r.revision,Note:note.trim(),Confirm:true,DirectApproval:r.status!=='Approved'});
  if(result.Status!=='Published'||!Number.isSafeInteger(result.PublishedProblemId)||result.PublishedProblemId<=0)throw Error('Publication not confirmed: refresh preview');
  onEvent({key:r.key,id:r.id,publishedProblemId:result.PublishedProblemId});count++;
  if(delay>0)await new Promise(resolve=>setTimeout(resolve,delay));
 }
 return count;
}
