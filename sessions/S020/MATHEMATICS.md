# S020 — a uniform all-cardinality near-circle theorem

## CLM-0107 (proved within programme)

Set R = sqrt(2/sin(2*pi/5)-1) = 1.0502020988726573... . EVERY finite set of n>=3 distinct boundary points of EVERY ellipse of semiaxes a>=b>0 and 1<=r=a/b<=R admits a noncrossing retained two-nearest-predecessor insertion order, starting from a triangle, under the prescribed Euclidean distances and lexicographic tie-breaking rule. There is no bound on n or minimum separation assumption.

By S017 CLM-0099 this follows if every set of k>=5 surviving vertices has a strict metric ear, and S016 CLM-0096 handles the final k=4.

## Proof (all k, including coalescence and antipodal cases)

Write cyclic ellipse sites P_j=(a cos theta_j,b sin theta_j); let g_j>0 be the successive positive parameter-angle gaps (sum g_j=2*pi). Define Lambda=4*arctan(b/a), so Lambda<=pi, and from S018 CLM-0102's verified chord derivative:

For two ellipse sites connected along a directed angular arc of width less than Lambda, extending the arc by moving either endpoint outward strictly increases its Euclidean chord length. Indeed, with Delta=phi-theta and M=(a²+b²)/2, D=(a²-b²)/2,
d/dphi |P(phi)-P(theta)|²
=4 sin(Delta/2)[M cos(Delta/2)-D cos((theta+3phi)/2)]>0
for 0<Delta<Lambda, since cos(Delta/2)>D/M. Reverse-direction extension holds likewise.

For each cyclic index j let s_j=g_(j-1)+g_j and L_j=|P_(j-1)-P_(j+1)| (the two-step or skip-one chord). Since sum_j s_j=4*pi, some s_j<=4*pi/k<=4*pi/5. Our R is smaller than cot(pi/5), so 4*pi/5<Lambda. Hence at least one index is ELIGIBLE, meaning s_j<Lambda. Choose i to minimize the **metric chord length** L_i over all ELIGIBLE indices.

Both adjacent chords from P_i to P_(i-1) and P_(i+1) are STRICTLY less than L_i by endpoint extension inside its eligible spanning arc. We establish that every non-neighbour P_j has distance from P_i AT LEAST L_i.

Let Delta in (0,2*pi) be the forward angular separation theta_j-theta_i modulo 2*pi.

(A) If Delta<Lambda, a forward non-neighbour occurs at or beyond i+2, so g_i+g_(i+1)<=Delta<Lambda and index i+1 is eligible. Extension from P_i gives
|P_i-P_j|>=|P_i-P_(i+2)|=L_(i+1)>=L_i,
using minimality among eligible indices. At Delta=Lambda: if the two-step arc is strictly shorter, the same comparison follows by continuous extension; if it is exactly Lambda, the central floor (B) applies directly.

(B) For Lambda<=Delta<=2*pi-Lambda, scale comparison with the circle gives
|P_i-P_j| >= 2*b*sin(Delta/2) >= 2*b*sin(Lambda/2) = 4*a*b²/(a²+b²).
The eligible witness with s<=4*pi/5 yields
L_i<=2*a*sin(2*pi/5).
By definition of R, r²+1<=2/sin(2*pi/5), which is exactly
2*a*sin(2*pi/5)<=4*a*b²/(a²+b²).
Hence |P_i-P_j|>=L_i in the entire central band, INCLUDING near-antipodal configurations.

(C) If Delta>2*pi-Lambda, reverse direction. The backward angular separation is <Lambda and P_j is not immediate predecessor; the arc passes i-1 and i-2. By the same short-direction argument index i-1 is eligible and |P_i-P_j|>=L_(i-1)>=L_i. At equality use central band (B).

Therefore all non-neighbours are at distance >=L_i, while both cyclic neighbours are at distances <L_i. Thus P_i is a strict metric ear, no distance-tie ambiguity. Remove P_i; remaining sites on the same ellipse still satisfy the same all-k theorem. Repeat until k=4, invoke the established universal four-point lemma CLM-0096, stop at three, and reverse all metric-ear deletions using the exact equivalence CLM-0099. QED.

## CLM-0108: CND-0131 is FALSE

Take a/b=101/100. This is nonround (r>1), yet 1.01<R. CLM-0107 grants a valid order for EVERY finite site set on this ellipse. Hence the CND-0131 proposal, that ONLY the circle has this universal property, is disproved. Change CND-0131 from GENERATED to KILLED_FALSE/DEGENERATE, based on this full symbolic argument, not a numeric experiment.

## Comparison, audit and limits

The selection MINIMISES THE METRIC SKIP CHORD AMONG ELIGIBLE SHORT SPANS, NOT merely the minimal angular gap. This is essential: short directed competitors are compared against eligible neighbouring skip chords in their own direction; central competitors use an absolute chord floor. It does not directly compare opposite-direction chords, and it handles arbitrarily close points, nested clusters and almost antipodal sites. R is a sufficient bound, NOT proven sharp. The global property for r>R and the complete successful aspect-ratio set remain unclassified. The exact bad five-site example at r=5 remains valid.

This is an original derivation **within the programme**, NOT an externally peer-reviewed result or verified historically new theorem. No CAM-0011, CAD execution or floating near-duplicate witness was used.