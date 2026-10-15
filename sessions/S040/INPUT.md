# S040 — owner-authorised strict Lean formalisation

# S040 — FUTURE / UNEXECUTED: complete the frozen geometric and metric-ear recursion

**Execution authority:** A NEW explicit owner invocation (including “run next session”) immediately authorises exactly S040, without any additional confirmation. This file is a handover, NOT execution of S040. Do not execute S041 during S040.

Repository: https://github.com/jfairfaxball-348/ellipse-theorem
Namespace: `ETSHTS`.

## Non-negotiable frozen mathematics

The S020/S021 theorem and proof strategy are LOCKED. This is STRICT Lean formalisation, not new mathematical research. Never change `ETSHTS/Targets.lean` (byte-for-byte immutable); never weaken the exact CLM0096, CLM0099, CLM0107, CLM0108, substitute a different selector, change Cartesian tie-breaking, omit edges, impose angular separation or replace the all-cardinality quantifier. `clm0102_exact : CLM0102` is already compiled. No novelty audits, new conjectures, publication, Palomar, arXiv, paper or outreach.

## Live entry and S039 verification

Independently fetch LIVE remote main SHA and tree. Reconcile S039 one-parent authored SHA/tree, its ordinary non-draft PR, two-parent merge SHA/parents/tree, open branches/PRs, rulesets (403 = UNKNOWN), and both PR and independent merged-main Lean/governance jobs, steps and full logs. Run/inspect the pinned `lake build`, `lake env lean ETSHTS.lean`, the theorem-specific `#print axioms`, the forbidden-token scan, `python scripts/check_scaffold.py` and all seven governance tests. Do not mark a source lemma as verified until hosted CI actually passes; local checks not performed must be marked NOT_RUN.

S039 targets genuine support and two-distinct-new-edge lemmas in `ETSHTS/EarCounting.lean`: they prove a **single fresh insertion** under exact predecessor and support hypotheses. They do NOT yet prove global `2n-3` for an entire `Grow`, maximal outerplanarity, CLM0099, CLM0096, or all-n geometry. Fix any compiler errors rather than making unverified claims; never silently suppress or weaken a target.

## Strict proof-first priorities

**A — exact CLM0096:** Finish the collinear-triple betweenness trichotomy from `orientation = 0` and distinctness, then derive unconditional `noThreeCollinear` for finite positive-axis ellipse boundary sets using S038's exposed-segment exclusion. For four sites, formally split triangle-interior and strictly-convex hull cases, prove noncrossing inside spokes, and the diagonal-crossing/intersection-distance maximum argument with exact Cartesian ties. Close `clm0096_exact : CLM0096` only after the unchanged proposition compiles.

**B — exact CLM0099:** Use S039's per-insertion support and two-fresh-edge count with the complete `List.Nodup` history to derive `2n-3` for every legal `Grow`. Prove the maximal outerplanar hull-side saturation bound, last-arrival metric-ear necessity, and the recursive converse by insertion along hull sides without introducing proper crossings. Establish BOTH directions of the original `FullEarCertificate` iff, not only the three-site base. Close `clm0099_exact : CLM0099` only if Lean compiles it unchanged.

**C — exact CLM0107/0108:** Formalise unique positive cyclic ellipse angles modulo `2π`, positive wraparound gaps, finite eligible metric skip-chord minimum, forward/backward directed competitors and weak central band including equality and antipodal ties. Reuse the S035/S036 proofs, preserve the closed `a/b ≤ R` case and EVERY finite cardinality. Finish `clm0107_exact : CLM0107`, then derive `clm0108_exact : CLM0108` from the already proved rational ratio comparison.

## Integrity and stop

No `sorry`, `admit`, custom `axiom`, mathematical `native_decide`, hidden extra hypotheses or recast targets. Commit only actual compilable Lean progress, explicitly distinguish partial lemmas from full target proofs and never interpret an incomplete Lean formalisation as a mathematical refutation. Exactly one isolated S040 branch, one atomic authored single-parent commit, ordinary non-draft PR, separate green Lean/governance checks, ordinary two-parent merge and independent merged-main verification if the proof content passes. Archive accurate gaps and full `S041 — FUTURE / UNEXECUTED` prompt; do not run S041. Include actual GitHub URLs and SHAs in the closeout.


The owner's message ‘run the next session’ is the new explicit invocation of S040 only.
