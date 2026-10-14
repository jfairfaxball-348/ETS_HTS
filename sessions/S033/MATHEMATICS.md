# S033 mathematics — a **rigorous obstruction** to minimum-two-gap ear selection

## What survives from S032

S032's exact `priority` comparator and tie-safe three-predecessor nearest-pair theorem are kernel-checked on the S032 merged main with only standard axioms. They correctly select a pair given a chosen final vertex, but do not prove the geometric plane condition for every four sites. CLM0096 remains open for cardinality four; three sites are already verified. S031's convex quadrilateral paper argument still needs actual Lean support for separation of diagonals/interior triangle, orientation, and `planeEdges`.

## A five-site counterexample to the S032 *selection heuristic* — NOT to CLM0107

Work on **the exact target ellipse** (x^2/(101/100)^2+y^2=1). Rational half-angle parametrisation gives

\[
P(t)=\left(\frac{101}{100}\frac{1-t^2}{1+t^2},\frac{2t}{1+t^2}\right).
\]

In counterclockwise cyclic order choose

\[
P_0=P(0),\quad P_1=P(1/3),\quad P_2=P(9/4),\quad
P_3=P(113/50),\quad P_4=P(-9/4).
\]

Their unwrapped parameters are `theta_0=0`, `theta_1=2 atan(1/3)`, `theta_2=2 atan(9/4)`, `theta_3=2 atan(113/50)`, `theta_4=2pi-2 atan(9/4)`; indeed they are strictly increasing and below 2pi. For cyclic positive gaps `g_i=theta_(i+1)-theta_i`, with theta_5=2pi, define `T_i=g_(i-1)+g_i` (indices mod 5). Then:

- `T_0=theta_1+theta_2 > T_1=theta_2 > T_2=theta_3-theta_1`. To justify the second inequality exactly, `T_2/2=atan(289/263)` and `T_1/2=atan(9/4)`; compare positive rationals.
- `T_3=theta_4-theta_2`; `T_3/2=atan(72/65)` by the arctangent reciprocal and double-angle identities (both angles lie in `(0,pi/2)`). Since `289*65=18785 < 18936=72*263`, `T_2<T_3` **strictly**.
- `T_4=2pi-theta_3>pi>T_2`.

Thus **index 2 is the unique minimiser of the adjacent two-gap sum**, with no gap ties. Yet the nearest neighbours of vertex 2 are NOT the two cyclic neighbours 1 and 3, because a non-neighbour (vertex 4) is strictly closer than neighbour 1.

Indeed the relevant ellipse coordinates are exactly

\[
P_1=(101/125,3/5),\quad P_2=(-1313/1940,72/97),\quad
P_4=(-1313/1940,-72/97)
\]

and a direct **rational identity** is

\[
\|P_2-P_1\|^2-\|P_2-P_4\|^2
=\boxed{49482169/2352250000}>0.
\]

These exact coordinates and inequality are encoded as candidate Lean theorems `s033_distance_reversal` and `s033_nonadjacent_strictly_closer`. Their eventual hosted kernel verification certifies **the rational distance statement**, while the cyclic-order/minimality arctangent algebra above remains a paper proof until separately formalised. This witness has alternative metric ears (at vertices 1 and 3), so it does NOT refute CLM0107 or CLM0099.

## Consequence for the all-n approach

The formalizable finite average statement is true: for a family `T : Fin n -> Real` with total sum `4*pi`, any index with minimal `T_i` satisfies `T_i<=4*pi/n`. The summation identity for genuine cyclic gaps, existence of the minimiser, closed-R Euclidean gap comparison, and wraparound have NOT been formalised. Crucially, even if they were, choosing the minimiser cannot by itself produce a metric ear; the explicit five-site witness disproves that proposed universal implication at 101/100. A replacement selection principle **must** be proved (e.g. allow both adjacent candidates, use a metric-weighted extremum, or a multi-ear disjunction) and must treat ties and endpoint equality at R.

## CLM0099 / CLM0096 open geometric lemmas

For CLM0099, numerical edge count `3+2(n-3)=2n-3` is insufficient alone. One must prove edge freshness of each insertion from global Nodup, noncrossing outerplanar bound relative to all vertices, hull-side saturation, last-vertex degree exactly 2 with compulsory hull neighbours, and full recursive forward/backward Grow construction. These were NOT Lean-proved in S033.

For CLM0096, interior-fourth spoke noncrossing and convex-four diagonal selection remain unformalised. The exact-tie nearest-pair theorem closes the ranking subgoal only, not the planarity/existence subgoal.

## Exact status

CLM0102 remains genuinely verified. CLM0096, CLM0099, CLM0107 and CLM0108 remain open as the **unmodified** exact types. The new rational-coordinate counterexample excludes one attractive *proof strategy*, not the central theorem. S033 verdict PARTIAL, not all-five PASS.
