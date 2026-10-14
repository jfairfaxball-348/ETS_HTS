# S026 — FUTURE / UNEXECUTED: complete exact Lean 4 ellipse theorem in ellipse-theorem

**FUTURE / UNEXECUTED. A new explicit owner invocation is REQUIRED.** This handover rewrite is administrative: it does NOT run S026. The canonical active repository is **https://github.com/jfairfaxball-348/ellipse-theorem** (renamed from `jfairfaxball-348/ETS_HTS`, **same repo ID 1416869836**). Work in that repository, not a new repo or an independent copy. Preserve history and all S001–S025 records.

## Verified entry provenance to independently recheck

S025 ordinary PR [#29](https://github.com/jfairfaxball-348/ellipse-theorem/pull/29) merged. Authored commit `e44abef10e4dbe842ba7a87bb6ffaa57164d151c` had sole parent `e784a449a64a9dd2c2e6dd8c7f9aad1b88b54de5`. Merge commit `018b55dfb052bd47c3081b4e96b2a77d8de7a5bc` has those two ordered parents, tree `53df8c3499e0e8cb933f606916e74b815ed0bac6`, identical to authored tree. The renamed repo's main was observed at that merge; **re-fetch live main/tree before starting S026**.

Lean 4.15.0 / pinned mathlib `9837ca9d65d9de6fad1ef4381750ca688774e608`; the actual [head Lean run 38596176639](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38596176639), [PR Lean run 38596222605](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38596222605), and [post-merge main Lean run 38596618699](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38596618699) all **PASSED**; governance separately checks FORMAT. S025 compiled `ETSHTS.Definitions`, `Foundation`, `Targets`, `ETSHTS` and **five small helper proofs** with only standard `propext`, `Classical.choice`, `Quot.sound` reported. **The five CLM targets below are `Prop` DEFINITIONS and remain UNPROVED.** Do not waste the next session merely re-establishing known green CI, but verify pinned version and semantic statements on fresh checkout.

Core materials: `sessions/S020/MATHEMATICS.md`, `sessions/S021/MATHEMATICS.md`, `sessions/S021/LEAN_BLUEPRINT.md`, `sessions/S025/FORMALISATION.md`, `docs/FORMALISATION_HANDOVER.md`. S024 was the FINAL prior-art audit: `CONDITIONAL_NOVELTY_SUPPORTED` as permission for formalisation, NOT historical priority certification.

## Immutable proof targets — no weakening

1. **CLM0096** universal three/four-point plane base, including the strictly convex quadrilateral.
2. **CLM0099** plane mandatory retained two-nearest-predecessor order ↔ **complete** recursive metric-ear deletion certificate for every strictly convex finite set, using the outerplanar `2m−3` edge saturation for necessity and certificate reversal for sufficiency.
3. **CLM0102** BOTH directed outward endpoint chord derivatives and strict extension along short ellipse angular arcs `< Λ = 4 atan(b/a)`; no illicit swap of forward/backward derivatives.
4. **CLM0107** EVERY finite `n≥3` distinct sites on EVERY ellipse with `a≥b>0`, `1≤a/b≤R=sqrt(2/sin(2π/5)−1)`, INCLUDING `a/b=R`, the circle, `n=5`, and arbitrarily close sites. Start from SOME triangle, attach each later site to EXACTLY its two Euclidean-nearest PREDECESSORS with Cartesian lex tie-breaking, KEEP all earlier edges, forbid proper crossings. Prove angular pair-gap averaging and strict eligible span at closed endpoint; choose the MINIMUM **METRIC** skip chord among eligible sites, strict shorter neighbours, short FORWARD and short BACKWARD comparisons, independent central/antipodal chord floor, then recursively remove a strict metric ear down to four.
5. **CLM0108** exact `101/100` nonround all-`n` corollary via exact trigonometric/radical bounds, no floating rounding.

`R` is only sufficient. Do NOT replace the ellipse with a circle, cap n, assume fixed separation, change the mandatory two edges/tie rule, drop the equality endpoint or assert sharpness.

## Execution obligations for ONE S026 session

- Reconcile LIVE canonical main/STATE/AGENTS/protocol/PRs/checks; create one isolated S026 branch. Do not start a parallel repository, novelty audit or new mathematical target.
- Use actual pinned `lake build`/Lean checkout, inspect elaborated definitions for precise semantics and validate Lake's dependency manifest (S025 manually transcribed upstream lock). Retain the compiled legacy `ETSHTS` namespace unless a proven-equivalent tested refactor is essential.
- **Prove the five claims** with kernel-checked theorem declarations, rather than only naming proposition definitions. Prioritise four-point geometry, metric-ear iff, BOTH derivative calculations, closed-threshold gap bounds and skip-chord minimisation, forward/central/backward cases and full induction, then rational `101/100` corollary. This session may make extensive proof progress; do not artificially stop after one helper object.
- Preserve actual compiler logs, Lean/mathlib hashes, `#print axioms` on genuine proved declarations, and independent statement audit of all-`n`, closed-R, tie and retained-edge semantics. **No `sorry`, `admit`, custom axioms, mathematical `native_decide` trust gap, hidden extra hypotheses or weaker theorem.** A green build of `def CLM... : Prop` is *not* an all-`n` theorem PASS.
- If the full kernel proof remains open, record EXACT proved lemmas and blockers and queue continued **FORMALISATION** for a separately owner-authorised next session. Do not revisit novelty, optimise R, begin Palomar, write a paper, submit to arXiv/journals or contact researchers.
- Exactly ONE numbered S026 session, one atomic authored commit, normal non-draft PR, two-parent merge if permitted; independently verify old/new main tree, checks and record failures. Preserve historical **CND131 killed131, SRC87 CLM108 CAM10**, all failed CAMs and detached S016 archive. No automatic S027 authorisation.

**PASS condition:** actual kernel-checked proofs of exact CLM0096/0099/0102/0107/0108 with semantic statement fidelity and no trust gap. Otherwise accurately report PARTIAL/OPEN.
