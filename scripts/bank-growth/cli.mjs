import {readFileSync,writeFileSync,mkdirSync} from 'node:fs';
import {join} from 'node:path';
import {generate,wave2,validate,plan,selectCandidates} from './pipeline.mjs';
import {universityWave} from './university-wave.mjs';
import {depthWave} from './depth-wave.mjs';
import {chunkImports} from './batch-runner.mjs';
const [cmd,input,output]=process.argv.slice(2);
if(cmd==='plan'&&input&&output){writeFileSync(output,JSON.stringify(plan(JSON.parse(readFileSync(input,'utf8'))),null,2)+'\n');}
else if((cmd==='pilot'||cmd==='prepare')&&input){let rows=[...generate(),...wave2(),...universityWave(),...depthWave()];if(cmd==='prepare'){if(!output)throw Error('prepare requires inventory JSON');const scoped=selectCandidates(rows,JSON.parse(readFileSync(output,'utf8')));rows=scoped.selected;console.log(JSON.stringify({held:scoped.held}));}const errors=validate(rows);if(errors.length)throw Error(JSON.stringify(errors));mkdirSync(input,{recursive:true});const batches=chunkImports(rows.map(({Family,Check,ReviewStatus,...r})=>r));for(let i=0;i<batches.length;i++){const Items=batches[i];writeFileSync(join(input,'batch-'+(i+1)+'.json'),JSON.stringify({Items,Confirm:false},null,2)+'\n');}console.log(rows.length+' unpublished candidate drafts');}
else{console.error('Usage: node scripts/bank-growth/cli.mjs pilot output-directory | prepare output-directory inventory.json | plan inventory.json plan.json');process.exitCode=2;}
