# S041 — FUTURE / UNEXECUTED: sustained end-to-end Lean attack on the frozen ellipse theorem

**Execution authority:** A **new explicit owner invocation** to run S041 or “run the next session” authorises **exactly S041 immediately**, without another confirmation. This file is a future handover, NOT execution of S041. A session may contain many proof modules, many compiler/repair passes and attempts at all remaining headline theorems. S042 is not authorised or executed here.

Repository: https://github.com/jfairfaxball-348/ellipse-theorem
Lean namespace: `ETSHTS`

## 0. Owner's revised operating instruction — maximise complete formalisation, not session count

**The objective of S041 is to formalise as much of the ENTIRE locked theorem as can genuinely be completed in this session, potentially all remaining CLMs.** Do not treat “one lemma”, “one theorem file”, “one green CI”, “one improvement” or “one pass through each workstream” as a stopping target.

Work assertively and persistently: plan the complete dependency graph; prove several substantial linked lemmas; connect them to actual unchanged target declarations; compile, read errors, repair and recompile; then continue to the NEXT useful dependency. Repeat the cycle while resources and context permit. Prefer completing end-to-end chains to producing isolated cosmetic helper lemmas. If one lane stalls, work a different independent lane instead of surrendering the whole session.

Do not impose arbitrary quotas of proof attempts, lemma count, module count or CI iterations. This is permission for ambitious work, NOT permission to weaken statements, hide failures, invent proofs or launch later numbered sessions. Work done only on a handover/roadmap is not a substantive mathematical formalisation result.

**Resource boundary:** If available context, compute, time or tool access genuinely prevents responsible continuation, preserve every verified result, spell out the precise first missing inference/compiler obstacle and its dependants, and roll the remaining work into a detailed S042 FUTURE / UNEXECUTED handover. Do not expend the last available resources on repeated unproductive attempts; do not falsely mark a result completed; do not execute S042.

## 1. Mathematical specification is LOCKED

This is **strict Lean formalisation of existing S020/S021 mathematics**, not mathematical research. Preserve `ETSHTS/Targets.lean` **byte-for-byte** and the definitions in `ETSHTS/Definitions.lean` unless a separately justified definitional equivalence is formally proved without changing any target (prefer no edits to either). Preserve all original semantic conditions:

- `CLM0096`: every distinct non-collinear finite three/four-point configuration, including the interior-point and strictly convex quadrilateral cases.
- `CLM0099`: for EVERY finite strictly convex set with at least three sites, exact `planeNearestTwoOrder S ↔ FullEarCertificate S`, both directions and the full recursive certificate.
- `CLM0102`: both derivative signs and strict short-arc extension, **already compiled** as `clm0102_exact`.
- `CLM0107`: every finite ellipse-boundary set at every cardinality ≥3, `a≥b>0`, `a/b≤R` **including equality**, arbitrarily close/antipodal sites, Euclidean two nearest predecessors with exact Cartesian lex ties, retention of all earlier edges and no proper crossings.
- `CLM0108`: exact all-cardinality 101/100 nonround ellipse corollary, not a bounded or generic substitute.

The sufficient `R = sqrt(2 / sin(2π/5) − 1)` is not asserted optimal. Use the locked original eligible **metric skip-chord minimum** strategy, not a new angular/shortest-edge/minimax selector. No spacing assumptions, changed ties, missing edges, circles-only proof or `a/b<R` shortcut. Do not reopen the mathematical proof, novelty review, other conjectures, Palomar, arXiv, journal paper or outreach. Distinguish internal original paper argument from what Lean has actually proved.

## 2. Mandatory live entry — but keep it efficient

Fetch fresh `main` SHA/tree, STATE, AGENTS, this handover, open PRs/branches/rulesets/protection and latest workflow evidence. Reconcile S040 [PR #48](https://github.com/jfairfaxball-348/ellipse-theorem/pull/48): authored initial `57da5f83a55f05facac0272c5507cd83fa5607b2` and subsequent compiler-repair `dfdfcd1d9a95bf9a490a25715a46adb78984663a`; two-parent normal merge `56e9c184f95b9054cbe175b3ab402f02dd5cdaab`, parents `5b6d2b868e27a58aa6c1ea1607fb049c7983fd20` and repaired head `dfdfcd1d9a95bf9a490a25715a46adb78984663a`, matching tree `913acc6faac9dc7fb03c3d27c917e253405e62b0`. The repaired PR Lean/governance runs are [38717538196](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38717538196) / [38717538238](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38717538238); independent merged-main runs [38717954160](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38717954160) / [38717954259](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38717954259), all SUCCESS. S040 `s040_grow_support_and_exact_count` is VERIFIED by Lean with only standard axioms `[propext, Classical.choice, Quot.sound]`; seven governance tests passed. Freshly verify these before relying on them, and mark any inaccessible checks UNKNOWN, not passed.

Read the existing modules: `ETSHTS/Definitions.lean`, `Targets.lean`, `FourPoint.lean`, `ThreePredecessors.lean`, `EllipseConvex.lean`, `EarFramework.lean`, `EarCounting.lean`, `GrowCounting.lean`, `EligibleSkip.lean`, `CentralRatio.lean`, `RationalBound.lean` and root `ETSHTS.lean`; check S020 proof and S021 hostile audit/blueprint. Build a concrete **proof dependency map** from existing proved lemmas to each open exact CLM, marking missing geometry, combinatorics, angular parameterisation and type/definition bridges. Allocate effort based on theorem-critical path and ability to compile, not chronological one-file progression.

## 3. Four substantial, interconnected proof workstreams

**Workstream A — exact finite geometry and CLM0096.** Prove orientation-zero collinear betweenness trichotomy for three distinct points, use the verified S038 strict-support/exposed-segment exclusion to derive ellipse `noThreeCollinear`, and establish the full four-site combinatorial/geometric case split. Construct noncrossing spokes for interior fourth sites; in a convex quadruple formalise diagonals/intersection-distance reasoning sufficient to identify an allowable exact nearest pair, with equality resolved by Cartesian priority. Connect all these facts to `FourPoint` and `ThreePredecessors` rather than stopping at a geometric illustration. Attempt and close `theorem clm0096_exact : CLM0096` on the original proposition.

**Workstream B — exact global graph count and CLM0099 iff.** From S039/S040 complete the three-edge distinct triangle seed, nodup-history/cardinality conversion, and the full `2*n−3` final-edge theorem, with correct definitions and quantifiers. Then prove hull-side saturation/maximal outerplanarity under the actual `planeEdges` and strict convexity predicates, last-arrival metric-ear necessity and the recursive removal step. Separately build the converse by reinserting each certified metric ear and proving no new proper crossings, preserving exact nearest-two/ties. Close `theorem clm0099_exact : CLM0099` ONLY once **both** directions compile unchanged. Do not mistake the count alone, a generic planar graph result, or the three-site base for the complete iff.

**Workstream C — ellipse cyclic geometry and uniform metric-ear existence.** Construct rigorous finite cyclic angular order of distinct ellipse sites modulo `2π`, positive wraparound gaps and two-gap `4π` sum, with every finite n≥5. Reuse S035/S036, the verified short-arc and closed-ratio inequalities, and prove the selected eligible **Euclidean metric** skip chord gives the strict two-nearest hull neighbours against every remaining competitor. Handle directed forward/backward and central cases, long arcs, closed threshold equality and antipodal distance/tie behaviour. Make the type bridges from angles to original `Point`, `metricEar`, `FullEarCertificate` and `Grow`; apply the recursive ear result for **every** n. Once dependencies are available, attempt `theorem clm0107_exact : CLM0107` rather than stopping at eligible witness existence.

**Workstream D — integrate the exact headline results.** Exploit the verified `clm0102_exact` without reopening it. Compose A+B+C to close the entire chain. Immediately after CLM0107 is proved, use the already-verified `ellipse_ratio_101_le_R` and `clm0108_of_clm0107` to close `theorem clm0108_exact : CLM0108`. Put every new exact target's `#print axioms` in the root and check Lean kernel dependencies. If the overall proof becomes possible in S041, COMPLETE it in S041; there is no requirement to leave a target for S042.

These are workstreams, **not four one-shot tasks**. Order/interleave them to unblock shared prerequisites. Produce multiple real lemma files if useful; consolidate proofs to avoid unrelated scaffolding. Explicitly search existing mathlib lemmas for geometric separation and finite cyclic combinatorics rather than recreate large foundations blindly. Do not trust apparent syntax, imported proposition definitions, or a green build of a mere `def` as proof of an exact CLM.

## 4. Required iterative proof-engineering loop

1. Start with a concrete missing dependency that would unlock multiple downstream exact claims; read the actual definitions and prove it with no hidden assumptions.
2. Add proof terms and appropriate imports plus `#print axioms` for genuinely proved lemmas. Develop connected follow-on lemmas in the same attempt instead of stopping after the first success.
3. Run local `lake build` / `lake env lean ETSHTS.lean` if a toolchain exists. Otherwise use the existing GitHub Actions Lean workflow after committing to the session branch. Inspect the **actual** compiler error line and failed proof state, not only the red/green badge.
4. Fix type mismatches, goals, API/import issues and logical gaps; rerun compilation. If a chosen approach demonstrably stalls, record the precise obstacle, switch workstreams or use a better theorem-equivalent bridge. Multiple repair iterations and multiple substantive lemmas per session are expected. Do not force-push or erase failed evidence; allow traceable corrective commits when hosted CI is the only compiler.
5. After a green proof dependency, continue to the next meaningful dependency, ideally closing a named exact target. No artificial “one lemma per S###” restriction.
6. At every significant stage, maintain a short proof coverage ledger: `VERIFIED`, `SOURCE_PENDING_CI`, `OPEN`, or `BLOCKED`, with exact proposition names, imports, missing hypotheses, and expected next bridge.

Do NOT use `sorry`, `admit`, custom `axiom`, `native_decide` trust gaps, opaque replacements for target propositions, modified selector, hidden extra hypotheses, unvalidated external proof tools, or reductions to an easier theorem. If a genuine formal inconsistency emerges, preserve the original statements, archive the exact Lean counterevidence and report a BLOCKER rather than silently changing mathematics.

## 5. Exit only on complete success or an honest resource boundary

**Preferred end state:** all remaining four exact `CLM0096`, `CLM0099`, `CLM0107`, `CLM0108` compiled, axioms inspected, and PR plus independent merged-main CI green.

**If partial:** maximise the number and depth of **compiled** dependencies. Identify the first unsatisfied mathematical/formal inference on every remaining critical path, not merely a vague “more geometry needed.” Explain attempts, actual Lean failures, successful repairs and whether a blocker is mathematical, formal, tooling or resource-related. Prioritise the most consequential missing dependency in S042, but transfer the complete backlog and original theorem unchanged. Do not treat exhaustion of a predefined task list as a reason to stop while useful work remains.

One isolated S041 branch from observed main; make a coherent authored commit for the proof changes and ordinary non-draft PR. Where hosted compilation requires corrective pushes, preserve their individual single-parent commits; no force/squash/rebase. Verify PR Lean **and** governance, then ordinary two-parent merge where green, and separately verify merged-main Lean/governance. Run `python scripts/check_scaffold.py`, all seven governance tests, `lake build`, `lake env lean ETSHTS.lean`, target-specific axiom inspection and a forbidden-token scan through local tools or hosted workflows; unrun checks = `NOT_RUN`. Close out with actual SHAs, tree, run/job URLs and precise coverage.

Archive `sessions/S041/INPUT.md`, `PLAN.md`, `CLOSEOUT.md`, and helpful proof coverage/failure notes, update `STATE.json` truthfully, and write the **complete** `S042 — FUTURE / UNEXECUTED` prompt if required. Do NOT run S042. A mere rewritten handover never counts as a completed S041.
