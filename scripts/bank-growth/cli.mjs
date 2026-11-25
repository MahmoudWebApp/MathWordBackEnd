import {readFileSync,writeFileSync,mkdirSync} from 'node:fs';
import {join} from 'node:path';
import {generate,wave2,validate,plan,selectCandidates} from './pipeline.mjs';
const [cmd,input,output]=process.argv.slice(2);
if(cmd==='plan'&&input&&output){writeFileSync(output,JSON.stringify(plan(JSON.parse(readFileSync(input,'utf8'))),null,2)+'\n');}
else if((cmd==='pilot'||cmd==='prepare')&&input){let rows=[...generate(),...wave2()];if(cmd==='prepare'){if(!output)throw Error('prepare requires inventory JSON');const scoped=selectCandidates(rows,JSON.parse(readFileSync(output,'utf8')));rows=scoped.selected;console.log(JSON.stringify({held:scoped.held}));}const errors=validate(rows);if(errors.length)throw Error(JSON.stringify(errors));mkdirSync(input,{recursive:true});for(let i=0;i<rows.length;i+=20){const Items=rows.slice(i,i+20).map(({Family,Check,ReviewStatus,...r})=>r);writeFileSync(join(input,'batch-'+(i/20+1)+'.json'),JSON.stringify({Items,Confirm:false},null,2)+'\n');}console.log(rows.length+' unpublished candidate drafts');}
else{console.error('Usage: node scripts/bank-growth/cli.mjs pilot output-directory | prepare output-directory inventory.json | plan inventory.json plan.json');process.exitCode=2;}
