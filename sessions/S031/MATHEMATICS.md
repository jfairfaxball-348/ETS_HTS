# S031 mathematical work: four-site base and metric-ear implications

## Four-site general-position base — complete paper argument, Lean geometry open

Let S be four points, no three collinear. Either one point V lies strictly inside the triangle of the other three, or they form the vertices of a strictly convex quadrilateral. This dichotomy is a geometric lemma still **unformalised**.

**Interior case.** Seed the triangle ABC and insert V last. Among A,B,C choose the two compulsory lexicographically ranked nearest predecessors (the strict distance between top-two and third need not hold here, as ties are possible). The segments from an interior point to any two corners lie in the closed triangle and meet its edges only at shared endpoints. The retained graph is plane. Lean obligations: existence of a total (distance, Cartesian-lex) ranking for three distinct predecessors; strict interior segment geometry; cardinality/list encoding.

**Convex case.** Label cyclically A,B,C,D; diagonals AC and BD meet at O in the interiors of both. Choose A to maximise Euclidean distance from O over all four points, and let C be its opposite vertex. Then |AO|≥|BO|,|DO|. In nondegenerate triangles C-O-B and C-O-D, strict triangle inequalities give

    |CB| < |CO|+|OB| ≤ |CO|+|OA| = |CA|,
    |CD| < |CO|+|OD| ≤ |CO|+|OA| = |CA|.

Thus C's two compulsory closest predecessors among A,B,D are B,D, with strict distance gaps independent of the lex tie convention (a B/D tie is harmless). Seed the triangle ABD, insert C joined to B,D. The edges CB,CD lie on the sides of quadrilateral ABCD, so they have no proper crossing with AB,BD,DA or one another. The original five-edge drawing is plane. This proves CLM0096 for four sites on paper once the standard convex partition facts are supplied. The Lean source S031 formalises the *actual order construction* assuming those two witnessed geometric facts, not the facts themselves; **CLM0096 remains open in Lean**.

## Geometry wrapper interface

`four_point_order_from_strict_separation` accepts distinct p,q,r,v, fourth-site exclusion, strict squared distances d(v,q),d(v,r)<d(v,p), and planarity of the five-edge graph. It proves the original `planeNearestTwoOrder {p,q,r,v}` with `Grow.insert` and `exactlyTwoNearest` under the exact Cartesian lex convention. No alternate order/nearest definitions or cap is introduced. This covers the final formal step in the convex case, but must not be mistaken for the universal CLM0096.

## CLM0099 full metric-ear iff route

Suppose S is strictly convex and an actual `Grow` order on n sites is plane. Each added site is fresh and supplies two distinct fresh incident edges, so edge cardinality is 3+2(n−3)=2n−3. Planarity of a straight-line graph on n points in strictly convex position implies it is outerplanar. An outerplanar straight-line graph has at most 2n−3 edges. Since any omitted hull side could be added without crossing, equality forces every hull side to be present. The last inserted vertex has exactly two incident edges (no later insertions), so both its two mandatory predecessors must be its two hull neighbours. It is therefore a `metricEar`; deleting it recovers a plane retained order on S.erase v and leads recursively to a full certificate. Conversely a full metric-ear deletion certificate reverses via `Grow.insert` from a triangle: two hull edges at the exposed vertex do not cross existing segments inside the remaining convex hull; earlier edges are preserved. Need independent Lean proofs for freshness/edge count, outerplanar edge bound, hull-side saturation, deletion, and reverse insertion. **CLM0099 remains open.**

## All-n closed ellipse obligation

S030 solved only the short-arc differential lemma; it does not select a valid metric ear for an arbitrary cyclic finite ellipse set. Necessary missing steps are cyclic lift for arbitrary boundary sites, gap-sum 2π, shortest eligible two-gap skip-chord selection, strict adjacent-chord dominance via S030, the 4π/5 cutoff, central/antipodal b-floor including equality a/b=R, and reverse ear recursion retaining every edge. Even a proved numerical 101/100≤R does not furnish CLM0107, and consequently cannot finish CLM0108. No computational sample substitutes for n-unbounded proof.

## Numerical lemma — independent of CLM0107

At x=2π/5, cos x = (√5−1)/4 > 1/4. Thus sin²x < 15/16, hence sin x <49/50. Since ((101/100)²+1)(49/50) = (20201/10000)(49/50) <2, we get ((101/100)²+1) sin x < 2; dividing by sin x>0 and taking nonnegative square roots yields 101/100 ≤ sqrt(2/sin x−1)=R. This is a strict margin, not a numerical approximation. S031 submits exact Lean proof terms separately for kernel testing.
