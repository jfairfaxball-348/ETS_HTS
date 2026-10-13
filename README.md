# Easy to State, Hard to Solve (ETS_HTS)

A governed programme to discover and audit a **small number of potentially new, naturally interesting mathematical questions** accessible to a strong secondary-school student. The programme's principal deliverables are precise statements with *honest* evidence for difficulty and a reproducible prior-art audit—not solutions or claims of first discovery.

Four desiderata: short elementary wording; actual resistance to easy techniques; no previously located exact or trivial-equivalent formulation after documented searching; a crisp, elegant reason to care. These are independent tests. "No hit" is never "novel."

**Start:** [authoritative/START_HERE.md](authoritative/START_HERE.md), then [STATE.json](authoritative/STATE.json), [AGENTS.md](AGENTS.md), [session protocol](docs/SESSION_PROTOCOL.md). See [taste calibration](research/TASTE_CRITERIA.md), [generation playbook](research/GENERATION_MECHANISMS.md), [novelty protocol](docs/NOVELTY_PROTOCOL.md), [difficulty protocol](docs/DIFFICULTY_PROTOCOL.md).

S001 scaffolds governance; there are **no registered candidates or computational campaigns**. The S002 prompt is future/unexecuted and requires a new explicit instruction. No research selection, public postings or mathematical collaboration are authorised.

Local record check (Python 3 stdlib): `python scripts/check_scaffold.py`; tests: `python -m unittest discover -s tests -v`. GitHub Actions repeats both. Green checks prove neither mathematical truth nor novelty.
