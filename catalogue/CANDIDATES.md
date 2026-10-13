# CANDIDATES registry — S003

Machine-readable detail, historical six-test battery plus S003 proof-first audit, and exact scores are in CANDIDATES.json. **Scores never certify mathematical hardness or novelty**.

| ID | status | score/100 | novice-facing problem | outcome |
|---|---|---:|---|---|
| CND-0001 | KILLED_FALSE/DEGENERATE | 49 | Can two trees on the same dots always be coloured together using only three colours? | K4 is the union of paths 1-2-3-4 and 3-1-4-2; it needs four colours. |
| CND-0002 | KILLED_EASY | 49 | Can we always colour two superimposed trees with four colours? | Take a 2-colouring of each tree; the ordered pair of colours is a proper 4-colouring. |
| CND-0003 | KILLED_FALSE/DEGENERATE | 49 | Do two lists always share a valid three-colour labelling? | The two K4 paths given for CND-0001 prevent three colours. |
| CND-0004 | KILLED_FALSE/DEGENERATE | 49 | Do two trees always have a common end vertex? | Paths 1-2-3-4 and 2-1-4-3 have leaf sets {1,4} and {2,3}. |
| CND-0005 | KILLED_FALSE/DEGENERATE | 49 | Can you always choose two dots with no edge between them in either tree? | The two paths covering K4 from CND-0001 make every pair adjacent somewhere. |
| CND-0006 | KILLED_EASY | 51 | How many dots can we pick so none are joined in either tree? | Four-colour the union by pairs of tree bipartitions; the largest colour class has at least ceil(n/4). K4 demonstrates sharpness at n=4. |
| CND-0007 | KILLED_FALSE/DEGENERATE | 49 | Can combined trees always be coloured with four equally large colour groups? | Two identical stars on n=8: the universal centre must have a singleton colour class, inconsistent with four groups of size 2. |
| CND-0008 | KILLED_FALSE/DEGENERATE | 51 | If two lists never place the same pair together, do three colours suffice? | K4 decomposes into the two edge-disjoint Hamiltonian paths in CND-0001. |
| CND-0009 | KILLED_EASY | 49 | Can we pair everyone using neighbouring names from either of two lists? | Use consecutive disjoint pairs along the first path: (1,2),(3,4),... . |
| CND-0010 | KILLED_EASY | 49 | Overlay two lists of the same names; is their neighbour graph connected? | The first Hamiltonian path already connects every vertex. |
| CND-0011 | KILLED_EASY | 49 | Can every number not divisible by 2 or 5 divide some all-ones number? | Pigeonhole n repunit remainders: a zero remainder or a difference with digits 1 then 0; because 10 is invertible, zero occurs. |
| CND-0012 | KILLED_EASY | 49 | Can we make a multiple from repeated 12 blocks? | The number 12(100^k−1)/99 is divisible by n if 100^k≡1 (mod 99n), which occurs for n coprime to 10. |
| CND-0013 | KILLED_EASY | 49 | Can every number have a multiple written using only zeros and ones? | Write n=2^a5^b m with gcd(m,10)=1; choose an all-ones multiple of m, then append at least max(a,b) zeros. |
| CND-0014 | KILLED_EASY | 49 | Can we make a multiple with exactly as many 0 digits as 1 digits? | Choose an all-ones multiple of the coprime-to-10 factor with length k≥max(v2(n),v5(n)); append exactly k zeros. |
| CND-0015 | KILLED_FALSE/DEGENERATE | 49 | Can every number have a multiple written using no digits other than 1 and 2? | Take n=5: a multiple of 5 cannot end in 1 or 2. |
| CND-0016 | KILLED_EASY | 49 | Does every number not divisible by 2 or 5 divide a number reading the same backwards? | An all-ones repunit multiple from CND-0011 is palindromic. |
| CND-0017 | KILLED_EASY | 58 | Can every number not ending in an even digit or 5 divide a palindrome of ones with a single middle 2? | For k>=0, the palindrome P_k=11...121...11 with k flanking ones equals ((10^(k+1)-1)(10^k+1))/9. Since gcd(10,9n)=1, take k+1=ord_(9n)(10): 9n divides 10^(k+1)-1, so n divides P_k. All n>=1 coprime to 10 covered, including n=1 (k=0). |
| CND-0018 | KILLED_FALSE/DEGENERATE | 49 | Can every odd number divide an alternating 101...101 number? | n=5, since all such numbers end in 1. |
| CND-0019 | KILLED_KNOWN | 51 | Does every number not divisible by 2 or 5 divide some 101...101 number? | OEIS A343447 records smallest such alternating multiples for integers coprime with 10, with multiplicative-order formula. |
| CND-0020 | KILLED_EASY | 49 | Can every number not divisible by 2 or 5 divide a palindrome of ones with a single middle 0? | For 10^k≡1 mod 9n, (10^(2k+1)−1)/9−10^k is 0 mod n; this is k ones, one 0, then k ones. |
| CND-0021 | KILLED_FALSE/DEGENERATE | 49 | Can every connected shape of even many grid squares be covered by dominoes? | The four-square T tetromino has one central square adjacent to three isolated tips: at most one tip can be paired to centre. |
| CND-0022 | KILLED_FALSE/DEGENERATE | 58 | Is equal black-white balance enough to tile a hole-free grid shape? | Eight cells: (-1,0),(0,0),(1,0),(2,0),(3,0),(4,0),(0,1),(3,-1). Connected, simply connected (no hole), 4 black/4 white. Cells (-1,0),(0,1) each have sole neighbour (0,0), so both cannot be matched by dominoes. Explicit counterexample. |
| CND-0023 | KILLED_FALSE/DEGENERATE | 49 | If we remove opposite corners of an even-sided rectangle, can dominoes fill the rest? | The two diagonally opposite cells have equal checkerboard colour, so the remaining colours are unbalanced. |
| CND-0024 | KILLED_KNOWN | 51 | If we remove a domino-shaped pair of squares from an even rectangle, can we always tile the rest? | Special case of Gomory's opposite-colour deletion theorem, which is already proved. |
| CND-0025 | KILLED_EASY | 49 | Can an odd square board be tiled after removing the middle square? | Remove an outer width-one ring (perimeter 4(n−1) even and tileable around the cycle), reduce n to n−2; base n=1. |
| CND-0026 | KILLED_KNOWN | 51 | On an odd chessboard, does deleting any square of the more common colour allow a domino tiling? | Constructive proof in Math Stack Exchange for odd-by-odd rectangles; exact n×n subcase. |
| CND-0027 | KILLED_KNOWN | 51 | On an even chessboard, can any differently coloured pair of holes be accommodated? | Gomory's theorem; a Hamiltonian cycle on the grid leaves even-length paths when oppositely coloured cells are removed. |
| CND-0028 | KILLED_FALSE/DEGENERATE | 49 | If two cells are removed, can dominoes always cover the rest of an even board? | Choose two cells of the same checkerboard colour. |
| CND-0029 | KILLED_FALSE/DEGENERATE | 49 | Can we tile an odd board with the long diagonal cut out? | For n=3, remaining six cells split into two components of three cells, so neither has a domino tiling. |
| CND-0030 | KILLED_EASY | 49 | When do three-square straight blocks tile a square board? | If a tiling exists then 3 divides n² and hence n; if 3 divides n, tile each row in triples. |
| CND-0031 | KILLED_FALSE/DEGENERATE | 49 | Must two orders of four or more names have at least one neighbouring pair in common? | The two edge-disjoint Hamiltonian paths covering K4 share no adjacent pair. |
| CND-0032 | KILLED_FALSE/DEGENERATE | 49 | Must two lists have a long group of names in exactly the same order? | The identity and its reverse have longest common subsequence length one. |
| CND-0033 | KILLED_EQUIVALENT | 49 | Must two lists share at least one pair of neighbours, regardless of direction? | This is exactly CND-0031 after replacing 'adjacent' by 'contiguous pair'. |
| CND-0034 | KILLED_EASY | 49 | Can you sort n different cards in at most n−1 swaps? | Resolve one cycle of length l by l−1 swaps; the sum over cycles is n−number_of_cycles≤n−1. |
| CND-0035 | KILLED_FALSE/DEGENERATE | 49 | Can we sort cards if each swap jumps over exactly one card? | Even and odd positions never exchange occupants; swapping positions 1 and 2 initially is not reversible by allowed moves. |
| CND-0036 | KILLED_EASY | 49 | Can we sort cards by flipping at most three neighbouring cards at a time? | Reversing two cards swaps an adjacent pair, and adjacent swaps sort any permutation. |
| CND-0037 | KILLED_EASY | 59 | In two lists of the same names, can we always choose a quarter (rounded up) with no chosen neighbours, and is this sharp? | Proof in sessions/S002/MATHEMATICS.md: union of two paths is 3-degenerate, hence four-colourable; matching K4-block constructions attain ceil(n/4). Not claimed novel. |
| CND-0038 | KILLED_EASY | 59 | If three lists have the same names, is one sixth (rounded up) always the best guaranteed choice with no neighbours in any list? | Union of three Hamiltonian paths is 5-degenerate, hence six-colourable. For sharpness K6 has three edge-disjoint paths 0-5-1-4-2-3, 1-0-2-5-3-4 and 2-1-3-0-4-5. Concatenate path orders in size<=6 blocks; restricting a K6 path to fewer vertices retains all covered adjacencies. Therefore f3(n)=ceil(n/6) for all n. |
| CND-0039 | KILLED_FALSE/DEGENERATE | 49 | Can we always pick a third of the names with no neighbours in either order? | n=4 K4 union of two paths permits only one selected name, but ceil(4/3)=2. |
| CND-0040 | KILLED_FALSE/DEGENERATE | 58 | If one name is compulsory, can we still pick the same quarter-sized set? | For n=5 prescribe v and take orders a-v-b-c-d and c-v-d-a-b. Then v is adjacent in one order or the other to every other label, so any permitted set containing v has size 1 whereas ceil(5/4)=2. |
| CND-0041 | KILLED_EASY | 49 | Among n whole numbers, must some nonempty choice have a total divisible by n? | Prefix sums modulo n: zero prefix or two equal prefix residues give a nonempty consecutive block. |
| CND-0042 | KILLED_EASY | 49 | Choose more than half of 1 to 2n; must one chosen number divide another? | Partition by odd part: n chains indexed by odd numbers ≤2n; pigeonhole gives a pair in one chain. |
| CND-0043 | KILLED_EASY | 49 | Must more than half the numbers from 1 to 2n include two adding to 2n+1? | The n complementary pairs {i,2n+1−i} are disjoint; pigeonhole. |
| CND-0044 | KILLED_FALSE/DEGENERATE | 49 | Choose n numbers from 1 to 2n; must one be the sum of two other chosen numbers? | Choose A={n+1,...,2n}; two chosen numbers add to more than 2n. |
| CND-0045 | KILLED_FALSE/DEGENERATE | 49 | If you choose half the numbers up to 2n, must two choices have the same total? | For n=2, A={1,2} has distinct subset sums 0,1,2,3. |
| CND-0046 | KILLED_FALSE/DEGENERATE | 49 | Does choosing half the numbers always give three equally spaced numbers? | At n=3 the set {1,2,4}⊂{1,...,6} has no three-term progression. |
| CND-0047 | KILLED_EASY | 49 | Can you find three equally spaced numbers in any run of at least three integers? | The first three consecutive numbers already form a progression. |
| CND-0048 | KILLED_FALSE/DEGENERATE | 49 | Among n positive numbers, must two non-overlapping groups have the same total? | Powers {1,2,4,...,2^(n−1)} have distinct subset sums by binary representation. |
| CND-0049 | KILLED_FALSE/DEGENERATE | 49 | Does choosing half the numbers force two non-overlapping pairs with the same total? | At n=5 the set {1,2,3,5,8} has all ten unordered distinct pair sums different. |
| CND-0050 | KILLED_EQUIVALENT | 59 | How many numbers must we choose from 1 to 2n before two disjoint pairs are forced to have equal sums? | Writing w(N) for the maximum subset of [1,N] with no equal sums from two distinct unordered pairs, s(n)=w(2n)+1. Shared endpoints in equal pair sums force identical pairs, so this is exactly weak Sidon extremality. OEIS A039836 defines w(N) with identical quantifiers; no new question was isolated, and no closed-form for w(N) is asserted. |

## S003 status audit
All 50 candidates are now killed (four elementary proofs/counterexamples and one exact prior-art reformulation in S003); 0 TRIAGED and 0 SURVIVING. This does not certify exhaustion of the space of possible new problems. See sessions/S003/MATHEMATICS.md and NOVELTY_QUERIES.md.

## S004 fresh generation, proof-first screening (15; none survived)

| ID | Mechanism/domain | Question | Outcome |
|---|---|---|---|
| CND-0051 | MEC-03, graphs/cycles | Does every connected triangle-free graph with minimum degree two have two edge-disjoint cycles? | KILLED_FALSE/DEGENERATE |
| CND-0052 | MEC-08, graphs/cycles | In a connected graph where every dot has an even number of neighbours, does every edge belong to a loop? | KILLED_EASY |
| CND-0053 | MEC-07, graphs/routes | If a connected graph has exactly two odd-degree dots, can we trace every edge exactly once? | KILLED_KNOWN |
| CND-0054 | MEC-05, games/subtraction | Taking one or two stones each turn, when can the first player force the last move? | KILLED_EASY |
| CND-0055 | MEC-04, games/number-reduction | Replace two numbers by their absolute difference until one remains. Does even starting total guarantee zero? | KILLED_FALSE/DEGENERATE |
| CND-0056 | MEC-04, sequences/rewrite-game | Delete adjacent equal binary digits until none remain. Is the final string independent of deletion order? | KILLED_EASY |
| CND-0057 | MEC-07, sequences/binary-words | Must an infinite row of 0s and 1s contain arbitrarily long neighbouring blocks with equal numbers of 1s? | KILLED_KNOWN |
| CND-0058 | MEC-07, sequences/binary-words | Must an infinite row of 0s and 1s have three neighbouring equal-length blocks of length at least two with equal numbers of 1s? | KILLED_KNOWN |
| CND-0059 | MEC-08, grids/toggles | If every row and column of a black-white grid has even black squares, can 2-by-2 flips clear it? | KILLED_EASY |
| CND-0060 | MEC-02, grids/toggles | Is even total number of black squares enough to clear a board by flipping 2-by-2 squares? | KILLED_FALSE/DEGENERATE |
| CND-0061 | MEC-07, integers/prime-matching | Can the integers from 1 through 2n always be paired so each pair has a prime sum? | KILLED_KNOWN |
| CND-0062 | MEC-02, integers/prime-matching | Can those pairs always have different prime sums? | KILLED_FALSE/DEGENERATE |
| CND-0063 | MEC-03, geometry/planar-matching | Can any equal number of red and blue points be paired by uncrossed straight red-blue lines? | KILLED_KNOWN |
| CND-0064 | MEC-08, integers/geometric-matching | Put 1 through 2n around a circle. Can noncrossing pairs always have prime sums? | KILLED_EASY |
| CND-0065 | MEC-02, graphs/prime-labels | Can every tree be numbered 1 through its size so that every linked pair adds to a prime? | KILLED_FALSE/DEGENERATE |

All mathematical reasons/known-source cautions are in S004/MATHEMATICS.md and the JSON kill records. No candidate was promoted to SURVIVING or HARD.
