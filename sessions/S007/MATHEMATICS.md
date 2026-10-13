# S007 mathematical investigation — 2026-10-13

**Scope.** These are *toy mathematical objects*, not a physical theory of time dilation, a model validated on human EEG, or a metaphysical position about the existence of infinity. All 17 CND-0085..0101 receive mathematical kills, not an open-problem certificate. No CAM computations were run in S007; examples are hand arguments.

## T: Local and global clocks — CND-0085/0086, CLM-0043/0044

Each vertex has a reading \(x_v\in\mathbb Z/k\); an oriented comparison \(u\to v\) imposes \(x_v-x_u=d_{uv}\pmod k\). Summing vertex differences round any cycle always yields zero. A triangle of 12-hour offset requests \(3,4,6\) has nonzero sum \(13\equiv1\pmod {12}\), so there is no solution. Conversely, zero signed offsets on *every* cycle suffice: choose a root phase 0 and integrate edge labels along a spanning tree, then each off-tree edge follows from its fundamental cycle. This is standard gain-graph balance (SRC-0044). Proper time in relativity motivates comparison, but the algebraic model assumes one discrete snapshot and does not prove clocks physically agree across worldlines.

## I: What finite statements do, and do not, force? — CND-0087/0088, CLM-0045/0046

If a prefix-closed binary tree has valid words of arbitrarily large lengths, one of the root's two children has arbitrarily deep descendants; at each stage make this same choice. This gives an infinite valid word (König's lemma; proof inspected SRC-0048). In any finite colouring of \(\mathbb N\), not every colour fibre can be finite, since a finite union of finite sets is finite. Neither argument decides the metaphysical existence of infinity or settles the axiom choice between different foundations; weak König lemma has a specific logical role (SRC-0052).

## P: Pi in a different metric — CND-0089/0090, CLM-0047/0048

Define circle as \(\{z:\|z\|=r\}\) and circumference using the *same norm*'s path length. In the taxicab norm \(\|(x,y)\|_1=|x|+|y|\), the unit circle is the diamond with vertices \((\pm1,0),(0,\pm1)\). Each of four boundary edges has norm-length 2, hence circumference 8; norm diameter 2, giving ratio 4, not Euclidean \(\pi\). The universal result for *all* norms on the plane is already known: by Gołąb, unit-circle self-perimeter lies between 6 and 8, with corresponding ratios 3 to 4 (SRC-0045, secondary statement). Euclidean pi does not randomly vary.

## B: Rhythm as finite modular phase — CND-0091/0092, CLM-0049/0050

For \(n\) pulse makers around a directed ring and phase \(x_i\in\mathbb Z/3\), requiring each successor to pulse one beat later means \(x_{i+1}-x_i=1\). Summing round the ring gives \(n\equiv0\pmod3\), also sufficient by \(x_i=i\bmod3\). A four-person ring is a counterexample to the universal claim. If two perfectly periodic trains of positive integer periods \(p,q\) begin together at zero, their first subsequent common pulse is \(\operatorname{lcm}(p,q)\). The neuroscience review SRC-0047 supplies motivation for mathematical oscillator models but offers **no measured EEG support** for these particular toy systems.

## Z: Division by zero — CND-0093/0094, CLM-0051/0052

Ordinary real multiplication gives \(0x=0\) for all \(x\), so there is no real number denoted \(1/0\) that meets \(0(1/0)=1\). A *different* total operation can instead define inverse \(b^{-1}=1/b\) when \(b\ne0\), and \(0^{-1}=0\); then define \(a/b=ab^{-1}\). This agrees with familiar division for nonzero denominator (the zero-totalised field/meadow literature SRC-0046), while losing universal cancellation \(b(a/b)=a\) when \(b=0,a\ne0\). This is not ordinary division by zero solved while preserving all field axioms.

## C: Convergence and ordering — CND-0095/0096, CLM-0053/0054

The harmonic sequence \(1/n\to0\) but its sum diverges: each block \(n=2^j+1,\ldots,2^{j+1}\) has \(2^j\) terms at least \(1/2^{j+1}\), giving infinitely many blocks of sum at least \(1/2\). Double sequence \(a_{mn}=m/(m+n)\) has \(\lim_m\lim_n a_{mn}=0\) (n first) but \(\lim_n\lim_m a_{mn}=1\) (m first). This familiar counterexample occurs in SRC-0050. No general interchange of iterated limits without an appropriate uniformity hypothesis.

## Genuine crossovers — CND-0097..0100, CLM-0055..0058

- I+C: The tree of *all finite strictly decreasing lists of nonnegative integers* has nodes of arbitrary depth (begin high enough), but no infinite branch. It is infinitely branching at the root, so finite-branching König cannot apply.
- T+B: Clock readings and discrete pulse phases on graph edges have the *identical* constraints \(x_v-x_u=d_{uv}\) modulo k; map every clock variable to pulse phase and conversely to produce an exact two-way equivalence, including disconnected graphs (one free shift per component). Not an independent brain theorem.
- P+C: Finer and finer horizontal/vertical staircase paths from \((0,0)\) to \((1,1)\), N horizontal and N vertical edges each of length \(1/N\), converge uniformly to the diagonal under \(x+y\) parametrisation, but every staircase has length \(2\ne\sqrt2\).
- Z+C: \(x/x\to1\) and \(x^2/x\to0\) as \(x\to0\), both written \(0/0\) at zero. No one constant c assigned to 0/0 yields continuous values for both expressions.

## Strongest finite probe: CND-0101, CLM-0059 — exact grid clock-repair count

**Statement.** For \(n\ge2\), take an \(n\times n\) square *vertex* grid with antisymmetric oriented edge labels in \(\mathbb Z/3\). Suppose each counterclockwise elementary square boundary has signed label sum \(+1\). Erase the fewest edges necessary to admit phases \(x_v\in\mathbb Z/3\) with \(x_v-x_u=d_{uv}\) on each retained edge. The number is
\[
\boxed{D(n)=\left\lceil\frac{2(n-1)^2}{3}\right\rceil}.
\]
No claim of new priority or open status.

**Nonvacuity:** label east-directed horizontal edges at height \(j\) by \(-j\pmod3\), north-directed vertical edges by zero; each counterclockwise unit-square sum is \(+1\). Any two labelings with the same square flux differ by a gradient on this simply connected grid, so deletion optimum depends only on flux, not on representatives (the graph-cycle integration criterion above).

**Lower bound:** set \(m=n-1\), \(F=m^2\). Before deletion there are \(F\) bounded faces. After any edge deletions, every bounded face of the remaining planar graph comprises a union of original unit squares. Its oriented boundary flux is exactly its **number of unit squares modulo 3**, since contributions of internal cell boundaries cancel. Global phase consistency therefore requires every bounded face to contain a multiple of three original cells. Each bounded face thus covers at least three disjoint cells, so at most \(\lfloor F/3\rfloor\) bounded faces can remain. Removing one primal edge decreases the bounded face count by at most one (and can leave it unchanged if a bridge), so at least
\[
F-\lfloor F/3\rfloor=\lceil 2F/3\rceil
\]
deletions are necessary.

**Construction:** If \(m=3k\), tile the \(m\times m\) original face-cells by horizontal trominoes. If \(m=3k+1\), leave the upper-left *corner cell* aside; the rest is partitioned into top row minus corner of length \(3k\), left column minus corner of length \(3k\), and a \((3k)\times(3k)\) square, all tileable by straight trominoes. If \(m=3k+2\), leave that corner aside and take the other three cells of the upper-left 2-by-2 block as one L tromino. The remaining top two rows to the right have width \(3k\) and the lower \(3k\) rows have full width \(m\), tileable in triples. For each connected triple delete its two *internal* primal edges to merge it into one face; if a corner was left aside, delete one exterior boundary edge of that corner to merge it with the unbounded face. All surviving bounded faces are 3-cell regions with flux \(3=0\pmod3\). Since bounded face boundaries generate the cycle space of a planar graph, *all* retained cycles have zero flux and therefore admit phases. Exactly \(2\lfloor F/3\rfloor+(F\bmod3)=\lceil2F/3\rceil\) edges are erased. This covers \(m=1,2\) too. QED.

**Two distinct attacks:** a signed-cycle obstruction establishes necessity; the independent planar face bound plus explicit casewise tromino tiling establishes optimality. Both succeed, so it fails the **hard/open-problem gate** and is permanently KILLED_EASY. Earlier gain-graph/general frustration literature (SRC-0044, SRC-0051, SRC-0054) is background only, not proof that this exact numerical formula is either original or already printed.

## Limits

All 17 statements receive direct symbolic resolution or specific known-source match. No CAM-0003 registered, no computation run, no independent referee, no formally checked Lean proof and no physical time-dilation or neuroscience inference. Exact literature queries, UNKNOWN totals and unsearched native databases in S007/NOVELTY_QUERIES.md; no claim of original or difficult open questions.
