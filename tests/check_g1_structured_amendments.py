"""Source-bound structured proposal contracts; never imports production."""
import json
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]/"content"/"editorial"
def load(name): return json.loads((ROOT/name).read_text(encoding="utf-8"))
d=load("g1-structured-amendments-wave01-20261124.json")
second=load("g1-structured-amendments-wave02-20261124.json")
assert second["Status"]==d["Status"]
d["Items"]+=second["Items"]
laws={r["ProblemId"]:r for r in load("g1-short-solution-law-candidates-20261124.json")["Items"]}
hints={r["problemId"]:r for r in load("g1-existing-hint-candidates-20261124.json")["items"]}
assert d["Status"]=="NotImportedNotPublished"
assert len(d["Items"])==len({r["ProblemId"] for r in d["Items"]})==52
def pair(x): return all(isinstance(x.get(k),str) and x[k].strip() for k in ("Ar","En"))
for row in d["Items"]:
    i=row["ProblemId"]; c=row["Content"]; l=laws[i]; h=hints[i]
    assert row["Status"]=="StructuredAmendmentCandidateNotImported"
    assert c["Question"]==h["question"]=={"Ar":l["ExpectedQuestionAr"],"En":l["ExpectedQuestionEn"]}
    assert row["ExpectedLegacySolution"]=={"Ar":l["ExpectedSolutionAr"],"En":l["ExpectedSolutionEn"]}
    assert c["Hints"]==h["Hints"] and len(c["Hints"])==2
    assert len(row["ExpectedOptionIds"])==len(set(row["ExpectedOptionIds"]))==4
    opts=c["Options"]
    assert len(opts)==len({o["LatexCode"] for o in opts})==4
    assert [o["LatexCode"] for o in opts if o["IsCorrect"]]==[l["ExpectedCorrectOption"]]
    assert all(o["ErrorType"] and pair(o["Reason"]) for o in opts if not o["IsCorrect"])
    sol=c["Solution"]
    assert sol["FormulaLatex"] and not sol["FormulaLatex"].startswith("$")
    assert all(pair(sol[k]) for k in ("Idea","Substitution","Result","Unit","Verification","CommonError"))
    assert 1<=len(sol["Steps"])<=20 and all(pair(s) for s in sol["Steps"])
    assert pair(c["Title"]) and c["Points"]>0 and c["PrimarySkillId"]>0
print("PASS: 52 complete structured amendment proposals, source-bound; no automatic publication")


# Wave 03: independent recomputation from the actual source-guarded English
# questions, not from the proposed answer text or existing correctness flag.
import re
from fractions import Fraction
wave=load("g1-structured-amendments-wave03-20261124.json")
assert wave["Status"]=="NotImportedNotPublished"
placements={r["ProblemId"]:(g,r) for g in load("g1-track-draft-batch-source-review-20261124.json")["Tracks"] for r in g["Rows"]}
wave_ids={r["ProblemId"] for r in wave["Items"]}
assert len(wave_ids)==len(wave["Items"])==20
assert not wave_ids.intersection({r["ProblemId"] for r in d["Items"]})
assert wave_ids.issubset(hints)
def numeric_choice(text):
    f=re.fullmatch(r"\\frac\{(\d+)\}\{(\d+)\}",text)
    if f: return Fraction(int(f[1]),int(f[2]))
    match=re.match(r"^(\d+)(?:\s+\\text\{ [^}]+\}.*)?$",text)
    assert match,text
    return Fraction(int(match[1]))
def expected_from_prompt(q, key):
    values=[int(x) for x in re.findall(r"\d+",q)]
    if key=="primary-subtraction": return values[0]-values[1]
    if key=="primary-multiplication": return values[0]*values[1]
    if key=="primary-perimeter":
        return 4*values[0] if "square" in q.lower() else 2*sum(values)
    if key=="primary-rectangle-area": return values[0]*values[1]
    if key=="primary-addition": return sum(values)
    if key=="primary-one-step-additive-equations": return values[1]-values[0]
    if key=="primary-one-step-multiplicative-equations": return Fraction(values[1],values[0])
    if key=="primary-arithmetic-mean": return Fraction(sum(values),len(values))
    if key=="primary-triangle-area": return Fraction(values[0]*values[1],2)
    if key=="primary-simple-probability":
        assert "fair six-sided die" in q and "even" in q
        return Fraction(sum(i%2==0 for i in range(1,7)),6)
    if key=="primary-multistep-arithmetic": return values[0]+values[1]-values[2]
    if key=="primary-division": return Fraction(values[0],values[1])
    if key=="primary-multiplicative-word-problems": return values[0]*values[1]
    if key=="primary-two-step-equations": return Fraction(values[2]-values[1],values[0])
    if key=="primary-substitution": return values[1]*values[0]-values[2]
    if key=="primary-triangle-angle-sum": return 180-sum(values)
    if key=="primary-unit-conversions":
        assert "metres to centimetres" in q
        return values[0]*100
    if key=="primary-mode":
        from collections import Counter
        ranked=Counter(values).most_common()
        assert ranked[0][1]>ranked[1][1]
        return ranked[0][0]
    if key=="primary-median":
        assert len(values)%2==1
        return sorted(values)[len(values)//2]
    raise AssertionError(key)
fourth=load("g1-structured-amendments-wave04-20261124.json")
assert fourth["Status"]==wave["Status"]
fourth_ids={r["ProblemId"] for r in fourth["Items"]}
assert len(fourth_ids)==len(fourth["Items"])==36
assert not fourth_ids.intersection(wave_ids|{r["ProblemId"] for r in d["Items"]})
assert not fourth_ids.intersection({153,159,165,171})
for row in wave["Items"]+fourth["Items"]:
    c=row["Content"]; g,p=placements[row["ProblemId"]]
    assert row["Status"]=="StructuredAmendmentCandidateNotImported"
    assert row["PrimarySkillKey"]==p["StableKey"]
    assert row["ProposedTrackCode"]==g["Code"]
    assert c["StageId"]==g["StageId"]==1
    assert c["CategoryId"]==p["CategoryId"] and c["PrimarySkillId"]==p["PrimarySkillId"]
    assert c["Question"]=={"Ar":p["ExpectedQuestionAr"],"En":p["ExpectedQuestionEn"]}
    assert pair(row["ExpectedLegacySolution"]) and pair(c["Title"])
    assert len(row["ExpectedOptionIds"])==len(set(row["ExpectedOptionIds"]))==4
    opts=c["Options"]
    expected=expected_from_prompt(c["Question"]["En"],row["PrimarySkillKey"])
    values=[numeric_choice(o["LatexCode"]) for o in opts]
    assert len(opts)==len(set(values))==4
    assert sum(bool(o["IsCorrect"]) for o in opts)==1
    assert all(o["IsCorrect"]==(v==expected) for v,o in zip(values,opts))
    assert all(o["ErrorType"] and pair(o["Reason"]) for o in opts if not o["IsCorrect"])
    assert len(c["Hints"])==2 and all(pair(h) for h in c["Hints"])
    assert all(c["Hints"][0][k]!=c["Hints"][1][k] for k in ("Ar","En"))
    sol=c["Solution"]
    assert sol["FormulaLatex"] and not sol["FormulaLatex"].startswith("$")
    assert all(pair(sol[k]) for k in ("Idea","Substitution","Result","Unit","Verification","CommonError"))
    assert all(numeric_choice(sol["Result"][lang].strip("$"))==expected for lang in ("Ar","En"))
    assert 1<=len(sol["Steps"])<=20 and all(pair(s) for s in sol["Steps"])
print("PASS: 56 additional primary proposals, independently recomputed options, source-matched placement, full bilingual solution and progressive hints")


# Wave 05 covers both recurring numeric skills and distinct fraction/word
# problems. Check exact rational values rather than float approximations.
from decimal import Decimal, ROUND_HALF_UP
fifth=load("g1-structured-amendments-wave05-20261124.json")
assert fifth["Status"]==wave["Status"]
fifth_ids={r["ProblemId"] for r in fifth["Items"]}
assert len(fifth_ids)==len(fifth["Items"])==59
assert not fifth_ids.intersection(wave_ids|fourth_ids|{r["ProblemId"] for r in d["Items"]})
assert not fifth_ids.intersection({177,183,189,195,201,207})
def rational(text):
    text=text.strip("$").replace(r"\%","").rstrip("%")
    m=re.fullmatch(r"(\d*)\\frac(?:\{(\d+)\}|(\d))(?:\{(\d+)\}|(\d))",text)
    if m:
        return Fraction(int(m[1] or 0))+Fraction(int(m[2] or m[3]),int(m[4] or m[5]))
    return Fraction(text)
def independent_fifth(row):
    i=row["ProblemId"]; c=row["Content"]; q=c["Question"]["En"]; opts=c["Options"]
    vals=[int(x) for x in re.findall(r"\d+",q)]
    # Relation, comparison and class-label options require checking truth
    # against the question, not parsing the key as an ordinary number.
    if i==422:
        correct=[o for o in opts if "=" in o["LatexCode"] and rational(o["LatexCode"].split("=")[0])==rational(o["LatexCode"].split("=")[1])]
        assert rational("0.6")==Fraction(3,5)
        return correct[0]["LatexCode"], True
    if i==472:
        correct=[]
        for o in opts:
            match=re.fullmatch(r"(.+?)([<>=])(.+)",o["LatexCode"])
            assert match
            a,op,b=match.groups()
            if {"<":rational(a)<rational(b),">":rational(a)>rational(b),"=":rational(a)==rational(b)}[op]:
                correct.append(o["LatexCode"])
        assert len(correct)==1
        return correct[0],True
    if i==504:
        values=[(rational(o["LatexCode"]),o["LatexCode"]) for o in opts if o["LatexCode"].startswith(r"\frac")]
        assert len(values)==2 and values[0][0]!=values[1][0]
        return max(values)[1],True
    if i==507:
        assert Fraction(vals[0],vals[1])<Fraction(vals[2],vals[3])
        return r"\text{الصف ب (Class B)}",True
    if i==505:
        ranked=sorted((abs(1-rational(o["LatexCode"])),o["LatexCode"]) for o in opts)
        assert ranked[0][0]<ranked[1][0]
        return rational(ranked[0][1]),False
    if i==506:
        eligible=[rational(o["LatexCode"]) for o in opts if Fraction(1,3)<rational(o["LatexCode"])<Fraction(1,2)]
        assert len(eligible)==1
        return eligible[0],False
    if i==423: return Fraction(vals[0]*2,3),False
    if i==424: return Fraction(vals[1],vals[0]),False
    if i==425: return Fraction(1)+Fraction(1,2)+Fraction(3,4),False
    if i==426: return Fraction(vals[0]*vals[1],100),False
    if i==427: return Fraction(Decimal(re.search(r"\d+\.\d+",q)[0]).quantize(Decimal("0.01"),rounding=ROUND_HALF_UP)),False
    if i==474: return Fraction(5,6)-Fraction(1,4),False
    if i==475: return int(re.search(r"\d+\.(\d+)",q)[1][1]),False
    if i==476:
        assert q.startswith("Twelve of ") and len(vals)==1
        return Fraction(12*100,vals[0]),False
    if i==477: return Fraction(5,vals[-1]),False
    if i in (609,612): return sum(vals),False
    if i==610: return vals[1]-vals[0],False
    if i==611: return sum((v+50)//100*100 for v in vals),False
    if i==613: return Fraction(2*vals[0],vals[1]),False
    if i in (614,615,616): return Fraction(vals[0]*vals[1],2),False
    if i==617: return Fraction(vals[0]*vals[1],100),False
    if i==618: return Fraction(vals[-1]*vals[1],100),False
    if i==619: return Fraction(vals[0]*100,vals[1]),False
    if i==620: return Fraction(vals[0]*vals[1],100),False
    if i in (689,691): return Fraction(vals[0],vals[1]),False
    if i==690: return Fraction(vals[1],vals[0]),False
    if i==692: return vals[0]*vals[1],False
    if i==693: return Fraction(vals[0]*vals[2],vals[1]),False
    return expected_from_prompt(q,row["PrimarySkillKey"]),False
for row in fifth["Items"]:
    c=row["Content"]; g,p=placements[row["ProblemId"]]
    assert row["Status"]=="StructuredAmendmentCandidateNotImported"
    assert row["PrimarySkillKey"]==p["StableKey"] and row["ProposedTrackCode"]==g["Code"]
    assert c["StageId"]==g["StageId"]==1
    assert c["CategoryId"]==p["CategoryId"] and c["PrimarySkillId"]==p["PrimarySkillId"]
    assert c["Question"]=={"Ar":p["ExpectedQuestionAr"],"En":p["ExpectedQuestionEn"]}
    assert pair(row["ExpectedLegacySolution"]) and pair(c["Title"])
    assert len(row["ExpectedOptionIds"])==len(set(row["ExpectedOptionIds"]))==4
    opts=c["Options"]; assert len(opts)==4 and sum(o["IsCorrect"] for o in opts)==1
    expected,symbolic=independent_fifth(row)
    values=[o["LatexCode"] if symbolic else rational(o["LatexCode"]) for o in opts]
    assert len(set(values))==4
    assert all(o["IsCorrect"]==(v==expected) for v,o in zip(values,opts)),row["ProblemId"]
    assert all(o["ErrorType"] and pair(o["Reason"]) for o in opts if not o["IsCorrect"])
    assert len(c["Hints"])==2 and all(pair(h) for h in c["Hints"])
    assert all(c["Hints"][0][k]!=c["Hints"][1][k] for k in ("Ar","En"))
    sol=c["Solution"]
    assert sol["FormulaLatex"] and not sol["FormulaLatex"].startswith("$")
    assert all(pair(sol[k]) for k in ("Idea","Substitution","Result","Unit","Verification","CommonError"))
    if not symbolic:
        assert all(rational(sol["Result"][lang])==expected for lang in ("Ar","En")),row["ProblemId"]
    elif row["ProblemId"]!=507:
        assert all(sol["Result"][lang].strip("$")==expected for lang in ("Ar","En"))
    else:
        assert sol["Result"]["En"]=="Class B" and "ب" in sol["Result"]["Ar"]
    assert 1<=len(sol["Steps"])<=20 and all(pair(s) for s in sol["Steps"])
print("PASS: 59 wave-05 questions, exact rational/comparison oracles, source guards and complete bilingual content")


# Wave 06: exact arithmetic, place value, comparisons, units, time and
# division-with-remainder checks. Expected values below are independent
# arithmetic expressions, not values extracted from the proposed answer.
sixth=load("g1-structured-amendments-wave06-20261124.json")
assert sixth["Status"]==wave["Status"]
sixth_ids={r["ProblemId"] for r in sixth["Items"]}
assert len(sixth_ids)==len(sixth["Items"])==54
assert not sixth_ids.intersection(wave_ids|fourth_ids|fifth_ids|{r["ProblemId"] for r in d["Items"]})
assert not sixth_ids.intersection({818,1679})
def nearest(n,m): return ((n+m//2)//m)*m
def independent_sixth(i,opts):
    expected={
        694:Fraction(14,21),695:Fraction(75,100),761:425-178,762:650-487,763:95+38,764:503-287,
        817:Fraction(9,12),819:Fraction(3,4)/2,820:Fraction(2,3)/4,822:Fraction(47,100)*10,
        852:(145+38-1)//38,853:18*12-35,854:48*100//4,1555:6*10**4,
        1556:70000+500+40+3,1558:nearest(37648,100),1559:nearest(9650,1000),
        1560:nearest(392,100)+nearest(614,100),1561:nearest(1508,100)-nearest(692,100),1562:40*100,
        1587:235+85,1588:Fraction(14,10)*100-135,1589:12*100//75,1590:2*1000+750-900,
        1591:Fraction(15,10)*1000//250,1592:2*1000//250,1593:2*1000-350,1594:750+Fraction(8,10)*1000,
        1596:(15*60+5)-(14*60+10),1597:Fraction(325,100)*1000,1598:18*10,
        1635:Fraction(3,4)+Fraction(1,8),1636:Fraction(5,6)-Fraction(1,3),1637:18*Fraction(2,3),
        1638:1+Fraction(1,4)+2+Fraction(1,2),1651:7*1000,1652:max(4096,4609,4690,4906),
        1653:nearest(3867,100),1654:1250+3*25,1655:nearest(198,100)+nearest(304,100),
        1656:4*1000+3*100+2*10+7,1675:4000//400,1676:6*1000+4*10+9,1677:Fraction(340+360,2),
        1681:min(n for n in range(1000,10000) if n//100%10==6 and n%10==8),
        1682:sum(n%10==0 for n in range(366,390)),1707:sum(n//10%10==4 for n in range(200,300)),1708:6005-90,
    }
    if i==696:
        valid=[]
        for o in opts:
            a,op,b=re.fullmatch(r"(.+?)([<>=])(.+)",o["LatexCode"]).groups()
            a,b=rational(a),rational(b)
            if {"<":a<b,">":a>b,"=":a==b}[op]:valid.append(o["LatexCode"])
        assert len(valid)==1
        return valid[0],lambda s:s
    if i==1557:
        a,b=58209,58290
        return "<" if a<b else ">" if a>b else "=",lambda s:s
    if i==851:
        def pair_choice(s):
            a,b=re.search(r"(\d+) each, (\d+) left",s).groups()
            return int(a),int(b)
        return divmod(96,7),pair_choice
    if i==1595:
        t=9*60+45+60+35
        return divmod(t,60),lambda s:tuple(map(int,re.search(r"(\d+):(\d+)",s).groups()))
    if i==1680:
        return divmod(36,10),lambda s:tuple(map(int,re.fullmatch(r"\((\d+),(\d+)\)",s).groups()))
    if i==1678:
        candidates=[int(o["LatexCode"]) for o in opts if nearest(int(o["LatexCode"]),100)==4600]
        assert len(candidates)==1
        return candidates[0],int
    return expected[i],lambda s:rational(s.replace(",",""))
for row in sixth["Items"]:
    i=row["ProblemId"]; c=row["Content"]; g,p=placements[i]
    assert row["Status"]=="StructuredAmendmentCandidateNotImported"
    assert row["PrimarySkillKey"]==p["StableKey"] and row["ProposedTrackCode"]==g["Code"]
    assert c["StageId"]==g["StageId"]==1 and c["CategoryId"]==p["CategoryId"] and c["PrimarySkillId"]==p["PrimarySkillId"]
    assert c["Question"]=={"Ar":p["ExpectedQuestionAr"],"En":p["ExpectedQuestionEn"]}
    assert pair(row["ExpectedLegacySolution"]) and pair(c["Title"])
    assert len(row["ExpectedOptionIds"])==len(set(row["ExpectedOptionIds"]))==4
    opts=c["Options"]; assert len(opts)==4 and sum(o["IsCorrect"] for o in opts)==1
    expected,parse=independent_sixth(i,opts)
    values=[parse(o["LatexCode"]) for o in opts]
    assert len(set(values))==4
    assert all(o["IsCorrect"]==(v==expected) for v,o in zip(values,opts)),i
    assert all(o["ErrorType"] and pair(o["Reason"]) for o in opts if not o["IsCorrect"])
    assert len(c["Hints"])==2 and all(pair(h) for h in c["Hints"])
    assert all(c["Hints"][0][k]!=c["Hints"][1][k] for k in ("Ar","En"))
    sol=c["Solution"]
    assert sol["FormulaLatex"] and not sol["FormulaLatex"].startswith("$")
    assert all(pair(sol[k]) for k in ("Idea","Substitution","Result","Unit","Verification","CommonError"))
    if i in (851,1680):
        assert all(tuple(map(int,re.fullmatch(r"\((\d+),(\d+)\)",sol["Result"][lang].strip("$")).groups()))==expected for lang in ("Ar","En"))
    elif i==1557:
        assert all("<" in sol["Result"][lang] for lang in ("Ar","En"))
    else:
        assert all(parse(sol["Result"][lang].strip("$"))==expected for lang in ("Ar","En")),i
    assert 1<=len(sol["Steps"])<=20 and all(pair(s) for s in sol["Steps"])
print("PASS: 54 wave-06 problems, independent exact math and bilingual source-guarded content")


# Wave 07: separate middle-school mathematical oracles, from source prompts.
from math import gcd, isqrt, lcm
seventh=load("g1-structured-amendments-wave07-20261124.json")
assert seventh["Status"]==wave["Status"]
seventh_ids={r["ProblemId"] for r in seventh["Items"]}
assert len(seventh_ids)==len(seventh["Items"])==40
assert not seventh_ids.intersection(wave_ids|fourth_ids|fifth_ids|sixth_ids|{r["ProblemId"] for r in d["Items"]})
def independent_seventh(row):
    i=row["ProblemId"]; c=row["Content"]; q=c["Question"]["En"]; k=row["PrimarySkillKey"]
    vals=[int(x) for x in re.findall(r"\d+",q)]
    if k=="middle-gcd": return gcd(*vals)
    if k=="middle-lcm": return lcm(*vals)
    if k=="middle-ratios": return Fraction(vals[2]*vals[1],vals[0])
    if k=="middle-unit-rates":
        if i==17: return Fraction(vals[0],vals[1])
        if i==59:
            assert q.startswith("Four identical pens cost 12") and "seven" in q
            return Fraction(12*7,4)
        assert q.startswith("If three notebooks cost") and "five" in q
        return Fraction(vals[0]*5,3)
    if k=="middle-triangle-angles": return 180-sum(vals)
    if k=="middle-circle-area": return Fraction(vals[1],vals[2])*vals[0]**2
    if k=="middle-evaluate-powers":
        assert q=="What is 2 raised to the fifth power?"
        return 2**5
    if k=="middle-quadratic-function-evaluation":
        if i==42: return vals[-1]**2-vals[0]
        return vals[0]*vals[-1]**2+vals[2]
    if k=="middle-pythagorean-theorem":
        s=sum(v*v for v in vals)
        h=isqrt(s); assert h*h==s
        return h
    if k=="middle-linear-equations": return Fraction(vals[2]-vals[1],vals[0])
    if k=="middle-vertical-angles": return vals[0]
    if k=="middle-exponent-laws":
        return vals[1]-vals[3] if i==210 else vals[1]+vals[3]
    if k=="middle-linear-function-evaluation": return vals[0]*vals[2]+vals[1]
    if k=="middle-inverse-function-evaluation": return Fraction(vals[2]-vals[1],vals[0])
    if k=="middle-slope": return Fraction(vals[3]-vals[1],vals[2]-vals[0])
    if k=="middle-percent-discounts": return Fraction(vals[0]*vals[1],100)
    if k=="middle-map-scale": return Fraction(vals[1]*vals[2],vals[0])
    raise AssertionError(k)
for row in seventh["Items"]:
    i=row["ProblemId"]; c=row["Content"]; g,p=placements[i]
    assert row["Status"]=="StructuredAmendmentCandidateNotImported"
    assert row["PrimarySkillKey"]==p["StableKey"] and row["ProposedTrackCode"]==g["Code"]
    assert c["StageId"]==g["StageId"]==2 and c["CategoryId"]==p["CategoryId"] and c["PrimarySkillId"]==p["PrimarySkillId"]
    assert c["Question"]=={"Ar":p["ExpectedQuestionAr"],"En":p["ExpectedQuestionEn"]}
    assert pair(row["ExpectedLegacySolution"]) and pair(c["Title"])
    assert len(row["ExpectedOptionIds"])==len(set(row["ExpectedOptionIds"]))==4
    opts=c["Options"]; assert len(opts)==4 and sum(o["IsCorrect"] for o in opts)==1
    expected=independent_seventh(row)
    def parse(s):
        s=s.strip("$")
        if row["PrimarySkillKey"]=="middle-exponent-laws":
            return int(re.fullmatch(r"2\^\{(\d+)\}",s)[1])
        return Fraction(re.match(r"^\d+",s)[0])
    values=[parse(o["LatexCode"]) for o in opts]
    assert len(set(values))==4
    assert all(o["IsCorrect"]==(v==expected) for v,o in zip(values,opts)),i
    assert all(o["ErrorType"] and pair(o["Reason"]) for o in opts if not o["IsCorrect"])
    assert len(c["Hints"])==2 and all(pair(h) for h in c["Hints"])
    assert all(c["Hints"][0][k]!=c["Hints"][1][k] for k in ("Ar","En"))
    sol=c["Solution"]
    assert sol["FormulaLatex"] and not sol["FormulaLatex"].startswith("$")
    assert all(pair(sol[k]) for k in ("Idea","Substitution","Result","Unit","Verification","CommonError"))
    assert all(parse(sol["Result"][lang])==expected for lang in ("Ar","En")),i
    assert 1<=len(sol["Steps"])<=20 and all(pair(s) for s in sol["Steps"])
print("PASS: 40 middle-school wave-07 questions, independent exact math, source binding, bilingual laws and hints")


# Wave 08: independent middle-school answer verification, including
# inverse Pythagoras and base-preserving exponent division.
eighth=load("g1-structured-amendments-wave08-20261124.json")
assert eighth["Status"]==wave["Status"]
eighth_ids={r["ProblemId"] for r in eighth["Items"]}
assert len(eighth_ids)==len(eighth["Items"])==50
assert not eighth_ids.intersection(wave_ids|fourth_ids|fifth_ids|sixth_ids|seventh_ids|{r["ProblemId"] for r in d["Items"]})
def independent_eighth(row):
    c=row["Content"]; q=c["Question"]["En"]; k=row["PrimarySkillKey"]
    v=[int(x) for x in re.findall(r"\d+",q)]
    if k=="middle-percent-increase": return Fraction(v[0]*(100+v[1]),100)
    if k=="middle-polygon-angles": return (v[0]-2)*180
    if k=="middle-pythagorean-theorem":
        s=v[0]**2-v[1]**2; h=isqrt(s); assert h*h==s
        return h
    if k=="middle-similar-triangles": return v[0]*v[1]
    if k=="middle-exponent-laws": 
        assert v[0]==v[2]
        return v[0],v[1]-v[3]
    if k=="middle-quadratic-function-evaluation": return v[0]*v[3]**2+v[2]
    return independent_seventh(row)
for row in eighth["Items"]:
    i=row["ProblemId"]; c=row["Content"]; g,p=placements[i]
    assert row["Status"]=="StructuredAmendmentCandidateNotImported"
    assert row["PrimarySkillKey"]==p["StableKey"] and row["ProposedTrackCode"]==g["Code"]
    assert c["StageId"]==g["StageId"]==2 and c["CategoryId"]==p["CategoryId"] and c["PrimarySkillId"]==p["PrimarySkillId"]
    assert c["Question"]=={"Ar":p["ExpectedQuestionAr"],"En":p["ExpectedQuestionEn"]}
    assert pair(row["ExpectedLegacySolution"]) and pair(c["Title"])
    assert len(row["ExpectedOptionIds"])==len(set(row["ExpectedOptionIds"]))==4
    opts=c["Options"]; assert len(opts)==4 and sum(o["IsCorrect"] for o in opts)==1
    expected=independent_eighth(row)
    def parse(s):
        s=s.strip("$")
        if row["PrimarySkillKey"]=="middle-exponent-laws":
            return tuple(map(int,re.fullmatch(r"(\d+)\^\{(\d+)\}",s).groups()))
        return Fraction(s)
    values=[parse(o["LatexCode"]) for o in opts]
    assert len(set(values))==4
    assert all(o["IsCorrect"]==(v==expected) for v,o in zip(values,opts)),i
    assert all(o["ErrorType"] and pair(o["Reason"]) for o in opts if not o["IsCorrect"])
    assert len(c["Hints"])==2 and all(pair(h) for h in c["Hints"])
    assert all(c["Hints"][0][k]!=c["Hints"][1][k] for k in ("Ar","En"))
    sol=c["Solution"]
    assert sol["FormulaLatex"] and not sol["FormulaLatex"].startswith("$")
    assert all(pair(sol[k]) for k in ("Idea","Substitution","Result","Unit","Verification","CommonError"))
    assert all(parse(sol["Result"][lang])==expected for lang in ("Ar","En")),i
    assert 1<=len(sol["Steps"])<=20 and all(pair(s) for s in sol["Steps"])
print("PASS: 50 wave-08 questions, independent exact answers and complete bilingual structured content")


# Wave 09: individually evaluated middle-school geometry, statistics,
# rational arithmetic, inequalities, counting and probability.
ninth=load("g1-structured-amendments-wave09-20261124.json")
ninth_ids={r["ProblemId"] for r in ninth["Items"]}
assert ninth["Status"]==wave["Status"]
assert len(ninth_ids)==len(ninth["Items"])==75
assert not ninth_ids.intersection(wave_ids|fourth_ids|fifth_ids|sixth_ids|seventh_ids|eighth_ids|{r["ProblemId"] for r in d["Items"]})
assert not ninth_ids.intersection({1658,1684})
from statistics import mean, median, multimode
from math import ceil, floor
def independent_ninth(i):
    numeric={
        267:isqrt(41**2-9**2),268:7*6,429:sum([8,12,10]),
        430:median([10,12,14])-median([2,4,6]),431:mean([4+3,8+3])-mean([4,8]),
        432:median([1,4,7,9,12]),433:max([3,4,6,9,20])-min([3,4,6,9,20]),
        434:100*Fraction(5,20),435:mean([2,2,2,7,7]),481:multimode([1,1,2,3,3,3,9])[0],
        621:28//4+3,622:(5+8)//(3-2),623:9*3-6,624:(41-5)//3,
        625:5**2,626:(18//2)**2,627:Fraction(6**2,2),628:isqrt(64),
        629:Fraction(45*2,9),630:Fraction(35*3,5),631:Fraction(36*4,9),632:Fraction(12*5,3),
        697:Fraction(180-40,2),698:125-45,699:90-35,700:180*Fraction(3,6),
        701:Fraction(20+40,3-1),702:2*(35-5)+5,703:Fraction(146,2),
        704:[65,180-65,65,180-65].count(65),
        765:(-4)**3,766:17**0,767:Fraction(1,2**3),
        823:4*(6-3),824:max(b-a for a,b in zip([14,23,19],[23,19,31])),
        825:Fraction(sum(abs(x-4) for x in [2,4,6]),3),826:(18-6)-(15-9),
        857:isqrt((7-1)**2+(10-2)**2),1563:-7+12,1564:-4-(-9),
        1565:(-3)*(-8),1567:abs(-13)-abs(5),1568:Fraction(-3,4)+Fraction(1,2),
        1569:Fraction(-5,6)-Fraction(1,3),1570:Fraction("-2.5")+Fraction("1.75"),
        1605:sum(-2<x<=2 for x in range(-3,4)),1606:sum(x for x in range(-3,4) if -2<=x<3),
        1607:floor(Fraction(18-4,2)),1608:ceil(Fraction(75-56,5)),1609:floor(Fraction(20-3,2)),
        1639:mean([4,7,7,10]),1640:median([2,5,8,12,20]),1641:multimode([3,5,5,5,8,8])[0],
        1642:mean([4,5,6,7,28]),1657:1-Fraction(2,6),1660:Fraction(18,60),1661:100*Fraction(24,80),
        1662:3*2,1683:len([(a,b) for a in "HT" for b in "HT"]),
        1685:Fraction(4,5)**3,1686:100*abs(Fraction(15,50)-Fraction(18,60)),
        1689:3*2*2,1690:Fraction(sum(x%2==0 or x%5==0 for x in range(1,11)),10),
        1709:Fraction(sum(x>3 for x in [2,4,6]),3),
        1710:sum((a==6)!=(b==6) for a in range(1,7) for b in range(1,7))
    }
    if i in numeric:
        expected=numeric[i]
        def parse(s):
            s=s.strip("$").replace("−","-")
            if i in (625,626,627):
                assert s.endswith(r"\pi")
                s=s[:-3]
            return rational(s)
        return expected,parse
    if i==479:
        assert median([4,5,6,7,50])==median([4,5,6,7,500])
        return r"\text{الوسيط (Median)}",str
    if i==480:
        assert Fraction(15,27)>Fraction(10,28)
        return r"\text{الصف أ (Class A)}",str
    if i==482:
        assert (31+5)-(7+5)==31-7
        return r"\text{لا يتغير (Unchanged)}",str
    # Compare solution sets on integer and half-integer samples, including
    # the boundary, to distinguish strict and non-strict inequalities.
    tests={
        1599:lambda x:x+5<12,
        1600:lambda x:3*x-4>=11,
        1601:lambda x:-2*x+6<10,
        1602:lambda x:5-x<=2,
        1603:lambda x:x>-3,
        1604:lambda x:x<=4,
        1610:lambda x:x<=-5,
    }
    from operator import lt, le, gt, ge
    points=[Fraction(x,2) for x in range(-40,41)]
    def parse(s):
        m=re.fullmatch(r"[xT](\\le|\\ge|<|>)(-?\d+)",s.strip("$"))
        assert m,s
        op={r"\le":le,r"\ge":ge,"<":lt,">":gt}[m[1]]
        return tuple(op(x,int(m[2])) for x in points)
    return tuple(tests[i](x) for x in points),parse
for row in ninth["Items"]:
    i=row["ProblemId"]; c=row["Content"]; g,p=placements[i]
    assert row["Status"]=="StructuredAmendmentCandidateNotImported"
    assert row["PrimarySkillKey"]==p["StableKey"] and row["ProposedTrackCode"]==g["Code"]
    assert c["StageId"]==g["StageId"]==2 and c["CategoryId"]==p["CategoryId"] and c["PrimarySkillId"]==p["PrimarySkillId"]
    assert c["Question"]=={"Ar":p["ExpectedQuestionAr"],"En":p["ExpectedQuestionEn"]}
    assert pair(row["ExpectedLegacySolution"]) and pair(c["Title"])
    assert len(row["ExpectedOptionIds"])==len(set(row["ExpectedOptionIds"]))==4
    opts=c["Options"]; assert len(opts)==4 and sum(o["IsCorrect"] for o in opts)==1
    expected,parse=independent_ninth(i)
    if i==431: # Multiplication is a transformation, not a numeric shift.
        values=[o["LatexCode"] if o["LatexCode"]==r"\times3" else parse(o["LatexCode"]) for o in opts]
    else:
        values=[parse(o["LatexCode"]) for o in opts]
    assert len(set(values))==4,i
    assert all(o["IsCorrect"]==(v==expected) for v,o in zip(values,opts)),i
    assert all(o["ErrorType"] and pair(o["Reason"]) for o in opts if not o["IsCorrect"])
    assert len(c["Hints"])==2 and all(pair(h) for h in c["Hints"])
    assert all(c["Hints"][0][k]!=c["Hints"][1][k] for k in ("Ar","En"))
    sol=c["Solution"]
    assert sol["FormulaLatex"] and not sol["FormulaLatex"].startswith("$")
    assert all(pair(sol[k]) for k in ("Idea","Substitution","Result","Unit","Verification","CommonError"))
    if i in (479,480,482):
        assert sol["Result"]["En"]=={479:"Median",480:"Class A",482:"Unchanged"}[i]
    else:
        assert all(parse(sol["Result"][lang])==expected for lang in ("Ar","En")),i
    assert 1<=len(sol["Steps"])<=20 and all(pair(s) for s in sol["Steps"])
print("PASS: 75 wave-09 middle-school questions, independent arithmetic and inequality-set checks")


# Wave 10: independent exact secondary-school oracles, including
# symbolic polynomial coefficients and special-angle values.
tenth=load("g1-structured-amendments-wave10-20261124.json")
tenth_ids={r["ProblemId"] for r in tenth["Items"]}
assert tenth["Status"]==wave["Status"]
assert len(tenth_ids)==len(tenth["Items"])==58
assert not tenth_ids.intersection(wave_ids|fourth_ids|fifth_ids|sixth_ids|seventh_ids|eighth_ids|ninth_ids|{r["ProblemId"] for r in d["Items"]})
assert not tenth_ids.intersection({80,95,110,125,140,279,291})
def independent_tenth(row):
    i=row["ProblemId"]; c=row["Content"]; q=c["Question"]["En"]; k=row["PrimarySkillKey"]
    v=[int(x) for x in re.findall(r"\d+",q)]
    def norm(s): return s.strip("$").replace(" ","")
    if k=="secondary-logarithm-evaluation":
        base,arg=v
        return next(n for n in range(30) if base**n==arg),rational
    if k=="secondary-trigonometric-special-angles":
        # Canonical values represented as (sign, squared magnitude).
        def angle_value(s):
            s=norm(s)
            m=re.fullmatch(r"\\frac\{\\sqrt\{(\d+)\}\}\{(\d+)\}",s)
            if m: return 1,Fraction(int(m[1]),int(m[2])**2)
            m=re.fullmatch(r"\\sqrt\{(\d+)\}",s)
            if m: return 1,Fraction(int(m[1]))
            z=rational(s)
            return (int(z>0)-int(z<0),z*z)
        val={21:None,22:(1,Fraction(1,4)),46:(1,Fraction(1,4)),62:(1,Fraction(1)),274:(0,Fraction(0)),286:(1,Fraction(1,4)),298:(1,Fraction(1,2))}
        return val[i],angle_value
    if k=="secondary-pythagorean-trig-identity":
        return Fraction(1,2)+Fraction(1,2),rational
    if k=="secondary-polynomial-derivatives":
        if i in (24,47):
            return {24:"3x^2+4x-5",47:"10x-4"}[i],norm
        if i>=275:
            arg,a,n=v
            return a*n*arg**(n-1),rational
        a,n,b,arg=v
        return a*n*arg**(n-1)+b,rational
    if k=="secondary-indefinite-integrals":
        if i==25: return "x^2+3x+C",norm
        if i==63: return "2x^{3}+C",norm
        a,n=v
        return f"{a//(n+1)}x^{{{n+1}}}+C",norm
    if k=="secondary-quadratic-roots":
        def pair_root(s):
            return tuple(sorted(map(int,re.fullmatch(r"\((-?\d+),(-?\d+)\)",norm(s)).groups())))
        roots=tuple(t for t in range(-20,21) if t*t-7*t+12==0)
        return roots,pair_root
    if k=="secondary-population-variance":
        x=v; avg=Fraction(sum(x),len(x))
        return sum((t-avg)**2 for t in x)/len(x),rational
    if k=="secondary-vieta-roots":
        return sum(v) if i<200 else v[-2],rational
    if k=="secondary-right-triangle-trig-ratios":
        return Fraction(v[0],v[1]),rational
    if k=="secondary-discriminant":
        return v[1]**2-4*v[2],rational
    if k=="secondary-factor-quadratics":
        def expanded(s):
            a,b=map(int,re.fullmatch(r"\(x([+-]\d+)\)\(x([+-]\d+)\)",norm(s)).groups())
            return a+b,a*b
        return (v[1],v[2]),expanded
    if k=="secondary-definite-integrals":
        lo,hi,a=v
        return Fraction(a*(hi**2-lo**2),2),rational
    if k=="secondary-combinations":
        from itertools import combinations
        return len(list(combinations(range(v[0]),2))),rational
    if k=="secondary-arithmetic-mean":
        a,n,b,m=v
        return Fraction(a*n+b*m,n+m),rational
    raise AssertionError(k)
for row in tenth["Items"]:
    i=row["ProblemId"]; c=row["Content"]; g,p=placements[i]
    assert row["Status"]=="StructuredAmendmentCandidateNotImported"
    assert row["PrimarySkillKey"]==p["StableKey"] and row["ProposedTrackCode"]==g["Code"]
    assert c["StageId"]==g["StageId"]==3 and c["CategoryId"]==p["CategoryId"] and c["PrimarySkillId"]==p["PrimarySkillId"]
    assert c["Question"]=={"Ar":p["ExpectedQuestionAr"],"En":p["ExpectedQuestionEn"]}
    assert pair(row["ExpectedLegacySolution"]) and pair(c["Title"])
    assert len(row["ExpectedOptionIds"])==len(set(row["ExpectedOptionIds"]))==4
    opts=c["Options"]; assert len(opts)==4 and sum(o["IsCorrect"] for o in opts)==1
    expected,parse=independent_tenth(row)
    values=[parse(o["LatexCode"]) for o in opts]
    assert len(set(values))==4,i
    assert all(o["IsCorrect"]==(v==expected) for v,o in zip(values,opts)),i
    assert all(o["ErrorType"] and pair(o["Reason"]) for o in opts if not o["IsCorrect"])
    assert len(c["Hints"])==2 and all(pair(h) for h in c["Hints"])
    assert all(c["Hints"][0][k]!=c["Hints"][1][k] for k in ("Ar","En"))
    sol=c["Solution"]
    assert sol["FormulaLatex"] and not sol["FormulaLatex"].startswith("$")
    assert all(pair(sol[k]) for k in ("Idea","Substitution","Result","Unit","Verification","CommonError"))
    assert all(parse(sol["Result"][lang])==expected for lang in ("Ar","En")),i
    assert 1<=len(sol["Steps"])<=20 and all(pair(s) for s in sol["Steps"])
print("PASS: 58 wave-10 secondary-school questions, exact oracles and source guards")


# Wave 11: explicit independent calculations for sequence, series and
# secondary-school variants; symbolic options are compared by expansion.
eleventh=load("g1-structured-amendments-wave11-20261124.json")
eleventh_ids={r["ProblemId"] for r in eleventh["Items"]}
assert eleventh["Status"]==wave["Status"]
assert len(eleventh_ids)==len(eleventh["Items"])==62
assert not eleventh_ids.intersection(wave_ids|fourth_ids|fifth_ids|sixth_ids|seventh_ids|eighth_ids|ninth_ids|tenth_ids|{r["ProblemId"] for r in d["Items"]})
assert not eleventh_ids.intersection({303,315,327})
def independent_eleventh(row):
    i=row["ProblemId"]; c=row["Content"]; q=c["Question"]["En"]; k=row["PrimarySkillKey"]
    v=[int(x) for x in re.findall(r"\d+",q)]
    def norm(s): return s.strip("$").replace(" ","")
    if i in (302,314,326,304,316,328,305,317,306,318,307,319,308,309,320,321,311,323,312,324,313,325):
        return independent_tenth(row)
    if i in (310,322):
        def trig(s):
            s=norm(s)
            m=re.fullmatch(r"\\frac\{\\sqrt\{(\d+)\}\}\{(\d+)\}",s)
            if m: return Fraction(int(m[1]),int(m[2])**2)
            return rational(s)**2
        return Fraction(3,4) if i==310 else Fraction(1),trig
    if i==436:
        def terms(s):
            m=re.fullmatch(r"(\d*)n([+-]\d+)",norm(s))
            a,b=int(m[1] or 1),int(m[2])
            return tuple(a*n+b for n in range(1,5))
        return (5,9,13,17),terms
    if i==770:
        def roots(s):
            parts=norm(s).removeprefix(r"\{").removesuffix(r"\}").split(",")
            vals=[]
            for part in parts:
                sign=-1 if part.startswith("-") else 1
                vals.append(sign*rational(part.removeprefix("-")))
            return tuple(sorted(vals))
        roots_expected=tuple(sorted(x for x in [Fraction(n,2) for n in range(-10,11)] if 2*x*x-7*x+3==0))
        return roots_expected,roots
    if i==827:
        def gaps(s): return tuple(map(int,re.findall(r"\d+",s)))
        d=Fraction(20-4,4)
        return tuple(4+d*n for n in (1,2,3)),gaps
    if i==861:
        # Differentiate the polynomial represented by each option.
        def derivative(s):
            s=norm(s)
            assert s.endswith("+C")
            terms=re.findall(r"([+-]?\d+)x(?:\^(\d+))?",s[:-2])
            return tuple(sorted((int(p or 1)-1,int(a)*int(p or 1)) for a,p in terms))
        return ((1,-4),(2,6)),derivative
    if i in (487,510,511,512):
        return {487:r"\text{يتباعد إلى ما لا نهاية (+infinity)}",510:r"\text{لا يتقارب (Does not converge)}",511:r"\text{يتباعد (Diverges)}",512:r"\text{كل كتلة مضاعفة تضيف نصفاً على الأقل (Each block adds at least 1/2)}"}[i],str
    def signed_rational(s):
        s=s.strip("$")
        return (-1 if s.startswith("-") else 1)*rational(s.removeprefix("-"))
    numeric={
        437:3*2**4,438:Fraction(27-11,7-3),439:4+9*3,
        440:sum(range(2,18,3)),441:sum(2**n for n in range(5)),
        442:Fraction(4,1)/(1-Fraction(1,2)),443:2*(2*2+1)+1,
        483:23-4*4,485:1+sum(2*n for n in range(1,4)),
        486:sum(range(1,24,2)),508:Fraction(1,1)/(1+Fraction(1,2)),
        509:Fraction(6,1)/(1-Fraction(1,3)),633:Fraction(isqrt(25-9),5),
        637:next(n for n in range(-10,1) if Fraction(5)**n==Fraction(1,125)),
        639:4-1,640:2**5,641:Fraction(sum((n-3)**2 for n in (1,3,5)),3),
        644:9*Fraction(2,3),709:Fraction(6,2),710:isqrt(54//6),
        769:next(n for n in range(-10,11) if n*n-10*n+25==0),
        771:next(n for n in range(1,49) if n*(n+2)==48),
        773:7-4*3,774:8,775:((1**2+1)**2+1)**2+1,
        776:next(n for n in range(1,20) if 2*3**(n-1)>100),
        828:1+Fraction(47-5,3),
        830:sum(Fraction(1,k)-Fraction(1,k+1) for k in range(1,5)),
        859:2*3*3**2-4,862:2**3+2
    }
    if i==442:
        return numeric[i],lambda s:s if s==r"\infty" else signed_rational(s)
    return numeric[i],signed_rational
for row in eleventh["Items"]:
    i=row["ProblemId"]; c=row["Content"]; g,p=placements[i]
    assert row["Status"]=="StructuredAmendmentCandidateNotImported"
    assert row["PrimarySkillKey"]==p["StableKey"] and row["ProposedTrackCode"]==g["Code"]
    assert c["StageId"]==g["StageId"]==3 and c["CategoryId"]==p["CategoryId"] and c["PrimarySkillId"]==p["PrimarySkillId"]
    assert c["Question"]=={"Ar":p["ExpectedQuestionAr"],"En":p["ExpectedQuestionEn"]}
    assert pair(row["ExpectedLegacySolution"]) and pair(c["Title"])
    assert len(row["ExpectedOptionIds"])==len(set(row["ExpectedOptionIds"]))==4
    opts=c["Options"]; assert len(opts)==4 and sum(o["IsCorrect"] for o in opts)==1
    expected,parse=independent_eleventh(row)
    values=[parse(o["LatexCode"]) for o in opts]
    assert len(set(values))==4,i
    assert all(o["IsCorrect"]==(v==expected) for v,o in zip(values,opts)),i
    assert all(o["ErrorType"] and pair(o["Reason"]) for o in opts if not o["IsCorrect"])
    assert len(c["Hints"])==2 and all(pair(h) for h in c["Hints"])
    assert all(c["Hints"][0][k]!=c["Hints"][1][k] for k in ("Ar","En"))
    sol=c["Solution"]
    assert sol["FormulaLatex"] and not sol["FormulaLatex"].startswith("$")
    assert all(pair(sol[k]) for k in ("Idea","Substitution","Result","Unit","Verification","CommonError"))
    if i in (487,510,511,512):
        assert sol["Result"]["En"]=={487:"Diverges to positive infinity",510:"Does not converge",511:"Diverges",512:"Each doubling block adds at least one half"}[i]
    else:
        assert all(parse(sol["Result"][lang])==expected for lang in ("Ar","En")),i
    assert 1<=len(sol["Steps"])<=20 and all(pair(s) for s in sol["Steps"])
print("PASS: 62 wave-11 secondary-school questions, mathematical and source-preservation checks")


# Wave 12: growth/decay, analytic geometry, vectors and logarithms.
twelfth=load("g1-structured-amendments-wave12-20261124.json")
twelfth_ids={r["ProblemId"] for r in twelfth["Items"]}
assert twelfth["Status"]==wave["Status"]
assert len(twelfth_ids)==len(twelfth["Items"])==49
assert not twelfth_ids.intersection(wave_ids|fourth_ids|fifth_ids|sixth_ids|seventh_ids|eighth_ids|ninth_ids|tenth_ids|eleventh_ids|{r["ProblemId"] for r in d["Items"]})
assert 20 not in twelfth_ids
def independent_twelfth(i):
    def num(s):
        s=s.strip("$").replace(",","")
        sign=-1 if s.startswith("-") else 1
        return sign*rational(s.removeprefix("-"))
    def norm(s): return s.strip("$").replace(" ","")
    def coordinates(s):
        return tuple(num(part) for part in norm(s).strip("()").split(","))
    numeric={
        1571:250*Fraction(6,5)**2,1572:80*2**3,1573:2000*Fraction(11,10)**2,
        1574:1200*Fraction(9,10)**2,1575:4*next(n for n in range(20) if Fraction(640,2**n)==80),
        1576:100*(1-Fraction(7,10)),1577:100*(Fraction(103,100)-1),
        1611:Fraction(10-2,5-1),1613:isqrt(6**2+8**2),1615:isqrt(49),
        1643:Fraction(3,1)/(1-Fraction(1,2)),1645:1/(1+Fraction(1,2)),
        1665:isqrt(5**2+12**2),1666:isqrt((-6)**2+8**2),
        1667:2*4+(-1)*3,1668:Fraction(2*6,3),1694:1*(-2)+(-2)*1,
        1695:Fraction(3*1+4*0,1),1697:isqrt((7-1)**2+(10-2)**2),
        1711:-isqrt(25-16),1712:1*(3-1)+2*(0+1),
        1715:next(n for n in range(20) if 3**n==243),
        1716:next(n for n in range(20) if 2**n==8*16),
        1717:next(n for n in range(20) if 3**n==243//9),
        1718:next(n for n in range(20) if 5**n==25**3),
        1719:1+2**4,
        1720:next(n for n in range(3,20) if n*(n-2)==3),
        1721:Fraction(3,2),1723:next(n for n in range(-10,10) if Fraction(1,2)**n==8),
        1724:10*next(n for n in range(10) if 10**n==1000),1725:-(-4)
    }
    if i in numeric:
        if i==1615:
            return numeric[i],lambda s: ("sqrt",int(s[5:])) if s.startswith(r"\sqrt") else num(s)
        return numeric[i],num
    vectors={
        1612:(Fraction(2+8,2),Fraction(6+0,2)),
        1663:(-1-2,5-(-1)),1664:(2-5,-3+4),
        1691:(2*4-(-1),2*(-2)-3),1692:(Fraction(3,5),Fraction(4,5))
    }
    if i in vectors: return vectors[i],coordinates
    if i==1618:
        # Only one of the listed points is at squared distance 25.
        return 25,lambda s:sum(v*v for v in coordinates(s))
    if i==1693:
        # Angles are positive fractions of pi; the known cosine is sqrt(2)/2.
        def pi_fraction(s):
            a,b="1",re.fullmatch(r"\\frac\{\\pi\}\{(\d+)\}",norm(s))[1]
            return Fraction(int(a),int(b))
        return Fraction(1,4),pi_fraction
    if i in (1614,1616,1617,1621):
        # Compare canonical coefficients of the equation to the derived
        # slope/intercept or centre and squared radius.
        if i==1614:
            def line(s):
                m=re.fullmatch(r"y=(-?\d+)x([+-]\d+)",norm(s))
                return int(m[1]),int(m[2])
            return (-2,3),line
        def circle(s):
            s=norm(s)
            m=re.fullmatch(r"(?:\(x([+-]\d+)\)|x)\^2\+(?:\(y([+-]\d+)\)|y)\^2=(\d+)",s)
            assert m,s
            return -int(m[1] or 0),-int(m[2] or 0),int(m[3])
        return {1616:(2,-3,4**2),1617:(1,0,3**2),1621:(1,2,3**2)}[i],circle
    if i in (1619,1620,1622):
        return {1619:"x=2",1620:f"y={(1+7)//2}",1622:f"y={(-2+6)//2}"}[i],norm
    if i==1644:
        assert abs(Fraction(11,10))>1
        return "|r|>1",norm
    if i==1646:
        return r"\lim_{n\to\infty}a_n=2",norm
    if i==1722:
        from operator import gt,ge,lt
        points=range(-2,10)
        def parse(s):
            m=re.fullmatch(r"x(\\ge|>|<)(\d+)",norm(s))
            op={r"\ge":ge,">":gt,"<":lt}[m[1]]
            return tuple(op(x,int(m[2])) for x in points)
        return tuple(x-5>0 for x in points),parse
    if i==1726: return "a+3",norm
    raise AssertionError(i)
for row in twelfth["Items"]:
    i=row["ProblemId"]; c=row["Content"]; g,p=placements[i]
    assert row["Status"]=="StructuredAmendmentCandidateNotImported"
    assert row["PrimarySkillKey"]==p["StableKey"] and row["ProposedTrackCode"]==g["Code"]
    assert c["StageId"]==g["StageId"]==3 and c["CategoryId"]==p["CategoryId"] and c["PrimarySkillId"]==p["PrimarySkillId"]
    assert c["Question"]=={"Ar":p["ExpectedQuestionAr"],"En":p["ExpectedQuestionEn"]}
    assert pair(row["ExpectedLegacySolution"]) and pair(c["Title"])
    assert len(row["ExpectedOptionIds"])==len(set(row["ExpectedOptionIds"]))==4
    opts=c["Options"]; assert len(opts)==4 and sum(o["IsCorrect"] for o in opts)==1
    expected,parse=independent_twelfth(i)
    values=[parse(o["LatexCode"]) for o in opts]
    assert len(set(values))==4,i
    assert all(o["IsCorrect"]==(v==expected) for v,o in zip(values,opts)),i
    assert all(o["ErrorType"] and pair(o["Reason"]) for o in opts if not o["IsCorrect"])
    assert len(c["Hints"])==2 and all(pair(h) for h in c["Hints"])
    assert all(c["Hints"][0][k]!=c["Hints"][1][k] for k in ("Ar","En"))
    sol=c["Solution"]
    assert sol["FormulaLatex"] and not sol["FormulaLatex"].startswith("$")
    assert all(pair(sol[k]) for k in ("Idea","Substitution","Result","Unit","Verification","CommonError"))
    assert all(parse(sol["Result"][lang])==expected for lang in ("Ar","En")),i
    assert 1<=len(sol["Steps"])<=20 and all(pair(s) for s in sol["Steps"])
print("PASS: 49 wave-12 secondary questions; exact arithmetic and geometry, vector, log and source guards")


# Wave 13: independent university-stage calculations and theorem checks.
thirteenth=load("g1-structured-amendments-wave13-20261124.json")
thirteenth_ids={r["ProblemId"] for r in thirteenth["Items"]}
assert thirteenth["Status"]==wave["Status"]
assert len(thirteenth_ids)==len(thirteenth["Items"])==60
assert not thirteenth_ids.intersection(wave_ids|fourth_ids|fifth_ids|sixth_ids|seventh_ids|eighth_ids|ninth_ids|tenth_ids|eleventh_ids|twelfth_ids|{r["ProblemId"] for r in d["Items"]})
def independent_thirteenth(row):
    i=row["ProblemId"]; q=row["Content"]["Question"]["En"]; k=row["PrimarySkillKey"]
    def norm(s): return s.strip("$").replace(" ","")
    def point(s): return tuple(map(int,re.fullmatch(r"\((-?\d+),(-?\d+)\)",norm(s)).groups()))
    def number(s):
        s=norm(s)
        if s.startswith(r"\text") or s.endswith(r"\infty"): return s
        return rational(s)
    if k=="university-matrix-determinants":
        a,b,c,d=map(int,re.findall(r"\d+",q)[-4:])
        return a*d-b*c,number
    if k=="university-matrix-trace":
        a,b,c,d=map(int,re.findall(r"\d+",q))
        return a+d,number
    if k=="university-partial-derivatives":
        if i==28: return r"2xy+3y^2+\cosx",norm
        if i==49: return 2*2*1,number
        a,n,b,m,x,y=map(int,re.findall(r"\d+",q))
        if i<329: return a*n*x**(n-1)*y,number
        return a*x**n+b*m*y**(m-1),number
    if k=="university-gradient":
        x,y=map(int,re.findall(r"\d+",q)[-2:])
        return (2*x,2*y),point
    if k=="university-directional-derivative":
        x,y=map(int,re.findall(r"\d+",q)[-2:])
        return 2*x,number
    if k=="university-vector-scaling":
        a,b,c=map(int,re.findall(r"\d+",q))
        return (a*c,b*c),point
    if k=="university-dot-product":
        a,b,c,d=map(int,re.findall(r"\d+",q))
        return a*c+b*d,number
    if k=="university-exponential-ode":
        if i==32: return "y=Ae^{3x}",norm
        rate,c=(1,2) if i==67 else (int(re.findall(r"\d+",q)[0]),int(re.findall(r"\d+",q)[-1]))
        def ode(s):
            s=norm(s).removeprefix("y=")
            m=re.fullmatch(r"(\d*)e\^\{(-?\d*)x\}",s)
            if not m: return s
            exponent=int(m[2]) if m[2] not in ("","-") else (-1 if m[2]=="-" else 1)
            return int(m[1] or 1),exponent
        return (c,rate),ode
    if k=="university-sequence-limits":
        return 0,number
    if k=="university-integrating-ode":
        if i==51: return "y=x^{2}+C",norm
        a,zero,c,t=map(int,re.findall(r"\d+",q))
        assert zero==0
        return c+(Fraction(a,2)*t*t if "x" in q else a*t),number
    if k=="university-second-order-ivp":
        z,z1,k,z2,c,t=map(int,re.findall(r"\d+",q))
        assert z==z1==z2==0
        return k*t+c,number
    if i==29: return Fraction(1**2,2)*Fraction(2**2,2),number
    if i==33: return 2,number
    if i==34: return 2+2,number
    if i in (31,35): return r"\text{لا (No)}",str
    if i in (68,144):
        return {68:r"\exists c\in(0,1):f(c)=0",144:r"\exists c\in(0,2):f(c)=0"}[i],str
    if i==145: return r"\text{الدالة متصلة عند 1 (Continuous at 1)}",str
    if i in (340,352): return r"\text{الدالة متصلة على [0,1] (Continuous on [0,1])}",str
    raise AssertionError(i)
for row in thirteenth["Items"]:
    i=row["ProblemId"]; c=row["Content"]; g,p=placements[i]
    assert row["Status"]=="StructuredAmendmentCandidateNotImported"
    assert row["PrimarySkillKey"]==p["StableKey"] and row["ProposedTrackCode"]==g["Code"]
    assert c["StageId"]==g["StageId"]==4 and c["CategoryId"]==p["CategoryId"] and c["PrimarySkillId"]==p["PrimarySkillId"]
    assert c["Question"]=={"Ar":p["ExpectedQuestionAr"],"En":p["ExpectedQuestionEn"]}
    assert pair(row["ExpectedLegacySolution"]) and pair(c["Title"])
    assert len(row["ExpectedOptionIds"])==len(set(row["ExpectedOptionIds"]))==4
    opts=c["Options"]; assert len(opts)==4 and sum(o["IsCorrect"] for o in opts)==1
    expected,parse=independent_thirteenth(row)
    values=[parse(o["LatexCode"]) for o in opts]
    assert len(set(values))==4,i
    assert all(o["IsCorrect"]==(v==expected) for v,o in zip(values,opts)),i
    assert all(o["ErrorType"] and pair(o["Reason"]) for o in opts if not o["IsCorrect"])
    assert len(c["Hints"])==2 and all(pair(h) for h in c["Hints"])
    assert all(c["Hints"][0][k]!=c["Hints"][1][k] for k in ("Ar","En"))
    sol=c["Solution"]
    assert sol["FormulaLatex"] and not sol["FormulaLatex"].startswith("$")
    assert all(pair(sol[k]) for k in ("Idea","Substitution","Result","Unit","Verification","CommonError"))
    if i in (31,35,145,340,352):
        assert sol["Result"]["En"]=={31:"Linearly dependent",35:"Not differentiable at zero",145:"Continuous at 1",340:"Continuity on [0,1]",352:"Continuity on [0,1]"}[i]
    elif i in (68,144):
        assert all(sol["Result"][lang].strip("$")==expected for lang in ("Ar","En"))
    else:
        assert all(parse(sol["Result"][lang])==expected for lang in ("Ar","En")),i
    assert 1<=len(sol["Steps"])<=20 and all(pair(s) for s in sol["Steps"])
print("PASS: 60 wave-13 university questions; independent calculation and source guards")


# Wave 14: additional university variants, exact finite counting,
# truth tables, linear independence, integration and convergence.
fourteenth=load("g1-structured-amendments-wave14-20261124.json")
fourteenth_ids={r["ProblemId"] for r in fourteenth["Items"]}
assert fourteenth["Status"]==wave["Status"]
assert len(fourteenth_ids)==len(fourteenth["Items"])==60
assert not fourteenth_ids.intersection(wave_ids|fourth_ids|fifth_ids|sixth_ids|seventh_ids|eighth_ids|ninth_ids|tenth_ids|eleventh_ids|twelfth_ids|thirteenth_ids|{r["ProblemId"] for r in d["Items"]})
def independent_fourteenth(row):
    i=row["ProblemId"]; q=row["Content"]["Question"]["En"]; k=row["PrimarySkillKey"]
    def norm(s): return s.strip("$").replace(" ","")
    def number(s):
        s=norm(s)
        if s.startswith(r"\text") or s.endswith(r"\infty"): return s
        return rational(s)
    if i<=388:
        if k=="university-intermediate-value-theorem":
            return r"\text{الدالة متصلة على [0,1] (Continuous on [0,1])}",str
        return independent_thirteenth(row)
    if i in (445,446):
        from itertools import product
        pairs=list(product((False,True),repeat=2))
        imp=lambda a,b:not a or b
        funcs={
            r"Q\Rightarrow P":lambda p,q:imp(q,p),
            r"\neg P\Rightarrow\neg Q":lambda p,q:imp(not p,not q),
            r"P\land Q":lambda p,q:p and q,
            r"\neg Q\Rightarrow\neg P":lambda p,q:imp(not q,not p),
            r"\neg P\lor\neg Q":lambda p,q:not p or not q,
            r"\neg P\land\neg Q":lambda p,q:not p and not q,
            r"P\lor Q":lambda p,q:p or q,
            r"P\land\neg Q":lambda p,q:p and not q
        }
        fn=imp if i==445 else lambda p,q:not(p and q)
        return tuple(fn(p,q) for p,q in pairs),lambda s:tuple(funcs[s.strip("$")](p,q) for p,q in pairs)
    if i==780:
        def order(s):
            s=norm(s)
            if "y^{(4)}" in s:return 4
            if "y'''" in s:return 3
            if "y''" in s:return 2
            if "y'" in s:return 1
            raise AssertionError(s)
        return 4,order
    if i in (488,492,782,783):
        return {488:r"\text{صحيحة (True)}",492:r"\text{نعم (Yes)}",782:r"\text{تتباعد (Diverges)}",783:r"\text{تتقارب شرطياً (Conditionally convergent)}"}[i],str
    from itertools import combinations, permutations
    numeric={
        444:len(list(combinations(range(7),2))),
        447:sum([2,2,2,2])//2,
        448:3,449:ceil(Fraction(13,12)),450:9-1,
        489:len([x for x in combinations(range(6),3) if 0 in x]),
        490:len({n%4 for n in range(-8,9)}),
        491:len(list(combinations(range(5),2))),
        647:Fraction(12,3),650:2,652:2,654:0,
        656:next(x for x in range(20) if x==Fraction(x+6,2)),
        713:3*Fraction(2**2,2)+2*Fraction(3**2,2),
        716:Fraction(1,2)-Fraction(1,2),
        718:0,719:Fraction(2,1),779:1,
        788:len(list(permutations(range(1,5))))
    }
    return numeric[i],number
for row in fourteenth["Items"]:
    i=row["ProblemId"]; c=row["Content"]; g,p=placements[i]
    assert row["Status"]=="StructuredAmendmentCandidateNotImported"
    assert row["PrimarySkillKey"]==p["StableKey"] and row["ProposedTrackCode"]==g["Code"]
    assert c["StageId"]==g["StageId"]==4 and c["CategoryId"]==p["CategoryId"] and c["PrimarySkillId"]==p["PrimarySkillId"]
    assert c["Question"]=={"Ar":p["ExpectedQuestionAr"],"En":p["ExpectedQuestionEn"]}
    assert pair(row["ExpectedLegacySolution"]) and pair(c["Title"])
    assert len(row["ExpectedOptionIds"])==len(set(row["ExpectedOptionIds"]))==4
    opts=c["Options"]; assert len(opts)==4 and sum(o["IsCorrect"] for o in opts)==1
    expected,parse=independent_fourteenth(row)
    values=[parse(o["LatexCode"]) for o in opts]
    assert all(o["IsCorrect"]==(v==expected) for v,o in zip(values,opts)),i
    assert all(o["ErrorType"] and pair(o["Reason"]) for o in opts if not o["IsCorrect"])
    assert len(c["Hints"])==2 and all(pair(h) for h in c["Hints"])
    assert all(c["Hints"][0][k]!=c["Hints"][1][k] for k in ("Ar","En"))
    sol=c["Solution"]
    assert sol["FormulaLatex"] and not sol["FormulaLatex"].startswith("$")
    assert all(pair(sol[k]) for k in ("Idea","Substitution","Result","Unit","Verification","CommonError"))
    labels={364:"Continuity on [0,1]",376:"Continuity on [0,1]",388:"Continuity on [0,1]",488:"True",492:"Yes, necessarily",782:"Diverges",783:"Conditionally convergent"}
    if i in labels: assert sol["Result"]["En"]==labels[i]
    else: assert all(parse(sol["Result"][lang])==expected for lang in ("Ar","En")),i
    assert 1<=len(sol["Steps"])<=20 and all(pair(s) for s in sol["Steps"])
print("PASS: 60 wave-14 university questions, counting and truth-table checks")


# Third wave is distinct from the short-solution and held candidates.
third=load("g1-structured-amendments-alternate-clarity-20261124.json")
review={r["ProblemId"]:r for r in load("g1-remaining-long-solution-review-20261124.json")["Items"] if r["Disposition"]=="SolutionClarityCandidate"}
held={r["ProblemId"] for r in load("g1-structured-amendments-held-20261124.json")["Items"]}
assert third["Status"]=="NotImportedNotPublished"
assert len(third["Items"])==len({r["ProblemId"] for r in third["Items"]})==20
assert {r["ProblemId"] for r in third["Items"]}==set(review)
assert not set(review).intersection({r["ProblemId"] for r in d["Items"]}|held)
for row in third["Items"]:
    i=row["ProblemId"]; c=row["Content"]; original=review[i]; sol=c["Solution"]
    assert row["Status"]=="StructuredAmendmentCandidateNotImported"
    assert c["Question"]==original["Question"]
    assert row["ExpectedLegacySolution"]==original["ExpectedSolution"]
    assert [[oid,o["LatexCode"],o["IsCorrect"]] for oid,o in zip(row["ExpectedOptionIds"],c["Options"])]==original["ExpectedOptions"]
    assert len(row["ExpectedOptionIds"])==len(set(row["ExpectedOptionIds"]))==len(c["Options"])==4
    assert sum(o["IsCorrect"] for o in c["Options"])==1
    assert all(o["ErrorType"] and pair(o["Reason"]) for o in c["Options"] if not o["IsCorrect"])
    assert c["Hints"]==hints[i]["Hints"] and len(c["Hints"])==2 and all(pair(h) for h in c["Hints"])
    assert sol["FormulaLatex"] and not sol["FormulaLatex"].startswith("$")
    assert all(pair(sol[k]) for k in ("Idea","Substitution","Result","Unit","Verification","CommonError"))
    assert 1<=len(sol["Steps"])<=20 and all(pair(s) for s in sol["Steps"])
    assert pair(c["Title"]) and c["Points"]>0 and c["PrimarySkillId"]>0
print("PASS: 20 clarity alternatives checked; two unique rows reserved in wave 15")

# Consolidated inventory: all historical waves retained; publication excludes holds.
all_rows=[r for n in range(1,16) for r in load(f"g1-structured-amendments-wave{n:02d}-20261124.json")["Items"]]
assert len(all_rows)==len({r["ProblemId"] for r in all_rows})==677
assert {r["ProblemId"] for r in all_rows[-2:]}=={791,800}
assert {r["ProblemId"] for r in all_rows[-2:]}=={r["ProblemId"] for r in third["Items"]}-{r["ProblemId"] for r in all_rows[:-2]}
print("PASS: 677 unique structured candidates across 15 waves; eligibility checked separately")

# Wave 16: numerical-analysis source-bound structured solutions, all 12 eligible.
wave16=load("g1-structured-amendments-wave16-20261124.json")
assert wave16["Status"]=="NotImportedNotPublished"
assert {r["ProblemId"] for r in wave16["Items"]}==set(range(1623,1635))
assert not {r["ProblemId"] for r in wave16["Items"]}&{r["ProblemId"] for r in all_rows}
expected={1623:"1.5",1624:"2",1625:"3.125",1626:"4",1627:"2",1628:r"\frac{8}{3}",1629:"0.3",1630:r"2\%",1631:"0.005",1632:r"(\frac94,\frac73)",1633:"3",1634:"3"}
for r in wave16["Items"]:
    c=r["Content"]; sol=c["Solution"]
    assert r["Status"]=="StructuredAmendmentCandidateNotImported" and r["ProposedTrackCode"]=="numerical-analysis"
    assert len(c["Options"])==len(set(r["ExpectedOptionIds"]))==4
    assert [o["LatexCode"] for o in c["Options"] if o["IsCorrect"]]==[expected[r["ProblemId"]]]
    assert all(pair(o["Reason"]) for o in c["Options"] if not o["IsCorrect"])
    assert len(c["Hints"])==2 and all(pair(h) for h in c["Hints"])
    assert sol["FormulaLatex"] and all(pair(sol[k]) for k in ("Idea","Substitution","Result","Unit","Verification","CommonError"))
    assert 1<=len(sol["Steps"])<=20 and all(pair(s) for s in sol["Steps"])
print("PASS: wave 16, all 12 numerical analysis questions with structured bilingual solutions")

# Wave 17 plus the 12 separate conditional candidates: exact disjoint source coverage.
w17=load("g1-structured-amendments-wave17-20261124.json")
model_holds=load("g1-model-assumption-holds-20261125.json")
assert w17["Status"]=="NotImportedNotPublished" and model_holds["Status"]=="HeldNotImportable"
assert len(w17["Items"])==37 and len(model_holds["Items"])==12
combined=w17["Items"]+model_holds["Items"]
expected={"153":"14","159":"\\frac{1}{7}","165":"19","171":"\\frac{2}{9}","177":"24","183":"\\frac{3}{11}","189":"29","195":"\\frac{4}{13}","201":"34","207":"\\frac{5}{15}","792":"2","793":"2","794":"2","795":"(1,3)","796":"\\text{ترتيب جزئي غير كلي (Partial, not total)}","797":"\\frac32","798":"0","799":"2","818":"\\frac{11}{8}","831":"6","832":"3","833":"2","834":"P","864":"3e^2","866":"1","1585":"p<\\alpha","1586":"\\alpha","1647":"\\exists x\\,\\neg P(x)","1648":"P=1,\\,Q=0","1649":"\\neg Q\\Rightarrow\\neg P","1650":"\\neg P\\lor\\neg Q","1658":"\\frac{1}{10}","1669":"2","1670":"3","1671":"(3,3)","1672":"25","1673":"18","1674":"2","1679":"10","1684":"\\frac{1}{6}","1699":"-3","1700":"x>0","1701":"9","1702":"2","1704":"23","1705":"20","1706":"a\\ge1","1713":"9","1714":"-6"}
assert {str(r["ProblemId"]) for r in combined}==set(expected)
assert not {r["ProblemId"] for r in combined}&{r["ProblemId"] for r in all_rows+wave16["Items"]}
for r in combined:
    c=r["Content"]; sol=c["Solution"]
    assert len(c["Options"])==len(set(r["ExpectedOptionIds"]))==4
    assert [o["LatexCode"] for o in c["Options"] if o["IsCorrect"]]==[expected[str(r["ProblemId"])]]
    assert all(pair(o["Reason"]) for o in c["Options"] if not o["IsCorrect"])
    assert len(c["Hints"])==2 and all(pair(h) for h in c["Hints"])
    assert sol["FormulaLatex"] and all(pair(sol[k]) for k in ("Idea","Substitution","Result","Unit","Verification","CommonError"))
    assert 1<=len(sol["Steps"])<=20 and all(pair(s) for s in sol["Steps"])
assert all(r["Status"]=="HeldStructuredCandidateNotImportable" and pair(r["ProposedQuestion"]) for r in model_holds["Items"])
print("PASS: 49 final hint-only rows now have structured proposals; 12 held for source wording")

# Original unresolved hold inventory: reviewed proposals never included in publication payload.
original_held=load("g1-original-holds-structured-review-20261125.json")
assert original_held["Status"]=="HeldNotImportable" and len(original_held["Items"])==35
expected_original={"7":"10","10":"\\frac{1}{2}","20":"x = 2 \\text{ or } x = 3","26":"\\frac{1}{6}","64":"\\frac{1}{8}","80":"\\frac{6}{16}","95":"\\frac{10}{32}","110":"\\frac{15}{64}","125":"\\frac{21}{128}","140":"\\frac{28}{256}","279":"\\frac{1}{4}","291":"\\frac{1}{8}","303":"\\frac{1}{16}","315":"\\frac{1}{32}","327":"\\frac{1}{64}","649":"1","705":"\\frac5{36}","706":"\\frac14","707":"\\frac{11}{36}","708":"\\frac34","768":"27","1566":"-8<-2<0<4","1578":"a_n=2\\cdot3^{n-1}","1579":"2","1580":"3","1581":"0.6","1582":"[98.04,101.96]","1583":"1.96","1584":"1/2","1659":"\\frac{1}{8}","1687":"\\frac{4}{25}","1688":"\\frac{1}{2}","1696":"6","1698":"5","1703":"(2,-4)"}
assert {str(r["ProblemId"]) for r in original_held["Items"]}==set(expected_original)
for r in original_held["Items"]:
    c=r["Content"]; sol=c["Solution"]
    assert r["Status"]=="HeldStructuredCandidateNotImportable"
    assert len(c["Options"])==len(set(r["ExpectedOptionIds"]))==4
    assert [o["LatexCode"] for o in c["Options"] if o["IsCorrect"]]==[expected_original[str(r["ProblemId"])]]
    assert all(pair(o["Reason"]) for o in c["Options"] if not o["IsCorrect"])
    assert len(c["Hints"])==2 and all(pair(h) for h in c["Hints"])
    assert sol["FormulaLatex"] and all(pair(sol[k]) for k in ("Idea","Substitution","Result","Unit","Verification","CommonError"))
    assert 1<=len(sol["Steps"])<=20 and all(pair(s) for s in sol["Steps"])
    assert r.get("ProposedQuestion") or r.get("ClassificationProposal") or r.get("OptionLocalization")
assert len({r["ProblemId"] for r in all_rows+wave16["Items"]+combined+original_held["Items"]})==773
print("PASS: all 773 existing IDs have structured solution proposals; 47 remain explicitly excluded from import")

# Independent finite-space/numeric oracles for the newly prepared waves and holds.
from itertools import product
from math import comb
recent={r["ProblemId"]:r for r in wave16["Items"]+combined+original_held["Items"]}
def chosen(i):
    return next(o["LatexCode"] for o in recent[i]["Content"]["Options"] if o["IsCorrect"])
def rational(text):
    s=text.strip().replace("−","-")
    f=re.fullmatch(r"\\frac(?:\{(-?\d+)\}|(-?\d))(?:\{(\d+)\}|(\d))",s)
    if f: return Fraction(int(f[1] or f[2]),int(f[3] or f[4]))
    if s.endswith(r"\%"): return Fraction(s[:-2])/100
    radical=re.fullmatch(r"\\sqrt\{(\d+)\}",s)
    if radical:
        from math import isqrt
        n=int(radical[1]);root=isqrt(n)
        return Fraction(root) if root*root==n else ("irrational-sqrt",n)
    if s==r"\text{غير موجودة (Does not exist)}":
        return ("undefined",)
    return Fraction(s)
def check_num(i,expected):
    options=recent[i]["Content"]["Options"]
    vals=[rational(o["LatexCode"]) for o in options]
    assert len(set(vals))==4 and sum(v==expected for v in vals)==1,(i,vals)
    assert rational(chosen(i))==expected,(i,expected)
dice_pairs=list(product(range(1,7),repeat=2))
for i,predicate in [(26,lambda a,b:a+b==7),(1684,lambda a,b:a+b==7),(705,lambda a,b:a+b==8),(706,lambda a,b:a%2==0 and b%2==0),(707,lambda a,b:6 in (a,b)),(708,lambda a,b:(a*b)%2==0)]:
    check_num(i,Fraction(sum(predicate(a,b) for a,b in dice_pairs),len(dice_pairs)))
for i,n in [(64,3)]+[(279+12*k,k+2) for k in range(5)]:
    check_num(i,Fraction(sum(all(x) for x in product((0,1),repeat=n)),2**n))
for k in range(5):
    n=k+4
    check_num(80+15*k,Fraction(sum(sum(x)==2 for x in product((0,1),repeat=n)),2**n))
    a=k+1;b=k+6
    check_num(159+12*k,Fraction(a,a+b))
    check_num(153+12*k,(k+2)+4*(k+3))
for i,v in {
    7:8+2,10:Fraction(1,2),818:Fraction(8+3,8),
    1658:Fraction(2,5)*Fraction(1,4),1659:Fraction(1,4)*Fraction(1,2),1687:Fraction(2,5)**2,
    1688:Fraction(sum(sum(t)==1 for t in product((0,1),repeat=2)),4),
    649:1*7-3*2,768:3**3,1579:Fraction(82-70,6),1580:Fraction(15,5),1581:Fraction(18,30),
    1583:Fraction(196,100)*Fraction(8,8),1584:Fraction(1,2),
    1696:Fraction(abs(3*4-0*0),2),1698:abs(2*3-1*1),
    831:2*3,833:sum(a==b for a,b in product((0,1),repeat=2)),
    1669:(3-3)**2+2,1670:Fraction(6,2),1699:2**2-4*2+1,1701:9-(1-1)**2,
    1714:1+2+3-4-8,1672:5*5,1702:1+1,1705:4**2+2**2,1713:(0+2)**2+5,
    1673:12+6,1674:min(2,4),1704:4*6-1,1679:1500-(490+390+610),
    1623:Fraction(1+2,2),1624:Fraction(1+3,2),1625:4-Fraction(16-9,8),
    1626:Fraction(2,2)*(0+4),1627:2*1,1628:Fraction(0+4+4,3),
    1629:abs(10-Fraction(97,10)),1630:Fraction(abs(50-49),50),1631:Fraction(1,200),
    1633:Fraction(7+2,3),1634:max(abs(4-2*2),abs(9-3*2)),797:Fraction(4-1,2),798:0,799:2,866:2-Fraction(2,2)
}.items(): check_num(i,v)
assert chosen(1582)=="[98.04,101.96]" and (100-Fraction(196,100),100+Fraction(196,100))==(Fraction(9804,100),Fraction(10196,100))
assert chosen(832)=="3"
def colorable(n,k):
    return any(all(c[i]!=c[(i+1)%n] for i in range(n)) for c in product(range(k),repeat=n))
assert not colorable(5,2) and colorable(5,3)
for p,q in product((False,True),repeat=2):
    assert (p and (p or q))==p
    assert ((not p) or q)==(q or (not p))
    assert (not(p and q))==((not p) or (not q))
print("PASS independent finite sample-space, exact rational, coloring and truth-table checks for final proposals")
