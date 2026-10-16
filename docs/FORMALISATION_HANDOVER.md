> **Historical S025 handover; no longer current.** All five original exact targets are proved in S053 and audited in S054. See [S054 coverage](../sessions/S054/PROOF_COVERAGE.md) and [reproducibility](../sessions/S054/REPRODUCIBILITY.md). Statements in this document saying the theorems remain open describe only S025.

# Canonical repository handover: ETS_HTS → ellipse-theorem

Owner-directed **administrative** rename/handover update, 2026-10-14. This is NOT S026 execution. Canonical repo: **https://github.com/jfairfaxball-348/ellipse-theorem** (former path `jfairfaxball-348/ETS_HTS`), unchanged GitHub repository ID **1416869836**, history, Lean code and research registries. The old `ETSHTS` Lean package/module names intentionally remain compiled-compatible.

## Proof and history anchors

- Original internal proof: `sessions/S020/MATHEMATICS.md`; hostile audit: `sessions/S021/MATHEMATICS.md`; blueprint: `sessions/S021/LEAN_BLUEPRINT.md`.
- FINAL novelty audit S024: `CONDITIONAL_NOVELTY_SUPPORTED` **only** for proof engineering. This is NOT priority/first-discovery certification or external peer review.
- S025 authored `e44abef10e4dbe842ba7a87bb6ffaa57164d151c` (sole parent `e784a449a64a9dd2c2e6dd8c7f9aad1b88b54de5`), [PR #29](https://github.com/jfairfaxball-348/ellipse-theorem/pull/29), two-parent merge `018b55dfb052bd47c3081b4e96b2a77d8de7a5bc` with ordered parents `e784a449...`, `e44abef...` and matching tree `53df8c3499e0e8cb933f606916e74b815ed0bac6`.
- **Actual compiler evidence:** Lean 4.15.0/Lake 5.0.0-1165156 and mathlib commit `9837ca9d65d9de6fad1ef4381750ca688774e608`: [S025 head build PASS](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38596176639), [PR build PASS](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38596222605), [merged main build PASS](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38596618699). Governance checks validate records only.
- `ETSHTS.Definitions`, `ETSHTS.Foundation`, `ETSHTS.Targets`, `ETSHTS` **compiled**. The five small foundation lemmas' `#print axioms` included only `propext`, `Classical.choice`, `Quot.sound`. **The main five CLM claims are still merely `Prop` definitions**, NOT proven theorem declarations. No mathematical all-n Lean PASS.
- S025's `lake-manifest.json` was transcribed from upstream mathlib's pinned manifest; validate/resolution-check on a fresh checkout. Earlier local checker/unittests were NOT_RUN due environment constraints; do not conflate with hosted build PASS.

## Exactly what S026 must accomplish

Prove CLM0096 (four-point base), CLM0099 (complete metric-ear iff), CLM0102 (BOTH endpoint derivative/strict extension), CLM0107 (ALL n≥3, ellipse a≥b>0, 1≤a/b≤R including R, arbitrary close sites, exact lex tie, retained two-nearest predecessor edges, no crossings), CLM0108 (101/100 nonround all-n). The analytic heart is strict eligible span at n=5/R, minimum **metric** skip chord, short forward/backward endpoint comparisons and central/antipodal b-floor, full ear recursion. `R=sqrt(2/sin(2π/5)−1)` is sufficient, not known sharp. No weakening to circle or bounded n.

Use [FUTURE S026 handover](../authoritative/NEXT_SESSION_PROMPT.md) only upon **new explicit owner invocation**, on the renamed repository. A green build of a proposition *definition* is not theorem verification; require full kernel proofs and semantic/axiom audit. No further novelty loops, Palomar, paper, arXiv or outreach automatically authorised.

Archive remains CND131 all killed, SRC87, CLM108, CAM10, zero surviving open-problem candidates; preserve S016 detached CAM evidence and previous failures. Historical ETS_HTS source text remains as original provenance, not a second repository.
