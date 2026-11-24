"""Create source-guarded SQL for the reviewed short-solution amendments.

Generate a read-only preview/rollback script. No apply mode is available.
No DB connection or credentials are used here; this does not bypass editor
review or publication approval.
"""
import argparse
import hashlib
import json
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
SOURCE=ROOT/"content/editorial/g1-short-solution-law-candidates-20261124.json"
parser=argparse.ArgumentParser()
parser.add_argument("--output",required=True)
args=parser.parse_args()
data=SOURCE.read_bytes()
manifest=json.loads(data)
items=manifest["Items"]
assert manifest["Status"]=="DraftCandidatesNotApplied"
assert len(items)==len({x["ProblemId"] for x in items})==56
# SQL literals escaped with dollar-quote tag chosen not to occur in source.
def literal(value):
    tag="$mw_solution$"
    while tag in value:
        tag=tag[:-1]+"x$"
    return tag+value+tag
values=[]
for item in items:
    fields=[str(item["ProblemId"]),str(item["StageId"])]
    fields.extend(literal(item[k]) for k in [
        "ExpectedQuestionAr","ExpectedQuestionEn","ExpectedCorrectOption",
        "ExpectedSolutionAr","ExpectedSolutionEn","ProposedSolutionAr","ProposedSolutionEn"
    ])
    values.append("("+", ".join(fields)+")")
sql="""-- READ ONLY PREVIEW: no update, no production mutation.
-- SHA256: """+hashlib.sha256(data).hexdigest()+"""
BEGIN TRANSACTION READ ONLY;
WITH candidates(id,stage,q_ar,q_en,answer,old_ar,old_en,new_ar,new_en) AS (
 VALUES
"""+",\n".join(values)+"""
)
SELECT count(*) AS candidates,
       count(*) FILTER (WHERE p."Id" IS NOT NULL AND p."StageId"=c.stage
           AND p."QuestionTextAr"=c.q_ar AND p."QuestionTextEn"=c.q_en
           AND p."DetailedSolutionAr"=c.old_ar AND p."DetailedSolutionEn"=c.old_en
           AND (SELECT count(*) FROM "QuestionOptions" o WHERE o."ProblemId"=p."Id" AND o."IsCorrect")=1
           AND EXISTS (SELECT 1 FROM "QuestionOptions" o WHERE o."ProblemId"=p."Id" AND o."IsCorrect" AND o."LatexCode"=c.answer))
       AS exact_source_matches
FROM candidates c LEFT JOIN "Problems" p ON p."Id"=c.id;
ROLLBACK;
"""
Path(args.output).write_text(sql,encoding="utf-8")
print("Wrote read-only source reconciliation SQL. No changes applied.")
