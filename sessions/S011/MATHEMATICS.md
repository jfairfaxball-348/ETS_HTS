# S011 mathematics — proof-first five-way screening

All candidate statements are high-school-facing mathematical models, not assertions about physics or brains. All five were killed. Each resolution self-audited; none is novel or hard.

## CND-0111 / CLM-0072 — clock schedules

**Exact question:** For positive integer m,n with gcd(m,n)=1 and nonempty sets A and B of lit positions on clocks modulo m and n, must there exist a nonnegative time at which both clocks are lit?

**Plain language:** If two clocks have coprime periods and each flashes at least once per cycle, must they flash together?

**Proof/counterexample:** Choose lit residues a in A and b in B. A common flash means exactly the paired congruences t=a (mod m), t=b (mod n). CRT ensures nonnegative t when gcd=1. Generally this is possible iff some a-b divisible by gcd(m,n); necessity follows by subtraction and sufficiency by Bezout. Noncoprime example: m=n=2, A={0}, B={1} never flash. This is a two-way reduction, not a fresh clock phenomenon.

**Decision:** KILLED_EQUIVALENT; relevant sources SRC-0059.

## CND-0112 / CLM-0073 — integer rows

**Exact question:** For an infinite row of nonnegative integers a_j (j>=0), repeatedly replace each entry by the average of itself and its right neighbour. If every row produced has only integers, must the original row be constant?

**Plain language:** If endless averaging never produces fractions, was the infinite row constant at the start?

**Proof/counterexample:** Induct: a_j(0)=3^j, and [2^t3^j+2^t3^(j+1)]/2=2^(t+1)3^j. Every entry for every j,t is integral but initial row is nonconstant. This is an infinite row, not a finite row losing its last entry.

**Decision:** KILLED_FALSE/DEGENERATE; relevant sources no direct source needed for elementary reasoning.

## CND-0113 / CLM-0074 — Euclidean pi geometry

**Exact question:** Can a positive-radius Euclidean circle and a positive-side square simultaneously have equal area and equal perimeter?

**Plain language:** Can a circle and square use the same boundary length and enclose the same area?

**Proof/counterexample:** Equal perimeters 2πr=4s imply s=πr/2; equal areas πr²=s² then imply π=4 after cancellation by πr²>0. Standard Euclidean π is strictly less than 4. Fixed-perimeter area ratio circle:square is 4/π. No assertion about alternative metrics.

**Decision:** KILLED_EASY; relevant sources SRC-0062.

## CND-0114 / CLM-0075 — planar boundary rigidity

**Exact question:** Can a positive-width positive-height closed rectangle equal a finite union of closed positive-radius Euclidean disks with pairwise disjoint interiors?

**Plain language:** Can finitely many round coins perfectly fill a rectangle, even along its sides?

**Proof/counterexample:** Suppose R is a rectangle equal to disks D_1∪...∪D_N. Since every disk lies in R, a rectangle side point cannot lie in any disk interior (otherwise its open ball protrudes outside R); so it must lie on a disk circumference. Each disk circumference intersects the side's supporting line in at most 2 points, hence a finite set cannot contain the entire positive-length side. Even allowing overlapping disks cannot fix this.

**Decision:** KILLED_EASY; relevant sources no direct source needed for elementary reasoning.

## CND-0115 / CLM-0076 — nonuniform integer dynamics

**Exact question:** For any positive integer x, if we repeatedly replace x by x+floor(sqrt(x)), must a strictly later term be a perfect square?

**Plain language:** If you repeatedly add the whole-number part of a square root, will you eventually land on a square?

**Proof/counterexample:** Let x=k²+r, k≥1, 1≤r≤2k. If r≤k, then two steps under F reach (k+1)²+(r-1); if r≥k+1 then one step reaches (k+1)²+(r-k-1). Both are within the next square gap and strictly lower nonnegative offsets than r. Iterated threshold crossings must end at r=0. If starting at square k², first move to k²+k (nonsquare) and apply the same descent. Exact prior statement already in OEIS A171746 (whose 1985–86 print reference was NOT inspected) and 2022 note.

**Decision:** KILLED_KNOWN; relevant sources SRC-0060, SRC-0061.

## Independent difficulty and family comparison
Clock CRT is exact congruence arithmetic, not a difficult bounded-memory phenomenon. The infinite one-sided row is refuted by a genuine eigen-row, not a finite state counting trick. Circle/square uses area/perimeter invariants rather than grid flux. Finite disks use a true rectangle boundary, unrelated to domino checkerboards. Square jump is locally nonuniform but has a descending square-offset and exactly located prior art. All five cheap attacks **succeeded**, not failed; zero candidates meet the two failed independent attacks plus external difficulty evidence criterion. No mathematical campaign, no computational proof, no priority claim beyond explicitly inspected SRC-0060/SRC-0061.
