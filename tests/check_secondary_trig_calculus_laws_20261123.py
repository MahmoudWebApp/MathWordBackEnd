#!/usr/bin/env python3
"""Independent trig exact values and basic calculus power/integration oracles."""
import json
from math import sqrt
from pathlib import Path
root=Path(__file__).resolve().parents[1]
d=json.loads((root/'content/editorial/secondary-trig-calculus-solutions-20261123.json').read_text(encoding='utf8'))
sql=(root/'scripts/apply_secondary_trig_calculus_laws_20261123.sql').read_text(encoding='utf8')
checks={}
def put(pid,answer,opt):
 assert pid not in checks
 checks[pid]=(str(answer),opt)

put(22,r'\frac{1}{2}',77)
put(46,r'\frac{1}{2}',174)
put(62,1,239)
for i,opp,hyp,opt in [(78,3,5,303),(93,5,13,362),(108,8,17,421),(123,7,25,484),(138,9,41,543)]:
 put(i,r'\frac{'+str(opp)+'}{'+str(hyp)+'}',opt)
for i,adj,hyp,opt in [(272,4,5,1078),(284,12,13,1125),(296,15,17,1176),(308,24,25,1223),(320,40,41,1270)]:
 put(i,r'\frac{'+str(adj)+'}{'+str(hyp)+'}',opt)
for i,opp,adj,opt in [(273,3,4,1081),(285,5,12,1132),(297,8,15,1179),(309,7,24,1226),(321,9,40,1273)]:
 put(i,r'\frac{'+str(opp)+'}{'+str(adj)+'}',opt)
put(274,0,1088);put(286,r'\frac{1}{2}',1135)
put(298,r'\frac{\sqrt{2}}{2}',1182)
put(310,r'\frac{\sqrt{3}}{2}',1229)
put(322,1,1280)
assert abs(sqrt(2)/2-0.7071067811865476)<1e-12
assert abs(sqrt(3)/2-0.8660254037844386)<1e-12

put(47,'10x-4',179)
for i,a,b,x,opt in [(79,2,3,1,306),(94,3,4,2,365),(109,4,5,3,428),(124,5,6,4,487),(139,6,7,5,546)]:
 put(i,2*a*x+b,opt)
for i,a,x,opt in [(275,3,2,1089),(287,4,3,1140),(299,5,4,1187),(311,6,5,1234),(323,7,6,1281)]:
 put(i,(a*a)*(x**(a-1)),opt)
for i,k,p,opt in [(276,4,1,1096),(288,9,2,1143),(300,16,3,1190),(312,25,4,1237),(324,36,5,1288)]:
 power=p+1
 assert k%power==0
 put(i,str(k//power)+'x^{'+str(power)+'}+C',opt)
for i,k,t,opt in [(277,4,3,1099),(289,6,4,1146),(301,8,5,1193),(313,10,6,1244),(325,12,7,1291)]:
 put(i,k*t*t//2,opt)
put(859,6*(3**2)-4,3431)
assert d['reviewedCount']==56 and d['improvedCount']==45
assert d['adequateOriginalIds']==[23,633,634,635,636,24,25,63,860,861,862]
assert len(checks)==len(d['changes'])==45
assert {x['problemId'] for x in d['changes']}==set(checks)
assert sql.count('UPDATE public."Problems"')==45
assert sql.count('GET DIAGNOSTICS affected=ROW_COUNT')==45
assert sql.count('RAISE EXCEPTION')==45
assert 'BEGIN;' in sql and 'COMMIT;' in sql
assert 'UPDATE public."QuestionOptions"' not in sql
for row in d['changes']:
 pid=row['problemId'];answer,opt=checks[pid]
 assert row['correctOptionId']==opt and row['correctOptionLatex']==answer,pid
 assert row['stageId']==3 and row['categoryId'] in (10,11)
 assert row['beforeAr']!=row['afterAr'] and row['beforeEn']!=row['afterEn']
 assert len(row['afterAr'])>150 and len(row['afterEn'])>135
 assert f'"Id"={pid}' in sql and f'o."Id"={opt}' in sql
print('PASS 56 upper-secondary trigonometry/calculus questions reviewed, 45 bilingual worked laws')
print('PASS exact trig expressions, derivatives and integrals verified against original correct choices')
print('PASS atomic source-guarded 45-row solution-only SQL')
