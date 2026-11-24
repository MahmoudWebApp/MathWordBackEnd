"""Rehearse the checked-in G1-06 candidate file against a migrated disposable DB."""
import json
from copy import deepcopy
from pathlib import Path

from integration_password_recovery import sql
from integration_problem_history import expect


ROOT = Path(__file__).resolve().parents[1]
MANIFEST = ROOT / "content/editorial/g1-gap-wave-01-20261124.json"
CATALOG = ROOT / "tests/fixtures/g1_gap_wave_01_catalog.sql"
EDITORIAL = "/api/editorial/problems"


def verify_gap_wave(admin):
    wave_one = json.loads(MANIFEST.read_text(encoding="utf-8"))["Items"]
    wave_two = json.loads(MANIFEST.with_name("g1-gap-wave-02-20261124.json").read_text(encoding="utf-8"))["Items"]
    assert len(wave_one) == 10 and len(wave_two) == 2
    wave_three = json.loads(MANIFEST.with_name("g1-gap-wave-03-20261124.json").read_text(encoding="utf-8"))["Items"]
    assert len(wave_three)==9
    items = wave_one + wave_two + wave_three
    assert len({r["ContentKey"] for r in items}) == 21
    assert len({r["PrimarySkillKey"] for r in items}) == 9
    sql(CATALOG.read_text(encoding="utf-8"))
    before_problems = sql('SELECT count(*) FROM "Problems"')
    before_drafts = int(sql('SELECT count(*) FROM "CurriculumDraftItems"'))

    def send(rows, confirm, status=200):
        return expect("POST", EDITORIAL + "/import", status,
                      {"Items": rows, "Confirm": confirm}, admin)

    # The last row failing must roll back the whole batch, including the first nine.
    invalid = deepcopy(items)
    invalid[-1]["ProposedTrackCodes"] = ["grade-4"]
    rejected = send(invalid, True, 400)
    assert "TrackStageMismatch" in rejected["Items"][-1]["Errors"]
    preview = send(items, False)
    assert preview["Ready"] == len(items) and preview["Created"] == 0
    assert int(sql('SELECT count(*) FROM "CurriculumDraftItems"')) == before_drafts

    saved = send(items, True)
    ids = saved["DraftIds"]
    assert saved["Created"] == len(set(ids)) == len(items)
    repeated = send(items, True)
    assert repeated["Created"] == 0
    assert {r["DraftId"] for r in repeated["Items"]} == set(ids)
    assert int(sql('SELECT count(*) FROM "CurriculumDraftItems"')) == before_drafts + len(items)

    skills = json.loads(sql('SELECT json_object_agg("StableKey", "Id") FROM "CurriculumSkills"'))
    tracks = json.loads(sql('SELECT json_object_agg("Code", "Id") FROM "LearningTracks"'))
    by_key = {r["ContentKey"]: r["DraftId"] for r in repeated["Items"]}
    for row in items:
        path = f"{EDITORIAL}/{by_key[row['ContentKey']]}"
        draft = expect("GET", path, 200, token=admin)
        assert draft["Status"] == "Draft" and draft.get("PublishedProblemId") is None
        expected = dict(row["Content"], PrimarySkillId=skills[row["PrimarySkillKey"]],
                        TrackIds=sorted(tracks[code] for code in row["ProposedTrackCodes"]))
        assert draft["Content"] == expected, row["ContentKey"]
        review = expect("POST", path + "/submit", 200, {"Revision": draft["Revision"]}, admin)
        assert review["Status"] == "PendingReview" and review.get("PublishedProblemId") is None

    assert sql('SELECT count(*) FROM "Problems"') == before_problems
    print("PASS: real gap wave, 21 bilingual drafts / 9 skills, atomic import, replay, review queue, no publication")
