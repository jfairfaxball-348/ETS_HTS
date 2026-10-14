# S028 formalisation: independent endpoint derivatives and circle chord

## Status
PARTIAL / OPEN. All five exact CLM0096/0099/0102/0107/0108 remain unproved under the unchanged propositions. This session focuses on the two distinct derivatives; it does **not** claim the strict positive sign or the extension inequality.

## Concrete Lean declarations (subject to hosted proof checks)
File `ETSHTS/Derivatives.lean`, imported by the root:
- `hasDerivAt_sqDist_ellipse_right`: exact HasDerivAt proof for the moving right endpoint, obtained from actual sin/cos derivatives, squared distance and ring normalisation.
- `hasDerivAt_sqDist_ellipse_left`: independent HasDerivAt proof for moving left endpoint, not inferred from a directional inequality.
- `deriv_sqDist_ellipse_right`, `deriv_sqDist_ellipse_left`: exact `deriv` identities from their HasDerivAt witnesses.
- `sqDist_unit_circle_cos_sub`: exact circle squared chord `2−2cos(θ−φ)` using `Real.cos_sub` and Pythagorean sin/cos identities.

The mathematical nontrivial difference is **both exact derivative *values*** now have separately authored proof terms; the key quantitative strict sign, elliptic cutoff `Λ`, full four-parameter strict endpoint extension, all four-point geometry and ear recursion still remain open. The original all-n closed-R theorem and exact 101/100 corollary are not claimed. No Prop target was weakened or replaced with conditional proof.

## Required remaining proof DAG
Prove factorisations:
```
∂φ d² = 4sin(δ/2)[M cos(δ/2) − D cos((θ+3φ)/2)]
−∂θ d² = 4sin(δ/2)[M cos(δ/2) − D cos((3θ+φ)/2)]
M=(a²+b²)/2, D=(a²−b²)/2, δ=φ−θ.
```
Derive `0<sin(δ/2)` and `cos(δ/2)>D/M` from `0<δ<4atan(b/a)`, including a=b and arbitrary real lifts. This must be proven (not assumed) and gives BOTH strict signs. Then apply calculus monotonicity to outward endpoint motions to yield CLM0102's full strict inequality.

For CLM0096 prove interior/spoke and strictly convex diagonal case in the exact `Finset Point`/Grow/planeEdges vocabulary. For CLM0099 establish edge count, missing hull sides, last-vertex ear necessity and reversal at all recursive depths. For CLM0107 formalise finite cyclic order, eligible short two-gaps at **closed R**, select minimum metric skip chord, and prove both short-side monotonicities and the central floor/ceiling (S027 sandwich and S028 circle identity). Iterate down to 4. Prove exact CLM0108 ratio and invoke unconditional CLM0107.

## Integrity
S027 was independently confirmed: branch SHA `650b34e76828ad0ecccd8573ed1acfe457b27a37` one parent `b7f816989d8f65371243ee8cd4de30ebd8fe75a5`; PR32 merged as `a164b4bb30de23d10ff231b63b399e3f054e1c2c` with ordered parents `b7f816...`, `650b34...`; both tree SHAs `de00aabdb64528463a5c1a7d49ca525f116eadbe` match. Authored S027 hosted Lean runs 38603642997/38603619569 SUCCESS and governance run 38603643083 SUCCESS; merged-main distinct Lean and governance checks also SUCCESS. These verify compiled S027 supporting declarations only.

Entry S028 main `a164b4bb30de23d10ff231b63b399e3f054e1c2c`; its tree `de00aabdb64528463a5c1a7d49ca525f116eadbe`. Local checkout and lean/lake/elan unavailable, so local `lake build`, `lake env lean ETSHTS.lean`, and Python checkout checks are NOT_RUN. S028 authored proof terms require hosted CI *after* commit; no premature pass asserted here. Pin unchanged leanprover/lean4:v4.15.0 and mathlib `9837ca9d65d9de6fad1ef4381750ca688774e608`. No `sorry`, `admit`, custom `axiom`, mathematical `native_decide`.

Archive unchanged: CND131 all killed, SRC87 CLM108 CAM10, S016 detached data, S024 final `CONDITIONAL_NOVELTY_SUPPORTED`. No new novelty review or publication stage.
