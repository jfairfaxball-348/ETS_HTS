# S036 — FUTURE / UNEXECUTED: strict continuation of the frozen S020/S021 Lean proof

**Execution authority:** A new explicit owner invocation of this text, or its GitHub URL with an instruction to run the next session, immediately authorises exactly S036. No second confirmation is needed. Do not execute S037.

Repository: https://github.com/jfairfaxball-348/ellipse-theorem
Lean namespace: `ETSHTS`.

## Binding unchanged mathematical authority

«The theorem statement and original S020/S021 mathematical proof remain frozen. Continue Lean formalisation of the exact existing argument. Mathematical research is not reopened merely because some Lean obligations remain difficult or incomplete. Only a demonstrated logical defect in the frozen proof authorises recording a mathematical blocker, and any broader research pivot requires a fresh owner decision.»

Use `sessions/S020/MATHEMATICS.md`, `sessions/S021/MATHEMATICS.md`, `sessions/S021/LEAN_BLUEPRINT.md` and the **immutable** five propositions of `ETSHTS/Targets.lean`. No selector experiments, minimax, angular-two-gap minimizer in place of metric skip-chord minimizer, novelty investigation, eccentricity improvement, extensions, Palomar, paper, arXiv, outreach or new theorem search. The S033/S034 alternative-selector failures do not refute S020.

## Entry verification

Fetch LIVE main SHA AND Git tree, and reconcile S035's one authored commit, sole parent, non-draft PR, two-parent merge and matching authored/merged trees. Check open PRs, branches, accessible rulesets and protection (403 is UNKNOWN). Independently inspect actual S035 PR Lean and governance runs and separately merged-main Lean/governance runs, including all jobs and actual logs. Verify `lake build`, `lake env lean ETSHTS.lean`, six S035 axiom prints, forbidden-proof-hole scan, `python scripts/check_scaffold.py` and `python -m unittest discover -s tests -v`. Do not infer success from a passing governance workflow. Inspect CI before promoting any source claim to kernel-certified.

## Existing certified dependencies and outstanding gaps

As of S035 entry, `ETSHTS.CLM0102` was proved by `clm0102_exact`, whose both outward derivative and strict chord-extension clauses are certified with the standard axioms [propext, Classical.choice, Quot.sound]. Earlier Lean-verified results: triangle slice of CLM0096 and `planeNearestTwoOrder_triangle` in `ETSHTS/Partial.lean`; `exactlyTwoNearest_three_exists` and exact tie-aware four-point insertion wrappers in `ETSHTS/ThreePredecessors.lean`; `ellipse_ratio_101_le_R` and the conditional corollary `clm0108_of_clm0107` in `ETSHTS/RationalBound.lean`; `sqDist_ellipse_between_circular_bounds` in `ETSHTS/AnalyticBounds.lean`; S034 homogeneous rational chord identity in `ETSHTS/RationalChord.lean`. These are not the four outstanding full targets.

S035 adds `ETSHTS/EligibleSkip.lean`, providing six source proofs: cyclic averaging implies at least one eligible site when its spanning two-gap sums total 4π and cutoff >4π/5; metric skip-chord minimizer existence on eligible sites; strict inequality of both adjacent chords relative to the selected eligible skip chord; forward and backward short-arc competitor comparisons; and exact tie-safe implication from a global nonneighbour floor to `metricEar`. Verify these as actual Lean-certified statements from hosted CI, not from the Markdown. They are intermediate lemmas with explicit hypotheses, NOT proofs of CLM0107.

### Stage A — highest priority: prove exact CLM0096
File `ETSHTS/FourPoint.lean`, `ETSHTS/ThreePredecessors.lean`, and `ETSHTS/Definitions.lean`. Complete the four-site geometric alternatives using noThreeCollinear. For interior fourth site prove all possible compulsory spokes remain planar inside seed triangle. For convex quadrilateral establish diagonal intersection O and choose the farthest from O to get strict distance inequalities by triangle inequality; deduce planarity for its opposite inserted vertex. Include Euclidean ties through priority. Finish `theorem clm0096_exact : CLM0096` if possible, not a hypothetical conditional wrapper. Triangle case is already complete; do not repeat it.

### Stage B — exact full metric-ear equivalence
New `ETSHTS/EarEquivalence.lean` importing frozen definitions and completed four-point support. Prove edge freshness, 2n-3 retained edges, outerplanar saturation, every hull side forced, last insertion's degree two and compulsory cyclic hull neighbours, recursive deletion down to three, converse planar reinstatement. Need `theorem clm0099_exact : CLM0099`. A single ear is insufficient.

### Stage C — original eligible metric skip-chord mechanism
Read `ETSHTS/EligibleSkip.lean` and `ETSHTS/Cutoff.lean`. First formalise finite ellipse parameterisation by cyclic strictly ordered real lifts, positive gaps summing 2π, two-gap spans summing 4π, and the **strict closed-ratio cutoff** `4π/5 < lambda a b` for every 0<b≤a and a/b≤R, INCLUDING a/b=R. Connect these proven facts to S035 eligible nonemptiness and exact finite metric minimum.

Then prove for the selected eligible i: adjacent Euclidean chords strictly shorter than its skip chord, and every nonneighbor at least as long as it. For forward and backward arcs reuse S035 strict extension (include wraparound and exact angular cutoff boundary). For the central band, connect `sqDist_ellipse_between_circular_bounds`, the witness skip-chord upper bound, and the defining inequality `r²+1 ≤ 2/sin(2π/5)`; explicitly handle equality and near-antipodal configurations. Use S035 `s035_metric_ear_of_skip_chord_floor` only after all nonneighbor cases are proved. Recursively remove eligible ears for all remaining sets of size ≥5. Apply exact CLM0096 and CLM0099 to derive `clm0107_exact : CLM0107`.

### Stage D — exact CLM0108
Use the already certified `ellipse_ratio_101_le_R` and `clm0108_of_clm0107` from `ETSHTS/RationalBound.lean`; prove `clm0108_exact : CLM0108` only after a compiled `clm0107_exact`.

## Strict execution, CI and closeout

No modifications to `ETSHTS/Targets.lean`; no custom axioms, admit, proof holes, mathematical native_decide gaps or weaker substitute theorem types. Use pinned Lean/mathlib. Run `lake build`, `lake env lean ETSHTS.lean`, `python scripts/check_scaffold.py` and `python -m unittest discover -s tests -v`. Print and inspect axioms of all new substantive theorems. If local binaries are absent mark local NOT_RUN and independently verify hosted runs.

Exactly one S036 session branch, one authored atomic one-parent commit, one ordinary non-draft PR, separate green PR Lean and governance checks, then only an ordinary two-parent merge. Verify current main head and matching tree; separately verify merged-main Lean and governance. Leave a complete `S037 — FUTURE / UNEXECUTED` prompt at `authoritative/NEXT_SESSION_PROMPT.md`; do not execute S037.

Report exact new Lean-certified claims, unchanged target types, the four unclosed CLMs or any actual completions, explicit mathematical blockers **only if logically demonstrated**, hosted runs/jobs and axiom lines, SHA/tree/PR/merge evidence, overall PASS only if all five exact CLMs are genuine compiled proof terms. Otherwise PARTIAL. Provide full S037 prompt and URLs in final chat response.
