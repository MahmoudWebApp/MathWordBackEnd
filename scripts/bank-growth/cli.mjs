import {readFileSync,writeFileSync,mkdirSync,readdirSync,existsSync} from 'node:fs';
import {join} from 'node:path';
import {generate,wave2,validate,plan,selectCandidates} from './pipeline.mjs';
import {universityWave} from './university-wave.mjs';
import {depthWave} from './depth-wave.mjs';
import {coverageWave} from './coverage-wave.mjs';
import {reasoningWave,heldFamilies} from './reasoning-wave.mjs';
import {authorQueue} from './author-queue.mjs';
import {chunkImports} from './batch-runner.mjs';
const [cmd,input,output,...extra]=process.argv.slice(2);
const read=p=>JSON.parse(readFileSync(p,'utf8'));
const save=(p,x)=>writeFileSync(p,JSON.stringify(x,null,2)+'\n',{flag:'wx'});
const all=()=>[...generate(),...wave2(),...universityWave(),...depthWave(),...coverageWave(),...reasoningWave()];
function wave(p){const x=read(p);if(!Array.isArray(x.Items))throw Error('Expected Items in '+p);return x.Items;}
function active(rows){const errors=validate(rows);if(errors.length)throw Error(JSON.stringify(errors));return rows.filter(r=>!heldFamilies.includes(r.Family));}
if(cmd==='plan'&&input&&output)save(output,plan(read(input)));
else if(cmd==='queue'&&input&&output){const [max='200',...waves]=extra;save(output,authorQueue(read(input),active([...all(),...waves.flatMap(wave)]),Number(max)));}
else if(['pilot','prepare','bulk-prepare'].includes(cmd)&&input){
 let raw=all(),known=[],inventory;
 if(cmd!=='pilot'){if(!output)throw Error('Inventory required');inventory=read(output);}
 if(cmd==='bulk-prepare'){const [knownPath,...waves]=extra;if(!knownPath||!waves.length)throw Error('Known questions and authored waves required');known=read(knownPath);if(!Array.isArray(known)||known.some(q=>typeof q.Ar!=='string'||typeof q.En!=='string'))throw Error('Expected bilingual known-question pairs');raw.push(...waves.flatMap(wave));}
 let rows=active(raw);const held=raw.filter(r=>heldFamilies.includes(r.Family)).map(r=>({key:r.ContentKey,reason:'PotentialSemanticOverlap'}));
 const errors=validate(rows,known);if(errors.length)throw Error(JSON.stringify(errors));
 if(inventory){const scoped=selectCandidates(rows,inventory);rows=scoped.selected;held.push(...scoped.held);}
 if(existsSync(input)&&readdirSync(input).length)throw Error('Use a new output directory');
 mkdirSync(input,{recursive:true});
 const batches=chunkImports(rows.map(({Family,Check,ReviewStatus,...r})=>r));
 for(const [i,Items] of batches.entries())save(join(input,'batch-'+(i+1)+'.json'),{Items,Confirm:false});
 save(join(input,'manifest.json'),{CandidateCount:rows.length,BatchCount:batches.length,ReviewStatus:'Unreviewed',Held:held,Keys:rows.map(r=>r.ContentKey)});
 console.log(JSON.stringify({candidates:rows.length,held:held.length,batches:batches.length}));
}
else{console.error('Usage: cli.mjs pilot OUT | prepare OUT INVENTORY | bulk-prepare OUT INVENTORY KNOWN WAVE... | queue INVENTORY OUT [MAX] [WAVE...] | plan INVENTORY OUT');process.exitCode=2;}
