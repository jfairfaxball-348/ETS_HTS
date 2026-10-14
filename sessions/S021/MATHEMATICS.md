# S021 — independent hostile reconstruction of CLM-0107 and CLM-0108

**Outcome: AUDIT_PASS_CONDITIONAL_FORMALISATION.** This is an internal mathematical proof audit, not external peer review, Lean verification, priority certification or optimality. Every asserted strictness below is proved at the place it is needed. New CND/CLM/SRC/CAM records: NONE.

## Exact model, no implicit generic position beyond ellipse

Let E(a,b)={P(t)=(a cos t,b sin t):t real}, a>=b>0, and let T be any finite set of n>=3 distinct boundary sites. Distinct sites have unique cyclic angular parameters modulo 2pi; an ellipse is strictly convex, hence all are exposed, no three collinear. An arrival order starts with any three vertices connected as a triangle, then adds exactly two edges from each later vertex to the two least Euclidean-distance *predecessors*, selecting ties lexicographically by the predecessor's Cartesian coordinates. Old edges never disappear. 'Plane' means no proper intersections between independent straight segments (on these points, overlaps and three-point collinearities are impossible).

Write h=sin(2pi/5), R=sqrt(2/h-1), r=a/b. Assume 1<=r<=R.

## A. Four-point base CLM-0096 and ear equivalence CLM-0099

For n=3 the freely chosen seed triangle is plane. For n=4 with one site inside the triangle of the other three, choose the containing triangle first and then its inside site; spokes to any two previous vertices remain inside the triangle. For a strictly convex four-set, diagonals AC and BD cross at O in their interiors. Pick among A,B,C,D a vertex A with largest distance |AO|, with opposite vertex C. Then |CA|=|CO|+|OA|>|CB|, because |CB|<|CO|+|OB|<=|CO|+|OA|; similarly |CA|>|CD|. Thus C's unique two nearest among {A,B,D} are B,D. Insert C after seed (A,B,D); both new edges lie on the final hull and cannot cross the seed. Ties among B and D do not affect the selected pair. For ellipses only the convex branch is needed.

For |T|=m>=4 in strict convex position, every chronological NG construction has 3+2(m-3)=2m-3 distinct edges. If its drawing is plane, all edges lie inside the convex hull. A plane graph drawn on m points in strictly convex position has <=2m-3 edges, e.g. triangulate each bounded face of the outerplane embedding; the m-gon has at most m-3 interior diagonals. If a hull side were absent it could be added without a proper crossing, violating the bound; hence all m hull sides are present. The final arrival v is incident with exactly its two newly made edges, so its two required hull sides are exactly the selected predecessor pair: the immediately previous/next cyclic hull vertices. Such v is a *metric ear*. Deleting it leaves the exact earlier plane NG order, giving necessity recursively.

Conversely, if an m-set has such an ear v, remove it, recursively construct the smaller set, then insert v. Its two original cyclic neighbours u,w are adjacent on the new smaller convex hull. For strictly convex point sets uv and vw lie along the enlarged polygon boundary, never crossing previously drawn segments; the metric-ear hypothesis states they are precisely the two selected nearest predecessors, even under lex ties. Iterate to three. The equivalence does not assume some good first ear alone suffices; it requires a complete deletion sequence, supplied in C.

## B. Endpoint-extension calculus, independently derived

For theta<phi on a real lift set delta=phi-theta, t=delta/2, M=(a^2+b^2)/2, D=(a^2-b^2)/2 (0<=D<M), and
 F(theta,phi)=|P(phi)-P(theta)|^2
 =4 sin^2(t) [M-D cos(theta+phi)].
Direct differentiation (product and chain rules) gives
 (partial_phi F)=4 sin(t)[M cos(t)-D cos((theta+3phi)/2)],
 -(partial_theta F)=4 sin(t)[M cos(t)-D cos((3theta+phi)/2)].
The second equation is the derivative when the *left* endpoint moves left, NOT a swap of a directed inequality into its opposite without proof.

Let Lambda=4 atan(b/a)=2 arccos(D/M), in (0,pi]. For 0<delta<Lambda, sin(t)>0 and cos(t)>D/M; since cosine of any phase <=1, both outward derivatives are STRICTLY positive. Consequently extending either endpoint outward inside an angular arc whose total width is <Lambda strictly increases the squared chord and hence the (positive) chord length. For one limiting extension to width =Lambda, continuity gives nondecrease; the proof below uses the independent central bound there, so no unjustified strict equality-endpoint claim enters the ear proof. These statements are valid on *any* unwrapped angular interval including intervals crossing parameter angle 2pi; no global isotropy or comparison between different/opposing chords is assumed.

## C. Global metric-ear proof (all m>=5, including equality r=R)

Let m>=5 and enumerate cyclic sites v_i=P(theta_i). Positive cyclic gaps g_i=theta_(i+1)-theta_i with a real cyclic lift have sum 2pi. Define s_i=g_(i-1)+g_i, L_i=|v_(i-1)-v_(i+1)|. Each gap occurs exactly twice, so sum_i s_i=4pi. Thus some s_j<=4pi/m<=4pi/5.

First check this j is **eligible** (s_j<Lambda) throughout the CLOSED interval r<=R. Since
 R^2+1=2/sin(2pi/5), while cot^2(pi/5)+1=1/sin^2(pi/5),
 R<cot(pi/5) is equivalent to 2 sin^2(pi/5)<sin(2pi/5), i.e. sin(pi/5)<cos(pi/5), true as pi/5<pi/4. Thus r<=R<cot(pi/5), hence atan(1/r)>pi/5 and Lambda>4pi/5. The eligible set is nonempty *strictly even at r=R*.

Choose i minimizing the **distance** L_i, not angular span s_i, over ALL eligible indices (finite minimum). The two adjacent chords v_i v_(i-1), v_i v_(i+1) have respective angular spans g_(i-1),g_i, strictly inside the eligible total span s_i<Lambda, and each is STRICTLY shorter than L_i by outward endpoint extension.

For every non-neighbour v_j, take its forward cyclic angular separation delta in (0,2pi):
- If delta<Lambda, j occurs at least two steps after i forward. Thus g_i+g_(i+1)<=delta<Lambda, so i+1 is eligible. By repeated outward extension with v_i fixed, |v_i-v_j|>=|v_i-v_(i+2)|=L_(i+1)>=L_i. This also covers the exact two-step competitor and arbitrarily close sites.
- If delta>2pi-Lambda, use backward lift from i to j. Since j is not the immediate predecessor, the backward route passes through i-1 and i-2. The index i-1 is eligible and the analogous LEFT-endpoint extension gives |v_i-v_j|>=|v_i-v_(i-2)|=L_(i-1)>=L_i. This is an independent same-direction comparison, not an illicit comparison of opposite-direction chords.
- For Lambda<=delta<=2pi-Lambda (including BOTH equality endpoints), anisotropic stretching of unit-circle chords yields
 |v_i-v_j|>=2b sin(delta/2)>=2b sin(Lambda/2)
 =4ab^2/(a^2+b^2).
The last identity uses sin(2atan(b/a))=2ab/(a^2+b^2). Take an eligible witness j0 with s_(j0)<=4pi/5 from averaging. Since 0<s_(j0)<=4pi/5<pi, its skip chord satisfies
 L_i<=L_(j0)<=2a sin(s_(j0)/2)<=2a sin(2pi/5).
Finally r^2+1<=R^2+1=2/h rearranges to
 2a sin(2pi/5)<=4ab^2/(a^2+b^2).
Therefore every central competitor also has distance >=L_i, without any opposite-chord monotonicity claim.
The three intervals cover all delta in (0,2pi), including delta=Lambda and 2pi-Lambda. For a=b, Lambda=pi and the central interval is just {pi}; for a>b, Lambda<pi and the intervals remain disjoint except endpoints handled centrally.

Thus both neighbours are strictly BELOW L_i and every other site is >=L_i. Even if several non-neighbours tie at L_i, they cannot displace either neighbour in the nearest-two list. So v_i is a strict metric ear for every eligible m>=5. Removing it keeps the remaining distinct points on the SAME ellipse, preserves cyclic strict convexity and the r<=R bound. Iterating decreases m to 4; CLM-0096 produces a plane 4-point order (and its final convex vertex is also a metric ear). Reverse via CLM-0099. No fixed minimum angular gap or n bound was used.

## D. CLM-0108, all-n and a rational noncircle witness

Exact sin^2(2pi/5)=(5+sqrt(5))/8. As sqrt(5)<5/2,
 sin^2(2pi/5)<15/16<(39/40)^2,
 so sin(2pi/5)<39/40. For r=101/100,
 r^2+1=20201/10000 and
 39/40<20000/20201=2/(r^2+1)
 (check 39*20201=787839<800000).
Therefore sin(2pi/5)<2/(r^2+1), i.e. r^2<R^2, and 1<101/100<R exactly (no decimal approximations). The n-universal theorem applies to this explicitly nonround ellipse for every finite subset; circle-only CND-0131 is thereby FALSE. This does NOT classify r>R or prove the bound is sharp.

## E. Hostile attacks and lemma-by-lemma verdict

| Dependency | Challenge / proof obligation | Reconstructed result | Verdict |
| --- | --- | --- | --- |
| CLM-0096 | n=3/4, quadrilateral diagonal max, interior point, ties | Strict triangle inequality defeats far diagonal; convex insertion plane | PASS |
| CLM-0099 | edge count, missing hull side, last degree two, reverse edges | 2m-3 outerplanar maximum forces both final hull sides; full recursion iff | PASS |
| CLM-0102 endpoint lemma | derivative factor, swapped endpoint, zero derivative at cutoff | Both outward derivatives computed; STRICT only below Lambda, central method at equality | PASS |
| CLM-0107 averaging | m=5, equality r=R, eligible nonempty | R<cot(pi/5), hence 4pi/5<Lambda at endpoint | PASS |
| CLM-0107 local & remote | wrong angular minimiser; wraparound; nested/close clusters | MIN metric L over eligible; next/previous eligible skip chords in own direction | PASS |
| CLM-0107 antipodal band | central angle floor, endpoint, exact R inequality | independent b lower and a upper; weak inequality enough | PASS |
| CLM-0107 recursion | one ear not sufficient; lex ties; arbitrary n | strict ear at EVERY m>=5; 4-point base then reversal | PASS |
| CLM-0108 | r=1.01 symbolic, quantifier reversal | exact radical bound and all-n application | PASS |

Attacks explicitly attempted: (1) m=5 symmetric gaps; eligible strictness persists even at R, (2) adversarially tiny consecutive gaps; all chord comparisons remain strict for positive gaps, (3) multiple near-antipodal points; central b-chord floor applies, (4) a competitor reached via a short backward vs long forward arc; separate backwards proof applies, (5) equality at Lambda and R; only weak non-neighbour comparisons are required, (6) equal non-neighbour distances; lex cannot override strictly nearer two neighbours, (7) removing one ear then finding none; same all-m proof repeats, (8) absent hull side with maximal edge count; insertion contradicts outerplanar bound. No exact counterconfiguration or fatal omitted case found, so NO new CAM was justified or executed.

## What has and has not been certified

The proof establishes precisely the sufficient closed aspect interval 1<=r<=R, for *all* finite n>=3 and arbitrarily close distinct sites. It does not establish historical novelty, a complete aspect ratio classification, sharpness/optimality, any r>R construction, independent peer review or compiled Lean proofs. The mathematical audit leaves no identified logical gap within these hypotheses. The Lean formalisation is the next independent verification gate, not an automatic consequence of an internal PASS.
