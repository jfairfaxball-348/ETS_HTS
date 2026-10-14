# S018 — gap-free short arcs and fixed-cardinality circle-limit stability

## Model and target
Use S017 CLM-0099's exact metric-ear equivalence for strictly convex finite sites: a plane nearest-two predecessor graph exists iff one can recursively delete vertices whose two nearest surviving sites are the two cyclic hull neighbours. An ellipse E_r with semiaxes a>=b>0 has parameter P(theta)=(a cos theta,b sin theta); r=a/b. Scale b=1 for the stability arguments, since uniform scaling does not affect nearest rankings. Angle ties are resolved by the existing lexicographic coordinate rule. The property concerns the ENTIRE recursive deletion, not merely the first metric ear.

## CLM-0102: uniform-in-clustering short-arc theorem
**Statement.** Put Lambda_r=4 arctan(b/a)=2 arccos((a²-b²)/(a²+b²)). Every finite set S of distinct ellipse sites contained in an angular interval of width strictly smaller than Lambda_r admits a plane NG arrival order. There is NO lower bound on positive angular gaps.

**Chord-extension lemma.** Let theta<phi with Delta=phi-theta in (0,Lambda_r), t=Delta/2, M=(a²+b²)/2 and D=(a²-b²)/2. Direct expansion of the squared chord gives
 d/dphi |P(phi)-P(theta)|² = 4 sin(t)[M cos(t)-D cos((theta+3phi)/2)].
Because cos(t)>D/M, the bracket is >= M cos(t)-D>0. Swapping fixed/moving endpoints proves the symmetric assertion: within such an arc, moving either chord endpoint further outward from the other strictly lengthens the chord. This applies at arbitrary tiny gaps; it is NOT the crude b/a bilipschitz perturbation estimate of S017.

**Recursive ear.** Write the angularly ordered sites in the short arc as v_1,...,v_k (k>=4). For each internal index 2<=i<=k-1 put L_i=|v_(i-1)-v_(i+1)|. Choose i minimizing L_i. Chord-extension yields L_i>max(|v_i-v_(i-1)|,|v_i-v_(i+1)|). Every vertex j>=i+2, if present, obeys
 |v_i-v_j|>=|v_i-v_(i+2)|=L_(i+1)>=L_i
by extending an endpoint within the arc and minimality. For j<=i-2 use L_(i-1)>=L_i analogously. Thus the nearest two other vertices to v_i are precisely its two immediate cyclic hull neighbours, strictly, making v_i a metric ear. Delete it and repeat because the remaining sites still lie in the same interval of width <Lambda_r. Stop at three and reverse by CLM-0099. QED.

The lower-bound derivative is phase-uniform, though Lambda_r is merely a proven sufficient arc threshold (not claimed optimal). For a circle it equals pi; CLM-0095 independently covers the whole circle.

## Local cluster lemma used below
Fix r_j->1 and finite ordered angle sets S_j converging, after a subsequence, to a multiset of circular support angles. A *cluster* is the consecutive block of angles tending to one support angle, and distinct support angles have a fixed positive limiting separation. If a cluster contains k>=3 sites, for all sufficiently large j its angular diameter is below Lambda_(r_j), and its within-cluster chords tend to zero, while chords to other clusters remain bounded below. The minimum-triple-span argument above therefore gives a metric ear **within the cluster** for the FULL surviving set. Deletion lowers its multiplicity by one and does not change the distinct limiting supports. This argument is uniform for a fixed finite number of deletions.

## Double-cluster ear lemma when at least three limit supports
Suppose a cluster consists of exactly two consecutive sites p_j=P_(r_j)(u_j) and q_j=P_(r_j)(v_j), where u_j<v_j and both tend to a support angle theta0. They are mutual nearest sites for large j. Let the immediate preceding and following *distinct limit supports* be L and R, respectively. With at least three support locations, the nearest OTHER support to theta0 on the limiting circle is one or both of L,R; its short circular angular distance is strictly <pi. Every nonflanking support has a strictly greater limiting chord distance. If a flank is represented by a multiple cluster, chord-extension near its limiting short-angle gap (<pi) ensures that among its representatives the one immediately adjacent to the p/q cluster is the closest to p_j or q_j. Therefore the nearest site external to {p_j,q_j}, for each twin, belongs to the pair of site representatives (ell_j,r_j) immediately left and right of the twin cluster.

If L is strictly closer to theta0 than R in the circular limit, p_j has as its nearest two q_j and ell_j, hence is a strict metric ear for large j. If R is strictly closer, q_j is the ear. In the equal-distance limit, write L=theta0-alpha and R=theta0+alpha (mod 2pi) with 0<alpha<pi. Consider
 H_j(theta)=|P_(r_j)(theta)-ell_j|²-|P_(r_j)(theta)-r_j|²
(where ell_j/r_j are the actual flanking representatives, not merely their limit coordinates). Then
 H'_j(theta)=2 P'_(r_j)(theta) dot (r_j-ell_j) -> 4 sin(alpha)>0
uniformly for theta between u_j and v_j (normalise radius b=1). Thus H_j(v_j)>H_j(u_j). It is impossible that simultaneously H_j(u_j)>=0 (p_j fails to prefer its LEFT neighbour) and H_j(v_j)<=0 (q_j fails to prefer its RIGHT neighbour). At least one is strictly on its correct side and is therefore a metric ear, with ties irrelevant. Deleting that twin lowers multiplicity from 2 to 1. QED.

**Why >=3 supports matters:** with exactly two limiting supports, both flank directions lead to the SAME opposite support and can be antipodal; the strict alpha<pi comparison need not hold. The separate <=4-point reduction below handles that case without falsely applying the double-cluster argument.

## CLM-0103: fixed-n near-circle theorem
**Theorem.** For every fixed n>=3 there is an epsilon_n>0 such that every set of n distinct sites on ANY ellipse with 1<=r<1+epsilon_n has a plane NG order, regardless of arbitrarily small gaps. The epsilon_n existence is non-effective.

**Proof by contradiction.** If no epsilon_n existed, select bad sets S_j of exactly n points on ellipses of ratios 1<=r_j<1+1/j. Normalise semiminor axis b=1 and select a subsequence on which the n cyclic angular coordinates converge to a multiset of m distinct support angles on the unit circle, retaining cyclic order and a local lift across 0.

- **m=1**: all n sites eventually lie in a parameter arc of vanishing width. Apply CLM-0102 directly.
- **m=2**: whenever a support cluster has >=3 points, remove its local minimum-triple-span metric ear. Repeat finitely until each of the two clusters has <=2 points. At most four sites remain, and the S016 four-point NG theorem CLM-0096 completes the recursion.
- **m>=3**: first peel every cluster of size >=3 using the local cluster lemma; next peel each residual double cluster using the double-cluster lemma above, preserving all m distinct support locations. The remaining m sites tend to m distinct points on the circle. They have a positive lower bound delta on their parameter gaps for large j. Apply S017 CLM-0100 (r_j<1+delta cos(2pi/5)/2 eventually) when m>=5; if m<=4 use CLM-0096. Reverse ALL recorded metric-ear deletions via CLM-0099.

Every possibility yields a complete NG order for S_j for sufficiently large j, contradicting that each S_j was bad. QED.

**Quantifier precision.** The theorem is "for EACH fixed n, EXISTS epsilon_n"; it is NOT "EXISTS epsilon valid for ALL n." Compactness and multiple cluster peeling are necessary; a crude minimum-gap perturbation does not prove it. One good ear by itself is insufficient, hence the explicit full deletion construction in each case.

## CLM-0104: cardinality blow-up necessity
Let r_j>1 tend to 1 and suppose *each* ellipse has a finite bad site set of size n_j. If n_j did not tend to infinity, some n in a bounded set would occur infinitely often; along that subsequence CLM-0103 would force a plane NG order, a contradiction. Therefore n_j->infinity. No assertion of existence of these bad sets is implied; the statement is a conditional necessity.

## Competing approaches, failure and scope
- A fixed five- or six-point rational no-ear obstruction with r_j->1 **cannot exist**, by CLM-0103. S017 floating near-collision near-zero signs are not exact certificates and do not contradict this theorem.
- A uniform epsilon independent of n remains UNPROVED. CLM-0103 is non-effective and epsilon_n may shrink to zero; no quantified n(r) obstruction bound is derived.
- A global curvature or two-site reduction that works for ALL cardinalities remains unproved. The local short-arc interval does not cover arbitrary configurations distributed round the ellipse.
- No proof that every noncircle ellipse fails, nor a proof that a fixed noncircular neighbourhood is universally safe. CND-0131 is UNRESOLVED / GENERATED.
- No CAM-0011 performed or preregistered because only symbolic proofs were used. Original CAM-0003/0005 failures and detached S016 CAM-0008/9 archive remain untouched; CAM-0010 float pseudo-witnesses INVALID.
- Self-checked programme proofs only; no mathematical external review or originality assessment.
