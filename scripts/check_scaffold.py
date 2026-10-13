#!/usr/bin/env python3
"""Stdlib-only ETS_HTS record validator. NEVER validates mathematics or novelty."""
from __future__ import annotations

import argparse
import json
import re
from pathlib import Path

REQUIRED = (
    "AGENTS.md", "README.md", "authoritative/START_HERE.md",
    "authoritative/STATE.json", "authoritative/NEXT_SESSION_PROMPT.md",
    "docs/SESSION_PROTOCOL.md", "docs/DECISION_LOG.md",
    "docs/FAILURE_LEDGER.md", "docs/SESSION_LEDGER.md",
    "docs/PHASE_GATE_LEDGER.md", "docs/NOVELTY_PROTOCOL.md",
    "docs/DIFFICULTY_PROTOCOL.md", "docs/INTEGRITY_CHECKLIST.md",
    "catalogue/SOURCES.json", "catalogue/SOURCES.md",
    "catalogue/CLAIMS.json", "catalogue/CLAIMS.md",
    "catalogue/CANDIDATES.json", "catalogue/CANDIDATES.md",
    "campaigns/README.md", "campaigns/COMPUTATION_LEDGER.json",
    "campaigns/COMPUTATION_LEDGER.md",
    "research/GENERATION_MECHANISMS.md", "research/TASTE_CRITERIA.md",
    "research/PRIOR_ART_LANDSCAPE.md", "sessions/S001/INPUT.md",
    "sessions/S001/PLAN.md", "sessions/S001/CLOSEOUT.md", "sessions/S002/INPUT.md", "sessions/S002/PLAN.md",
    "sessions/S002/CLOSEOUT.md", "sessions/S002/MATHEMATICS.md",
    "sessions/S002/NOVELTY_QUERIES.md", "sessions/S003/INPUT.md",
    "sessions/S003/PLAN.md", "sessions/S003/CLOSEOUT.md",
    "sessions/S003/MATHEMATICS.md", "sessions/S003/NOVELTY_QUERIES.md",
    "sessions/S004/INPUT.md", "sessions/S004/PLAN.md",
    "sessions/S004/CLOSEOUT.md", "sessions/S004/MATHEMATICS.md",
    "sessions/S004/NOVELTY_QUERIES.md",
    "sessions/S006/INPUT.md", "sessions/S006/PLAN.md",
    "sessions/S006/CLOSEOUT.md", "sessions/S006/MATHEMATICS.md",
    "sessions/S006/NOVELTY_QUERIES.md",
    "sessions/S007/INPUT.md", "sessions/S006/PLAN.md",
    "sessions/S007/CLOSEOUT.md", "sessions/S007/MATHEMATICS.md",
    "sessions/S007/NOVELTY_QUERIES.md", "sessions/S007/PLAN.md", "sessions/S007/DISCOVERY_REPORT.md",
    "campaigns/CAM-0001_preregistration.json", "campaigns/CAM-0001_raw.json",
    "campaigns/CAM-0002_preregistration.json", "campaigns/CAM-0002_raw.json",
    "campaigns/necklace_exhaustive.py", "campaigns/necklace_exact_optima.py",
    "scripts/check_scaffold.py", "tests/test_scaffold.py",
    ".github/workflows/governance.yml",
)
CANDIDATE_STATUSES = {
    "GENERATED", "TRIAGED", "KILLED_KNOWN", "KILLED_EASY",
    "KILLED_FALSE/DEGENERATE", "KILLED_EQUIVALENT", "SURVIVING",
    "SHORTLISTED", "SELECTED_FOR_RESEARCH",
}
NOVELTY = {
    "NOT_SEARCHED", "SHALLOW_SEARCH_NO_HIT", "DEEP_SEARCH_NO_HIT",
    "KNOWN_EXACT", "KNOWN_VARIANT", "KNOWN_EQUIVALENT",
}
ACCESS = {
    "METADATA_ONLY", "ABSTRACT_INSPECTED", "STATEMENT_INSPECTED",
    "PROOF_INSPECTED", "SECONDARY_ONLY",
}
CLAIM_STATUSES = {
    "SOURCE_STATED", "PROGRAMME_PROVED", "COMPUTED_EXACT",
    "HEURISTIC", "INHERITED_UNVERIFIED",
}
CAM_STATUSES = {"REGISTERED", "RUNNING", "COMPLETED", "FAILED", "CANCELLED"}
SCHEMAS = {
    "sources": ("catalogue/SOURCES.json", "catalogue/SOURCES.md", "SRC",
                {"id", "title", "author", "date", "url_or_doi", "access_grade", "notes"}),
    "claims": ("catalogue/CLAIMS.json", "catalogue/CLAIMS.md", "CLM",
               {"id", "statement", "status", "source_ids", "candidate_ids", "cam_ids",
                "justification", "limitations"}),
    "candidates": ("catalogue/CANDIDATES.json", "catalogue/CANDIDATES.md", "CND",
                   {"id", "exact_statement", "plain_language_statement", "domain",
                    "origin_mechanism", "status", "novelty_grade",
                    "difficulty_evidence", "kill_record", "source_ids", "claim_ids",
                    "cam_ids", "scoring"}),
    "campaigns": ("campaigns/COMPUTATION_LEDGER.json",
                  "campaigns/COMPUTATION_LEDGER.md", "CAM",
                  {"id", "candidate_ids", "claim_ids", "purpose", "bounds",
                   "code_version", "code_hash", "input_hash", "environment",
                   "stopping_rule", "output_paths", "status"}),
}
REFS = {"source_ids": "sources", "candidate_ids": "candidates",
        "claim_ids": "claims", "cam_ids": "campaigns"}


def validate(root: Path) -> list[str]:
    root = Path(root)
    errors: list[str] = []
    for name in REQUIRED:
        if not (root / name).is_file():
            errors.append("missing required file: " + name)
    parsed: dict = {}
    ids: dict[str, set[str]] = {}
    global_ids: set[str] = set()
    for typ, (json_path, md_path, prefix, required) in SCHEMAS.items():
        path = root / json_path
        if not path.is_file():
            continue
        try:
            doc = json.loads(path.read_text(encoding="utf-8"))
        except (ValueError, OSError) as exc:
            errors.append(f"{json_path}: invalid JSON: {exc}")
            continue
        if not isinstance(doc, dict) or doc.get("schema_version") != 1 or not isinstance(doc.get("records"), list):
            errors.append(f"{json_path}: must contain schema_version=1 and records=list")
            continue
        parsed[typ] = doc["records"]
        ids[typ] = set()
        for index, item in enumerate(doc["records"]):
            if not isinstance(item, dict):
                errors.append(f"{json_path}[{index}]: record must be object")
                continue
            missing = required.difference(item)
            if missing:
                errors.append(f"{json_path}[{index}]: missing fields {sorted(missing)}")
            ident = item.get("id")
            if not isinstance(ident, str) or not re.fullmatch(rf"{prefix}-[0-9]{{4}}", ident):
                errors.append(f"{json_path}[{index}]: invalid {prefix} identifier")
                continue
            if ident in ids[typ] or ident in global_ids:
                errors.append(f"{json_path}: duplicate ID {ident}")
            ids[typ].add(ident)
            global_ids.add(ident)
            allowed = {"candidates": (CANDIDATE_STATUSES, "status"),
                       "claims": (CLAIM_STATUSES, "status"),
                       "sources": (ACCESS, "access_grade"),
                       "campaigns": (CAM_STATUSES, "status")}[typ]
            if item.get(allowed[1]) not in allowed[0]:
                errors.append(f"{ident}: invalid {allowed[1]} {item.get(allowed[1])!r}")
            if typ == "candidates":
                if item.get("novelty_grade") not in NOVELTY:
                    errors.append(f"{ident}: invalid novelty grade")
                killed = isinstance(item.get("status"), str) and item["status"].startswith("KILLED_")
                if killed and not item.get("kill_record"):
                    errors.append(f"{ident}: killed candidate has no kill record")
            for key in required.intersection(REFS):
                if key not in item:
                    continue
                if not isinstance(item[key], list) or any(not isinstance(v, str) for v in item[key]):
                    errors.append(f"{ident}: {key} must be an array of IDs")
        md = root / md_path
        if md.is_file():
            body = md.read_text(encoding="utf-8")
            listed = set(re.findall(rf"\b{prefix}-[0-9]{{4}}\b", body))
            if listed != ids[typ]:
                errors.append(f"{md_path}: Markdown/JSON ID mismatch: md={sorted(listed)}, json={sorted(ids[typ])}")
    for typ, entries in parsed.items():
        for item in entries:
            if not isinstance(item, dict):
                continue
            for key, target in REFS.items():
                for ref in item.get(key, []) if isinstance(item.get(key, []), list) else []:
                    if ref not in ids.get(target, set()):
                        errors.append(f"{item.get('id','?')}: dangling {key} reference {ref}")
    state_file = root / "authoritative/STATE.json"
    if state_file.is_file():
        try:
            s = json.loads(state_file.read_text(encoding="utf-8"))
            if s.get("next_session") != "S008" or s.get("next_session_authorised") is not False:
                errors.append("STATE: S008 must be next and explicitly unauthorised")
            if s.get("last_completed_session") != "S007":
                errors.append("STATE: S007 must be last completed")
            if s.get("phase") != 1:
                errors.append("STATE: S007 must remain in generation/triage phase one")
            statuses = [x.get("status") for x in parsed.get("candidates", []) if isinstance(x, dict)]
            if s.get("kill_count") != sum(str(x).startswith("KILLED_") for x in statuses):
                errors.append("STATE: kill_count mismatch registry")
            if s.get("triaged_count") != statuses.count("TRIAGED"):
                errors.append("STATE: triaged_count mismatch registry")
            if s.get("surviving_count") != statuses.count("SURVIVING"):
                errors.append("STATE: surviving_count mismatch registry")
            for kind, state_key in (("candidates", "candidate_count"),
                                    ("sources", "source_count"),
                                    ("claims", "claim_count"),
                                    ("campaigns", "campaign_count")):
                if kind in parsed and s.get(state_key) != len(parsed[kind]):
                    errors.append(f"STATE: {state_key} mismatch registry")
        except (ValueError, OSError) as exc:
            errors.append("STATE: invalid JSON: " + str(exc))
    prompt = root / "authoritative/NEXT_SESSION_PROMPT.md"
    if prompt.is_file():
        body = prompt.read_text(encoding="utf-8")
        if not body.startswith("# S008") or "FUTURE" not in body or "UNEXECUTED" not in body:
            errors.append("NEXT_SESSION_PROMPT must be explicitly FUTURE UNEXECUTED S008")
        if "new explicit owner invocation" not in body:
            errors.append("NEXT_SESSION_PROMPT lacks fresh owner gate")
    return errors


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=Path(__file__).resolve().parents[1])
    args = parser.parse_args()
    errors = validate(args.root)
    if errors:
        for error in errors:
            print("ERROR:", error)
        print(f"Governance validation FAILED: {len(errors)} error(s)")
        return 1
    print("Governance record validation PASS (records only; not mathematics or novelty)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
