"""Adversarial schema tests; not mathematical validation."""
import json
import shutil
import tempfile
import unittest
from pathlib import Path

from scripts.check_scaffold import validate

BASE = Path(__file__).resolve().parents[1]


class ScaffoldTest(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name) / "repo"
        shutil.copytree(BASE, self.root, ignore=shutil.ignore_patterns("__pycache__"))

    def load(self, p):
        return json.loads((self.root / p).read_text(encoding="utf-8"))

    def save(self, p, x):
        (self.root / p).write_text(json.dumps(x, indent=2) + "\n", encoding="utf-8")

    def test_clean_s002(self):
        self.assertEqual([], validate(self.root))

    def test_missing_file(self):
        (self.root / "AGENTS.md").unlink()
        self.assertTrue(any("missing required" in x for x in validate(self.root)))

    def test_wrong_next_prompt(self):
        (self.root / "authoritative/NEXT_SESSION_PROMPT.md").write_text(
            "# S004\nFUTURE UNEXECUTED\nnew explicit owner invocation", encoding="utf-8")
        self.assertTrue(any("FUTURE UNEXECUTED S003" in x for x in validate(self.root)))

    def test_dangling_source_and_bad_status(self):
        p = "catalogue/CANDIDATES.json"
        j = self.load(p)
        j["records"] = [dict(id="CND-0001", exact_statement="Exact hypothetical statement",
                             plain_language_statement="Simple hypothetical statement",
                             domain="graphs", origin_mechanism="MEC-02",
                             status="AWESOME", novelty_grade="NOT_SEARCHED",
                             difficulty_evidence=[], kill_record=None, source_ids=["SRC-9999"],
                             claim_ids=[], cam_ids=[], scoring={})]
        self.save(p, j)
        errors = validate(self.root)
        self.assertTrue(any("invalid status" in x for x in errors))
        self.assertTrue(any("dangling source_ids" in x for x in errors))
        self.assertTrue(any("Markdown/JSON ID mismatch" in x for x in errors))

    def test_duplicate_ids(self):
        p = "catalogue/SOURCES.json"
        j = self.load(p)
        rec = dict(id="SRC-0001", title="x", author="x", date="unknown",
                   url_or_doi="https://example.org", access_grade="METADATA_ONLY", notes="")
        j["records"] = [rec, dict(rec)]
        self.save(p, j)
        self.assertTrue(any("duplicate ID" in x for x in validate(self.root)))

    def test_kill_requires_reason(self):
        p = "catalogue/CANDIDATES.json"
        j = self.load(p)
        j["records"] = [dict(id="CND-0001", exact_statement="x",
                             plain_language_statement="x", domain="graphs",
                             origin_mechanism="MEC-01", status="KILLED_EASY",
                             novelty_grade="NOT_SEARCHED", difficulty_evidence=[],
                             kill_record=None, source_ids=[], claim_ids=[], cam_ids=[], scoring={})]
        self.save(p, j)
        self.assertTrue(any("kill record" in x for x in validate(self.root)))


if __name__ == "__main__":
    unittest.main()
