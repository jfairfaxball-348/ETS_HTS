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


## S005: 16 source-led structural questions (two unresolved TRIAGED)

| CND | Status | Question | Decisive screen |
|---|---|---|---|
| CND-0066 | KILLED_FALSE/DEGENERATE | One cut can share each of q doubled bead colours fairly | q=3, AABBCC: only a cut after position 3 gives two blocks of length 3; AAB and BCC are not rainbow. |
| CND-0067 | KILLED_KNOWN | At most q cuts always fairly share a two-person even-colour necklace | Classical Goldberg–West two-person necklace-splitting theorem directly stated in Simonyi 2008. |
| CND-0068 | KILLED_EASY | No identical neighbours: are q-1 cuts enough for double beads? | Expected cut count q−1/2 over fair independent choices, hence some <=q−1 (CLM-0038). |
| CND-0069 | KILLED_KNOWN | Worst pile placement for covering any connected graph is stacked | Sjöstrand's 2005 cover pebbling theorem provides this exact stacking maximum. |
| CND-0070 | KILLED_FALSE/DEGENERATE | Five pebbles always cover three vertices in a row | (5,0,0) cannot cover path P3: from the left endpoint, costs 1+2+4=7. |
| CND-0071 | KILLED_FALSE/DEGENERATE | Every six-square polyomino folds to a cube without overlap | 2x3 rectangle contains a 2x2 subblock: four panel corners share an interior planar vertex, but only three distinct cube faces meet at any cube vertex. |
| CND-0072 | KILLED_KNOWN | Five points always include four in convex position | Esther Klein's five-point convex quadrilateral theorem, the Erdős–Szekeres base case. |
| CND-0073 | KILLED_KNOWN | A third of a polygon's corners can guard its interior | Classical art gallery theorem; Fisk's 3-colouring of triangulations gives floor(n/3) guards. |
| CND-0074 | KILLED_EASY | Every round-robin tournament has a winner reachable within two wins | A vertex of maximum outdegree is a 2-king. |
| CND-0075 | KILLED_KNOWN | Circular binary string displaying every k-block once | de Bruijn sequence; Euler circuit of (k-1)-block overlap digraph constructs it. |
| CND-0076 | KILLED_KNOWN | Fewest chains partitioning a partially ordered set equal its width | Exactly Dilworth's theorem, directly recorded in MathWorld. |
| CND-0077 | KILLED_KNOWN | Sandpile stabilization unaffected by order of topplings | Classical order-independent abelian sandpile stabilization, directly stated in Sage tutorial. |
| CND-0078 | KILLED_EASY | Positive sums of consecutive integers characterize nonpowers of two | Factor n=l(2a+l-1)/2; any representation forces odd factor >1. Conversely an odd divisor >1 yields a positive-length interval of >=2 summands. |
| CND-0079 | KILLED_EASY | Rectangular grid has Hamiltonian cycle exactly when its area is even | Bipartite parity forbids odd mn; for an even side reserve a border column and snake through other columns, returning on the border. |
| CND-0080 | KILLED_FALSE/DEGENERATE | Can every polygon triangulation keep all vertex triangle loads at most half n? | Six-vertex concave-chain polygon has forced apex fan with 4 triangles, versus cap 3 (CLM-0039). |
| CND-0081 | KILLED_KNOWN | Can streets without bridges be directed for two-way reachability? | Exactly Robbins's strong-orientation theorem; related publisher source states theorem. |
| CND-0082 | KILLED_FALSE/DEGENERATE | Can every road network become a tree while making journeys at most one road longer? | C5: every spanning tree deletes one edge and becomes a 5-vertex path; endpoints of that edge have distance 1 in C5 but 4 in the tree. |
| CND-0083 | KILLED_KNOWN | Can appointments always use as many rooms as the largest simultaneous overlap? | Classical interval-graph colouring: in nondecreasing start order, a new interval intersects only previously coloured intervals containing its start; at most k-1 colours unavailable. |
| CND-0084 | KILLED_KNOWN | Do sums made from n distinct integers always give at least 2n−1 different totals? | For a1<...<an the chain a1+a1<...<a1+an<a2+an<...<an+an gives exactly 2n-1 distinct sums; already explicit in a 2026 published journal editorial. |

## S007: seventeen definitive kill-gate outcomes

| ID | Lane | Status | Question | Reason |
|---|---|---|---|---|
| CND-0085 | T | KILLED_FALSE/DEGENERATE | Do all pairwise time offsets on a triangle of 12-hour clocks admit simultaneous settings? | Offsets 3,4,6 sum to 13≡1(mod12), but vertex differences telescope to 0. |
| CND-0086 | T | KILLED_KNOWN | When do local clock comparisons around a graph agree globally? | Necessity telescopes; sufficiency integrates along root-to-vertex spanning-tree paths; cycle condition gives path independence, standard gain-graph balance. |
| CND-0087 | I | KILLED_KNOWN | Do arbitrarily long finite choices from two options force one endless valid choice sequence? | One child at each node must have arbitrarily long descendants; recursively choose it (König lemma). |
| CND-0088 | I | KILLED_EASY | Must a colour be used infinitely often when infinitely many numbers receive one of finitely many colours? | If every colour class were finite, their finite union would be finite, contradiction. |
| CND-0089 | P | KILLED_FALSE/DEGENERATE | Must the circumference-to-diameter ratio be π when distance is changed? | Taxicab diamond has four sides of norm-length 2, norm circumference 8, diameter 2, ratio 4. |
| CND-0090 | P | KILLED_KNOWN | Must every norm-circle have circumference between six and eight times its unit radius? | This is Gołąb's theorem, with hexagonal/parallelogram extremals; source secondary restatement inspected. |
| CND-0091 | B | KILLED_FALSE/DEGENERATE | Can each person in a clapping circle be one beat later than the previous person on a three-beat cycle? | Summation forces n≡0 mod3. C4 is false; if 3 divides n, set x_i=i mod3. |
| CND-0092 | B | KILLED_EASY | When do two regular pulse trains coincide again? | Common pulses are exactly positive multiples of both p and q. |
| CND-0093 | Z | KILLED_FALSE/DEGENERATE | Could one over zero be an ordinary real number? | 0x=0 for every real x, contradiction. |
| CND-0094 | Z | KILLED_KNOWN | Can division be given an output at zero without changing nonzero divisions? | Yes, known zero-totalised field/meadow; loses b(a/b)=a when b=0,a≠0. |
| CND-0095 | C | KILLED_FALSE/DEGENERATE | If terms shrink to zero, must their sum converge? | Harmonic 1/n tends to zero but dyadic grouping gives infinitely many blocks each of total at least 1/2. |
| CND-0096 | C | KILLED_FALSE/DEGENERATE | Do row-first and column-first limits always agree? | Taking n→∞ first yields 0; taking m→∞ first yields 1; matching known literature example. |
| CND-0097 | I+C | KILLED_FALSE/DEGENERATE | Do arbitrarily long finite decreasing countdowns force an infinite countdown? | Start arbitrarily high for finite length; an infinite decreasing sequence of nonnegative integers is impossible. Root has infinite branching. |
| CND-0098 | T+B | KILLED_EQUIVALENT | Are cyclic phase instructions on a graph a new condition beyond clock offsets? | Bidirectional bijection to CND-0086 clock variables/edge equations; same cycle telescoping and root integration for any k. |
| CND-0099 | P+C | KILLED_FALSE/DEGENERATE | Do paths approaching a straight diagonal always approach its length? | All staircase lengths are 2 though distance to diagonal is ≤1/(√2 N), so lengths do not approach √2. |
| CND-0100 | Z+C | KILLED_FALSE/DEGENERATE | Could one chosen 0/0 value make every vanishing fraction continuous? | The limits are 1 and 0 respectively: no common c. |
| CND-0101 | T+B | KILLED_EASY | How many mismatched clock comparisons must be erased from a grid whose every small square is one tick off? | Let F=(n−1)². Each retained bounded face must enclose area 0 mod3, hence there are ≤floor(F/3) bounded faces; each deletion reduces their number by ≤1, giving ≥ceil(2F/3). Partition square cells into trominoes plus at most one boundary corner for F mod3=1; delete two internal edges per triple and the corner outer edge if needed. This meets the bound. Full cases and proof in S007 MATHEMATICS. |

S007 17/17 killed, 101/101 cumulative; 0 TRIAGED or SURVIVING.

## S008 permanent candidate IDs

| ID | Status | Plain statement | Kill / current limit |
|---|---|---|---|
| CND-0102 | KILLED_EASY | If neighbouring squares are wrong by opposite ticks, how many clock-comparison lines must you erase? | Let F=m^2. Every retained bounded face must contain >=2 cells because every cell has flux +1 or -1. Thus at most floor(F/2) bounded faces remain, and at least ceil(F/2) edges must be deleted. Checkerboard adjacent dominoes have cancelling flux. For even m tile all m rows by horizontal dominoes; for odd m remove a corner cell into the exte |
| CND-0103 | KILLED_EQUIVALENT | Is erasing the fewest contradictory comparisons the same as satisfying as many comparisons as possible? | Given phases, erase exactly their violated edges, leaving a consistent graph, so deletion optimum <= minimum violation count. Given a consistent retained subgraph, use its vertex phases (one independent free origin per component, arbitrary values for isolated vertices); violated equations can occur only on deleted edges, so minimum violat |
| CND-0104 | KILLED_EQUIVALENT | Can a network keep two different clock speeds consistent forever if its initial offsets and speed differences each agree around loops? | At t=0 the cycle equation gives sum(a)=0. At t=1 minus t=0 gives sum(b)=0. Conversely integrate a and b independently along a spanning forest into vertex potentials u_v,w_v and set x_v(t)=u_v+t*w_v. Each component carries independent additive origins, isolated vertices arbitrary. A static cycle-balance problem duplicated twice; not a genu |
| CND-0105 | KILLED_EQUIVALENT | What is the fewest lines to sever so two clocks can insist on different readings? | Any retained s-t path forces equality of the two fixed phases, impossible. Hence every feasible deletion separates s and t, so at least a min s-t cut. Conversely remove a min s-t cut, put constant 0 on the component of s and constant 1 on the component of t, and arbitrary constants on all other components including isolated vertices. Equa |
| CND-0106 | KILLED_EQUIVALENT | If three distant clocks insist on different readings, what is the fewest connections to remove? | Any pair of distinct terminals remaining connected forces identical phases, impossible, so every feasible deletion is a multiway cut. Conversely each component after a multiway cut has at most one terminal: label its vertices by that terminal's prescribed phase, or arbitrarily if no terminal (including singleton components). Every retaine |
| CND-0107 | KILLED_FALSE/DEGENERATE | If a pulse clock chases a neighbour that is one tick ahead, do all connected groups eventually synchronize? | For the directed cycle v0->v1->v2->v0 start states (0,1,2). Every vertex sees the next value equal to its own+1 mod3. Therefore every vertex advances at every step and all three pairwise differences stay 1; after each step the pattern rotates modulo3 forever and never synchronizes. States, simultaneous schedule, stopping criterion (all eq |
| CND-0108 | KILLED_EASY | Can a finite collection of clocks following a repeating update schedule avoid ever entering a loop? | Augment the system state with t mod P. This has P*3^v distinct states, and the next augmented state is a deterministic function of the present one. Among the first P*3^v+1 observed states two coincide; deterministic continuation then repeats with cycle length <=P*3^v. This gives eventual periodicity, not synchronization; isolated vertices |
| CND-0109 | KILLED_EASY | In an alternating grid of faulty clock squares, what changes if exactly one square has the wrong sign? | S010 CLM-0071 closes all cells: even m D=m²/2+1; odd m majority interior D=(m²+3)/2; all other odd positions D=(m²+1)/2. Explicit T-triple + two exterior boundary cells + domino tiling, with component-count lower bound. Old CAM-0003 remains failed/partial 37/54. |
| CND-0110 | KILLED_EASY | As rows of positive fractions get longer but smaller, when do their totals vanish, stay finite, or blow up? | Rewrite A_n(p)=n^(1-p)*(1/n)*sum_(k=1)^n (1+k/n)^(-p). The parenthesized term is a Riemann sum converging to positive finite integral from 0 to1 of (1+x)^(-p) dx for every real p. Hence the row sum tends to 0 if p>1, diverges to +infinity if p<1, and tends to integral=log2 if p=1. The proposed threshold is elementary and closed. |

## S010 final disposition

CND-0109 permanently KILLED_EASY by CLM-0071 (S010 MATHEMATICS). Cumulative 110/110 KILLED; zero GENERATED, TRIAGED, SURVIVING or selected. No new CND, SRC, CAM or externally claimed priority. S009 partial solver transcript immutable.


## S011 — regenerated distinct questions, all killed
| ID | question | disposition | proof/killer |
|---|---|---|---|
| CND-0111 | If two clocks have coprime periods and each flashes at least once per cycle, must they flash together? | KILLED_EQUIVALENT | The two flashes are simultaneous precisely when t≡a mod m and t≡b mod n for a in A, b in B. The Chinese remainder theorem gives a solution, and the reverse implication is automatic. |
| CND-0112 | If endless averaging never produces fractions, was the infinite row constant at the start? | KILLED_FALSE/DEGENERATE | For a_j=3^j, every time-t row has entries 2^t*3^j, integers, although the original row is not constant. |
| CND-0113 | Can a circle and square use the same boundary length and enclose the same area? | KILLED_EASY | Equal perimeter gives s=πr/2; equal area gives πr²=π²r²/4, forcing π=4, impossible. |
| CND-0114 | Can finitely many round coins perfectly fill a rectangle, even along its sides? | KILLED_EASY | A full straight rectangle side would have to be covered by finitely many circle boundaries, each meeting its supporting line in at most two points; impossible. |
| CND-0115 | If you repeatedly add the whole-number part of a square root, will you eventually land on a square? | KILLED_KNOWN | OEIS A171746 (2010) encodes the exact first positive square-hitting iteration; a 2022 mathematical note poses the same question. An elementary square-offset descent gives a proof. |

Total 115/115 killed, none surviving or triaged. No CAM-0004.

## S012 — distinct schools of questions, all elementary or already known
| ID | Question | Status | Permanent kill |
|---|---|---|---|
| CND-0116 | One clock rings at square-numbered minutes, and the other at triangular-numbered minutes. Will they ring together infinitely often? | KILLED_KNOWN | Exact square-triangular numbers OEIS A001110. Pell recurrence supplies infinitely many times; classical, not a novel oscillator question. |
| CND-0117 | Can a circle of whole-number radius pass through exactly eight grid points? | KILLED_EASY | Exactly four axis points; every other integer point has a symmetry orbit of size eight, hence the number is 4 modulo 8 and never eight. |
| CND-0118 | If everyone follows the majority of their neighbours at each beat, can the whole group ever settle into a loop longer than two beats? | KILLED_KNOWN | The symmetric-threshold theorem of Goles–Olivos (1980) states fixed points or 2-cycles; the tie-hold update embeds using symmetric neighbour weight 2 and diagonal self-weight 1. No original result established. |
| CND-0119 | If the gaps between chosen whole numbers grow without bound, must the sum of their reciprocals have a finite total? | KILLED_FALSE/DEGENERATE | Take a_n=∑_(k=1)^n ⌈log₂(k+1)⌉; gaps grow to infinity, but dyadic blocks show ∑1/a_n diverges. |
119/119 KILLED, zero TRIAGED/SURVIVING; CAM-0004 not registered, CAM-0003 unchanged.

## S013 — coupled constraints, five immediate symbolic/source kills
| ID | Question | Status | Audit result |
|---|---|---|---|
| CND-0120 | Can a triangle drawn between grid points have three squared side lengths that are consecutive whole numbers? | KILLED_EASY | elementary parity and sums-of-two-squares obstruction. |
| CND-0121 | Could the reciprocals of chosen increasing whole numbers add up forever while the reciprocals of their step sizes have a finite total? | KILLED_EASY | Cauchy-Schwarz forces convergence. |
| CND-0122 | Can four non-collinear points in the plane have all six distances be consecutive whole numbers? | KILLED_KNOWN | exact historical MO question; reported collinear-only classification. |
| CND-0123 | On a circle with a whole-number radius, can the shorter curved distance and the straight-line distance between two points both be whole numbers? | KILLED_KNOWN | immediate classical transcendence reduction. |
| CND-0124 | Are there infinitely many different triangles whose sides are three consecutive whole numbers and whose corners and incentre all lie on grid points? | KILLED_EASY | explicit Pell family supplies infinitely many triangles. |

124/124 KILLED; no TRIAGED/SURVIVING. CAM-0003 remains FAILED/PARTIAL 37/54; CAM-0004 never registered.

## S014 candidates — owner triangle idea

### CND-0125 — KILLED_FALSE/DEGENERATE

For every strictly convex simple polygon Q with at least four vertices and every point P strictly inside Q and off every line through two vertices, are the two nearest vertices (distance ties lexicographic) adjacent on the boundary?

Plain: Inside a convex shape, are the two nearest corners always next to one another?

Evidence: Diamond counterexample: opposite short-axis endpoints closest to P=(.1,.1). Novelty grade: KNOWN_VARIANT. Claim: CLM-0088. Scope: KNOWN_VARIANT records nearby standard context, not an exact historical match. Decisive elementary kill suffices; no originality asserted.

### CND-0126 — KILLED_EASY

For every fixed simple polygon Q, can the set of fresh point locations P for which replacing the edge between the two nearest vertices by the two P-segments produces a simple polygon with one additional strict corner be expressed by a finite Boolean combination of affine inequalities and equalities in P? Distance ties are lexicographic; nonadjacent nearest pairs are inadmissible.

Plain: For a fixed shape, can all safe places for a new nearest-two corner be marked using finitely many straight lines?

Evidence: Exact affine distance/orientation/interval predicates give the finite arrangement description. Novelty grade: KNOWN_VARIANT. Claim: CLM-0089. Scope: KNOWN_VARIANT records nearby standard context, not an exact historical match. Decisive elementary kill suffices; no originality asserted.

### CND-0127 — KILLED_FALSE/DEGENERATE

Does an absolute constant C exist such that every NG drawing on n>=3 distinct sites with no three collinear has at most Cn proper edge-pair crossings, for every arrival order and noncollinear initial triangle, with lexicographic coordinate tie breaking?

Plain: Can the nearest-two growing network always have only a fixed multiple of its number of dots in crossings?

Evidence: Strict-scale two-phase construction and generic perturbation gives m² crossings on 2m+4 sites; hence Θ(n²) worst case. Novelty grade: KNOWN_VARIANT. Claim: CLM-0090. Scope: KNOWN_VARIANT records nearby standard context, not an exact historical match. Decisive elementary kill suffices; no originality asserted.

### CND-0128 — KILLED_FALSE/DEGENERATE (S015)

For every finite point set in general position, can some nearest-two-predecessor arrival order produce no crossing? **NO.** Convex six-integer-site certificate A=(-40,400), B=(-22,121), C=(-20,100), D=(-4,4), E=(24,144), F=(28,196). Every maximal plane graph on these convex sites must retain all six hull sides, forcing the last vertex's two nearest other sites to be precisely its two hull neighbours. None qualifies (CLM-0092/0093). Independently all 720 orders cross (CAM-0007, CLM-0094); CAM-0005's earlier false obstruction was discarded with immutable failure record, CAM-0006 correctly discovered a harder-coordinate example. KILLED_FALSE/DEGENERATE, NOT_SEARCHED for historical originality; one false instance is conclusive regardless of novelty search. **No new research problem selected.**

## S016 — three distinct mechanisms, one unresolved classification

| ID | Status | Score | Question | Result |
|---|---|---:|---|---|
| CND-0129 | KILLED_EASY | 59 | Do circle-point sets always permit a crossing-free nearest-two arrival order? | YES: circular-gap ear deletion proof CLM-0095 |
| CND-0130 | KILLED_EASY | 59 | Smallest point set with no possible plane order? | Exactly **5**, n<=4 theorem CLM-0096 plus rational-ellipse witness CLM-0097/0098 |
| CND-0131 | GENERATED | 60 | Is the circle the only ellipse for which every finite site set admits a plane nearest-two order? | Circle YES; ellipse x²/25+y²=1 NO; all other nonround ellipses UNRESOLVED. Not TRIAGED/SURVIVING/HARD/OPEN-certified. |

CND-0129 and CND-0130 are killed as *questions seeking unsolved answers*, but their positive and sharp mathematical results are retained. CND-0131 is a genuinely qualitative shape classification, not an eccentricity threshold adjusted to preserve a failing conjecture. Historical originality and full native literature audit remain UNKNOWN. The computational raw/scripts are preserved in a **detached** downloadable archive; see CAM manifest for incompleteness.


## S017 — retained CND-0131, no promotion
- **CND-0131 [GENERATED]**: remains a shape-classification question, not proven open/novel/hard. CLM-0099 gives a finite recursive ear equivalence, CLM-0100 a quantitative near-circle stability theorem with an explicit angular-gap hypothesis, and CAM-0010 is a preregistered but floating-point-inconclusive finite search. The all-nonround ellipse quantifier remains unresolved. Counts still 131 total, 130 killed, 1 generated, none triaged/surviving. S016 detached CAM8/9 archive unresolved.
