"""Independent answer and structure checks for both unpublished G1 gap waves."""
import json
from collections import Counter
from fractions import Fraction as F
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]
FOLDER = ROOT / "content/editorial"
ITEMS = [i for wave in (1, 2)
         for i in json.loads((FOLDER / f"g1-gap-wave-{wave:02d}-20261124.json").read_text(encoding="utf-8"))["Items"]]

# Match full English stems, extract operands, and calculate rather than
# trusting Check.expected or the answer flags in the manifest.
RULES = [
    (r"A notebook costs (\d+) currency units\. We need (\d+) notebooks\. Estimate the cost by rounding each number to the nearest ten, then multiplying\.",
     lambda a,b: ((int(a)+5)//10*10)*((int(b)+5)//10*10)),
    (r"One bag has a mass of ([\d.]+) kg and another has a mass of (\d+) g\. By how many grams is the first bag heavier\?",
     lambda a,b: F(a)*1000-int(b)),
    (r"A runner covers (\d+) meters\. How many kilometers is this\?", lambda a:F(a)/1000),
    (r"A recording starts at (\d+):(\d+) and ends at (\d+):(\d+) the next day\. How many minutes does it last\?",
     lambda h,m,j,n:1440-int(h)*60-int(m)+int(j)*60+int(n)),
    (r"What is the distance between (−?\d+) and (−?\d+) on the number line\?",
     lambda a,b:abs(int(a.replace("−","-"))-int(b.replace("−","-")))),
    (r"Find the real domain of \$f\(x\)=\\log_2\(x\+(\d+)\)\+\\log_2\((\d+)-x\)\$\.",
     lambda a,b:f"({-int(a)},{int(b)})"),
    (r"Find the real domain of \$g\(x\)=\\ln\(\(x-(\d+)\)\(x\+(\d+)\)\)\$\.",
     lambda a,b:rf"(-\infty,{-int(b)})\cup({int(a)},\infty)"),
    (r"Power attenuation in decibels is given by \$A=10\\log_\{10\}\(P_\{in\}/P_\{out\}\)\$\. If \$A=(\d+)\$ dB, what is the ratio \$P_\{in\}/P_\{out\}\$\?",
     lambda a:F(10)**(int(a)//10) if int(a)%10==0 else None),
    (r"Given \$N\(t\)=(\d+)\(([\d.]+)\)\^t\$, what is the ratio \$N\(t\+(\d+)\)/N\(t\)\$\?",
     lambda a,b,t:F(b)**int(t)),
    (r"At a specified parameter value under the alternative hypothesis, the probability of a Type II error is ([\d.]+)\. What is the test power at that value\?",
     lambda b:1-F(b)),
    (r"Which set contains all solutions of \$\|x-(\d+)\|=(\d+)\$\?",
     lambda a,d: "\\{"+",".join(map(str,sorted([int(a)-int(d),int(a)+int(d)])))+"\\}"),
    (r"A subscriber count follows \$N\(t\)=(\d+)\(([\d.]+)\)\^\{t/(\d+)\}\$, where t is in months\. What is the percentage increase over three months\?",
     lambda a,b,p: 100*(F(b)**(3//int(p))-1) if 3%int(p)==0 else None),
]

def canonical(value):
    if isinstance(value,(int,F)):
        return F(value)
    text=value.strip().strip("$")
    try:
        return F(text)
    except ValueError:
        return text

def solve(prompt):
    matches=[fn(*match.groups()) for regex,fn in RULES if (match:=re.fullmatch(regex,prompt))]
    assert len(matches)==1 and matches[0] is not None, prompt
    return canonical(matches[0])

def pair(value):
    assert all(isinstance(value[k],str) and value[k].strip() for k in ("Ar","En")), value

assert len(ITEMS)==12 and len({i["ContentKey"] for i in ITEMS})==12
assert Counter(i["PrimarySkillKey"] for i in ITEMS)=={
    "estimation":1,"mass":1,"metric-conversion":1,"time":1,"absolute-value":2,
    "logarithm-domain":2,"logarithm-modeling":1,"model-interpretation":2,"hypothesis-testing":1}
for lang in ("Ar","En"):
    assert len({" ".join(i["Content"]["Question"][lang].lower().split()) for i in ITEMS})==len(ITEMS)
for item in ITEMS:
    c=item["Content"]
    assert item["ReviewStatus"]=="Draft" and item["ProposedTrackCodes"] and c["TrackIds"]==[]
    expected=solve(c["Question"]["En"])
    assert canonical(item["Check"]["expected"])==expected,item["ContentKey"]
    options=c["Options"]
    assert len(options)==len({canonical(o["LatexCode"]) for o in options})==4
    assert [j for j,o in enumerate(options) if canonical(o["LatexCode"])==expected]==[j for j,o in enumerate(options) if o["IsCorrect"]]
    assert sum(o["IsCorrect"] for o in options)==1
    for o in options:
        if not o["IsCorrect"]:
            assert o["ErrorType"].strip()
            pair(o["Reason"])
    pair(c["Title"]);pair(c["Question"])
    assert len(c["Hints"])==2
    for hint in c["Hints"]:pair(hint)
    for lang in ("Ar","En"):
        assert c["Hints"][0][lang].strip()!=c["Hints"][1][lang].strip()
    s=c["Solution"]
    assert s["FormulaLatex"].strip() and s["Steps"]
    for step in s["Steps"]:pair(step)
    for field in ("Idea","Substitution","Result","Unit","Verification","CommonError"):pair(s[field])
    for lang in ("Ar","En"):
        assert canonical(s["Result"][lang])==expected
print("PASS: 12 independent prompt-based answers; bilingual structured solutions, hints and distractors; candidates remain drafts")
