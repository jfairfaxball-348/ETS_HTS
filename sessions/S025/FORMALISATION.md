# S025 Lean formalisation — semantic and dependency audit

## Status: SPECIFIED / PARTIAL FOUNDATION ONLY — FULL THEOREM NOT VERIFIED

The project now includes Lean source for Cartesian points, ellipse boundary, squared Euclidean distance, strict lex tie priority, mandatory two-predecessor selection, retained insertion graph, proper crossings, supporting hull sides, metric ears, full recursive ear certificates, and five **propositions** CLM0096/0099/0102/0107/0108. The propositions are definitions of obligations, **NOT proved theorems**. A definition of a Prop does not assert or establish that Prop.

Some small source-level proof scripts have been written: squared-distance reflexivity/nonnegativity/symmetry and strict-gap ⇒ lex-exact-nearest-two. These are also UNVERIFIED until a compiler actually checks them.

### Explicit exactness review
- Finset Point models arbitrarily many distinct points; no cap on n, no minimum angular gap.
- Boundary is ANY real angle ellipsePoint(a,b,θ); point distinctness is implicit in Finset, with no generic-position assumption beyond the eventual ellipse hypothesis.
- CLM0107 quantifies a,b over reals with 0<b≤a and a/b≤R. The endpoint equality at R is included, as is a=b. R is exactly sqrt(2/sin(2π/5)−1), not a float.
- Nearest-two compares squared Euclidean distances, mathematically the same ordering as Euclidean distances, then exact Cartesian lex order for equal squared distances. The chosen two are both strictly ranked before each *other* predecessor. Old edges are retained.
- Planarity is nonintersection of proper interiors of independent segments. For ellipse points, distinct sites are strictly convex and noncollinear, removing tangency/overlap ambiguity once that geometric fact is proved.
- The full certificate recursively deletes a current metric ear down to three; a single locally valid ear is not claimed sufficient.
- CLM0108 retains the exact nonround 101/100 and universal finite-set quantification. No sharp-threshold claim.

### Proofs still missing (FULLY OPEN)
1. CLM0096 full three/four-site general-position result (convex diagonal intersection + interior case).
2. CLM0099 outerplanar 2m−3 edge bound, hull-edge saturation, last-vertex necessity, complete-ear sufficiency, cyclic-hull correctness.
3. CLM0102 complete chord-squared trig identity, independent two endpoint derivatives, strict outward monotonicity, short arcs and lambda cutoff.
4. Convexity of every distinct ellipse boundary subset; cyclic angular lift and sum of gap-pairs 4π; n=5 strict eligibility even at r=R.
5. Eligible metric skip-chord minimiser; two neighbours strictly shorter; every other site handled by forward/central/backward cases, equality endpoints.
6. Full finite induction down to m=4 and reversal giving CLM0107 with all quantifiers unchanged.
7. Exact radical/trigonometric inequality 101/100<R and CLM0108.

No title theorem for CLM0107 or CLM0108 has been falsely introduced, and neither is proved. Treat S020/S021 programme proofs as motivation, not Lean evidence.

### Toolchain / validation
- Lean toolchain: `leanprover/lean4:v4.15.0` (matching upstream mathlib tag's lean-toolchain).
- Mathlib direct pin: `9837ca9d65d9de6fad1ef4381750ca688774e608`, immutable git commit underlying upstream tag `v4.15.0` (GitHub inspected 2026-10-14).
- `lake-manifest.json` is an AUTHOR-CONSTRUCTED proposed lock transcribed from upstream mathlib v4.15.0's inspected manifest, NOT generated, reconciled or validated by executing Lake; regenerate and compare on an actual checkout.
- Local `lean`, `lake`, `elan`: unavailable. Local `git ls-remote`/curl failed because DNS for github.com/raw.githubusercontent.com was not resolvable. Therefore no local `lake build` or actual-checkout `python scripts/check_scaffold.py` or unittest run can be called PASS.
- The separate Lean GitHub Actions workflow explicitly attempts `lake build` and `lake env lean ETSHTS.lean`. Inspect actual workflow/jobs and logs before claiming any compilation.
- Existing green governance workflow checks only governance RECORD FORMAT, never mathematics.

### Next session scope
S026 is a *future, separately authorised* continuation of formalisation, not another novelty audit. First repair whatever compiler errors hosted CI reveals, verify manifest and pin, and then tackle the full mathematical obligations in dependency order. Success means compiled proof of EXACT CLM0107 and CLM0108 without new axioms, admits, holes, or weakened assumptions, with independent statement inspection.
