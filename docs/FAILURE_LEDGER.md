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
