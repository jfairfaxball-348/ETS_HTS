# S016 — five sites are the sharp obstruction; every concyclic set works

## Common model
NG: choose any first three distinct noncollinear sites as a retained triangle. Insert the rest in a freely chosen order, each joined by straight edges to the two Euclidean-nearest *earlier* sites; keep every edge forever; count proper crossings of edges with distinct endpoints. Ties are lexicographically broken. This is not SP edge replacement or CH hull update. All results assume no three collinear except that a circle is automatically general-position for distinct points.

## CLM-0095: circle sufficiency, self-contained proof
Let S be n>=4 distinct points on a circle, in cyclic order, with successive positive central-angle gaps g_0,...,g_{n-1}, summing 2π. At vertex v_i let a=g_{i-1}, b=g_i, choose i minimizing a+b. Since the sum over i of (g_{i-1}+g_i) is 4π, a+b<=4π/n<=π. The next forward gap c=g_{i+1} satisfies b+c>=a+b, hence c>=a. The next backward gap d=g_{i-2} satisfies d+a>=a+b, hence d>=b. A site other than v_i and its two circular neighbours is separated from v_i by clockwise arc at least b+c>=a+b AND anticlockwise arc at least a+d>=a+b. Its minor central angle thus is >=a+b, and its chord is strictly longer than each of the two neighbour chords: those have minor angles a,b (<a+b<=π). Thus v_i's two nearest other sites are precisely its immediate polygon neighbours, with strict separation from any third.

Remove v_i and repeat on the remaining concyclic points (still strictly convex). When three remain, start with their triangle. Reinsert removed vertices in reverse removal order: each v_i joins its two nearest preceding vertices, namely the original two neighbours at its removal, and lies outside the smaller convex polygon adjacent to their shared hull edge. These two new edges do not cross the prior plane triangulation. Induction yields the desired crossing-free NG drawing. n=3 is the seed. This proves the circle question CND-0129 and kills it as an unsolved candidate, without asserting originality.

## CLM-0096: all n<=4 work, exact elementary proof
n=3: the seed triangle. n=4 with one point inside its other three: make the containing triangle first and place its interior point last; any two spokes remain inside the triangle, hence no proper crossings. For a strictly convex quadrilateral A,B,C,D cyclic, let O be the intersection of diagonals AC and BD. Choose a vertex, relabelled A, whose distance to O is maximal among all four. Then for opposite vertex C, diagonal CA=CO+OA > CO+OB > CB and CA=CO+OA > CO+OD > CD, using strict triangle inequalities in triangles COB and COD. Therefore C's two nearest among A,B,D are exactly B,D, its hull neighbours. Start with triangle A,B,D and insert C last, joining C-B,C-D outside that triangle; no proper crossings. Thus no counterexample with four or fewer points exists.

## CLM-0097: exact five-site rational ellipse certificate
Take ellipse x²/25+y²=1. In circular order indexed i=0,...,4 choose integer parameters m=(-194, 3, 25, 217, 257). Define P(m)=(320m/(1024+m²), (1024-m²)/(1024+m²)), with arithmetic in rational numbers. Explicit coordinates:

| i | x | y | two nearest other indices | hull neighbour indices |
|---|---|---|---|---|
| 0 | -3104/1933 | -9153/9665 | 3,4 | 1,4 |
| 1 | 960/1033 | 1015/1033 | 3,4 | 0,2 |
| 2 | 8000/1649 | 399/1649 | 3,4 | 1,3 |
| 3 | 69440/48113 | -46065/48113 | 1,4 | 2,4 |
| 4 | 82240/67073 | -65025/67073 | 1,3 | 0,3 |

The x²/25+y²=1 identity follows by expanding [2t/(1+t²)]²+[(1−t²)/(1+t²)]²=1 with t=m/32. Ordered distinct t give distinct cyclic ellipse sites. Strict convexity of ellipse gives no collinear triples and all five points exposed. Compare each row's rational squared distances d²(i,j)=(x_i-x_j)²+(y_i-y_j)², sorting j≠i; in every row the displayed two-nearest pair is strictly separated from the third-nearest. None matches the two hull neighbours. By S015 CLM-0092, a plane retained NG graph on five convex sites must have all five hull edges and its last vertex must attach to its two hull neighbours. No vertex qualifies. Hence every order crosses. The rational identity/table provide a finite hand-checkable exact obstruction independently of the search.

CLM-0098 CAM-0009 cross-check: all 120 permutations yield >=1 proper crossing (minimum 1), all tie-sensitive relevant ranks strict. The universal 4-point theorem and explicit 5-point example prove the sharp minimum is exactly 5 (CND-0130). Earlier S015 six-site result remains true but not minimal.

## CND-0131 — genuinely different remaining problem, no open-status certificate
Question: is the circle the only ellipse with the *every finite site set* plane NG arrival-order property? Circle affirmative by CLM-0095; ellipse with aspect 5:1 negative by CLM-0097. CAM-0008 also found zero-good-ear samples for aspect 20:1, but not aspect 51:50, 6:5 or 2:1 at fixed sampled bounds; not an impossibility for near-circular ellipses. Affine changes of coordinates preserve combinatorial convexity and crossings, but **do not preserve Euclidean distance rankings**, so an ellipse cannot simply be mapped to a circle with the rule intact. Conversely the circular arc proof uses exact isotropic chord geometry and cannot be applied blindly to an ellipse. No proof for all nonround ellipses, no verified novelty/hardness and no owner research selection. A no-good-ear property is only a necessary test; a set with a good ear may still be infeasible.

## Integrity and limitations
CAM-0008/9 full original preregs/scripts/raw are in detached downloadable archive, not yet resident in remote GitHub: see manifest. This is an unresolved archival governance exception, not secret completion. The 100,000 parabolic 5-site samples with no zero-ear witness do not refute the five-point ellipse certificate nor prove a theorem about parabola sets. CAM-0003 FAILED/PARTIAL37/54, CAM-0004 unchanged, CAM-0005 FAILED, CAM-0006/7 unchanged. Mathematics is self-checked, not peer reviewed or novelty cleared.
