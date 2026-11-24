"""Contract for the first 16 structured amendments; never imports production."""
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
placements={r["ProblemId"]:(g,r) for g in load("g1-track-draft-batch-20261124.json")["Tracks"] for r in g["Rows"]}
wave_ids={r["ProblemId"] for r in wave["Items"]}
assert len(wave_ids)==len(wave["Items"])==20
assert not wave_ids.intersection({r["ProblemId"] for r in d["Items"]})
assert not wave_ids.intersection(hints)
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
assert not fourth_ids.intersection(wave_ids|set(hints)|{r["ProblemId"] for r in d["Items"]})
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
assert not fifth_ids.intersection(wave_ids|fourth_ids|set(hints)|{r["ProblemId"] for r in d["Items"]})
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
