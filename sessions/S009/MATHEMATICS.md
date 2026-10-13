# S009 mathematics — 2026-10-13 (CND-0109)

## Definitions and two-way reductions

The S008 potential/edge-deletion and plane-dual partition equivalences apply unchanged. An m×m array of nonzero face charges in Z/3 has D >= ceil(m²/2) because every retained bounded face must aggregate at least two original cells and one deleted primal edge can eliminate at most one bounded face. Every feasible deleted dual forest partitions cells into connected regions summing to 0 mod3, except the region attached to the exterior. Conversely any such partition is realised by the corresponding dual forest, and the phase potential exists on each primal retained component. Bridges, corner cells, exterior boundary edges and isolated vertices are covered by this same argument.

## Theorem 1: all even m (PROGRAMME_PROVED, CLM-0068)

For all even m>=2 and **every** defect (i,j), **D(m,i,j)=m²/2+1**.

*Lower bound.* If D=m²/2 (the general lower bound), the dual partition has m²/2 bounded blocks, each of size exactly two, and the exterior is a singleton. Each bounded pair must consist of opposite signed charges. The flipped cell, however, has the SAME charge as every orthogonally adjacent cell. It cannot occur in any zero-sum two-cell connected block. Contradiction. Therefore D>=m²/2+1.

*Upper bound, boundary defect.* Pick a domino of two adjacent cells lying along the same outer boundary containing the defect, compatible with the standard rowwise (top/bottom) or columnwise (left/right) complete domino tiling of the even×even board. Join both cells to the exterior with the two boundary edges (the two defect-pair faces now lie in the exterior component). Remove the internal separating edge for each other domino. That is 2+(m²-2)/2=m²/2+1 deleted primal edges. All interior domino charges sum to zero, including pairs not touching the defect.

*Upper bound, nonboundary defect.* Its column j is between 2 and m-1. Take the three horizontal consecutive cells (i,j-1),(i,j),(i,j+1). After the sign flip, all three charges agree, so their mod3 sum is ±3=0; delete their two internal boundaries. Also join one same-row boundary face to the exterior: choose (i,1) if j is odd and (i,m) if j is even, and delete its outside boundary edge. These faces are distinct. Tile the remaining segments of row i by horizontal dominoes: their lengths are even (check parity of j); tile every other complete row horizontally (m is even). All domino charges cancel. Count 2+1+(m²-4)/2=m²/2+1. The retained bounded-face fluxes are all zero. This proves both directions without placing restrictions on i or j.

## Theorem 2: two full classes for odd m (PROGRAMME_PROVED, CLM-0069)

Let odd m>=3. If the defect has i+j odd (the original **minority** checkerboard colour), then D=(m²+1)/2. Indeed, when i is odd and j even, group defect with left/right neighbours: all three flipped charges agree and cancel mod3; the two unoccupied intervals of that row each have even length, and the other m-1 rows tile vertically in pairs. When i even and j odd use the transposed vertical triple and tile the remaining m-1 columns horizontally in pairs. The total deletion count is 2+(m²-3)/2=(m²+1)/2, attaining the universal bound.

If the defect has i+j even (original **majority**) and is on the outer boundary, D=(m²+1)/2: send the defect square to the exterior with one deleted boundary edge, tile the two even-length intervals of the affected side row/column and the remaining even number of complete rows/columns by dominoes. The total is 1+(m²-1)/2.

If instead the majority-colour defect is **strictly interior**, D>=(m²+3)/2. To attain (m²+1)/2, every bounded block is a domino and the exterior contains exactly one boundary face, or else the exterior is empty of cells and there is exactly one size-3 zero-charge block with all other blocks dominoes. The first case requires the defect on the boundary, as it cannot be in an opposite-charge domino. A size-3 connected zero-charge set over ±1 mod3 must have all three charges equal, and in the alternating grid it must contain the defect and two originally minority-colour neighbours (an unflipped three-cell connected set necessarily has an adjacent opposite-charge pair). For m odd the original majority count exceeds the minority count by one. Removing one originally majority and two minority cells leaves a surplus of TWO majority cells, so the complement cannot be tiled by opposite-colour dominoes. Hence the bound. No general matching upper bound for this interior-majority class has been proved.

## CAM-0003 finite MILP audit (CLM-0070, not a general proof)

Preregistered at 2026-10-13T18:37:19.829521+00:00, before execution, Python source hash sha256:285038eae3993c1f8ffe3e20273fb68702e71d66b4f3a6b499e389e85d7eeabb. Integer vertex variables x_v in {0,1,2}, lift k_e in [-2,2] and violations y_e in {0,1}; enforce |x_v-x_u-d_e-3k_e|<=6y_e and minimize sum y_e. On a square grid these edge demands realise prescribed face flux; every assignment yields the violated-edge deletion and conversely each consistency repair extends to phases (S008). Each reported HiGHS status=0 is a finite MILP optimum. The model permits bridge deletions and isolated vertices.

Completed 37 of preregistered 54 instances before the container execution was interrupted. All positions were solved for m=2 (4 points, D=3), m=3 (9 points, D=5 except centre D=6), m=4 (16 points, D=9). For m=5, eight positions (row 1 entire, row 2 columns 1..3) yielded D=13 except (2,2) yielded D=14. **No claim for the 17 unrun m=5 positions.** The run did not write its end-of-run JSON, so the raw JSON is explicitly transcribed from preserved stdout. No retry is falsely claimed. Numerical source is not an independent mathematical proof nor a verified general formula; campaign status FAILED/PARTIAL.

## Mathematical status

CND-0109 is neither killed nor TRIAGED. Odd-majority-interior exactness is still unresolved, especially as m grows; the above counting bound and isolated data are evidence of tractability, not of open-problem difficulty. Two genuinely failed independent attacks plus independent difficulty evidence are NOT established. Known MAX-2-LIN / gain-graph frustration formulations remain strong prior-art hazards. No transferable Z2 planar signed graph theorem is asserted for the Z3 instance. All human proofs are self-audited and not formalised/reviewed.
