# S003 mathematics — hostile proof-first elimination of all five carryovers

## CLM-0004 / CND-0017 — central 2 palindrome
For k>=0 set P_k to the decimal integer consisting of k ones, a central 2, and k more ones. It equals R_(2k+1)+10^k, where R_m=(10^m-1)/9. Factor:
9 P_k = 10^(2k+1)-1+9*10^k = (10^(k+1)-1)(10^k+1).
Given n>=1 coprime to 10, 10 is a unit modulo 9n. Let t be its positive multiplicative order modulo 9n and choose k=t-1>=0. Then 9n divides 10^(k+1)-1 and consequently n divides P_k. For n=1, t=1 and P_0=2 is legal. **Complete proof of all quantifiers.** Earlier S002 negative residue for 10^k=1 was not a disproof: use k+1 rather than k in the order condition.
Cheap attacks: direct digit-sum parity/modular order (resolved by factorisation); try to kill using modular restrictions on 9/11 (not a valid obstruction once the full 9n order is allowed). No CAM.

## CLM-0005 / CND-0022 — balanced simply-connected polyomino
Take the 8 unit cells with lower-left integer coordinates
S={(-1,0),(0,0),(1,0),(2,0),(3,0),(4,0),(0,1),(3,-1)}.
A text sketch (top to bottom; all columns x=-1,0,1,2,3,4):
top y=1: .#....
middle y=0: ######
bottom y=-1: ....#.
The six middle cells form a horizontal bar, the other two are attached by a single edge; S is edge-connected and contains no bounded complementary grid component, so is hole-free. The six bar cells have 3 of each checkerboard colour. The top cell (0,1) is odd/black and bottom cell (3,-1) is even/white, giving 4 black and 4 white in total. Both tips (-1,0) and (0,1) have exactly one edge-neighbour in S, namely (0,0). Thus any domino cover would have to use the same centre square twice, impossible. This is a two-vertex Hall obstruction despite colour balance. **Counterexample**.
Cheap attacks: checkerboard parity is necessary but insufficient; Hall-neighbour counting kills it. No CAM.

## CLM-0006 / CND-0038 — exact three-permutation threshold
For any triple of permutations of [n], connect names if consecutive in at least one. For every induced t-vertex subgraph, each of three original paths contributes at most t-1 edges; thus at most 3(t-1) total edges (possibly fewer due to repeats) and mean degree <6. Every induced subgraph contains a vertex of degree <=5, so this graph is 5-degenerate and 6-colourable. One independent colour class has at least ceil(n/6) names.

To prove the matching universal upper bound, here is an explicit partition of the 15 edges of K6 into three Hamiltonian paths (vertices 0..5):
P1: 0-5-1-4-2-3
P2: 1-0-2-5-3-4
P3: 2-1-3-0-4-5
P1 edges: 05,15,14,24,23.
P2 edges: 01,02,25,35,34.
P3 edges: 12,13,03,04,45.
These 15 unordered pairs are distinct and exhaust K6. For any m<=6, delete the other labels from each of the three listed orders. Every K_m edge was adjacent in at least one K6 order and therefore remains adjacent in the resulting restricted order (deletion cannot destroy adjacency of retained consecutive entries). Split [n] into ceil(n/6) blocks of size at most six and concatenate the three restricted orders, separately per path. Each block induces a complete graph in the union. Thus an independent set contains at most one vertex per block: alpha<=ceil(n/6). Together f3(n)=ceil(n/6) for all n>=1. **Complete elementary proof.**
Cheap attacks: degeneracy gives lower bound but cannot alone prove upper; explicit K6 path factorisation and restriction finish it. No CAM or theorem novelty claim.

## CLM-0007 / CND-0040 — obligatory vertex
At n=5 let labels be {v,a,b,c,d}, and use two permutations
p=(a,v,b,c,d), q=(c,v,d,a,b).
In p, v meets a,b; in q, v meets c,d. The union-neighbourhood of v is every other label. Thus any independent set containing v has size exactly 1, while ceil(5/4)=2. **Explicit counterexample**. The S002 removal-and-four-colour lower bound already hinted at the exact failure point, but did not itself prove falsehood.
Cheap attacks: attempt 4-colour global selection fails to anchor a specified vertex; build degree-four universal prescribed vertex on five names, which disproves universal claim. No CAM.

## CLM-0008 / CND-0050 — weak Sidon sequence not a new problem
Let w(N)=max{|A|: A subset of {1,...,N} and all unordered sums a+b with a<b in A are distinct}. For two distinct unordered pairs {a,b} and {c,d}, if a+b=c+d and they share one entry (say a=c), then b=d, contradiction. Thus collisions are *necessarily* between four distinct elements. Hence the property defining w(N) is exactly absence of CND-0050's forbidden configuration, with no shift of bounds or hidden exceptions.
A k-subset forced to contain a collision exists for all k>w(N), while by definition at least one w(N)-subset avoids a collision. Therefore s(n)=w(2n)+1 for every n>=1, including the vacuous threshold for n=1. The exact maximum w(N), with precisely these distinct-pair sums and interval [1,N], is already OEIS **A039836**, SRC-0010. SRC-0011 (A345731) and SRC-0012 describe the related shortest-span/inverse weak Sidon formulation; SRC-0013 confirms active 2026 related research. Full Sidon sets also forbid repeated sums with coincident summands, e.g. three-term arithmetic progressions; **weak** Sidon sets need not. An ordinary Golomb ruler is not automatically an exactly synonymous condition without treating overlapping differences. Do not confuse these variants or confuse an existing sequence with a solved general formula.
Cheap attacks: pigeonhole pair-sum counting gives bounds only, not exact terms; translation into weak Sidon exactly identifies prior formulation, so no independent novelty remains. No CAM.

## Separate S002/CND-0037 correction audit
The S002 proof f2(n)=ceil(n/4) is sound: union of two paths has at most 2(t-1) induced edges -> 3-degenerate -> 4-colour independent set, and K4 two-path edge covers yield sharp block upper bound. Distinguish universal worst-case f2 from **instancewise** maximum independent set: SRC-0006 states vertex cover is NP-complete on the related braid graph class, which does *not* make the universal f2 computation hard. Since alpha(G)+tau(G)=|V|, instance vertex-cover hardness corresponds to an instance independent-set optimisation, not f2. No change to CND-0037 or CLM-0001.

## Outcome and limits
Five S002 TRIAGED -> four elementary resolved (CND-0017, 0022, 0038, 0040) and one exact prior-art equivalence (CND-0050). No surviving question. Symbolic proofs/witnesses only, no CAM, no claim of original theorems or independently verified new mathematics.
