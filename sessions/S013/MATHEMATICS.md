# S013 mathematics — coupled constraints, rigorous pre-kills

Five complete elementary statements are frozen in the candidate registry. Every result below is a human self-audit or inspected source, not an independent research certification. No computational finite search was run.

## CND-0120 / CLM-0081 — elementary parity and sums-of-two-squares obstruction

**Question:** Does there exist a noncollinear triple A,B,C in Z^2 such that the three integers |A-B|^2, |B-C|^2, |C-A|^2 are n,n+1,n+2 in some order for a positive integer n?

**School version:** Can a triangle drawn between grid points have three squared side lengths that are consecutive whole numbers?

**Resolution and precise limits:** Translate A to 0 and let u=B-A,v=C-A, with squared lengths x=|u|^2,y=|v|^2,z=|u-v|^2. Then x+y-z=2u·v is even, so x+y+z is even. If {x,y,z}={n,n+1,n+2}, the sum is 3n+3: n must be odd. Every three consecutive integers starting with odd n contain an integer congruent to 3 mod 4, but an integer squared distance (p^2+q^2) can never be 3 mod 4. Contradiction. Independently Heron's identity gives 4 det(u,v)^2=3(n+1)^2-4, impossible modulo 3 (LHS square mod3, RHS 2 mod3).

**Reduction both ways:** Translate one vertex to origin; triple squared distances are norms of u, v and u-v. Conversely such a pair of integer vectors uniquely provides the lattice triangle.

**Status:** KILLED_EASY, novelty NOT_SEARCHED. CAM: none. No two failed distinct attacks after decisive result, hence no hardness claim.

## CND-0121 / CLM-0082 — Cauchy-Schwarz forces convergence

**Question:** Is there a strictly increasing infinite sequence of positive integers (a_n) such that sum_(n>=1) 1/a_n diverges but sum_(n>=1) 1/(a_(n+1)-a_n) converges?

**School version:** Could the reciprocals of chosen increasing whole numbers add up forever while the reciprocals of their step sizes have a finite total?

**Resolution and precise limits:** Write d_j=a_(j+1)-a_j>0 and S=sum_(j>=1) 1/d_j<infinity. Cauchy-Schwarz yields (n-1)^2 <= (sum_(j<n)d_j)(sum_(j<n)1/d_j) <= S(a_n-a_1) for n>=2. Hence a_n>=(n-1)^2/S, so sum_(n>=2)1/a_n<=S sum_(k>=1)1/k^2<infinity, a contradiction. The converse combination is possible (a_n=n^2 gives summable 1/a_n and divergent 1/d_n).

**Reduction both ways:** A strictly increasing integer sequence is equivalent to its positive integer initial value plus positive integer gap sequence d_n; summation reconstructs a_n exactly.

**Status:** KILLED_EASY, novelty NOT_SEARCHED. CAM: none. No two failed distinct attacks after decisive result, hence no hardness claim.

## CND-0122 / CLM-0083 — exact historical MO question; reported collinear-only classification

**Question:** Do four distinct points in the Euclidean plane, not all collinear, exist whose six unordered pairwise distances are precisely n,n+1,n+2,n+3,n+4,n+5 for some positive integer n?

**School version:** Can four non-collinear points in the plane have all six distances be consecutive whole numbers?

**Resolution and precise limits:** Exact consecutive-six-distance formulation is posed in a MathOverflow question (Morteza, 2014-10-15) for four planar points; Robert Israel's inspected answer states only starting value n=1 is possible, realized by four collinear points (0,0),(1,0),(4,0),(6,0), and cites the Cayley-Menger determinant. The present added non-collinear exclusion rules out that sole reported configuration. The exhaustive elimination asserted in the answer was NOT independently re-proved or referee-certified here; priority kill is decisive even if the claimed classification were later corrected because the question itself is already published.

**Reduction both ways:** An assignment of six integer distances to the edges of K4 must satisfy planar Cayley-Menger determinant zero and all triangle inequalities; geometric points give such labelled edge data. The converse also needs positivity / Euclidean Gram rank, so determinant zero alone is NOT equivalent.

**Status:** KILLED_KNOWN, novelty KNOWN_VARIANT. CAM: none. No two failed distinct attacks after decisive result, hence no hardness claim.

## CND-0123 / CLM-0084 — immediate classical transcendence reduction

**Question:** For a circle of positive integer radius R, do distinct points P,Q exist for which the minor arc length L(P,Q)>0 and the chord length |P-Q| are both positive integers?

**School version:** On a circle with a whole-number radius, can the shorter curved distance and the straight-line distance between two points both be whole numbers?

**Resolution and precise limits:** Let theta=L/R; theta is nonzero rational in (0,pi] and C=|P-Q| is a positive integer. The chord relation C^2=2R^2(1-cos theta) makes cos theta rational. Hence z=e^(i theta) is algebraic, being a root of z^2-2(cos theta)z+1=0. But i theta is nonzero algebraic, and the Hermite-Lindemann theorem says e^(i theta) is transcendental. Contradiction. This is a direct classical-theorem consequence, not a new result; the theorem itself was read at encyclopedia statement level, not re-proved.

**Reduction both ways:** Minor arc L and radius R determine theta=L/R in (0,pi]; conversely theta and R give arc L=R theta and chord C=R sqrt(2-2cos theta). Requiring both L,C to be integers is precisely the algebraic exponential contradiction.

**Status:** KILLED_KNOWN, novelty KNOWN_VARIANT. CAM: none. No two failed distinct attacks after decisive result, hence no hardness claim.

## CND-0124 / CLM-0085 — explicit Pell family supplies infinitely many triangles

**Question:** Are there infinitely many pairwise noncongruent nondegenerate Euclidean triangles with three consecutive positive-integer side lengths, integer-coordinate vertices, and integer-coordinate incenter?

**School version:** Are there infinitely many different triangles whose sides are three consecutive whole numbers and whose corners and incentre all lie on grid points?

**Resolution and precise limits:** For every positive solution m^2-3k^2=1 (start (m,k)=(2,1), iterate (m,k)->(2m+3k,m+2k)), take A=(0,0), B=(2m,0), C=(m-2,3k). Direct expansion using 3k^2=m^2-1 gives |AB|=2m, |AC|=2m-1, |BC|=2m+1 and signed doubled area 6mk, so nondegenerate. The incenter weighted by opposite side lengths is ((2m-1)B+(2m)C)/(6m)=(m-1,k), an integer lattice point. Since m strictly increases, triangles are noncongruent. The established general Heronian-to-lattice theorem is related prior art but this stronger incenter construction is recorded as an elementary self-contained result, not a new theorem.

**Reduction both ways:** Any (m,k) positive Pell solution gives stated integer coordinates, and any triangle with consecutive sides and integer area satisfies a Pell relation through Heron's formula; the proof establishes an infinite family, not a classification of all possible incenter placements.

**Status:** KILLED_EASY, novelty KNOWN_VARIANT. CAM: none. No two failed distinct attacks after decisive result, hence no hardness claim.

## Adversarial summary

- No stand-alone reformulation was kept as an unverified survivor. The nearest classical matches were exposed *before* any numerical experiment.
- The sixth consecutive point-distance condition was genuinely exact in 2014 MathOverflow; the reply's full algebra was not verified. Lindemann–Weierstrass is deep but directly settles the chord/arc question, so it is not a presently open candidate.
- The Pell construction supplies infinitely many *different* integer-side triangles and integer-coordinate incentres; hence the existence statement is not resistant even though the geometry looks coupled.
- No CAM-0004 preregistration; no numerical arithmetic sequence enumeration or search. All five killed, CND=124 total.
