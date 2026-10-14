# S002 failure / kill ledger

Full permanent kill reasons are synchronized in CANDIDATES.json and CANDIDATES.md; these entries remain even when equivalent.

| Candidate | Kill status | Concrete reason |
|---|---|---|
| CND-0001 | KILLED_FALSE/DEGENERATE | K4 is the union of paths 1-2-3-4 and 3-1-4-2; it needs four colours. |
| CND-0002 | KILLED_EASY | Take a 2-colouring of each tree; the ordered pair of colours is a proper 4-colouring. |
| CND-0003 | KILLED_FALSE/DEGENERATE | The two K4 paths given for CND-0001 prevent three colours. |
| CND-0004 | KILLED_FALSE/DEGENERATE | Paths 1-2-3-4 and 2-1-4-3 have leaf sets {1,4} and {2,3}. |
| CND-0005 | KILLED_FALSE/DEGENERATE | The two paths covering K4 from CND-0001 make every pair adjacent somewhere. |
| CND-0006 | KILLED_EASY | Four-colour the union by pairs of tree bipartitions; the largest colour class has at least ceil(n/4). K4 demonstrates sharpness at n=4. |
| CND-0007 | KILLED_FALSE/DEGENERATE | Two identical stars on n=8: the universal centre must have a singleton colour class, inconsistent with four groups of size 2. |
| CND-0008 | KILLED_FALSE/DEGENERATE | K4 decomposes into the two edge-disjoint Hamiltonian paths in CND-0001. |
| CND-0009 | KILLED_EASY | Use consecutive disjoint pairs along the first path: (1,2),(3,4),... . |
| CND-0010 | KILLED_EASY | The first Hamiltonian path already connects every vertex. |
| CND-0011 | KILLED_EASY | Pigeonhole n repunit remainders: a zero remainder or a difference with digits 1 then 0; because 10 is invertible, zero occurs. |
| CND-0012 | KILLED_EASY | The number 12(100^k−1)/99 is divisible by n if 100^k≡1 (mod 99n), which occurs for n coprime to 10. |
| CND-0013 | KILLED_EASY | Write n=2^a5^b m with gcd(m,10)=1; choose an all-ones multiple of m, then append at least max(a,b) zeros. |
| CND-0014 | KILLED_EASY | Choose an all-ones multiple of the coprime-to-10 factor with length k≥max(v2(n),v5(n)); append exactly k zeros. |
| CND-0015 | KILLED_FALSE/DEGENERATE | Take n=5: a multiple of 5 cannot end in 1 or 2. |
| CND-0016 | KILLED_EASY | An all-ones repunit multiple from CND-0011 is palindromic. |
| CND-0018 | KILLED_FALSE/DEGENERATE | n=5, since all such numbers end in 1. |
| CND-0019 | KILLED_KNOWN | OEIS A343447 records smallest such alternating multiples for integers coprime with 10, with multiplicative-order formula. |
| CND-0020 | KILLED_EASY | For 10^k≡1 mod 9n, (10^(2k+1)−1)/9−10^k is 0 mod n; this is k ones, one 0, then k ones. |
| CND-0021 | KILLED_FALSE/DEGENERATE | The four-square T tetromino has one central square adjacent to three isolated tips: at most one tip can be paired to centre. |
| CND-0023 | KILLED_FALSE/DEGENERATE | The two diagonally opposite cells have equal checkerboard colour, so the remaining colours are unbalanced. |
| CND-0024 | KILLED_KNOWN | Special case of Gomory's opposite-colour deletion theorem, which is already proved. |
| CND-0025 | KILLED_EASY | Remove an outer width-one ring (perimeter 4(n−1) even and tileable around the cycle), reduce n to n−2; base n=1. |
| CND-0026 | KILLED_KNOWN | Constructive proof in Math Stack Exchange for odd-by-odd rectangles; exact n×n subcase. |
| CND-0027 | KILLED_KNOWN | Gomory's theorem; a Hamiltonian cycle on the grid leaves even-length paths when oppositely coloured cells are removed. |
| CND-0028 | KILLED_FALSE/DEGENERATE | Choose two cells of the same checkerboard colour. |
| CND-0029 | KILLED_FALSE/DEGENERATE | For n=3, remaining six cells split into two components of three cells, so neither has a domino tiling. |
| CND-0030 | KILLED_EASY | If a tiling exists then 3 divides n² and hence n; if 3 divides n, tile each row in triples. |
| CND-0031 | KILLED_FALSE/DEGENERATE | The two edge-disjoint Hamiltonian paths covering K4 share no adjacent pair. |
| CND-0032 | KILLED_FALSE/DEGENERATE | The identity and its reverse have longest common subsequence length one. |
| CND-0033 | KILLED_EQUIVALENT | This is exactly CND-0031 after replacing 'adjacent' by 'contiguous pair'. |
| CND-0034 | KILLED_EASY | Resolve one cycle of length l by l−1 swaps; the sum over cycles is n−number_of_cycles≤n−1. |
| CND-0035 | KILLED_FALSE/DEGENERATE | Even and odd positions never exchange occupants; swapping positions 1 and 2 initially is not reversible by allowed moves. |
| CND-0036 | KILLED_EASY | Reversing two cards swaps an adjacent pair, and adjacent swaps sort any permutation. |
| CND-0037 | KILLED_EASY | Proof in sessions/S002/MATHEMATICS.md: union of two paths is 3-degenerate, hence four-colourable; matching K4-block constructions attain ceil(n/4). Not claimed novel. |
| CND-0039 | KILLED_FALSE/DEGENERATE | n=4 K4 union of two paths permits only one selected name, but ceil(4/3)=2. |
| CND-0041 | KILLED_EASY | Prefix sums modulo n: zero prefix or two equal prefix residues give a nonempty consecutive block. |
| CND-0042 | KILLED_EASY | Partition by odd part: n chains indexed by odd numbers ≤2n; pigeonhole gives a pair in one chain. |
| CND-0043 | KILLED_EASY | The n complementary pairs {i,2n+1−i} are disjoint; pigeonhole. |
| CND-0044 | KILLED_FALSE/DEGENERATE | Choose A={n+1,...,2n}; two chosen numbers add to more than 2n. |
| CND-0045 | KILLED_FALSE/DEGENERATE | For n=2, A={1,2} has distinct subset sums 0,1,2,3. |
| CND-0046 | KILLED_FALSE/DEGENERATE | At n=3 the set {1,2,4}⊂{1,...,6} has no three-term progression. |
| CND-0047 | KILLED_EASY | The first three consecutive numbers already form a progression. |
| CND-0048 | KILLED_FALSE/DEGENERATE | Powers {1,2,4,...,2^(n−1)} have distinct subset sums by binary representation. |
| CND-0049 | KILLED_FALSE/DEGENERATE | At n=5 the set {1,2,3,5,8} has all ten unordered distinct pair sums different. |

## S003 permanent kill additions (2026-10-13)

| Candidate | Kill status | Concrete evidence |
|---|---|---|
| CND-0017 | KILLED_EASY | For k>=0, the palindrome P_k=11...121...11 with k flanking ones equals ((10^(k+1)-1)(10^k+1))/9. Since gcd(10,9n)=1, take k+1=ord_(9n)(10): 9n divides 10^(k+1)-1, so n divides P_k. All n>=1 coprime to 10 covered, including n=1 (k=0). |
| CND-0022 | KILLED_FALSE/DEGENERATE | Eight cells: (-1,0),(0,0),(1,0),(2,0),(3,0),(4,0),(0,1),(3,-1). Connected, simply connected (no hole), 4 black/4 white. Cells (-1,0),(0,1) each have sole neighbour (0,0), so both cannot be matched by dominoes. Explicit counterexample. |
| CND-0038 | KILLED_EASY | Union of three Hamiltonian paths is 5-degenerate, hence six-colourable. For sharpness K6 has three edge-disjoint paths 0-5-1-4-2-3, 1-0-2-5-3-4 and 2-1-3-0-4-5. Concatenate path orders in size<=6 blocks; restricting a K6 path to fewer vertices retains all covered adjacencies. Therefore f3(n)=ceil(n/6) for all n. |
| CND-0040 | KILLED_FALSE/DEGENERATE | For n=5 prescribe v and take orders a-v-b-c-d and c-v-d-a-b. Then v is adjacent in one order or the other to every other label, so any permitted set containing v has size 1 whereas ceil(5/4)=2. |
| CND-0050 | KILLED_EQUIVALENT | Writing w(N) for the maximum subset of [1,N] with no equal sums from two distinct unordered pairs, s(n)=w(2n)+1. Shared endpoints in equal pair sums force identical pairs, so this is exactly weak Sidon extremality. OEIS A039836 defines w(N) with identical quantifiers; no new question was isolated, and no closed-form for w(N) is asserted. |

Final counts: 50 KILLED, 0 TRIAGED, 0 SURVIVING. Proof and source limits in sessions/S003.

## S004 permanent new kills (detailed proofs in sessions/S004/MATHEMATICS.md)

| ID | Status | Decisive reason |
|---|---|---|
| CND-0051 | KILLED_FALSE/DEGENERATE | The 5-cycle C5 is triangle-free, connected and 2-regular, yet has only one cycle. |
| CND-0052 | KILLED_EASY | A bridge would create a component with odd total degree (its one exiting edge); hence no bridge exists. Any nonbridge edge lies on a cycle. |
| CND-0053 | KILLED_KNOWN | Add an edge between the two odd-degree vertices to get all-even degrees; Euler circuit exists and removing added edge gives the required trail. |
| CND-0054 | KILLED_EASY | Positions divisible by 3 are losing: any move leaves remainder 1 or 2, and the opponent can restore a multiple of 3; all other positions move to such a multiple. |
| CND-0055 | KILLED_FALSE/DEGENERATE | For {1,2,5}, the possible first differences give final values 4 (merge 1,2), 2 (merge 1,5), or 2 (merge 2,5), never 0. |
| CND-0056 | KILLED_EASY | Termination is by decreasing length by 2. Two redexes either are disjoint and commute or overlap in 000/111 and both choices leave the same letter; induction on remaining length gives unique irreducible normal form. |
| CND-0057 | KILLED_KNOWN | Exactly the classical arbitrarily long abelian-square theorem of Entringer, Jackson and Schatz (1974); direct authors' paper statement inspected in a public text reproduction. |
| CND-0058 | KILLED_KNOWN | Rao and Rosenfeld (2015) state that no infinite binary word avoids abelian cubes of period >=2; binary Parikh equality equals equality of ones counts. |
| CND-0059 | KILLED_EASY | Each move preserves each row and column parity. Conversely clear positions (i,j), i<m,j<n, lexicographically using a flip based at (i,j) iff its bit is 1; the last row and column vanish by the parity constraints. |
| CND-0060 | KILLED_FALSE/DEGENERATE | The 2-by-2 board with top row 11 and bottom row 00 has even total 2 but each column has odd parity, preserved by every allowed flip. |
| CND-0061 | KILLED_KNOWN | Greenfield and Greenfield (1998) established this; standard Bertrand-postulate induction explicitly inspected in secondary exposition; OEIS A000341 enumerates such pairings. |
| CND-0062 | KILLED_FALSE/DEGENERATE | Already directly posed and answered on Math.SE in 2018; n=7 impossible because sum 1+...+14=105, whereas the seven largest distinct eligible odd primes <=27 total only 95. |
| CND-0063 | KILLED_KNOWN | Known geometric matching theorem (Kano 2002 presentation). Independent short proof: choose a red-blue perfect matching minimizing total Euclidean length; any crossing edges can be uncrossed by swapping blue endpoints to strictly reduce length. |
| CND-0064 | KILLED_EASY | Bertrand induction picks p in (2n,4n) and pairs a=p-2n with 2n, a+1 with 2n-1, etc. These chords are nested and do not cross; induct on the disjoint smaller prefix [1,a-1]. |
| CND-0065 | KILLED_FALSE/DEGENERATE | The five-vertex star K1,4 refutes it: any centre label c in {1,2,3,4,5} forces four prime sums with other labels, but c=1,2,3,4,5 respectively gives composite sums 4,6,4,6,6. |


## S005 permanent eliminations

- CND-0066 [KILLED_FALSE/DEGENERATE]: q=3, AABBCC: only a cut after position 3 gives two blocks of length 3; AAB and BCC are not rainbow.
- CND-0067 [KILLED_KNOWN]: Classical Goldberg–West two-person necklace-splitting theorem directly stated in Simonyi 2008.
- CND-0069 [KILLED_KNOWN]: Sjöstrand's 2005 cover pebbling theorem provides this exact stacking maximum.
- CND-0070 [KILLED_FALSE/DEGENERATE]: (5,0,0) cannot cover path P3: from the left endpoint, costs 1+2+4=7.
- CND-0071 [KILLED_FALSE/DEGENERATE]: 2x3 rectangle contains a 2x2 subblock: four panel corners share an interior planar vertex, but only three distinct cube faces meet at any cube vertex.
- CND-0072 [KILLED_KNOWN]: Esther Klein's five-point convex quadrilateral theorem, the Erdős–Szekeres base case.
- CND-0073 [KILLED_KNOWN]: Classical art gallery theorem; Fisk's 3-colouring of triangulations gives floor(n/3) guards.
- CND-0074 [KILLED_EASY]: A vertex of maximum outdegree is a 2-king.
- CND-0075 [KILLED_KNOWN]: de Bruijn sequence; Euler circuit of (k-1)-block overlap digraph constructs it.
- CND-0076 [KILLED_KNOWN]: Exactly Dilworth's theorem, directly recorded in MathWorld.
- CND-0077 [KILLED_KNOWN]: Classical order-independent abelian sandpile stabilization, directly stated in Sage tutorial.
- CND-0078 [KILLED_EASY]: Factor n=l(2a+l-1)/2; any representation forces odd factor >1. Conversely an odd divisor >1 yields a positive-length interval of >=2 summands.
- CND-0079 [KILLED_EASY]: Bipartite parity forbids odd mn; for an even side reserve a border column and snake through other columns, returning on the border.
- CND-0081 [KILLED_KNOWN]: Exactly Robbins's strong-orientation theorem; related publisher source states theorem.
Two other S005 cases (CND-0068, CND-0080) remain TRIAGED, not killed or hard.


## S006 permanent kill additions — 2026-10-13
- **CND-0068 KILLED_EASY**: independent fair orientations for two occurrences per symbol; distinct adjacent symbols => each ownership boundary flips with probability 1/2; expectation q−1/2, so some integer assignment <=q−1 cuts. CLM-0038.
- **CND-0080 KILLED_FALSE/DEGENERATE**: n=6 polygon (0,10),(-2,0),(-1,3),(0,4),(1,3),(2,0), all nonconsecutive lower-chain chords exterior, unique apex fan loads apex with 4 triangles >ceil(6/2)=3. CLM-0039.
- **CND-0082 KILLED_FALSE/DEGENERATE**: C5 spanning tree path, missing-edge endpoints have distance 4 versus graph distance 1, fails additive one. CLM-0040.
- **CND-0083 KILLED_KNOWN**: interval graph greedy colouring in number of colours equal maximum point overlap; exact familiar theorem, SRC-0038 CLM-0041.
- **CND-0084 KILLED_KNOWN**: 2n−1 strictly increasing sumset chain of sorted integers; 2026 journal editorial confirms exact result, SRC-0039 CLM-0042.
Final cumulative 84/84 KILLED, 0 TRIAGED, 0 SURVIVING, 0 HARD.

## S007 permanent elimination records (2026-10-13)

- **CND-0085**: inconsistent 3+4+6 mod12 clock triangle; permanent KILLED; corresponding CLM/proof in S007 MATHEMATICS.md.
- **CND-0086**: standard cycle-sum/potential equivalence; permanent KILLED; corresponding CLM/proof in S007 MATHEMATICS.md.
- **CND-0087**: classical finitely branching König lemma; permanent KILLED; corresponding CLM/proof in S007 MATHEMATICS.md.
- **CND-0088**: finite-union infinite pigeonhole; permanent KILLED; corresponding CLM/proof in S007 MATHEMATICS.md.
- **CND-0089**: L1 diamond circumference/diameter=4; permanent KILLED; corresponding CLM/proof in S007 MATHEMATICS.md.
- **CND-0090**: Gołąb normed plane circumference bound already known; permanent KILLED; corresponding CLM/proof in S007 MATHEMATICS.md.
- **CND-0091**: C4 phase ring mod3 impossibility; permanent KILLED; corresponding CLM/proof in S007 MATHEMATICS.md.
- **CND-0092**: ordinary least common multiple; permanent KILLED; corresponding CLM/proof in S007 MATHEMATICS.md.
- **CND-0093**: 0x=0 forbids 0x=1; permanent KILLED; corresponding CLM/proof in S007 MATHEMATICS.md.
- **CND-0094**: known zero-totalised meadow arithmetic; permanent KILLED; corresponding CLM/proof in S007 MATHEMATICS.md.
- **CND-0095**: divergent harmonic series; permanent KILLED; corresponding CLM/proof in S007 MATHEMATICS.md.
- **CND-0096**: unequal iterated limits 0 and1; permanent KILLED; corresponding CLM/proof in S007 MATHEMATICS.md.
- **CND-0097**: infinitely branching finite countdown tree; permanent KILLED; corresponding CLM/proof in S007 MATHEMATICS.md.
- **CND-0098**: strict equation-by-equation equivalence to clock model; permanent KILLED; corresponding CLM/proof in S007 MATHEMATICS.md.
- **CND-0099**: staircase length2 vs diagonal sqrt2; permanent KILLED; corresponding CLM/proof in S007 MATHEMATICS.md.
- **CND-0100**: x/x vs x²/x limits incompatible; permanent KILLED; corresponding CLM/proof in S007 MATHEMATICS.md.
- **CND-0101**: exact closed grid minimum ceil(2(n−1)²/3), face count/trominoes; permanent KILLED; corresponding CLM/proof in S007 MATHEMATICS.md.

**Final: 101/101 KILLED; 0 TRIAGED/SURVIVING/HARD.**

## S008 negative results and unfinished gates — 2026-10-13

- CND-0102 checkerboard-looking complexity evaporates: exact ceil(m²/2), lower face count and explicit domino upper; KILLED_EASY.
- CND-0103 arbitrary flux repair is precisely MAX-2-LIN in both directions; dual connected partition not a separate new problem. CND-0104 affine drift just two static cycle constraints.
- CND-0105 two forced terminal phases exactly min-cut; CND-0106 three phases exactly multiway cut and general NP-hardness DOES NOT license planar/grid hardness (SRC-0055).
- CND-0107 directed triangle never synchronizes under synchronous one-ahead chase; CND-0108 finite periodic scheduler gives only trivial eventual periodicity; CND-0110 row threshold is elementary Riemann sum.
- CND-0109 one-flipped checkerboard remains GENERATED, no two failed rigorous attacks, no independent hardness support, native deep novelty incomplete; not a solved/open/hard assertion.
- Actual checkout git remote failed DNS 'Could not resolve host: github.com'; Python local checker/unittest NOT_RUN; hosted governance CI only. No CAM-0003, no retroactive experiment.

## S009 — 2026-10-13
- F-S009-1: Interior original-majority defective face on odd m is **unresolved** above the lower bound (m²+3)/2. Naive opposite-signed dominoes fail at defect. Local 3-cell zero-charge block leaves unmatched bipartite count +2; attaching to an artificial subgrid exterior is invalid when the subgrid is embedded. Need a global construction or counterexample.
- F-S009-2: CAM-0003 actual runtime interrupted at 37/54 status0 finite MILPs, 17 planned instances NOT run; planned final JSON never written (source has an additional potential NumPy JSON serialisation defect). Preserve raw transcription of stdout only, no retry.
- F-S009-3: `git ls-remote` / full actual checkout blocked: `Could not resolve host: github.com`; local checker/unittests on actual repository checkout NOT_RUN. Later hosted governance checks assess FORMAT not mathematical claims.
- F-S009-4: Native deep two-pass OEIS / arXiv full corpus / MO-MSE / books / AMM-MM / OPG-Erdos searches incomplete/UNKNOWN, not false zero results. Z2 signed planar results not equivalent to Z3.


## S010 — 2026-10-13
- F-S010-1 / **PERMANENT CLOSE** of S009 F-S009-1: the odd-majority interior grid case is NOT unresolved. Explicit universal horizontal triple + two genuine exterior boundary monomers + dominoes reaches (m²+3)/2 for both i,j odd and i,j even (CLM-0071). It is KILLED_EASY, not a new difficult question. Retain historical S009 failure text unchanged for provenance.
- F-S010-2 / **CORRECTION**: S009 even-case supposed sharp configuration said 'exterior singleton'; the correct sharp configuration has 0 original cells assigned to exterior; otherwise 2×(F/2) bounded cells would exceed F. No change to the even-grid exact optimum.
- F-S010-3 / **UNRESOLVED PRIORITY**: exact historical novelty and complete source-native literature coverage not established; indexing gap UNKNOWN. This has no effect on the easy-kill decision.
- F-S010-4 / **NO NEW CAM**: CAM-0003 stays FAILED/PARTIAL at 37 of 54, original script's possible NumPy serialisation issue retained; nothing silently rerun.
- F-S010-5 / **RUNTIME BLOCKER**: true checkout inaccessible due to DNS failure for github.com, so local checker and unittest NOT_RUN. Hosted format CI (if it runs) must not be labelled mathematical verification.

## S011 permanent kills — 2026-10-13
- CND-0111 KILLED_EQUIVALENT: The two flashes are simultaneous precisely when t≡a mod m and t≡b mod n for a in A, b in B. The Chinese remainder theorem gives a solution, and the reverse implication is automatic. CLM-0072.
- CND-0112 KILLED_FALSE/DEGENERATE: For a_j=3^j, every time-t row has entries 2^t*3^j, integers, although the original row is not constant. CLM-0073.
- CND-0113 KILLED_EASY: Equal perimeter gives s=πr/2; equal area gives πr²=π²r²/4, forcing π=4, impossible. CLM-0074.
- CND-0114 KILLED_EASY: A full straight rectangle side would have to be covered by finitely many circle boundaries, each meeting its supporting line in at most two points; impossible. CLM-0075.
- CND-0115 KILLED_KNOWN: OEIS A171746 (2010) encodes the exact first positive square-hitting iteration; a 2022 mathematical note poses the same question. An elementary square-offset descent gives a proof. CLM-0076.
Total 115/115 killed.

## S012 permanent four-way kills
- CND-0116 KILLED_KNOWN: square-triangular minutes = Pell solutions = exact OEIS A001110; CLM-0077.
- CND-0117 KILLED_EASY: integer-radius circle has 4+8k lattice points, never eight; CLM-0078.
- CND-0118 KILLED_KNOWN: undirected synchronous tie-hold majority embeds symmetric binary thresholds with diagonal weight1 and offdiagonal2; Goles–Olivos 1980 abstract says eventual period <=2; CLM-0079 (source abstract, not proof).
- CND-0119 KILLED_FALSE/DEGENERATE: a_n=sum_{k≤n}ceil(log2(k+1)) has gaps →∞ but reciprocal series diverges via dyadic block harmonic lower bound; CLM-0080.
- Access: native OEIS term/keyword full queries and other required original literature searches UNKNOWN; local true checkout blocked DNS. No mathematical CAM-0004; CAM-0003 remains FAILED/PARTIAL 37/54.

## S013 — source-first symbolic kills / persistent blockers (2026-10-14)
- CND-0120: simultaneous consecutive squared lattice distances obstructed by parity and sum-of-two-squares mod4, independently determinant mod3.
- CND-0121: summable reciprocals of gaps force a_n=Ω(n²), so divergent term reciprocals impossible (Cauchy-Schwarz).
- CND-0122: 2014 MathOverflow already poses six consecutive distances among four points and gives collinear-only response; programme does not reproduce complete Cayley-Menger case elimination.
- CND-0123: positive integer arc and chord on integer-radius circle forbidden by classical Lindemann theorem, though independent theorem proof not inspected.
- CND-0124: explicit infinite Pell construction places consecutive-sided triangles AND incentres on integer lattice; prior source covers general Heronian lattice embedding, exact incenter novelty not cleared.
- No candidate passes hardness/novelty gates. No numeric search; CAM-0004 absent. Checkout DNS unresolved; real local test commands NOT_RUN. Protection 403 UNKNOWN, status checks zero means ABSENT_NOT_PASS; Actions CI is record-format only.


## S014 — 2026-10-14

FAL-0056:Raw nearest-two simple-quadrilateral narrative fails at P=(12,2). FAL-0057:Interior convexity does not imply adjacency (0125). FAL-0058:Exact safe-region existence is easy (0126). FAL-0059:Linear total crossings fails;Θ(n²) bad-order construction (0127). FAL-0060:Lex sweep and arbitrary extreme reinsertion do not settle0128;native priority and independent hardness still absent. No survivor declared.

## S015 — 2026-10-14

- CND-0128 exact false universal. Convex six-point witness destroys every possible final vertex via hull-ear necessity. No proposal of novelty, open status or minimal size.
- CAM-0005 **FAILED**: program erroneously included the queried vertex as its own nearest neighbour; the reported four-point no-ear was false and its own DFS returned a valid order. Do not reuse for any result. Frozen prereg/source/raw retained.
- Two independent proof strategies not needed after decisive kill. Source-native coverage remains UNKNOWN in inaccessible archives. CAM-0003 still FAILED/PARTIAL 37/54.

## S016 — 2026-10-14
- **CND-0129 KILLED_EASY:** circular angular-gap minimisation identifies recursively removable nearest-two hull ears, solving the school-readable question. Elementary proof, not new open problem.
- **CND-0130 KILLED_EASY:** all n<=4 plane NG orderable; exact 5-site rational ellipse witness blocks every order. Minimum5 proved, so no unsolved target here.
- **CND-0131 GENERATED ONLY:** cannot extrapolate ellipse 5:1 obstruction to all eccentricities; cannot transport chord-nearest rule under nonuniform affine stretch. Circle proof and finite screens insufficient for a general classification. Native priority and independent difficulty evidence absent; no hard/open label.
- **Archival and local-validation blockers:** original CAM8/9 frozen files are a detached downloadable archive, not GitHub; full-checkout test commands NOT_RUN locally because Github DNS failed. Historical CAM-0003/0005 failures retained.


## S017 — 2026-10-14
- F-S017-1: Global CND-0131 classification unresolved; the gap-stability CLM100 is nonuniform as δ->0 and cannot imply a universal near-circle eccentricity interval.
- F-S017-2: CAM-0010 apparent near-round no-ear configurations have duplicate/effectively equal angles and signed margins order10^-31. Do NOT cite as valid counterexamples. Float optimisation cannot replace exact rational geometry.
- F-S017-3: Original frozen S016 CAM8/9 archive absent from GitHub and not available in this new session; no silent replacements, all six original hashes in manifest unchanged.
- F-S017-4: git ls-remote DNS unresolved; actual checkout local checker/unittests NOT_RUN. Hosted format checks may pass but are not mathematical validation.
- F-S017-5: Native novelty two-pass and independent hardness for CND-0131 remain incomplete/UNKNOWN; no claim of open problem.

## S018 — 2026-10-14
- F-S018-1: Global CND-0131 still **NOT RESOLVED**; CLM-0103 quantifies `forall n exists epsilon_n`, not `exists epsilon forall n`. No global universal interval or circle-only theorem asserted.
- F-S018-2: Short-arc theorem CLM-0102 has strict width <4 arctan(b/a), no claim threshold sharp and no assertion for wraparound full ellipse point sets.
- F-S018-3: No explicit constructive epsilon_n or lower bound for minimum counterexample size as a function of r; existence of a bad set at every noncircular r not shown. Fixed five/six witness family approaching r=1 precluded by CLM-0103.
- F-S018-4: Native external priority and independent research-hardness still incomplete/UNKNOWN; zero TRIAGED/SURVIVING; old false/failed CAM not rehabilitated.
- F-S018-5: S016 CAM8/9 original six-file archive remains detached/unhosted; true local Git checkout and checker/tests NOT_RUN due DNS. Hosted CI if observed is record-format only.


## S019 — 2026-10-14
- F-S019-1: No explicit epsilon_n, n-dependent bound or uniform safe eccentricity from the symbolic CAD termination argument; procedure not executed.
- F-S019-2: Fixed-n Q-semialgebraicity gives no semialgebraic description of the COUNTABLE all-n union. Global CND-0131 unresolved.
- F-S019-3: Small gaps chain into long clusters; opposite-direction chord comparisons and nearly antipodal two-support groups stop naive gap-free global proof. No exact n(r) family.
- F-S019-4: Native two-pass and independent difficulty remain UNKNOWN; no originality claim. Original CAM8/9 not hosted, CAM3/5 failures and CAM10 1e-31 numerical pseudo-witness untouched.
- F-S019-5: Real git clone GitHub DNS failure; local true-checkout checker/unittests NOT_RUN. Hosted validation checks formats only.
