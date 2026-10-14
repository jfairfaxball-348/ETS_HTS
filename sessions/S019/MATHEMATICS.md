# S019 — exact decidability of fixed-n ellipse obstruction ratios

## Model
For n>=3 distinct ellipse boundary points, fix a triangle first, then add each remaining point, retaining its two edges to its Euclidean-nearest previously present sites (lexicographic coordinate tie-breaking). Require no proper crossings. By CLM-0099, on strictly convex sets feasibility is equivalent to recursive deletion of metric hull ears. CND-0131 asks whether the circle alone is universally feasible over *all* finite n.

S018 CLM-0103 proved: for every FIXED n, some unspecified epsilon_n>0 protects all sets with r=a/b in [1,1+epsilon_n), even with arbitrary coalescence. This session DOES NOT find an explicit numerical epsilon_n or any all-n bound.

## CLM-0105 — bad ratios form a Q-semialgebraic set
Put t=r²>=1 and represent sites z_i=(u_i,v_i) on the UNIT circle:
  u_i²+v_i²=1;
  (u_i-u_j)²+(v_i-v_j)²>0 (all i≠j).
Their physical ellipse coordinates are P_i=(sqrt(t)u_i,v_i), after scaling b=1. Every squared distance is the integer-coefficient polynomial
  D_ij=t(u_i-u_j)²+(v_i-v_j)².
For arrival of i, predecessor j outranks k iff
  D_ij<D_ik
OR D_ij=D_ik and [u_j<u_k OR (u_j=u_k and v_j<v_k)].
This exactly reproduces lex coordinate ties since sqrt(t)>0. Distinct points make rankings total.

For each of n! arrival permutations π, enumerate finite choices of predecessor pairs, impose that each pair is ranked first and second according to the above comparisons, and create the retained graph of 2n−3 edges including the first triangle. Edges with distinct endpoints cross properly iff each edge's endpoints lie on opposite signed sides of the other supporting line; these are inequalities between products of 2D orientation determinants. The linear map diag(sqrt(t),1) preserves sign of every determinant, so all crossing tests use the *rational-polynomial* unit-circle positions z_i without radicals. Three distinct sites on a circle are never collinear, so no extra collinear exceptions arise. Define Good_π(t,z) as the finite Boolean polynomial formula that the precisely ranked predecessors produce no proper crossing. Then
  Bad_n(t,z) := [unit-circle and distinctness conditions] AND [for ALL π, NOT Good_π(t,z)]
is quantifier-free over Q in the 2n+1 variables (t,z).

Thus the bad squared-aspect-ratio set is
  B_n={t>=1: EXISTS z_1,...,z_n, Bad_n(t,z)}.
The standard Tarski-Seidenberg theorem proves B_n is Q-semialgebraic, and effective cylindrical algebraic decomposition (CAD) can construct or decide its projection. A univariate Q-semialgebraic set is a finite union of intervals and isolated points, with finite boundaries at real-algebraic numbers. If B_n is nonempty its infimum is real algebraic; otherwise inf B_n=+infinity. **B_n may omit its infimum or be nonmonotone.** No statement says an obstruction exists exactly at a lower boundary. This is a self-contained reduction to established mathematical machinery, not a novel CAD method.

## CLM-0106 — terminating exact rational bound-extraction algorithm
For input n>=3 enumerate integers m=1,2,... . At each stage use *exact* real quantifier elimination to answer whether there exist t∈[1,(1+1/m)²] and n distinct unit-circle points satisfying Bad_n(t,z). If YES, increment m. At the first NO, output the rational epsilon_n=1/m. All input coefficients are rational and each yes/no query is decidable by established real-algebraic algorithms. CLM-0103 gives eta_n>0 safe for r<1+eta_n. Once 1/m<eta_n the **whole closed** interval has no bad t, so the loop terminates. The result is a mathematically effective, certified rational n-specific epsilon_n and is safe even under arbitrary site coalescence.

**Important:** This algorithm was NOT run. No integer m, numerical epsilon_n, polynomial root, runtime, practical feasibility, n-uniform aspect interval or n(r) bound has been supplied. Termination relies on the correctness of S018's CLM-0103. For n<=4 the no-bad-set result CLM-0096 immediately applies.

## Failed direct global/quantitative routes
- CLM-0100 needs a minimum angular gap δ>0. Coalescing sites make δ arbitrarily small even at fixed n, so the direct estimate r<1+δ cos(2π/5)/2 cannot yield a universal aspect interval.
- CLM-0102 makes chord extension monotone on arcs of width <4 arctan(1/r), but a chained cluster may span a much larger arc when n grows. The shortest triple-span proof on one arc cannot simply cover the entire ellipse.
- Near two antipodal limiting clusters, the flanking-support derivative proof used for >=3 limit supports degenerates. S018 needs its separate <=4 reduction; a naive uniform cluster induction cannot discard this case.
- Comparing opposing arcs from a vertex is not warranted by monotonicity on EACH short directed arc. Infinitesimal circle distance margins may lose to fixed anisotropy; an explicit hierarchical invariant is still absent.
- No rigorously certified nearcircle bad sets with n(r)->infinity were constructed. S017 CAM10 floating signs around 1e-31 reflect near-duplicates, not valid exact certificates.

## Global logical limitation and programme recommendation
For each n, B_n is semialgebraic. Their **countable union over all n** need not be semialgebraic and the infimum of safe epsilon_n over n may be zero. The desired classification, and even a fixed positive all-n safe ratio interval, remain UNRESOLVED. This session reached effectivity only, NOT the primary explicit numerical bound/obstruction objective. Retain CND-0131 GENERATED but recommend a decisive all-n attempt then governed narrative NOT_RESOLVED_RETIRED consideration in S020 if no actual global obligation falls. There was no CAM11, external mathematical review, or verified novelty.
