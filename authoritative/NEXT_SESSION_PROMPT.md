# S048 — FUTURE / UNEXECUTED: aggressive CLM0107 completion on the exact original geometry

**FUTURE / UNEXECUTED. A new explicit owner invocation** of this prompt, its link, "continue", or "run next session" authorises **S048 only**. No additional confirmation is needed once invoked; no invocation is occurring in this planning edit. Do not execute S049 automatically.

## Binding policy and completion roadmap

Read [the critical-path formalisation completion plan](../docs/FORMALISATION_COMPLETION_PLAN.md) before writing Lean. Owner policy: one **direct original theorem at a time**, pursue multiple substantial dependencies within the authorised session, not a one-lemma quota. S048's **sole active direct goal** is literal unchanged `theorem clm0107_exact : CLM0107`. `CLM0099` and `CLM0108` remain OPEN and deferred until separately authorised later. Frozen mathematics S020/S021; unchanged original `ETSHTS/Targets.lean`, `ETSHTS/Definitions.lean` (expected blob SHAs `e12f117589b1852e06aa669a405a6dc3ee652549` and `f5e71b625bdbf40f6c84551dd93f9ce375154519`). No weakened ellipse ratio, finite n ceiling, extra spacing, changed tie-break, fake cyclic indexing, geometric proxy graph, custom axioms, proof gaps, or new mathematics. Exactly original all n≥3, closed a/b≤R including equality, compulsorily ranked two Euclidean predecessors with lex ties, retained edge planarity.

## Verified starting point and fresh entry

Last completed S047, ordinary [PR #58](https://github.com/jfairfaxball-348/ellipse-theorem/pull/58), merged main `bfd9195c4734a27bc579fc5a3f8f7baad2285e8e`, git tree `5c37defea1ba6c18a3e289cb9a806ce2626a9504`, independently successful main Lean run `38797974855`, governance run `38797974839`. Confirm live main has not moved; verify PR-head Lean/governance and S047 ordinary two-parent merge, final axiom lines, branches/open PRs/rulesets and unavailable protection as UNKNOWN rather than assuming. Read S047 PROOF_COVERAGE and actual imported Lean, never just archived prose. Baseline 2/5 direct original statements: `CLM0096` and `CLM0102` VERIFIED, `CLM0107` OPEN, `CLM0108` and `CLM0099` OPEN/deferred. Local Lean not installed at last audit; use hosted GitHub Actions.

S047 compiled C1/C2: `s047_actual_sites_min_skip_cyclic_neighbours` on any original ellipse site S≥5 returns θ,i, true hull `cyclicNeighbours S v u w`, original membership in S.erase v, genuine minimum **squared Euclidean** eligible skip and strict incident `sqDist v u < skip`, `sqDist v w < skip`. Reuse it; do not redo hull-side proofs.

## S048 aggressive proof campaign — C3 then C4

**Obligation 1 (actual x indexing and delta):** For every original `x ∈ S.erase v` with `x ≠ u`, `x ≠ w`, derive the unique corresponding actual θ index, real forward angle δ in (0,2π), explicit distinction from first successors/predecessors and correct lifts across the 0/2π wrap. Use S046 membership/injectivity and exact `finRotate` properties; handle antipodal and arbitrarily close sites.

**Obligation 2 (true selected skip upper, critical):** Independently find an eligible witness span ≤4π/5 by cyclic averaging; bound its original Euclidean chord LENGTH ≤ 2a*sin(2π/5) (or squared equivalent). Use eligible *metric minimum* to transfer bound to selected original squared skip. Existing S036 conditional floor theorem does **not** already provide this actual geometric bound. Prove nonnegativity before squaring.

**Obligation 3 (central band, CLOSED):** For λ ≤ δ ≤ 2π−λ, derive actual ellipse squared chord ≥ [2b*sin(δ/2)]² ≥ [4ab²/(a²+b²)]²; use proved closed ratio inequality `s036_closed_ratio_central_floor` to compare with selected squared skip. Include δ=λ, δ=2π−λ, δ=π and equality a/b=R; use sine monotonicity on two halves or sine symmetry to avoid an unjustified global monotonicity claim.

**Obligation 4 (both short directions):** For δ<λ, competitor x is at least second forward successor; its first eligible skip has selected minimum ≤ its squared chord; apply `s035_forward_short_arc_competitor` only for strict beyond-second cases and handle exact second successor by minimum directly. Reverse for δ>2π−λ using actual lifted phases and `s035_backward_short_arc_competitor`; handle the exactly second predecessor separately. Neither endpoint of the central closed band may disappear.

**Obligation 5 (assemble all x and theorem):** Combine cases into `∀ x ∈ S.erase v, x≠u → x≠w → selectedSkip ≤ sqDist v x`. Use `s035_metric_ear_of_skip_chord_floor` with S047 strict incidents to construct unconditional original uniform ∀S≥5 `metricEar`. Apply `s042_clm0107_of_clm0096_and_ge5_ears clm0096_exact`; compile literal `theorem clm0107_exact : CLM0107`, root-import and `#print axioms ETSHTS.clm0107_exact` with standard-only dependencies.

## Engineering and honest reporting

Within S048 work on several modules/obligations; run multiple hosted compiler/repair cycles. It is better to close a true C3 quantitative bridge than to introduce a dozen unconnected helper statements. Before changing proof strategy, review S020's three-band argument and the roadmap; do not assume `s036_skip_witness_le_central_floor` is an unconditional geometric bound. No root theorem promoted from an unproved premise.

A session is complete only once its proof obligations and status are truthfully reported. If the literal CLM0107 proof has not compiled, status stays OPEN. Handover S049 as **FUTURE / UNEXECUTED** pursuing the same sole theorem with exact blocker, failed Lean goal, useful proved interfaces and next direct attack; do not pivot to CLM0108/CLM0099. If CLM0107 genuinely succeeds, S049 may instead target CLM0108 alone via `clm0108_of_clm0107_and_ratio` and the already verified exact 101/100 ratio lemma. For CLM0099 after that, heed the two pitfalls in the roadmap: overstrong 'any last vertex' forcing premise and false unrestricted outerplanar edge cap.

Fresh branch, archived `sessions/S048/{INPUT,PLAN,PROOF_COVERAGE,CLOSEOUT}.md`, state/ledger/README, and authoritative next prompt. PR-head Lean and governance SUCCESS on final authored commit before a normal two-parent PR merge; separately merged-main Lean and governance SUCCESS afterward, exact SHAs and axiom prints. No unsupported local-build claim. No paper/Palomar/novelty/outreach.
