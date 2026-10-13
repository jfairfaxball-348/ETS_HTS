# S004 — proof-first mathematical record and diversity funnel

## Funnel and exclusions
Fifteen precisely stated questions in CND-0051 to CND-0065, arising from independent graph cycle structure, graph traversal, move games, rewrite systems, binary repetition avoidance, cellular linear toggles, prime-sum pairings, planar matching and prime-labelled trees. No S002 graph-path overlays, digit palindromes, domino-hole modifications or weak-Sidon restatements were reopened. Each entered GENERATED, underwent immediate symbolic/witness/source screening, and moved to KILLED; none was classified hard or open. Do not mistake multiple prime-sum variations as fully independent mechanisms: their dependencies are recorded below.

## CND-0051 / CLM-0009 — Does every connected triangle-free graph with minimum degree two have two edge-disjoint cycles?

**Exact:** For every finite connected simple triangle-free graph G with minimum degree at least 2, are there two cycles sharing no edge?

**Result:** KILLED_FALSE/DEGENERATE. The 5-cycle C5 is triangle-free, connected and 2-regular, yet has only one cycle.

**Attack A — invariants/counting:** Minimum degree cannot force two cycles: C5 has only five edges; a graph-theoretic cyclomatic-number check is 1.

**Attack B — theorem/proof/counterexample:** The 5-cycle C5 is triangle-free, connected and 2-regular, yet has only one cycle.

**Limit:** Finite witness, human proof, or inspected source statement only. No CAM/run, independent referee or novelty certificate.

## CND-0052 / CLM-0010 — In a connected graph where every dot has an even number of neighbours, does every edge belong to a loop?

**Exact:** In every finite connected undirected graph all of whose vertices have even degree, does each edge lie on a simple cycle?

**Result:** KILLED_EASY. A bridge would create a component with odd total degree (its one exiting edge); hence no bridge exists. Any nonbridge edge lies on a cycle.

**Attack A — invariants/counting:** Bridge parity is sufficient: remove edge uv, find a remaining u-v path, reattach edge to form a cycle.

**Attack B — theorem/proof/counterexample:** A bridge would create a component with odd total degree (its one exiting edge); hence no bridge exists. Any nonbridge edge lies on a cycle.

**Limit:** Finite witness, human proof, or inspected source statement only. No CAM/run, independent referee or novelty certificate.

## CND-0053 / CLM-0011 — If a connected graph has exactly two odd-degree dots, can we trace every edge exactly once?

**Exact:** Does every finite connected graph having precisely two vertices of odd degree admit a trail traversing every edge exactly once?

**Result:** KILLED_KNOWN. Add an edge between the two odd-degree vertices to get all-even degrees; Euler circuit exists and removing added edge gives the required trail.

**Attack A — invariants/counting:** Euler's trail theorem directly settles all quantifiers; nontree multigraph insertion is allowed in the proof auxiliary graph.

**Attack B — theorem/proof/counterexample:** Add an edge between the two odd-degree vertices to get all-even degrees; Euler circuit exists and removing added edge gives the required trail.

**Limit:** Finite witness, human proof, or inspected source statement only. No CAM/run, independent referee or novelty certificate.

## CND-0054 / CLM-0012 — Taking one or two stones each turn, when can the first player force the last move?

**Exact:** In normal play on a pile of n positive stones with moves remove 1 or 2 stones, does the first player win exactly when 3 does not divide n?

**Result:** KILLED_EASY. Positions divisible by 3 are losing: any move leaves remainder 1 or 2, and the opponent can restore a multiple of 3; all other positions move to such a multiple.

**Attack A — invariants/counting:** Induction on n, with terminal zero losing for the player to move.

**Attack B — theorem/proof/counterexample:** Positions divisible by 3 are losing: any move leaves remainder 1 or 2, and the opponent can restore a multiple of 3; all other positions move to such a multiple.

**Limit:** Finite witness, human proof, or inspected source statement only. No CAM/run, independent referee or novelty certificate.

## CND-0055 / CLM-0013 — Replace two numbers by their absolute difference until one remains. Does even starting total guarantee zero?

**Exact:** For every finite multiset of positive integers of even total sum, can repeated replacement of any two numbers a,b by |a-b| finish at 0?

**Result:** KILLED_FALSE/DEGENERATE. For {1,2,5}, the possible first differences give final values 4 (merge 1,2), 2 (merge 1,5), or 2 (merge 2,5), never 0.

**Attack A — invariants/counting:** Parity is invariant but insufficient; this explicit three-number exhaustive symbolic split disproves sufficiency.

**Attack B — theorem/proof/counterexample:** For {1,2,5}, the possible first differences give final values 4 (merge 1,2), 2 (merge 1,5), or 2 (merge 2,5), never 0.

**Limit:** Finite witness, human proof, or inspected source statement only. No CAM/run, independent referee or novelty certificate.

## CND-0056 / CLM-0014 — Delete adjacent equal binary digits until none remain. Is the final string independent of deletion order?

**Exact:** For every finite binary word, is the irreducible word obtained by repeatedly deleting 00 or 11 independent of the chosen sequence of deletions?

**Result:** KILLED_EASY. Termination is by decreasing length by 2. Two redexes either are disjoint and commute or overlap in 000/111 and both choices leave the same letter; induction on remaining length gives unique irreducible normal form.

**Attack A — invariants/counting:** Local diamond plus length induction, not brute-force enumeration or an unsupported confluence citation.

**Attack B — theorem/proof/counterexample:** Termination is by decreasing length by 2. Two redexes either are disjoint and commute or overlap in 000/111 and both choices leave the same letter; induction on remaining length gives unique irreducible normal form.

**Limit:** Finite witness, human proof, or inspected source statement only. No CAM/run, independent referee or novelty certificate.

## CND-0057 / CLM-0015 — Must an infinite row of 0s and 1s contain arbitrarily long neighbouring blocks with equal numbers of 1s?

**Exact:** In every infinite binary word, for every k>=1 do two adjacent blocks of the same length at least k occur with equal counts of 1?

**Result:** KILLED_KNOWN. Exactly the classical arbitrarily long abelian-square theorem of Entringer, Jackson and Schatz (1974); direct authors' paper statement inspected in a public text reproduction.

**Attack A — invariants/counting:** For binary words two equal-length blocks have the same ones count iff they have equal multisets of letters; identity is bidirectional.

**Attack B — theorem/proof/counterexample:** Exactly the classical arbitrarily long abelian-square theorem of Entringer, Jackson and Schatz (1974); direct authors' paper statement inspected in a public text reproduction.

**Limit:** Finite witness, human proof, or inspected source statement only. No CAM/run, independent referee or novelty certificate.

## CND-0058 / CLM-0016 — Must an infinite row of 0s and 1s have three neighbouring equal-length blocks of length at least two with equal numbers of 1s?

**Exact:** Does every infinite binary word contain three consecutive blocks of some common length at least 2 with equal numbers of 1?

**Result:** KILLED_KNOWN. Rao and Rosenfeld (2015) state that no infinite binary word avoids abelian cubes of period >=2; binary Parikh equality equals equality of ones counts.

**Attack A — invariants/counting:** Do not mistake 'period >=2' for 'arbitrarily large period': these are different quantifier statements.

**Attack B — theorem/proof/counterexample:** Rao and Rosenfeld (2015) state that no infinite binary word avoids abelian cubes of period >=2; binary Parikh equality equals equality of ones counts.

**Limit:** Finite witness, human proof, or inspected source statement only. No CAM/run, independent referee or novelty certificate.

## CND-0059 / CLM-0017 — If every row and column of a black-white grid has even black squares, can 2-by-2 flips clear it?

**Exact:** For all m,n>=2 and all binary m-by-n boards, can flipping all four bits of chosen adjacent 2-by-2 subboards reach all zeroes iff every initial row sum and column sum is even?

**Result:** KILLED_EASY. Each move preserves each row and column parity. Conversely clear positions (i,j), i<m,j<n, lexicographically using a flip based at (i,j) iff its bit is 1; the last row and column vanish by the parity constraints.

**Attack A — invariants/counting:** Constructive elimination works for arbitrary m,n >=2; earlier cleared cells never change.

**Attack B — theorem/proof/counterexample:** Each move preserves each row and column parity. Conversely clear positions (i,j), i<m,j<n, lexicographically using a flip based at (i,j) iff its bit is 1; the last row and column vanish by the parity constraints.

**Limit:** Finite witness, human proof, or inspected source statement only. No CAM/run, independent referee or novelty certificate.

## CND-0060 / CLM-0018 — Is even total number of black squares enough to clear a board by flipping 2-by-2 squares?

**Exact:** For every m,n>=2, is a binary m-by-n grid with even total bit sum necessarily transformable to zero by adjacent 2-by-2 flips?

**Result:** KILLED_FALSE/DEGENERATE. The 2-by-2 board with top row 11 and bottom row 00 has even total 2 but each column has odd parity, preserved by every allowed flip.

**Attack A — invariants/counting:** Checks row/column invariants from CND-0059 rather than number of black cells alone.

**Attack B — theorem/proof/counterexample:** The 2-by-2 board with top row 11 and bottom row 00 has even total 2 but each column has odd parity, preserved by every allowed flip.

**Limit:** Finite witness, human proof, or inspected source statement only. No CAM/run, independent referee or novelty certificate.

## CND-0061 / CLM-0019 — Can the integers from 1 through 2n always be paired so each pair has a prime sum?

**Exact:** For every n>=1 does {1,...,2n} have a partition into n unordered pairs {a,b} with a+b prime?

**Result:** KILLED_KNOWN. Greenfield and Greenfield (1998) established this; standard Bertrand-postulate induction explicitly inspected in secondary exposition; OEIS A000341 enumerates such pairings.

**Attack A — invariants/counting:** For n>=2 choose prime p with 2n<p<4n and pair the consecutive upper suffix [p-2n,2n] by equal-sum nested pairs, then induct on remaining prefix.

**Attack B — theorem/proof/counterexample:** Greenfield and Greenfield (1998) established this; standard Bertrand-postulate induction explicitly inspected in secondary exposition; OEIS A000341 enumerates such pairings.

**Limit:** Finite witness, human proof, or inspected source statement only. No CAM/run, independent referee or novelty certificate.

## CND-0062 / CLM-0020 — Can those pairs always have different prime sums?

**Exact:** For every n>=1 can {1,...,2n} be partitioned into n pairs whose sums are n pairwise distinct primes?

**Result:** KILLED_FALSE/DEGENERATE. Already directly posed and answered on Math.SE in 2018; n=7 impossible because sum 1+...+14=105, whereas the seven largest distinct eligible odd primes <=27 total only 95.

**Attack A — invariants/counting:** Each pair uses two distinct positive integers and prime sum is odd <=4n-1; a rainbow matching would need distinct prime labels, contradicted by total-sum ceiling.

**Attack B — theorem/proof/counterexample:** Already directly posed and answered on Math.SE in 2018; n=7 impossible because sum 1+...+14=105, whereas the seven largest distinct eligible odd primes <=27 total only 95.

**Limit:** Finite witness, human proof, or inspected source statement only. No CAM/run, independent referee or novelty certificate.

## CND-0063 / CLM-0021 — Can any equal number of red and blue points be paired by uncrossed straight red-blue lines?

**Exact:** For all n>=1, given n red and n blue distinct planar points with no three collinear, does a noncrossing perfect matching using straight red-blue segments exist?

**Result:** KILLED_KNOWN. Known geometric matching theorem (Kano 2002 presentation). Independent short proof: choose a red-blue perfect matching minimizing total Euclidean length; any crossing edges can be uncrossed by swapping blue endpoints to strictly reduce length.

**Attack A — invariants/counting:** Uncrossing uses the triangle inequality with strictness from general position; minimizer therefore has no crossing.

**Attack B — theorem/proof/counterexample:** Known geometric matching theorem (Kano 2002 presentation). Independent short proof: choose a red-blue perfect matching minimizing total Euclidean length; any crossing edges can be uncrossed by swapping blue endpoints to strictly reduce length.

**Limit:** Finite witness, human proof, or inspected source statement only. No CAM/run, independent referee or novelty certificate.

## CND-0064 / CLM-0022 — Put 1 through 2n around a circle. Can noncrossing pairs always have prime sums?

**Exact:** For every n>=1, place 1,...,2n clockwise around a convex circle. Does a perfect noncrossing straight-chord matching exist in which endpoints of every chord sum to a prime?

**Result:** KILLED_EASY. Bertrand induction picks p in (2n,4n) and pairs a=p-2n with 2n, a+1 with 2n-1, etc. These chords are nested and do not cross; induct on the disjoint smaller prefix [1,a-1].

**Attack A — invariants/counting:** This is already implicit in known 'intervallic' prime pairings discussed on MathOverflow in 2016, not a novel open problem.

**Attack B — theorem/proof/counterexample:** Bertrand induction picks p in (2n,4n) and pairs a=p-2n with 2n, a+1 with 2n-1, etc. These chords are nested and do not cross; induct on the disjoint smaller prefix [1,a-1].

**Limit:** Finite witness, human proof, or inspected source statement only. No CAM/run, independent referee or novelty certificate.

## CND-0065 / CLM-0023 — Can every tree be numbered 1 through its size so that every linked pair adds to a prime?

**Exact:** For every finite tree T on n>=2 vertices, is there a bijection f:V(T)->{1,...,n} for which f(u)+f(v) is prime on every edge uv?

**Result:** KILLED_FALSE/DEGENERATE. The five-vertex star K1,4 refutes it: any centre label c in {1,2,3,4,5} forces four prime sums with other labels, but c=1,2,3,4,5 respectively gives composite sums 4,6,4,6,6.

**Attack A — invariants/counting:** A single composite edge for each of five possible central labels suffices; no computation run.

**Attack B — theorem/proof/counterexample:** The five-vertex star K1,4 refutes it: any centre label c in {1,2,3,4,5} forces four prime sums with other labels, but c=1,2,3,4,5 respectively gives composite sums 4,6,4,6,6.

**Limit:** Finite witness, human proof, or inspected source statement only. No CAM/run, independent referee or novelty certificate.

## Correctness stress tests (symbolic, no code)
- CND-0055: the three first moves from {1,2,5} leave pairs (1,5), (4,2), or (3,1), giving final values 4, 2, 2. Thus even total is *not* sufficient; parity alone is necessary.
- CND-0056: adjacent deletion overlaps only in triples 000/111, where either deletion produces the same residue. Disjoint deletions commute. By induction on word length, all reduction paths have the same irreducible endpoint; termination is immediate since length drops by 2. Not to be mistaken for mere conservation of parity of digit counts, which is too weak to determine the word.
- CND-0059: the flip at (i,j) changes each affected row/column by 2 bits, preserving row and column parity. In lexicographic elimination, later flips have top-left coordinate (i',j') with i'>i or (i'=i,j'>j); none affects the previous target (i,j). Once the (m-1)x(n-1) northwest rectangle is zero, column parity clears bottom row in each earlier column; row parity clears the remaining right column; bottom-right follows either parity. This proves both implications.
- CND-0062: for n=7 each prime pair sum is odd (the pair contains distinct integers, and 1+1 is not allowed), at least 3 and at most 27. The seven largest *distinct* such primes have total 5+7+11+13+17+19+23=95, yet 1+...+14=105 must equal the sum of the pair sums. Contradiction at n=7, stronger than the cruder n=30 prime-count obstruction. This exact issue was explicitly answered in SRC-0019.
- CND-0063: with red points r,s and blue points b,c, if [r,b] and [s,c] intersect internally at x, then the red-blue swap [r,c], [s,b] is strictly shorter in total, using strict triangle inequality on the two non-collinear turns through x. A finite minimum-length matching exists and has no crossings; no ham-sandwich machinery is needed for this version.
- CND-0064: Bertrand gives odd p with 2n<p<4n for n>=2, so a=p-2n is odd and between 1 and 2n-1. For each 0<=j<=(2n-a-1)/2 pair a+j with 2n-j (sum p). These are nested noncrossing arcs. The remaining 1..a-1 form an even prefix and induct. Base n=1 uses (1,2) sum 3. This yields the *stronger noncrossing property*, which is already related to MathOverflow's 2016 intervallic construction, not a novel proof claim.
- CND-0065: in K1,4, assigning the centre c=1,2,3,4,5 respectively necessarily exposes composite sums 1+3=4, 2+4=6, 3+1=4, 4+2=6, 5+1=6. Leaves necessarily carry all remaining labels, so all central choices fail.

## Equivalence translations and rigorous maps
1. CND-0057/0058 binary word ↔ path of +/-1 steps ↔ abelian repetitions. Map bit 1↦+1 and 0↦-1. For any two same-length blocks their net displacements agree iff their counts of ones agree (net displacement 2*ones-length). For three blocks equality of all three sums is equivalent. Map back using bit↦step, bijective for finite words and infinite sequences; translation preserves consecutive-block positions and length. Importantly period>=2 existential vs arbitrarily large periods universal are **not** interchangeable; CND-0058 asks only period>=2.
2. CND-0061/0062 integer pairings ↔ graph perfect matchings. Graph vertices 1..2n, edge {a,b} iff a+b prime. Every such sum >=3 is odd, so graph is bipartite (odd/even vertices). A prime-sum partition is exactly a perfect matching and conversely. Label an edge by p=a+b; distinct-prime condition is exactly a rainbow perfect matching. All maps are literal and work at n=1.
3. CND-0064 noncrossing prime chords ↔ Catalan/Dyck matching with prime edge labels. Traverse labelled convex vertices in clockwise order. A noncrossing matching corresponds to a balanced-parenthesis word via '(' at smaller endpoint and ')' at larger, matched by standard stack nesting; conversely the stack reconstructs its unique noncrossing chord matching. Each matched endpoint pair additionally must sum to a prime. The numeric labels are fixed, so this is an exact bidirectional map, not an unrestricted equivalence to OEIS A000341 (which counts crossing matchings too).
4. CND-0063 red-blue geometric pairs ↔ bijections in minimum-cost bipartite Euclidean matching. Assignments are exactly matchings between red and blue sets. A length-minimizing assignment has no crossings by explicit uncrossing. It is **not** equivalent to arbitrary graph planarity without the geometric cost and point set.

## Session outcome
15 registered, 15 killed: elementary counterexamples or direct proofs in graphs/games/grids/trees, exact 1974/2015 binary-word predecessors, and 1998/2016/2018/2002 matching predecessors. 65 total candidates, 65 killed, 0 TRIAGED, 0 SURVIVING, 0 SHORTLISTED, 0 selected. No mathematical computation, no CAM and no HARD classification. Search and source details explicitly bounded in NOVELTY_QUERIES.md.
