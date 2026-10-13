# S002 mathematics — exact solves and unresolved gates

## CLM-0001 — nonadjacent names in two permutations, sharp guarantee

Let p and q be permutations of the same n names. Form a graph on those names, joining names that are adjacent in at least one permutation. Every induced subgraph on t≥1 vertices has at most (t−1)+(t−1)=2t−2 edges, because the edges from each permutation form a subgraph of a path, hence a forest. Its average degree is strictly less than 4. Thus **every nonempty induced subgraph contains a vertex of degree at most 3**. Remove such vertices successively, colour in the reverse order greedily using four colours, and take the largest colour class. The chosen vertices are pairwise nonadjacent in both permutations; its size is at least ceil(n/4).

Sharpness for n=4 is explicit: first order (1,2,3,4), second (3,1,4,2). Their six adjacent pairs are precisely all pairs from {1,2,3,4}; only one can be chosen.

For arbitrary n partition the names into b=ceil(n/4) successive blocks of size at most 4. Within each four-name block, use the two K4-decomposing path orders above. For a three-name block, choose (1,2,3) and (2,1,3), which together cover all three pairs. For a two-name block use the same two-element path twice. For a singleton use that name. Concatenate the per-block first orders into one whole-list order, and separately concatenate the second orders. Within each block, every two distinct names appear adjacent in at least one of the complete lists. Therefore an admissible set contains at most one name from each block, so it has size at most b. Combined with the lower bound, **f(n)=ceil(n/4)**, including n=1,2,3.

This elementary proof is only session-internal human reasoning; no independent mathematical referee, no novel claim, no Lean. Compare SRC-0006: the broader class of *braid graphs* (unions of two Hamiltonian paths) and instance-specific vertex-cover problems has long been studied and is NP-complete; worst-case universal threshold and finding the maximum for a specific input are different questions.

## CND-0017 — palindromic all-ones with one central 2
A candidate with form R_(2k+1)+10^k. The congruence trick that solves the central-zero analogue CND-0020 instead gives residue 2 mod n when 10^k≡1 (mod 9n), rather than 0. This **rules out that specific naive proof technique only**, not the conjecture. Other residues and exponents have not been checked. No CAM finite enumeration executed. Not classified HARD.

## CND-0038 — three orders
For any three permutations, their edge-union has ≤3(t−1) edges on any t-vertex induced graph, so the average induced degree is below 6. The graph is 5-degenerate, hence 6-colourable. Therefore a set of size ceil(n/6) exists. Matching *upper* examples would require constructions covering all pairs in blocks of six with three Hamiltonian paths. This construction is plausible from complete-graph path decompositions but is NOT archived as a verified proof here; candidate remains TRIAGED and may be a straightforward classical exercise.

## CND-0040 — forced name
Fix v. A maximal independent set containing v certainly exists, but the four-colour class argument does not necessarily contain v. Removing v and its at most four neighbours leaves ≥n−5 vertices; 4-colour bound gives only 1+ceil(max(0,n−5)/4), which can be smaller than ceil(n/4). This gap is not a counterexample. An explicit small model is needed before making difficulty claims.

## Difficulty battery honesty
All 50 records have an explicit six-step record; no CAM ran, no exhaustive search was performed, no timed olympiad-day challenge or rigorous random model was archived. The majority are killed by a concrete symbolic proof or counterexample, while five remain TRIAGED pending deep audit. Zero are SURVIVING or owner SELECTED_FOR_RESEARCH.