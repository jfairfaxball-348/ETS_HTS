# S037 — strict finite ellipse convexity, original frozen geometry

## Source contribution (requires hosted kernel check)

A direct proof for **the exact existing** `strictConvexPosition` definition on arbitrary finite positive-axis ellipse-boundary sets, without a separation bound, angular parameter choice or generic-position hypothesis.

For every boundary point p, the weighted quadratic identity holds:

```
b² p₁² + a² p₂² = a² b².
```

For distinct boundary points p≠q and a,b>0, the weighted squared separation
`b²(p₁−q₁)²+a²(p₂−q₂)²` is strictly positive. Subtracting the equal
weighted norms yields

```
(p₁ b²) q₁ + (p₂ a²) q₂ < (p₁ b²) p₁ + (p₂ a²) p₂.
```

Thus the original real linear functional with coefficients
`(p₁ b², p₂ a²)` strictly exposes p over all other ellipse points. On any finite
subset this proves the EXACT predicate `strictConvexPosition S` used in CLM0099.

Declarations in `ETSHTS/EllipseConvex.lean`:
- `s037_ellipse_boundary_weighted_norm`
- `s037_weighted_sqDist_pos`
- `s037_ellipse_strict_support`
- `s037_ellipse_strictConvexPosition`

These statements are independent of the aspect-ratio bound: they are valid for
all a,b>0. No custom axiom, proof hole, conditional convexity hypothesis or
change to `ETSHTS/Targets.lean`.

## Scope boundary

This supplies a genuine ellipse-to-strict-convex bridge for the ORIGINAL S020
ear proof. It does not establish finite cyclic lifts, exclusion of collinear
triples, four-point base planarity, full metric-ear iff, or central competitor
geometry. Exact CLM0102 remains proved; CLM0096/0099/0107/0108 remain open.
Do not imply any full all-n target is kernel proved from this partial lemma.
