# S005 — proof-first mathematics and source-led diversity

Entry main 7794b213505aefe7b268c7d976085b9082bb282a tree 08d4a47e5098145a5eb9c3a0fde2caa88091ec58. S004 authored 172a82b53449800d1486d3d1cef9d87d99dff7a6 sole parent 821f4b06af48f7c5cadd1a7e733c3f7446f42bb0; merged PR #4 has two parents [821f4b06...,172a82b5...] and same tree. S005 had no competing branch/PR on entry. 16 candidates span fair division, pebbling, folding, convexity, visibility, tournaments, symbolic dynamics, posets, abelian networks, integer intervals, lattice routing, triangulations, strong orientation. Two fair-division and two pebbling entries share mechanism lineages (not claimed independent). 14 killed, 2 TRIAGED; no mathematics experiment/CAM and no 'hard' or novel assertions.

## CND-0066: One cut can share each of q doubled bead colours fairly

**Exact:** For all q>=1 and all linear words on q symbols each appearing exactly twice, does one internal cut leave one occurrence of each symbol on either side?

**Result:** KILLED_FALSE/DEGENERATE — q=3, AABBCC: only a cut after position 3 gives two blocks of length 3; AAB and BCC are not rainbow.

**Attack A:** Equal allocation requires both blocks of length q.

**Attack B:** The only possible cut at q fails on AABBCC.

Sources SRC-0023; claim CLM-0024; no CAM. Limit: no independent review, full novelty audit or proof formalisation.

## CND-0067: At most q cuts always fairly share a two-person even-colour necklace

**Exact:** For every linear word using exactly q>=1 colours each an even positive number of times, can at most q internal cuts create consecutive segments allocatable between two people so both receive half of each colour?

**Result:** KILLED_KNOWN — Classical Goldberg–West two-person necklace-splitting theorem directly stated in Simonyi 2008.

**Attack A:** Doubled monochromatic blocks show q cuts can be sharp.

**Attack B:** Publisher inspected statement settles full quantified claim.

Sources SRC-0023, SRC-0024; claim CLM-0025; no CAM. Limit: no independent review, full novelty audit or proof formalisation.

## CND-0068: No identical neighbours: are q-1 cuts enough for double beads?

**Exact:** For every q>=2 and every linear word length 2q with precisely two occurrences of each of q symbols and unequal adjacent symbols, can at most q-1 cuts divide contiguous intervals, assigned alternately to two people, with exactly one of each symbol per person?

**Result:** TRIAGED — No proof or counterexample certified; this q-1-cut restriction is not cleared as novel or hard.

**Attack A:** All-equal-adjacent sharp obstruction AABBCC is forbidden, removing the standard q-cut lower-bound example.

**Attack B:** Encode each colour's two occurrences by opposite ± signs; demand <=q-1 adjacent sign transitions. Parity alone does not bound this objective.

Sources SRC-0023, SRC-0024, SRC-0025, SRC-0034, SRC-0035; claim none; unresolved; no CAM. Limit: no independent review, full novelty audit or proof formalisation.

## CND-0069: Worst pile placement for covering any connected graph is stacked

**Exact:** For each finite connected graph G, do pebbling moves that replace two pebbles on a vertex by one on a neighbour require a universal covering threshold equal to max over roots r of sum over vertices v of 2^(distance(r,v))?

**Result:** KILLED_KNOWN — Sjöstrand's 2005 cover pebbling theorem provides this exact stacking maximum.

**Attack A:** A single pile at r needs sum of powers-of-two distance costs.

**Attack B:** Inspected publisher theorem's converse handles arbitrary configurations.

Sources SRC-0026; claim CLM-0026; no CAM. Limit: no independent review, full novelty audit or proof formalisation.

## CND-0070: Five pebbles always cover three vertices in a row

**Exact:** For every nonnegative distribution of five pebbles over a three-vertex path, can moves taking two pebbles at one vertex and depositing one on a neighbour end with >=1 pebble everywhere?

**Result:** KILLED_FALSE/DEGENERATE — (5,0,0) cannot cover path P3: from the left endpoint, costs 1+2+4=7.

**Attack A:** Rooted path transportation doubles pebble cost at each step.

**Attack B:** The three target pebbles cost respectively 1,2,4 from initial endpoint.

Sources SRC-0026; claim CLM-0027; no CAM. Limit: no independent review, full novelty audit or proof formalisation.

## CND-0071: Every six-square polyomino folds to a cube without overlap

**Exact:** For every edge-connected union of six unit lattice squares, can rigid 90-degree folds along square edges place the interiors of the squares bijectively onto six different unit-cube faces without overlap?

**Result:** KILLED_FALSE/DEGENERATE — 2x3 rectangle contains a 2x2 subblock: four panel corners share an interior planar vertex, but only three distinct cube faces meet at any cube vertex.

**Attack A:** Rigid hinged squares preserve common incidence at 2x2 interior vertex.

**Attack B:** Face-bijective cube net has at most three square faces incident at one cube vertex.

Sources SRC-0027; claim CLM-0028; no CAM. Limit: no independent review, full novelty audit or proof formalisation.

## CND-0072: Five points always include four in convex position

**Exact:** For every set of five planar points with no three collinear, do four form the vertices of a convex quadrilateral?

**Result:** KILLED_KNOWN — Esther Klein's five-point convex quadrilateral theorem, the Erdős–Szekeres base case.

**Attack A:** Convex hull >=4 immediately supplies a subset.

**Attack B:** Triangular hull with two interior points is the classical remaining case, covered by inspected secondary source.

Sources SRC-0028; claim CLM-0029; no CAM. Limit: no independent review, full novelty audit or proof formalisation.

## CND-0073: A third of a polygon's corners can guard its interior

**Exact:** For every simple polygon with n>=3 vertices, is there a set of at most floor(n/3) existing vertices such that each point inside has an unobstructed straight segment to some chosen vertex?

**Result:** KILLED_KNOWN — Classical art gallery theorem; Fisk's 3-colouring of triangulations gives floor(n/3) guards.

**Attack A:** Triangulate and 3-colour the polygon's triangulation vertices.

**Attack B:** A smallest colour class hits every triangle and guards its entire interior.

Sources SRC-0029; claim CLM-0030; no CAM. Limit: no independent review, full novelty audit or proof formalisation.

## CND-0074: Every round-robin tournament has a winner reachable within two wins

**Exact:** For every finite tournament (direction chosen for each complete-graph edge), does some vertex reach every other through at most two directed edges?

**Result:** KILLED_EASY — A vertex of maximum outdegree is a 2-king.

**Attack A:** Select vertex v with maximum number of outgoing edges.

**Attack B:** If u beats v and all v's outneighbours, then u has strictly larger outdegree, a contradiction.

Sources none; claim CLM-0031; no CAM. Limit: no independent review, full novelty audit or proof formalisation.

## CND-0075: Circular binary string displaying every k-block once

**Exact:** For every k>=1, does a cyclic binary word of length 2^k contain every possible binary word of length k exactly once cyclically?

**Result:** KILLED_KNOWN — de Bruijn sequence; Euler circuit of (k-1)-block overlap digraph constructs it.

**Attack A:** Vertices are (k-1)-bit words, edges k-bit words from prefix to suffix.

**Attack B:** Every vertex has indegree and outdegree 2 and graph is strongly connected, so Euler circuit spells desired word.

Sources SRC-0032; claim CLM-0032; no CAM. Limit: no independent review, full novelty audit or proof formalisation.

## CND-0076: Fewest chains partitioning a partially ordered set equal its width

**Exact:** For every finite partially ordered set, is the minimum number of disjoint totally ordered subsets covering all elements equal to the largest number of pairwise incomparable elements?

**Result:** KILLED_KNOWN — Exactly Dilworth's theorem, directly recorded in MathWorld.

**Attack A:** An antichain of size w requires at least w disjoint chains.

**Attack B:** Dilworth's theorem proves w chains suffice.

Sources SRC-0030; claim CLM-0033; no CAM. Limit: no independent review, full novelty audit or proof formalisation.

## CND-0077: Sandpile stabilization unaffected by order of topplings

**Exact:** On every finite connected undirected graph with a chosen sink, with finitely many initial grains, whenever a nonsink vertex has at least its degree grains it may send one along every incident edge (grains at sink disappear). Is the final stable configuration independent of which legal firings occur first?

**Result:** KILLED_KNOWN — Classical order-independent abelian sandpile stabilization, directly stated in Sage tutorial.

**Attack A:** Two simultaneously legal firings commute as integer-vector updates.

**Attack B:** Accessible sink guarantees termination; standard abelian result yields unique stable state.

Sources SRC-0031; claim CLM-0034; no CAM. Limit: no independent review, full novelty audit or proof formalisation.

## CND-0078: Positive sums of consecutive integers characterize nonpowers of two

**Exact:** For every n>=1, is n representable as a sum of at least two consecutive positive integers exactly when n is not a power of two?

**Result:** KILLED_EASY — Factor n=l(2a+l-1)/2; any representation forces odd factor >1. Conversely an odd divisor >1 yields a positive-length interval of >=2 summands.

**Attack A:** If n is a power of two, odd-length l>=3 impossible and even l forces odd factor 2a+l-1>1.

**Attack B:** For odd divisor d>1 with n=dm: use d terms centered at m if m>=(d+1)/2; otherwise use 2m terms centered at d/2, both positive.

Sources none; claim CLM-0035; no CAM. Limit: no independent review, full novelty audit or proof formalisation.

## CND-0079: Rectangular grid has Hamiltonian cycle exactly when its area is even

**Exact:** For all m,n>=2, does the graph of m*n grid points joined along horizontal and vertical unit distances contain a simple cycle visiting every point exactly once if and only if mn is even?

**Result:** KILLED_EASY — Bipartite parity forbids odd mn; for an even side reserve a border column and snake through other columns, returning on the border.

**Attack A:** Any cycle alternates chessboard colours, hence covers equally many colours.

**Attack B:** When m even (transpose if needed), horizontal serpentine rows with reserved first column close a single spanning loop.

Sources none; claim CLM-0036; no CAM. Limit: no independent review, full novelty audit or proof formalisation.

## CND-0080: Can every polygon triangulation keep all vertex triangle loads at most half n?

**Exact:** For each simple polygon with n>=4 vertices and no three collinear, is there a noncrossing triangulation using only diagonals between existing vertices where each original vertex is incident to no more than ceil(n/2) of the n-2 triangular regions?

**Result:** TRIAGED — Not proved, falsified, or cleared for novelty. Convex triangulations allow zig-zag low load, but nonconvex visibility obstructions remain.

**Attack A:** Sum of triangle incidence over vertices is 3(n-2), which bounds averages below but cannot cap maximum load.

**Attack B:** Convex ear-reduction zig-zag constructions do not preserve available diagonals in reflex polygons; no nonconvex global proof or witness established.

Sources SRC-0029; claim none; unresolved; no CAM. Limit: no independent review, full novelty audit or proof formalisation.

## CND-0081: Can streets without bridges be directed for two-way reachability?

**Exact:** For every finite connected undirected simple graph containing no bridge, can each edge receive a direction so every vertex is reachable by a directed path from every other vertex?

**Result:** KILLED_KNOWN — Exactly Robbins's strong-orientation theorem; related publisher source states theorem.

**Attack A:** A bridge makes reverse travel across its cut impossible.

**Attack B:** Ear-decomposition proof gives strong orientation of bridgeless graph; known prior result.

Sources SRC-0033; claim CLM-0037; no CAM. Limit: no independent review, full novelty audit or proof formalisation.

## TRIAGED translations and exact reduction directions

CND-0068: sign each of 2q positions ± with opposite signs at the two occurrences of each colour. Assign every maximal constant-sign run to one recipient: number of cuts equals the number of sign changes; conversely any alternating allocation induces precisely such signs. Alternative path-plus-perfect-matching formulation: match positions with same colours, forbid matched neighbouring positions, demand opposite signs across each matching edge and at most q-1 path sign transitions. Both mappings are exact up to colour renaming. General q-cut theorem is related but does not imply q-1. Adjacent-equal lower bounds are excluded. No claim of new/true result.

CND-0080: same as minimising max original-vertex incident bounded-face count in a plane triangulation with fixed outer polygon boundary and noncrossing inside diagonals (equivalence both directions); also ear deletion/reconstruction orders with final vertex load, each triangulation has such an order and each valid order reverses to one, but intermediate-load bounds are not equivalent to final max load. Convex zig-zag does not solve arbitrary nonconvex polygons. Prior low-degree pseudo-triangulation results not equivalent to triangular faces; full audit unperformed.
