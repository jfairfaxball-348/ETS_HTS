# CLAIMS registry — S003

- **CLM-0001** [PROGRAMME_PROVED]: For any two orders of n labels, the sharp universal guaranteed nonadjacent-in-both-orders subset size is ceil(n/4). Justification: Self-contained lower and sharp upper bound argument archived in sessions/S002/MATHEMATICS.md; academic source establishes overlapping braid-graph subject, not the exact formula. Limits: Human proof only; no Lean formalisation, independent referee or novel status; classical argument. References: SRC-0006; CND-0037.
- **CLM-0002** [SOURCE_STATED]: OEIS A343447 concerns alternating 101...101 multiples for every positive integer coprime to 10. Justification: Inspected OEIS entry directly. Limits: The statement is known, not an S002 discovery. References: SRC-0003; CND-0019.
- **CLM-0003** [SOURCE_STATED]: After any two opposite-colour cells are deleted from an even-by-even rectangular board, the rest is domino-tileable. Justification: Inspected opposite-colour removal proof and named theorem secondary entry; Hamiltonian cycle gives even paths. Limits: Source primary attribution to Gomory not independently checked. References: SRC-0004, SRC-0009; CND-0027.

- **CLM-0004** [PROGRAMME_PROVED] CND-0017 always true: take k=ord_(9n)(10)-1 in P_k=((10^(k+1)-1)(10^k+1))/9. No novelty claimed.
- **CLM-0005** [PROGRAMME_PROVED] CND-0022 false: explicit eight-cell balanced hole-free shape with two forced leaves sharing one neighbour. No enumeration.
- **CLM-0006** [PROGRAMME_PROVED] CND-0038 exact f3(n)=ceil(n/6) by induced forest degeneracy plus explicit three-path decomposition of K6. Related SRC-0006 is not exact prior art.
- **CLM-0007** [PROGRAMME_PROVED] CND-0040 false at n=5: orders a-v-b-c-d and c-v-d-a-b force v to be isolated in any valid chosen set.
- **CLM-0008** [PROGRAMME_PROVED] CND-0050 s(n)=A039836(2n)+1; known weak Sidon extremal formulation, NOT a solution of general term computation. SRC-0010, SRC-0011, SRC-0012, SRC-0013.

## S004 claims (symbolic or explicitly attributed)

| ID | Candidate | Status | Scope |
|---|---|---|---|
| CLM-0009 | CND-0051 | PROGRAMME_PROVED | The 5-cycle C5 is triangle-free, connected and 2-regular, yet has only one cycle. |
| CLM-0010 | CND-0052 | PROGRAMME_PROVED | A bridge would create a component with odd total degree (its one exiting edge); hence no bridge exists. Any nonbridge edge lies on |
| CLM-0011 | CND-0053 | SOURCE_STATED | Add an edge between the two odd-degree vertices to get all-even degrees; Euler circuit exists and removing added edge gives the re |
| CLM-0012 | CND-0054 | PROGRAMME_PROVED | Positions divisible by 3 are losing: any move leaves remainder 1 or 2, and the opponent can restore a multiple of 3; all other pos |
| CLM-0013 | CND-0055 | PROGRAMME_PROVED | For {1,2,5}, the possible first differences give final values 4 (merge 1,2), 2 (merge 1,5), or 2 (merge 2,5), never 0. |
| CLM-0014 | CND-0056 | PROGRAMME_PROVED | Termination is by decreasing length by 2. Two redexes either are disjoint and commute or overlap in 000/111 and both choices leave |
| CLM-0015 | CND-0057 | SOURCE_STATED | Exactly the classical arbitrarily long abelian-square theorem of Entringer, Jackson and Schatz (1974); direct authors' paper state |
| CLM-0016 | CND-0058 | SOURCE_STATED | Rao and Rosenfeld (2015) state that no infinite binary word avoids abelian cubes of period >=2; binary Parikh equality equals equa |
| CLM-0017 | CND-0059 | PROGRAMME_PROVED | Each move preserves each row and column parity. Conversely clear positions (i,j), i<m,j<n, lexicographically using a flip based at |
| CLM-0018 | CND-0060 | PROGRAMME_PROVED | The 2-by-2 board with top row 11 and bottom row 00 has even total 2 but each column has odd parity, preserved by every allowed fli |
| CLM-0019 | CND-0061 | SOURCE_STATED | Greenfield and Greenfield (1998) established this; standard Bertrand-postulate induction explicitly inspected in secondary exposit |
| CLM-0020 | CND-0062 | PROGRAMME_PROVED | Already directly posed and answered on Math.SE in 2018; n=7 impossible because sum 1+...+14=105, whereas the seven largest distinc |
| CLM-0021 | CND-0063 | SOURCE_STATED | Known geometric matching theorem (Kano 2002 presentation). Independent short proof: choose a red-blue perfect matching minimizing  |
| CLM-0022 | CND-0064 | PROGRAMME_PROVED | Bertrand induction picks p in (2n,4n) and pairs a=p-2n with 2n, a+1 with 2n-1, etc. These chords are nested and do not cross; indu |
| CLM-0023 | CND-0065 | PROGRAMME_PROVED | The five-vertex star K1,4 refutes it: any centre label c in {1,2,3,4,5} forces four prime sums with other labels, but c=1,2,3,4,5  |


## S005 claims

- **CLM-0024** [PROGRAMME_PROVED] q=3, AABBCC: only a cut after position 3 gives two blocks of length 3; AAB and BCC are not rainbow. Candidate CND-0066; sources SRC-0023.
- **CLM-0025** [SOURCE_STATED] Classical Goldberg–West two-person necklace-splitting theorem directly stated in Simonyi 2008. Candidate CND-0067; sources SRC-0023, SRC-0024.
- **CLM-0026** [SOURCE_STATED] Sjöstrand's 2005 cover pebbling theorem provides this exact stacking maximum. Candidate CND-0069; sources SRC-0026.
- **CLM-0027** [PROGRAMME_PROVED] (5,0,0) cannot cover path P3: from the left endpoint, costs 1+2+4=7. Candidate CND-0070; sources SRC-0026.
- **CLM-0028** [PROGRAMME_PROVED] 2x3 rectangle contains a 2x2 subblock: four panel corners share an interior planar vertex, but only three distinct cube faces meet at any cube vertex. Candidate CND-0071; sources SRC-0027.
- **CLM-0029** [SOURCE_STATED] Esther Klein's five-point convex quadrilateral theorem, the Erdős–Szekeres base case. Candidate CND-0072; sources SRC-0028.
- **CLM-0030** [SOURCE_STATED] Classical art gallery theorem; Fisk's 3-colouring of triangulations gives floor(n/3) guards. Candidate CND-0073; sources SRC-0029.
- **CLM-0031** [PROGRAMME_PROVED] A vertex of maximum outdegree is a 2-king. Candidate CND-0074; sources .
- **CLM-0032** [SOURCE_STATED] de Bruijn sequence; Euler circuit of (k-1)-block overlap digraph constructs it. Candidate CND-0075; sources SRC-0032.
- **CLM-0033** [SOURCE_STATED] Exactly Dilworth's theorem, directly recorded in MathWorld. Candidate CND-0076; sources SRC-0030.
- **CLM-0034** [SOURCE_STATED] Classical order-independent abelian sandpile stabilization, directly stated in Sage tutorial. Candidate CND-0077; sources SRC-0031.
- **CLM-0035** [PROGRAMME_PROVED] Factor n=l(2a+l-1)/2; any representation forces odd factor >1. Conversely an odd divisor >1 yields a positive-length interval of >=2 summands. Candidate CND-0078; sources .
- **CLM-0036** [PROGRAMME_PROVED] Bipartite parity forbids odd mn; for an even side reserve a border column and snake through other columns, returning on the border. Candidate CND-0079; sources .
- **CLM-0037** [SOURCE_STATED] Exactly Robbins's strong-orientation theorem; related publisher source states theorem. Candidate CND-0081; sources SRC-0033.
