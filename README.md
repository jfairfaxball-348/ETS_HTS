# Ellipse theorem — mandatory nearest-two insertion on near-circle ellipses

**This is the active Lean 4 formalisation repository.** It is the **same GitHub repository** as the former `jfairfaxball-348/ETS_HTS` (renamed to `jfairfaxball-348/ellipse-theorem`, repository ID 1416869836), with its original research archives and Git history preserved.

## The mathematical result

For `a ≥ b > 0`, define `R = sqrt(2 / sin(2π/5) − 1) ≈ 1.0502020988726573`.

**CLM-0107:** Every finite set of `n ≥ 3` distinct points on an ellipse of aspect ratio `1 ≤ a/b ≤ R` admits an arrival order beginning with **some triangle** in which each subsequent point connects to **exactly its two Euclidean-nearest predecessors**, with Cartesian lexicographic tie-breaking; old edges are **retained** and the completed drawing has **no proper crossings**. The assertion includes `a/b = R`, all `n ≥ 3`, and arbitrarily close distinct boundary points. `R` is only a **sufficient** threshold; sharpness is not claimed.

**CLM-0108:** The noncircular ellipse `a/b = 101/100` has this property for all finite `n ≥ 3`. The older circle-only conjecture CND-0131 was disproved within the programme and marked killed.

## Current verification status (after S025)

| Gate | Verified status |
| --- | --- |
| Paper mathematics | S020 proof and S021 conditional hostile mathematical audit |
| Prior art | S024 final **CONDITIONAL_NOVELTY_SUPPORTED** for proof engineering only, **NOT** a priority or first-discovery certificate |
| Lean foundation | **COMPILED** (Lean 4.15.0 and pinned mathlib); five small helper lemmas checked with standard axioms only |
| Main Lean claims | **NOT PROVED**: CLM0096/0099/0102/0107/0108 currently have `Prop` definitions, **not proof terms** |
| Palomar / manuscript / arXiv / outreach | Not started; separate owner decisions required |

Actual successful builds: [S025 run 38596176639](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38596176639), [main run 38596618699](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38596618699); [merged PR #29](https://github.com/jfairfaxball-348/ellipse-theorem/pull/29). **A green build of definitions and helper lemmas does not prove the headline theorem.**

## Start here and next work

[Start here](authoritative/START_HERE.md) · [Live state](authoritative/STATE.json) · [Agent instructions](AGENTS.md) · [S026 NEXT SESSION](authoritative/NEXT_SESSION_PROMPT.md) · [Formalisation/rename handover](docs/FORMALISATION_HANDOVER.md).

Read [S020 proof](sessions/S020/MATHEMATICS.md), [S021 hostile audit](sessions/S021/MATHEMATICS.md), [S021 Lean blueprint](sessions/S021/LEAN_BLUEPRINT.md), and [S025 implementation audit](sessions/S025/FORMALISATION.md).

The source modules `ETSHTS/Definitions.lean`, `ETSHTS/Foundation.lean`, `ETSHTS/Targets.lean`, `ETSHTS.lean` intentionally retain their compiled legacy namespace; a cosmetic rename is not necessary to prove the theorem. Run `lake build` and `lake env lean ETSHTS.lean` with the pinned `lean-toolchain` and `lake-manifest.json`. The independent Lean GitHub workflow is `.github/workflows/lean.yml`. Governance format checks use `python scripts/check_scaffold.py` and `python -m unittest discover -s tests -v`, and do **not** certify mathematics.

**S026 remains FUTURE / UNEXECUTED**, requiring a **new explicit owner invocation**. Its focus is full exact Lean proof, not more novelty audits, threshold tuning or new open-problem generation.

Historical S001–S025 sessions, catalogue/campaign records and failed-experiment provenance remain in their existing directories; old `ETS_HTS` references are historical, not links to a separate active project.
