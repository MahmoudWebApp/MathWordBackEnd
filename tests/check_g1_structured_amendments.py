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
