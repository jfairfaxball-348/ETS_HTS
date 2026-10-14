# S017 — reverse metric ears and a quantitative ellipse stability theorem

## Fixed NG model and boundary hypotheses
Let S be n>=3 distinct points in strictly convex position (every point exposed, no three collinear). Choose any three as an initial retained triangle; add remaining vertices in some order, each joined to the two Euclidean-nearest previously present vertices (ties broken by lexicographic coordinates). Keep all previous edges. Proper crossings of distinct-endpoint segments are forbidden. For an ellipse, the standard parameterisation is P(θ)=(a cos θ,b sin θ) with a>=b>0, and the **parameter** angles are cyclically ordered; δ denotes their minimum positive cyclic gap **in radians**, not arc length.

## CLM-0099: exact reverse-ear characterisation on strictly convex sites
Define a *metric ear* of a finite strictly convex set T, |T|>=4, to be a point v whose two selected Euclidean-nearest neighbours among T\{v} are exactly the two immediate cyclic polygon neighbours of v, under the fixed tie rule.

**Theorem.** A crossing-free NG order for T exists iff T admits a sequence of metric-ear deletions leaving three sites.

**Proof of necessity.** After all n arrivals, the NG graph has exactly E=3+2(n-3)=2n-3 undirected edges: each inserted vertex is new, so no edges are duplicated. All sites are in strict convex position, and any crossing-free drawing lies inside their convex hull. A plane graph with all n exposed vertices and 2n-3 edges saturates the outerplanar edge bound and contains every n hull boundary side (otherwise a missing hull side could be inserted without crossing and violate the bound). The final inserted vertex v has degree precisely two in the graph, since no later site can attach to it. Both hull edges at v must be among its two incident edges, so the selected nearest two among all preceding sites are its two cyclic neighbours. Remove v; the predecessor order itself yields a crossing-free NG drawing on T\{v}. Repeat.

**Proof of sufficiency.** Reverse the deletion sequence. Three survivors form a triangle. At each reverse step v was a metric ear in the larger surviving set, so its selected earlier neighbours are the two ends u,w of one boundary edge uw of the smaller convex polygon. Since all sites of the original S lie in strict convex position, v lies outside the smaller polygon in the wedge adjacent to uw; the edges uv,vw lie on the new hull boundary and do not cross any old edge. Thus all reinsertion steps are crossing-free and obey the two-nearest predecessor rule. QED.

**Limit.** This is not an ellipse classification; it supplies a finite elimination certificate. It does not claim a similar equivalence for nonconvex point sets.

## CLM-0100: angular-gap stability of the circular theorem
Let k>=5 currently surviving ellipse vertices and each of their consecutive standard angular gaps be at least δ>0. Let g_i denote these circular parameter gaps (sum 2π); choose a vertex with smallest adjacent sum s=g_{i-1}+g_i. Since the k sums together add to 4π, 0<s<=4π/k<=4π/5<π. Each of the two adjacent gaps is at most s-δ. The minimum property gives g_{i+1}>=g_{i-1} and g_{i-2}>=g_i. Hence every *non-neighbour* lies at circular angular distance at least s from v in **both** orientations, so its minor central separation is at least s, whereas the two neighbour minor separations are each <=s-δ.

Let d_0 be chord distance on the unit circle. Thus each non-neighbour w has d_0(v,w)>=2sin(s/2), while each neighbour u has d_0(v,u)<=2sin((s-δ)/2). By mean value theorem on [0,2π/5],
2sin(s/2)-2sin((s-δ)/2) >= δ cos(2π/5)>0.

The ellipse map diag(a,b) is bi-Lipschitz on vectors: b d_0 <= d_ellipse <= a d_0. In particular, the distance from v to *any* non-neighbour minus distance to *either* neighbour is >=
2b sin(s/2) - 2a sin((s-δ)/2)
= b[2sin(s/2)-2sin((s-δ)/2)] -2(a-b)sin((s-δ)/2)
>= b δ cos(2π/5) - 2(a-b).
This is strictly positive whenever a/b < 1+(δ/2)cos(2π/5). Therefore v is a strict metric ear. After deleting v, the remaining positive parameter gaps are old gaps or sums of old gaps, so each remains >=δ; repeat for k>=5. At k=4 or k=3 the universal theorem CLM-0096 supplies a crossing-free order. By CLM-0099, reinsertion gives the desired NG order.

**Corollary (necessary clustering).** If S is a counterexample on ratio r=a/b>1, then its minimum angular gap δ must obey δ <= 2(r-1)/cos(2π/5). E.g. r=1.01 requires δ <= 0.06472 rad (approximately 3.71 degrees). This bound is NOT sufficient for a counterexample; the strict theorem provides no answer as δ->0. The earlier 5:1 S016 counterexample satisfies no blanket near-circle conclusion.

## Attempted global routes and obstruction
- *Finite certification:* CLM-0099 is necessary and sufficient for one convex finite S; does not establish whether there exists some infeasible S for every nonround ellipse.
- *Perturb circular ears:* The positive angular-gap margin decays with minimum gap δ; hence no configuration-uniform eccentricity neighbourhood follows. Need either a singular coalescence analysis or an explicit parameterised family of no-ear sets as r->1.
- *Curvature/affine route:* Stretch map preserves crossing patterns and cyclic convexity but not Euclidean nearest-two rankings. A/b distortion is exactly what enters the proof. A global counterexample family for all r>1 remains unconstructed.
- *Elimination versus last ear:* One eligible ear only ensures the first deletion. The exact recursive criterion requires subsequent ear deletions; S016 five-site witnesses have no initial ear, but converse for isolated ear is false without recursion.
- *Novelty:* These proofs are programme self-checks; no outside mathematical review, exact prior-art novelty or priority certificate.

CND-0131 remains GENERATED, not TRIAGED/SURVIVING/OPEN/PROVED. The central universal ellipse classification is unresolved.
