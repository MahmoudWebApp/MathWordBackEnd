#!/usr/bin/env python3
"""Guard the user-approved removal of student-facing view/history features.

The database retains the historical columns/attempt records for admin analytics,
scoring consistency, and error-notebook functionality. It must not write a
problem view on GET nor expose a student attempt timeline.
"""
from pathlib import Path

controller = Path("Controllers/ProblemsController.cs").read_text(encoding="utf-8-sig")
assert "BackgroundUpdateAsync(" not in controller, "GET problem details must not start a write for views"
assert "ViewsCount++" not in controller, "Retired view counters must not increment"
assert 'HttpGet("{id:int}/attempts")' not in controller, "Student attempt history endpoint must remain retired"
assert "GetAttemptHistory(" not in controller, "No student attempt-history action"
assert "ProblemAttempts" in controller and "IsInErrorNotebook" in controller, (
    "Private scoring and mistakes must remain intact"
)
web = Path("docs/RELEASE_CLOSEOUT_2026-11-23.md").read_text(encoding="utf-8")
assert "Attempt history removed" in web
print("PASS: no student view-count writes or learner attempt-history endpoint")
