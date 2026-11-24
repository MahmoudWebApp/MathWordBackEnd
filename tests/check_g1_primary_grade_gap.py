import json
import re
from fractions import Fraction as F
from pathlib import Path
root=Path(__file__).resolve().parents[1]/"content"/"editorial"
items=json.loads((root/"g1-primary-early-and-final-grade-gap-20261124.json").read_text(encoding="utf-8"))["Items"]
q=json.loads((root/"g1-track-review-queue-20261124.json").read_text(encoding="utf-8"))
skills={s["StableKey"]:s for s in q["Skills"]}
rules=[
(r"A shelf has (\d+) books\. Then (\d+) more books are added\. How many books are on the shelf now\?",lambda a,b:int(a)+int(b)),
(r"A child has (\d+) balloons and gives (\d+) to a friend\. How many balloons remain\?",lambda a,b:int(a)-int(b)),
(r"Which number belongs in the box to make \$([0-9]+)\+\\square=([0-9]+)\$ true\?",lambda a,b:int(b)-int(a)),
(r"The pattern increases by (\d+) each time: (\d+), (\d+), (\d+), box, (\d+)\. What is the missing number\?",lambda d,a,b,c,e:int(c)+int(d)),
(r"What number represents (\d+) tens and (\d+) ones\?",lambda a,b:int(a)*10+int(b)),
(r"Which number is greatest: (\d+), (\d+), (\d+), (\d+)\?",lambda *a:max(map(int,a))),
(r"Start at (\d+) and count backward (\d+) steps, subtracting (\d+) at each step\. Which number do you reach\?",lambda a,b,c:int(a)-int(b)*int(c)),
(r"A red ribbon is (\d+) cm long and a blue ribbon is (\d+) cm long\. How many centimeters longer is the red ribbon\?",lambda a,b:int(a)-int(b)),
(r"In a library, (\d+) stories represent (\d+)% of all the stories\. How many stories are there in total\?",lambda a,b:F(a)*100/F(b)),
(r"A student buys (\d+) notebooks of equal price and pays (\d+) units for delivery\. The total is (\d+) units\. What is the price of one notebook\?",lambda n,d,t:(F(t)-F(d))/F(n)),
(r"A child has (\d+) cards, gives one quarter to a friend, then gives one third of the remainder to another friend\. How many cards are left\?",lambda a:F(a)*(1-F(1,4))*(1-F(1,3))),
(r"A triangle has area (\d+) square centimeters and perpendicular height (\d+) cm\. What is its base length in centimeters\?",lambda a,h:2*F(a)/F(h))]
assert len(items)==len({x["ContentKey"] for x in items})==12
assert sum(x["ProposedTrackCodes"]==["grade-1"] for x in items)==8
assert sum(x["ProposedTrackCodes"]==["grade-6"] for x in items)==4
for i in items:
    c=i["Content"];s=skills[i["PrimarySkillKey"]]
    assert i["ReviewStatus"]=="Draft" and c["TrackIds"]==[]
    assert (c["StageId"],c["CategoryId"],c["PrimarySkillId"])==(s["StageId"],s["CategoryId"],s["SkillId"])
    found=[fn(*m.groups()) for p,fn in rules if (m:=re.fullmatch(p,c["Question"]["En"]))]
    assert len(found)==1,i["ContentKey"]
    result=F(found[0]);assert F(i["Check"]["expected"])==result
    opts=c["Options"];assert len(opts)==len({F(o["LatexCode"]) for o in opts})==4
    assert sum(o["IsCorrect"] for o in opts)==1
    assert all(o["IsCorrect"]==(F(o["LatexCode"])==result) for o in opts)
    assert all(o["IsCorrect"] or (o["ErrorType"] and o["Reason"]["Ar"] and o["Reason"]["En"]) for o in opts)
    assert len(c["Hints"])==2 and all(c["Hints"][0][lang]!=c["Hints"][1][lang] for lang in ("Ar","En"))
    for lang in ("Ar","En"):
        assert c["Title"][lang] and c["Question"][lang]
        assert all(h[lang] for h in c["Hints"])
        sol=c["Solution"];assert sol["FormulaLatex"] and F(sol["Result"][lang])==result
        assert all(sol[k][lang] for k in ("Idea","Substitution","Unit","Verification","CommonError"))
        assert sol["Steps"] and all(st[lang] for st in sol["Steps"])
print("PASS: 12 independently computed grade 1/6 bilingual draft answers, real skill links and four distinct options")
