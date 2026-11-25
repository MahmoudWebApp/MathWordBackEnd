import {readFileSync,writeFileSync,appendFileSync} from 'node:fs';
import {preview,publish,digest} from './batch-runner.mjs';
const [command,path,approval,maxArg]=process.argv.slice(2);
const token=process.env.MATHWORLD_ADMIN_TOKEN;
if(!token)throw Error('Authenticated admin session required');
async function request(method,route,body){
 const r=await fetch('https://mathwordbackend.onrender.com/api/editorial/problems'+route,{method,headers:{Authorization:'Bearer '+token,'Content-Type':'application/json'},body:body===undefined?undefined:JSON.stringify(body),redirect:'error',signal:AbortSignal.timeout(60000)});
 if(!r.ok)throw Error(method+' '+route+' HTTP '+r.status+'; stop and refresh preview');
 return r.json();
}
if(command==='preview'&&path){const p=await preview(request);writeFileSync(path,JSON.stringify(p,null,2)+'\n',{flag:'wx'});console.log(JSON.stringify({ready:p.ready.length,held:p.held.length,published:p.published,enabled:p.enabled,approvalDigest:digest(p)}));}
else if(command==='publish'&&path&&approval){const p=JSON.parse(readFileSync(path,'utf8'));const count=await publish(request,p,{approvedDigest:approval,note:process.env.MATHWORLD_REVIEW_NOTE,max:maxArg===undefined?500:Number(maxArg),onEvent:e=>appendFileSync(path+'.published.jsonl',JSON.stringify(e)+'\n')});console.log('Confirmed published: '+count);}
else throw Error('Usage: reviewed-cli.mjs preview plan.json | publish plan.json APPROVED_DIGEST [max]');
