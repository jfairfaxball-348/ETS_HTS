# S010 mathematics — a full elementary solution of CND-0109 (CLM-0071)

Date: 2026-10-13. Classification: **PROGRAMME_PROVED, KILLED_EASY**. Self-audit only, no priority or independent referee. No new mathematical computations.

## Statement and exact answer

Let G be the (m+1)-by-(m+1) planar square grid of vertices; there are F=m² unit faces. Fix demands d_e in Z/3 on oriented edges, with clockwise face sums q_{rc}=(-1)^(r+c) ∈ {+1,-1} for 1<=r,c<=m except at defect (i,j), where q_{ij} is sign-reversed. Any different edge-demand representatives with these face fluxes are gauge-equivalent, hence the optimum depends only on q. Let D(m,i,j) be the least number of primal edges removed so that on all retained edges d_e=x_v-x_u for some x:V(G)->Z/3 (independent additive origins on disconnected retained components).

**Theorem S010.1 (CLM-0071).** For every m>=2 and 1<=i,j<=m:

* If m is even: D=m²/2+1, for any defect.
* If m is odd and the defect has original majority colour (i+j even) AND 1<i,j<m: D=(m²+3)/2.
* In the remaining odd cases: D=(m²+1)/2.

No asymptotic qualification, artificial subpatch boundary, numerical extrapolation or solver assumption is used.

## Lemma A — exact two-way primal/dual interpretation (including exterior)

Construct the planar dual G* whose vertices are ALL m² unit cells plus the one outside face, with one dual edge crossing each primal grid edge. For E' deleted primal edges, form H*=(V(G*), {e*:e∈E'}); loops and parallel edges cause no difficulty. The remaining edge equations are integrable if and only if every connected component of H* NOT containing the exterior has charge sum 0 mod3.

Forward: if a potential exists on every retained edge, the oriented demand sum vanishes along every retained closed walk. For any bounded H* component S, the boundary of the union of its original cells traverses only retained primal edges: if a boundary edge had been deleted, its dual would join S to the other side, contrary to being a component. Each oriented boundary walk has zero demand sum. Discrete Stokes/cancellation over S gives sum_{f∈S}q_f=0. This remains true for a component with holes, bridges, corner faces and disconnected retained primal graph.

Reverse: a retained primal closed walk C is disjoint from every deleted dual edge. Therefore every deleted-dual component is wholly inside or outside C; the exterior component is outside. The charge enclosed by C is a sum of whole bounded H* component charges and hence zero. Discrete Stokes says the demand sum around C is zero. Choose a root and integrate demands along paths separately in each connected component of the retained primal graph; cycle-zero makes the value path-independent. Isolated vertices obtain arbitrary phase. The choice of demand representative has no effect because all representatives of identical face flux differ by an integrable gradient on the simply connected original grid.

A constructive partition below is realised by deleting a spanning tree edge within each desired dual block, and for each cell assigned to the exterior deleting a dual path to the exterior. In our constructions ALL chosen dual edges form disjoint block trees plus a two-leaf star or singleton exterior edge; hence the number of deleted primal edges equals the sum of block-size-minus-one and exterior attachments, without cycle/bridge counting ambiguity.

## Lemma B — sharp lower bounds

Let d deleted primal edges. Initially G* has F+1 singleton components. Adding d dual edges reduces the number of components by at most d, so there are at least F+1-d components overall, or at least F-d bounded components not containing the exterior. Every nonempty bounded component has at least 2 cells because each individual q_f is ±1 mod3 and cannot sum to zero. Consequently F-d <= floor(F/2), hence d>=ceil(F/2).

**Even m:** F=2k. Suppose d=k. Then there must be k bounded components of at least two cells each. Their total is F, so the exterior contains NO cells and each bounded component is a 2-cell domino with opposite charges. But the reversed defective cell has the same charge as every neighbouring cell, so cannot belong to a neutral domino. Contradiction. Thus d>=k+1. NOTE: S009 MATHEMATICS accidentally called the exterior a singleton here. It is **empty of original cells**, not a singleton. The inequality and conclusion in S009 remain correct after this correction.

**Odd m, majority interior:** F=2k+1. Suppose d=k+1. Then at least k bounded components, each with >=2 cells, so at most one original cell belongs to the exterior, and there are exactly k bounded components.

Case (a), one exterior cell: all bounded components are opposite-charge dominoes. Since the defect cannot belong to a domino, it must be the exterior cell. Yet an interior cell cannot be the sole member of the exterior dual component: to reach the outside it would need a path through other cell vertices, contradicting singleton membership.

Case (b), no exterior cells: k bounded zero-charge components partition 2k+1 cells, so precisely one block has size 3 and the other k−1 blocks are opposite-charge dominoes. A connected 3-cell block whose entries lie in {±1} can sum to 0 mod3 only if all three are the same sign (integer sums are −3,−1,+1,+3). Without defect, adjacent cells always have opposite signs, so this triple must contain the flipped defect and precisely two original minority-colour adjacent neighbours. On odd m, before the defect the majority colour has (F+1)/2=k+1 cells and the minority has (F−1)/2=k. Remove the triple (1 majority, 2 minority); the remainder has k majority and k−2 minority cells. Every domino contains one of each ORIGINAL colour, impossible. Therefore d>=k+2=(m²+3)/2.

No assumption of a local 3x3 or 5x5 patch is made. This lower bound is on the entire embedded board with its actual exterior.

## Lemma C — all required explicit upper bounds

All described paired cells are adjacent opposite ORIGINAL checkerboard colours and therefore opposite mod-3 charges unless they touch the defect. A three-cell horizontal or vertical block containing the flipped defect at its middle has three identical charges (the two neighbours are original minority relative to the defect), so its total is ±3=0 mod3. Each domino costs one deleted interior primal edge; the triple costs two. Every mentioned exterior singleton is a genuine ORIGINAL outside-boundary cell and costs one outer primal edge. All remaining primal demands admit phases by Lemma A.

(1) **m even, defect on boundary.** Choose an adjacent boundary domino containing the defect in a complete horizontal or vertical tiling (depending on which outer side is used) and attach BOTH its cells to the exterior (two distinct outer edges), not as a bounded domino. Tile the other F−2 cells in dominoes: cost 2+(F−2)/2=F/2+1. This works at corner and noncorner boundary positions, with rows or columns chosen parallel to an even-length boundary.

(2) **m even, defect interior.** Use horizontal triple T={(i,j−1),(i,j),(i,j+1)} (cost 2). If j odd, send (i,1) to exterior; if j even, send (i,m) to exterior (cost 1). These are distinct from T because 1<j<m and parity: for j odd >=3; for j even <=m−2. The remaining parts of row i have even lengths; all other complete rows have even length m. Tile horizontally. There remain F−4 domino-covered cells, hence cost 2+1+(F−4)/2=F/2+1.

(3) **m odd, original minority defect (i+j odd).** If i odd, j even, use horizontal triple T. The left and right intervals in that row have lengths j−2 and m−j−1, both even. The numbers of rows above and below row i, namely i−1 and m−i, are both even; pair each neighbouring complete two rows with vertical dominoes. No exterior cells: cost 2+(F−3)/2=(F+1)/2. If i even, j odd, transpose the construction (vertical T with the remaining columns paired horizontally).

(4) **m odd, original majority boundary defect (i+j even, i∈{1,m} or j∈{1,m}).** On the appropriate outside side, the defect lies at an odd index along that side because the side index is odd. Send the defect to exterior (cost 1); the two remaining intervals of that row/column have even lengths and can be domino tiled; the remaining m−1 rows/columns can be paired across their full length. Total 1+(F−1)/2=(F+1)/2.

(5) **m odd, original majority strictly interior: NEW universal construction, two parity cases.** Here i+j is even, so i,j are both odd or both even. In either case take the horizontal 3-cell triple T=(i,j−1),(i,j),(i,j+1) and delete its two internal edges. It is zero-charge after the flip.

  **(5a) i,j both odd.** Necessarily 3<=i,j<=m−2 (m>=5). Attach boundary cells A=(i,1) and B=(i,m) each directly to the REAL exterior by deleting their west/east primal boundary edges. Both were original majority cells and are disjoint from T. The leftover intervals of row i have lengths j−3 and m−j−2, both even; tile them horizontally. The i−1 rows above and m−i below are each an EVEN number of rows, so tile all these complete rows in vertical two-row pairs. There are F−5 other cells, perfectly covered by (F−5)/2 dominoes.

  **(5b) i,j both even.** Necessarily 2<=i,j<=m−1 (m>=3). Attach A=(i−1,1) and B=(i+1,1) to the REAL exterior using their west primal boundary edges. These are both original majority cells (odd row, column 1) and lie outside T. In row i the intervals left/right of T have lengths j−2 and m−j−1, both even, so tile them horizontally. Row i−1 and row i+1 each has the first cell A/B removed; their remaining columns 2..m are an even number m−1, so tile both rows horizontally. There are i−2 rows above the 3-row strip and m−i−1 rows below it; each count is even (i even, m odd), so tile each such pair of complete rows vertically. Again the F−5 remaining cells form (F−5)/2 dominoes.

  Both cases produce an acyclic dual-edge selection with exactly 2 edges for T, 2 edges for A/B to the original exterior, and (F−5)/2 domino internal edges. Thus d=2+2+(F−5)/2=(F+3)/2, matching Lemma B. The construction is valid without any reliance on a fictitious patch boundary.

At m=3 only case (5b) occurs at the centre (2,2); T occupies the middle row, A=(1,1), B=(3,1), leaving two horizontal dominoes, so d=6. At m=5 both parity cases exist, and the formulas are exact with no computational input.

This completes the proof of Theorem S010.1. □

## Independence audit and limitations

* The lower bound is a component-number invariant independent of the parity-split explicit *upper*-bound tilings. Both have global quantifiers and handle original grid exterior edges, isolated primal vertices, dual loops/multiple edges and bridges.
* The single exterior component may contain both A and B, joined through the actual exterior vertex. Exactly two boundary primal deletions suffice; there is no need for an artificial corridor from either boundary face to the defect.
* No use of the faulty CAM-0001 metric, CAM-0002, or interrupted CAM-0003. Solver-optimal m2/3/4 cases are consistent but NOT the basis for the proof, and 17 unexecuted m5 CAM-0003 positions remain unexecuted.
* This demonstrates CND-0109 is easy in the programme sense, not that the formula is historically original. External independent verification, Lean formalisation, publication, and a priority assertion are neither performed nor authorised.
