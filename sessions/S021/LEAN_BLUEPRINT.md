# S021 handoff: Lean 4 formalisation of EXISTING S020 theorem only

> **SUPERSEDING OWNER INSTRUCTION — 2026-10-14 (administrative; NOT S022):** Before formalisation the next session MUST perform a comprehensive hostile historical prior-art/novelty audit. S022 is now NOVELTY ONLY. References below to “S022” refer to the formerly queued Lean plan and do NOT authorise Lean at S022. Preserve this technical blueprint for potential FUTURE S023 only if S022 concludes CONDITIONAL_NOVELTY_SUPPORTED; a fresh owner invocation is still required. Otherwise Lean remains blocked by novelty/owner decision.


**Conditional target.** S021 hostile mathematical audit PASSED internally. FUTURE S022, requiring a fresh owner invocation, is formalisation only. No Lean file, mathlib environment, Palomar job, manuscript, contact or external certification was created during S021. No stronger ellipse threshold or new candidate is permitted.

## Representation and definitions (avoid ambiguous informal geometry)

Prefer `P : ℝ → EuclideanSpace ℝ (Fin 2)` with `P a b θ = ![a * Real.cos θ, b * Real.sin θ]`, and `a ≥ b > 0`. Finite site set `S : Finset (EuclideanSpace ℝ (Fin 2))` with all members on the parametrised boundary; formally either `∀ p∈S, ∃ θ∈Ico 0 (2*pi), p=P a b θ` and distinctness, or an injective indexed `Fin n → ℝ` angle list strictly increasing and <2pi. A strictly increasing cyclic angle list is likely preferable for the core analytic theorem; later lift to arbitrary finite sets using bijection/rotation. Squared distance `distSq p q := (p-q)ᵥ ...` or `‖p-q‖^2`, and prove nonnegative norm-square and monotonic square equivalences.

For each vertex `v`, define `lexLT p q := p 0 < q 0 ∨ (p 0 = q 0 ∧ p 1 < q 1)`; lexicographic tie selection orders predecessors by the pair `(distSq v u, coordinates u)`. Prove a strict-distance separation lemma yields the exact two nearest regardless of lex tie policy. No reliance on `Finset` iteration-order or a noncanonical predecessor tie.

Define `properCross (p q r s)` for independent endpoints by strict signed orientation products or by `∃ x, x∈ openSegment p q ∧ x∈ openSegment r s`; for ellipse sites, three-point collinearity is impossible. `planeEdges` means no distinct-endpoint proper crossings. Define `arrivalOrder : Equiv.Perm (Fin n)` or ordered nodup list; `ngGraph` has initial triangle edges and precisely the distance-ranked two edges for every later vertex, with all older edges retained. Define cyclic `pred/succ` on sorted indices and `metricEar T v` as exactly those two hull neighbours being the nearest two other sites. Define `EarDeletable T` by finite well-founded recursion to size three, or by a certificate list of deletions; the latter makes reversal explicit and avoids choice issues.

## Draft theorem signatures (mathematical specification; NOT compiled code)

```lean
-- Illustrative interfaces only; names/imports/notation to be verified in S022.
def ellipsePoint (a b θ : ℝ) : EuclideanSpace ℝ (Fin 2) := ...
def ellipseBoundary (a b : ℝ) (p : EuclideanSpace ℝ (Fin 2)) : Prop := ...
def metricEar (S : Finset (EuclideanSpace ℝ (Fin 2))) (v : _) : Prop := ...
def planeNearestTwoOrder (S : Finset (EuclideanSpace ℝ (Fin 2))) : Prop := ...
def lambda (a b : ℝ) : ℝ := 4 * Real.arctan (b / a)
def R : ℝ := Real.sqrt (2 / Real.sin (2 * Real.pi / 5) - 1)

theorem clm0096_four_sites
  (S : Finset (EuclideanSpace ℝ (Fin 2)))
  (hcard : 3 ≤ S.card ∧ S.card ≤ 4)
  (hgeneral : NoThreeCollinear S) :
  planeNearestTwoOrder S := by ...

theorem clm0099_ear_iff
  (S : Finset (EuclideanSpace ℝ (Fin 2)))
  (hcard : 3 ≤ S.card) (hconvex : StrictlyConvexPosition S) :
  planeNearestTwoOrder S ↔ EarDeletable S := by ...

theorem clm0102_outward_chord_derivative
  (a b θ φ : ℝ) (ha : 0 < b ∧ b ≤ a)
  (hθφ : θ < φ) (hshort : φ - θ < lambda a b) :
  0 < deriv (fun t => distSq (ellipsePoint a b θ) (ellipsePoint a b t)) φ := by ...

theorem clm0107_uniform_ellipse
  (a b : ℝ) (ha : 0 < b ∧ b ≤ a)
  (hr : a / b ≤ R)
  (S : Finset (EuclideanSpace ℝ (Fin 2)))
  (hcard : 3 ≤ S.card)
  (hon : ∀ p ∈ S, ellipseBoundary a b p) :
  planeNearestTwoOrder S := by ...

theorem clm0108_nonround_example :
  1 < (101 : ℝ) / 100 ∧
    (∀ S : Finset (EuclideanSpace ℝ (Fin 2)),
      3 ≤ S.card →
      (∀ p ∈ S, ellipseBoundary ((101 : ℝ)/100) 1 p) →
      planeNearestTwoOrder S) := by ...
```

These are **specifications**, not verified compilable interfaces: `NoThreeCollinear`, `StrictlyConvexPosition`, `planeNearestTwoOrder` and `EarDeletable` must be implemented or substituted with proven mathlib equivalents. For CLM-0102 also add LEFT outward derivative with minus sign and a full strict endpoint-extension theorem. The full CLM-0102 claim additionally includes the short-arc recursive ear order, not merely its derivative; prove both.

## Proof DAG / dependency order

1. Foundational finite geometry: ellipse strict convexity and parameter injectivity modulo 2pi; no-three-collinear; signed orientation test, polygon hull-side ordering, plane edge count bound E<=2n-3, hull-side saturation; ordered predecessor-nearest tie rule.
2. CLM-0096: seed 3, interior 4 optional generality, convex quadrilateral and maximal diagonal-intersection-distance argument.
3. CLM-0099: necessity via edge count and degree-2 last vertex; sufficiency via strict-convex cyclic neighbour boundary-edge insertion; induction/well-founded descending cardinality. Do not confuse 'has one ear' with full recursive certificate.
4. Analytic core: squared chord formula, partial derivatives for BOTH endpoints, cos(2atan x) relation, lambda=2arccos(D/M), strict chord-extension for span <lambda; finite short-arc CLM-0102.
5. Trigonometric/algebraic bounds: s-sum=4pi, strict 4pi/5<lambda even at r=R (via R<cot(pi/5)), skip chord witness upper bound, central chord lower bound, r²+1<=2/sin(2pi/5). Show all trig denominators strictly positive.
6. CLM-0107: finite nonempty eligible indices; choose index minimising metric skip-length, prove adjacent chords strictly smaller; classify every competitor into forward/central/backward, handle endpoints centrally; build ear certificate recursively until 4; apply CLM0096/0099 to obtain order.
7. CLM-0108: exact `sin(2pi/5)^2=(5+sqrt 5)/8`, rational inequality `101/100 < R`, universal instantiation.

## Mathlib and anticipated bottlenecks

Use a pinned Lean 4 toolchain and mathlib revision via `lake init ... math`, `lake exe cache get`; pin both hashes in S022 and archive `lakefile.toml`, `lean-toolchain`, `lake-manifest.json` plus CLI/compiler output. Expected useful libraries: `Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic`, real derivatives/calculus, `Mathlib.Geometry.Euclidean`, `Mathlib.Data.Finset`, `Mathlib.Data.Real.Sqrt`, `Mathlib.Tactic`; these module names are starting points **to verify at S022**, not claimed to exist exactly or supply bespoke lemmas. Use `Real.sin`, `Real.cos`, `Real.arctan`, `Real.sqrt`, `norm_num`, `positivity`, `nlinarith`, `ring`, `linarith`, `field_simp` after hypotheses. The principal bottlenecks are: formal convex-hull cyclic geometry and outerplanar edge bound on Finsets, representing cyclic lifted angle gaps and n-2 skip indexing, differentiating two-argument real trigonometric chords and proving strict signs, and exact radical trig identity at 72 degrees. Do not evade any with axioms or unproved imports.

## S022 implementation plan and acceptance gates

Proceed in small independently compilable modules: Geometry/Definitions; Geometry/FourPoint; Geometry/EarEquivalence; Analytic/Chord; Analytic/Threshold; Geometry/UniformEar; Main/Theorems. First formally specify every theorem and prove equivalence between friendly statements and final versions. Then fill dependencies from leaves to headline with actual compiler evidence, covering n=3,4,5, r=1,R, lambda endpoints, lex ties and arbitrary finite S. A built proof with extra hypotheses is not a pass. **PASS** iff a clean pinned Lean 4 + mathlib checkout compiles every target, with `#print axioms` showing no nonstandard axioms and no `sorry`, `admit`, `native_decide` trust gap, magic theorem import or weakened quantifier. Preserve build logs and hashes; run independent statement audit. **FAIL** on unresolved definitions, axioms, partial proofs, inability to compile, or a changed theorem. Record partial coverage honestly without claiming Lean verification. Palomar is a later independent owner-gated readiness decision, not authorised now.

## Repo and authority

S022 may implement Lean in this repository on a fresh session branch, avoiding an unapproved separate repo. A dedicated Lean repo can be proposed to the owner but is NOT created by this blueprint. Do not carry out any new ratio optimisation, ellipse counterexample search, external communication, paper or submission. After a clean formalisation, ask the owner about Palomar as a separate authorised stage.
