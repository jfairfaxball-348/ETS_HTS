# S035 — FUTURE / UNEXECUTED: prove or refute the Euclidean minimax-ear selector and discharge real four-site Lean geometry

**FUTURE / UNEXECUTED. A new explicit owner invocation of this prompt (including a GitHub link to it) authorises exactly S035 immediately and without a second confirmation; it does not authorise S036.** Repo https://github.com/jfairfaxball-348/ellipse-theorem ; Lean namespace ETSHTS.

## Mandatory entry and S034 provenance

Independently pin actual LIVE main SHA and actual commit tree, not S034 authoring hashes. Reconcile S034 authored single-parent commit with entry main `67e93fc2fc0c3f08228bcddf39c5cfd838e9e0d3`, source tree, ordinary non-draft PR, two-parent GitHub merge (old main, authored), merge tree, all open PRs/branches and accessible rulesets/protection. Independently inspect S034 PR Lean/governance and merged-main Lean/governance job runs and actual logs for `lake build`, `lake env lean ETSHTS.lean`, specific s034 `#print axioms`, negative grep, `python scripts/check_scaffold.py` and `python -m unittest discover -s tests -v`. No absent, queued or failing check counts as pass. Investigate and repair any failure before assuming S034 source is kernel-proven.

Read `AGENTS.md`, `authoritative/STATE.json`, `authoritative/START_HERE.md`, `ETSHTS/Targets.lean`, `ETSHTS/Definitions.lean`, `ETSHTS/RationalChord.lean`, `ETSHTS/CyclicGapObstruction.lean`, `sessions/S034/MATHEMATICS.md`, `sessions/S034/CLOSEOUT.md`, `sessions/S034/VALIDATION.txt` and previous relevant Lean modules.

## Immutable five exact targets

- CLM0096: every finite three/four-site general-position set, compulsory exactly-two-nearest retained planar order, including Euclidean distance ties.
- CLM0099: every n>=3 finite strictly convex site set, planar order **iff** complete recursively valid FullEarCertificate.
- CLM0102: both outward derivatives and real-lift strict chord extension, already verified, preserve exact type.
- CLM0107: every n>=3 finite distinct ellipse-boundary site set with a>=b>0, a/b<=R **including equality**, exactly two Euclidean nearest predecessors, Cartesian lex ties, all prior edges retained, no proper crossing.
- CLM0108: ratio 101/100 full all-n corollary only from closed CLM0107 and proven ratio inequality.

Do not change `ETSHTS/Targets.lean`. No sorries, admits, custom axioms or native_decide shortcuts.

## Critical S034 mathematical inheritance

S033 **refuted** the universal minimum angular two-gap selector on ratio 101/100 at five explicit rational sites; Lean verified its rational squared-distance reversal, not cyclic arctan ordering. S034 identifies **another** exact rational five-site failure of choosing an arbitrary endpoint of the shortest hull edge: parameters `0,1/8,1/4,-6,-4`, where endpoint `P(-6)` is not a metric ear despite being incident to the globally shortest adjacent edge. S034 adds a uniform homogeneous rational half-angle chord numerator identity: `D(t)=1+t²`, `X=a(1-t²)`, `Y=2bt`, and squared chord numerator `4(t-u)²(a²(t+u)²+b²(1-tu)²)`. First inspect its separate CI; the mathematical rational identity is not automatically an all-n ear theorem.

The **Euclidean minimax selector** `i ∈ argmin max(|P_i-P_(i-1)|², |P_i-P_(i+1)|²)` is a new candidate, NOT proved; numerical sampling near 1.01/1.05 saw no refutation while larger eccentricity can fail. Adversarially test minmax with exact rational arithmetic, a/b=R boundary approximation certified with interval bounds, near-collisions, uneven clusters, n=4..12, and exact tie ranking. A counterexample kills the selector, NOT automatically the ellipse theorem. If minmax survives, derive rigorous inequality against every nonneighbor from convex geometry, Ptolemy-type quadrilateral bounds and the exact homogeneous chord formula, treating both cyclic directions, complementary wraparound, far arcs and equality R. If minimax fails, develop the alternative pair-of-minima, lex minimax and global ear-existence route. Do not infer Euclidean chord inequalities from angles without proof.

## Other highest-priority Lean tasks

1. **Finish CLM0096 itself.** Prove proper-cross absence for interior fourth point using barycentric coordinates/segment convexity; prove four-site hull/interior dichotomy; for convex A-B-C-D show diagonal O exists in both open segments; choose A with maximal distance from O and show C nearer to B and D than A by strict triangle inequality. Formalise all geometry and obtain an exact theorem `clm0096_exact : CLM0096`, checking axiom print. Don't substitute a conditional helper.
2. **CLM0099 complete iff.** Formalise edge freshness and total 2n-3 for Nodup insertion, outerplanar maximality, forced hull sides, last vertex hull degree 2 and nearest-neighbour ear, full recursive deletion and converse reconstruction. A single ear is insufficient.
3. **CLM0107 genuine all n** using surviving selector or alternative; prove n3/n4 and closed-R equality, short arc/long arc/wraparound, lex ties. Deduce CLM0108 only after its exact antecedent is proved.
4. Explicitly distinguish polynomial identities, geometric propositions with pending hypotheses, numerical experiments, actual `#print axioms` results and exact completed CLM proofs.

## Exit/integration protocol

Exactly one S035 isolated branch and **one atomic authored single-parent commit**, ordinary **non-draft PR**, then **two-parent merge** only after both independent PR Lean and governance jobs succeed. Verify PR head, authored parent/tree, merge parents/tree, newly fetched main and both fresh merged-main CI jobs. Run pinned `lake build`, `lake env lean ETSHTS.lean`, relevant theorem axiom prints, no holes grep, scaffold and Python unit tests. No local Lean/lake => report local NOT_RUN and rely on observed hosted output. If exact all five CLMs not proved, verdict PARTIAL and enumerate outstanding obligations. Preserve no Palomar, paper, arXiv, submission or outreach. Write a **complete S036 FUTURE / UNEXECUTED** handover for the next separate owner invocation, never execute S036 here. Include full next prompt and verified GitHub URLs in the chat closeout.
