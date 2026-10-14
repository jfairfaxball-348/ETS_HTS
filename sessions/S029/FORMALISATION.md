# S029 — strict outward ellipse chord extension: proof reduction and remaining barriers

**Status: PARTIAL.** The original exact Lean targets CLM0096 / 0099 / 0102 / 0107 / 0108 are unchanged and all still open. No source result here is a full CLM0102 theorem, and no named proof is kernel-certified until hosted Lean succeeds.

## 1. New explicit identities (Lean source in `ETSHTS/HalfAngle.lean`)

For `δ=φ−θ`, `t=δ/2`, `M=(a²+b²)/2`, `D=(a²−b²)/2`, the *independently obtained* endpoint derivatives from S028 admit:

```text
∂φ F(θ,φ) = 4 sin t [ M cos t − D cos((θ+3φ)/2) ]
−∂θ F(θ,φ) = 4 sin t [ M cos t − D cos((3θ+φ)/2) ].
```

The exact proof routes use only `sin(x±y)`, `sin(2x)`, ring identities, and S028's separate `deriv` witnesses. For the first derivative:
```text
∂φ F = (a²+b²) sin(φ−θ)
       +(a²−b²)(sin(θ+φ)−sin(2φ)).
sin(φ−θ) = 2sin t cos t.
sin(θ+φ)−sin(2φ) = −2sin t cos((θ+3φ)/2).
```
For the left derivative the second term changes sign and
`sin(θ+φ)−sin(2θ)=2sin t cos((3θ+φ)/2)`.
Both are separately formalised; the left case is NOT obtained by silently swapping the right endpoint.

The source additionally formalises `0<M`, `0≤D`, and the algebraic implication
`D/M<cos t ⇒ M cos t−D cos ψ>0` for every real phase `ψ`.
The two endpoint positivity theorems are **conditional on the explicit half-angle sine/cosine bounds**. They are not full short-arc theorems.

## 2. Real-analysis proof of the precise missing cutoff

Under `0<b≤a`, put `x=b/a`, so `0<x≤1`. Then
`0<2atan x≤π/2`, `D/M=(1−x²)/(1+x²)=cos(2atan x)`.
For `0<δ<Λ=4atan x` we have `0<t<2atan x≤π/2`; consequently
`sin t>0` and strictly decreasing cosine on `[0,π]` gives
`cos t>cos(2atan x)=D/M`. As `cos ψ≤1` and `D≥0`,
`M cos t−D cos ψ ≥ M cos t−D>0`.
Thus **both outward signs hold mathematically**, including the circle `a=b`,
all real lifts, and arbitrary positive gaps (the cutoff inequality is *strict*).

**Formal gap:** supply pinned-mathlib Lean proof terms for `0<sin t`,
`cos t>D/M` directly from `0<φ−θ<lambda a b`. Do not add these as
extra assumptions to the original CLM0102 target. The tangent double-angle
identity must be proved at `x=b/a>0` with denominators justified.

## 3. Strict extension from endpoint derivatives

Given `θ₀≤θ₁<φ₀≤φ₁`, at least one strict endpoint change, and
`φ₁−θ₀<Λ`, all intermediate arcs have widths strictly between 0 and Λ.
Apply strict monotonicity first in the right endpoint on `[φ₀,φ₁]` with
left endpoint θ₁ fixed, then in the left endpoint on `[θ₀,θ₁]` with
right endpoint φ₁ fixed, where `−∂θ F>0`.
This gives
`F(θ₁,φ₀)<F(θ₀,φ₁)` whenever at least one interval has positive length.
No stronger statement at `δ=Λ` is used.
**Formal gap:** Lean calculus monotonicity and strict-interval case split,
followed by assembling the *unchanged* conjunction `CLM0102`.

## 4. Full four-point and ear programme rechecked, not formalised

CLM0096: interior fourth point may be inserted after the containing triangle.
For a convex quadrilateral diagonals intersect at O. Choose the vertex A
maximising distance to O and let C be opposite A; triangle inequalities give
`CA=CO+OA>CB` and `CA>CD` (since `CB<CO+OB≤CO+OA`).
So C's mandatory two closest predecessors are its hull neighbours B,D;
seed A,B,D and insert C. Formalising open segments and strict convexity in
the exact `Finset Point` vocabulary remains unresolved.

CLM0099: a planar convex retained construction has `2n−3` edges;
a noncrossing graph on n strictly convex sites has at most `2n−3`;
the missing-hull-side argument forces every hull side. The final vertex has
only its two insertion edges, therefore they must be its two hull sides.
Remove the vertex and recurse; reverse a full metric-ear certificate for
sufficiency. The outerplanar extremal theorem, deletion edge invariants and
precise cyclic neighbour geometry remain formal gaps.

CLM0107: the S020/S021 metric skip-chord minimiser among eligible two-gaps
remains the indispensable argument. No Lean finite cyclic-angle
enumeration, `Λ>4π/5` at closed R, central floor, recursive ear extraction,
nor unconditional all-n theorem has been produced in this session.
CLM0108 still requires exact symbolic `101/100≤R` in Lean *and* CLM0107.

## Verdict / integrity

- Actual source proof terms attempted: 11, including both factored derivatives.
- Kernel status: require hosted S029 Lean job (no local Lean installed).
- **S029 PASS gate: NOT MET. PARTIAL / OPEN.**
- No `sorry`, `admit`, `axiom`, mathematical `native_decide`, changed target
  quantifiers, finite-n shortcuts, or publication/novelty activity.
- Archive remains CND131 killed131 / SRC87 / CLM108 / CAM10. S024 conditional
  novelty audit remains the last novelty decision.
