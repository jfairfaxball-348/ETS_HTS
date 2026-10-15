# S038 — strict segment exclusion and original Grow retention

Scope: strict Lean formalisation of S020/S021 only, NOT a mathematical research change. Original `ETSHTS/Targets.lean` is unchanged.

### Exact source contributions

1. `s038_strictConvexPosition_no_openSegment`: if a finite set satisfies the repo's exact strict exposing-functional condition, any point in it cannot be strictly between two other distinct sites. The proof evaluates the same supporting functional at a strict affine convex combination and obtains an impossible strict self-inequality.
2. `s038_ellipse_no_boundary_strictly_between`: applies S037's unconditional positive-axis ellipse exposing-functional theorem to the result above, with no axis-ratio or spacing restriction.
3. `s038_grow_retains_initial_edges`: induction over the unmodified inductive `Grow` shows any initial edge remains in the final graph.
4. `s038_planeEdges_of_subset` and `s038_grow_planar_initial_edges`: noncrossing is monotone under a subgraph and hence any completed planar `Grow` certifies its initial drawing.
5. `s038_card_three_plane_iff_fullEarCertificate`: proves both directions of the original CLM0099 equivalence **only for card = 3**, using existing proven three-point order and exact recursive certificate base constructor.

This does NOT yet prove `noThreeCollinear` from strict exposure (a separate collinear betweenness trichotomy remains), four-point `CLM0096`, full all-cardinality `CLM0099`, or `CLM0107/0108`. It cannot be cited as closure of an entire exact target.

Local Lean/lake is absent; CI source verification is required. See `sessions/S038/CLOSEOUT.md`.
