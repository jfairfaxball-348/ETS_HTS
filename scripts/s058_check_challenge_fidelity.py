#!/usr/bin/env python3
"""Check that the independently allowed Challenge reproduces exact frozen propositions."""
import json
from pathlib import Path

challenge = Path("Challenge.lean").read_text(encoding="utf-8")
assert challenge.startswith("module\n\npublic import Mathlib\n"), "Challenge must import trusted Mathlib only"
assert "import ETSHTS" not in challenge, "Challenge must be independent of submitted proof sources"

def namespace_core(path):
    source = Path(path).read_text(encoding="utf-8")
    i = source.index("namespace ETSHTS")
    j = source.rindex("end ETSHTS") + len("end ETSHTS")
    return source[i:j]

for source in ("ETSHTS/Definitions.lean", "ETSHTS/Targets.lean"):
    assert namespace_core(source) in challenge, f"Mismatch: frozen exact source declarations from {source}"
data = json.loads(Path("comparator.json").read_text())
expected = [f"ETSHTS.clm{n}_exact" for n in ("0096", "0099", "0102", "0107", "0108")]
assert data["theorem_names"] == expected, "Comparator does not select all five exact roots"
for theorem, claim in zip(expected, ("0096","0099","0102","0107","0108")):
    assert f"theorem {theorem.split('.')[-1]} : CLM{claim} := by" in challenge
assert "public import ETSHTS" in Path("Solution.lean").read_text()
print("S058 exact Challenge primitive and five-proposition textual fidelity PASS")
