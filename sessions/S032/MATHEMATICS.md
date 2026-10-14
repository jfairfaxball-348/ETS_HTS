# S032 mathematics — exact ties, convex four-site route and cyclic metric-ear gap

## New formal target, no geometric assumptions masked

The predecessor rank is the strict lexicographic order on the triple
`(squared Euclidean distance to v, first Cartesian coordinate, second Cartesian coordinate)`.
It is transitive; for distinct sites it is total. The resulting comparison permits equal squared
distances and resolves them by original `cartLexLT`, without perturbation or a strict-distance hypothesis.

For **any** three distinct predecessors p,q,r and any fourth point v, exactly two predecessors
satisfy `exactlyTwoNearest {p,q,r} v u w`. A constructive six-case proof orders the triple using
`priority_total_of_ne` and `priority_trans`. This is a genuine statement about the exact rule, not
a relaxation of ties or a planarity theorem. S032 offers an actual Lean proof candidate in
`ETSHTS/ThreePredecessors.lean`.

`four_point_order_from_exact_nearest` inserts that pair into the real `Grow` construction, provided
the original five edges are plane. Thus the interior-fourth-site argument now needs **only**
the segment/convexity proof: when v is strictly inside triangle pqr, every pair of its
three corner connections lies inside that triangle, disjoint from the opposite triangle
edge in the relative interiors. `four_point_order_of_all_nearest_pairs_plane` isolates this exact
geometric obligation and supplies existence of the nearest pair automatically.

## Remaining CLM0096 steps

The universal three/four dichotomy requires proving in Lean that noncollinear four-site
configurations are either one site strictly inside a triangle of the other three or the
vertices of a convex quadrilateral. The convex case requires a strict diagonal-intersection
O and selecting a diagonally opposite farthest-A pair. With O interior to both diagonals,
\[
|CB|<|CO|+|OB|\le |CO|+|OA|=|CA|,\quad
|CD|<|CO|+|OD|\le |CO|+|OA|=|CA|.
\]
So the chosen fourth C has strict closest B,D, and the constructed graph comprises a
triangle and two quadrilateral hull sides. Its planarity follows from the elementary
disjoint-crossing geometry. This paper proof is not a Lean proof of CLM0096.
The key boundary is explicit: the new unconditional *ranking* theorem does not yield
the existential choice of a planar triangle/last-site split.

## CLM0099 and the edge-count invariant

A legal n-site insertion order has exactly n-3 insertions and each inserts two
edges incident to its genuinely new vertex. There are 3+2(n-3)=2n-3 distinct edges.
With strict convex position, every edge is a diagonal or hull side and planeEdges means
a noncrossing straight-line outerplanar graph. A maximal outerplanar n-vertex graph has
at most 2n-3 edges; saturation forces all n hull sides. The final inserted v has
degree exactly two and its adjacent predecessor pair must be its hull neighbours,
which the mandatory nearest rule promotes to a `metricEar`. Induct on the
remainder; reverse insertion uses the two hull sides and cannot cross an earlier chord.

**Formal gaps**: preserved freshness/disjointness and graph degree, saturation under
the repository's `planeEdges` (proper crossings only between disjoint edges),
formal outerplanar edge bound, extraction of the last `Grow` edge pair, and
the reverse-witness list construction. Do not silently infer these from a numerical edge count.

## CLM0107: a finite cyclic-gap selection lemma and its limitation

For any n≥5 cyclically ordered distinct boundary sites, take positive parameter
gaps g_i with total 2π and define T_i=g_{i-1}+g_i (indices mod n).
Then Σ_i T_i=4π. For a minimum T_i,
\[
T_i\le 4\pi/n\le 4\pi/5,
\quad
g_{i-1}\le g_{i+1},
\quad g_i\le g_{i-2}.
\]
The latter two inequalities follow from T_i≤T_{i+1} and T_i≤T_{i-1}.
This is a useful exact, tie-robust combinatorial shortlist for a metric-ear witness.

**Crucially the lemma ALONE is not enough**: it compares parameters, not Euclidean
ellipse chords. It does not rule out a distant site becoming closer because of
anisotropy, cyclic wraparound or equality at R. The S030 derivative theorem applies
only under its strict short-arc cutoff; a central-chord b-floor and gap-case
inequalities remain required for n≥5. In addition n=4 is outside this average bound
and must come from CLM0096. No all-n induction has been established.

## CLM0108 and numerical closure

The S031 hosted main build verifies `ellipse_ratio_101_le_R` with only
[propext, Classical.choice, Quot.sound], and `clm0108_of_clm0107` has
only CLM0107 as its hypothesis. This makes the nonround parameter arithmetic
complete but does not establish the existential order for any unspecified n.

## Verdict

S032 is PARTIAL. Exact target definitions CLM0096, CLM0099, CLM0102,
CLM0107, CLM0108 were not edited. The source-level proof candidates have to
pass S032 independent hosted Lean builds before being called kernel-verified.
