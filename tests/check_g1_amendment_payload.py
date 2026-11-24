import copy
import importlib.util
import json
from pathlib import Path

root=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location("prepare",root/"scripts/prepare_g1_amendment_payload.py")
module=importlib.util.module_from_spec(spec); spec.loader.exec_module(module)
manifest=json.loads((root/"content/editorial/g1-structured-amendments-wave01-20261124.json").read_text(encoding="utf-8"))
second=json.loads((root/"content/editorial/g1-structured-amendments-wave02-20261124.json").read_text(encoding="utf-8"))
manifest["Items"]+=second["Items"]
third=json.loads((root/"content/editorial/g1-structured-amendments-wave03-20261124.json").read_text(encoding="utf-8"))
manifest["Items"]+=third["Items"]
fourth=json.loads((root/"content/editorial/g1-structured-amendments-wave04-20261124.json").read_text(encoding="utf-8"))
manifest["Items"]+=fourth["Items"]
fifth=json.loads((root/"content/editorial/g1-structured-amendments-wave05-20261124.json").read_text(encoding="utf-8"))
manifest["Items"]+=fifth["Items"]
sixth=json.loads((root/"content/editorial/g1-structured-amendments-wave06-20261124.json").read_text(encoding="utf-8"))
manifest["Items"]+=sixth["Items"]
seventh=json.loads((root/"content/editorial/g1-structured-amendments-wave07-20261124.json").read_text(encoding="utf-8"))
manifest["Items"]+=seventh["Items"]
eighth=json.loads((root/"content/editorial/g1-structured-amendments-wave08-20261124.json").read_text(encoding="utf-8"))
manifest["Items"]+=eighth["Items"]
ninth=json.loads((root/"content/editorial/g1-structured-amendments-wave09-20261124.json").read_text(encoding="utf-8"))
manifest["Items"]+=ninth["Items"]
tenth=json.loads((root/"content/editorial/g1-structured-amendments-wave10-20261124.json").read_text(encoding="utf-8"))
manifest["Items"]+=tenth["Items"]
eleventh=json.loads((root/"content/editorial/g1-structured-amendments-wave11-20261124.json").read_text(encoding="utf-8"))
manifest["Items"]+=eleventh["Items"]
twelfth=json.loads((root/"content/editorial/g1-structured-amendments-wave12-20261124.json").read_text(encoding="utf-8"))
manifest["Items"]+=twelfth["Items"]
thirteenth=json.loads((root/"content/editorial/g1-structured-amendments-wave13-20261124.json").read_text(encoding="utf-8"))
manifest["Items"]+=thirteenth["Items"]
assert len(manifest["Items"])==len({r["ProblemId"] for r in manifest["Items"]})==615
for row in manifest["Items"]:
    content=copy.deepcopy(row["Content"])
    content["TrackIds"]=[101];content["SecondarySkillIds"]=[999];content["DifficultyLevel"]=3
    content["Hints"]=None;content["Solution"]=None
    for opt in content["Options"]:
        opt["ErrorType"]="";opt["Reason"]=None
    draft={"SourceProblemId":row["ProblemId"],"Revision":0,"Status":"Draft",
        "LegacySolutionAr":row["ExpectedLegacySolution"]["Ar"],
        "LegacySolutionEn":row["ExpectedLegacySolution"]["En"],"Content":content}
    before=copy.deepcopy(draft)
    body=module.prepare(manifest,draft)
    assert body["Revision"]==0 and draft==before
    for k in ("TrackIds","SecondarySkillIds","DifficultyLevel","StageId","CategoryId","PrimarySkillId","Points","Title","Question"):
        assert body["Content"][k]==content[k]
    for k in ("Options","Hints","Solution"):
        assert body["Content"][k]==row["Content"][k]
    changes=[
        lambda d:d.update(Revision=1),
        lambda d:d.update(Status="Approved"),
        lambda d:d.update(LegacySolutionEn="changed"),
        lambda d:d["Content"]["Question"].update(En="changed"),
        lambda d:d["Content"]["Options"].reverse(),
        lambda d:d["Content"].update(Solution={"Idea":{"Ar":"موجود","En":"Existing"}}),
        lambda d:d["Content"].update(Hints=[{"Ar":"موجود","En":"Existing"}]),
        lambda d:d["Content"]["Options"][0].update(ErrorType="existing"),
    ]
    for change in changes:
        bad=copy.deepcopy(draft); change(bad)
        try: module.prepare(manifest,bad)
        except ValueError: pass
        else: raise AssertionError("Unsafe amendment accepted")
print("PASS: 615 draft payloads preserve classification and immutable sources; reject stale/edited drafts")
