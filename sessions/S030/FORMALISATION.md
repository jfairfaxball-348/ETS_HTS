# S030 formalisation — exact cutoff and CLM0102 candidate

## Source proof attempt
`ETSHTS/Cutoff.lean` directly proves in source:
- `cos (2 arctan x) = (1-x²)/(1+x²)` and the exact ellipse anisotropy identity.
- For all `0 < b ≤ a`, all real θ<φ satisfying `φ-θ < lambda a b`: strictly positive half-angle sine and strictly positive M/D cosine gap.
- Unconditional strict right and outward-left derivatives, each using its own factorisation from S029.
- Strict endpoint interval monotonicity, split on which endpoint actually changes.
- `clm0102_exact : CLM0102` for the UNALTERED `ETSHTS/Targets.lean` proposition.

These are **authored proof terms awaiting hosted compilation**, not certified claims until the pinned hosted Lean workflow succeeds and `#print axioms` confirms the exact term. No local Lean or network git checkout is installed.

## Geometric obligations — not claimed complete

**CLM0096:** n=3 is already formalised; for a fourth interior point, the containing triangle can be used as the initial triangle since there is no crossing with segments to two corners. For convex four points, let O be the diagonal intersection; choose A on a diagonal endpoint at maximal O-distance among four vertices, with opposite endpoint C and other pair B,D. Strict triangle inequality in triangles COB and COD gives `|CB|<|CO|+|OB|≤|CO|+|OA|=|CA|`, similarly for `|CD|<|CA|`. Seed A,B,D then insert C with mandatory B,D. Required Lean: convex/interior partition, diagonal-intersection segment membership, exact distance comparisons, final `planeEdges`.

**CLM0099:** for a plane retained nearest-two order on n strictly convex sites, final graph has exactly `2n−3` edges. A straight-line outerplanar graph has at most `2n−3`; to prove necessity of a full ear certificate one must show all hull sides are present (missing side would allow an extra edge), hence the last vertex's two mandatory insertion edges are precisely its hull-neighbour edges. Delete and recurse; conversely reverse a full metric-ear deletion certificate. Required Lean: planar cardinality invariant, outerplanar extremal theorem, hull-side saturation, erase/reversal and `Grow` invariants. Avoid assuming saturation as a new hypothesis.

**CLM0107:** remaining route is the strictly convex ellipse cyclic eligible-ear proof: order all finite distinct angles, find a shortest eligible two-gap skip-chord, establish central distance floor using the exact closed `R` threshold, eliminate all nonadjacent nearer sites, then recurse. The closed-R endpoint (not strict ratio), arbitrarily close angles, ties and n unrestricted are essential. No finite-n sampling can replace this.

**CLM0108:** derive exact rational `101/100 ≤ R` in Lean and apply unconditional CLM0107. The earlier conditional corollary is insufficient by itself.

No change to `Targets.lean`; no full proof of 0096/0099/0107/0108 attempted as a theorem. Status is PARTIAL until all five exact theorems are verified.
