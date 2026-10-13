# S012 mathematics — four independent kills, not new theorems

The four questions are fully specified in catalogue/CANDIDATES.json and as follows. School-level formulations refer to pure mathematical models, not empirical time, neuroscience or cosmology. No numeric searches were executed.

## CND-0116 / CLM-0077 — square-triangular pulse collision
**Question:** Let one ideal clock ring at minutes n^2 (n=1,2,...) and another at minutes m(m+1)/2 (m=1,2,...). Are there infinitely many positive integer minutes at which both ring?
**Plain language:** One clock rings at square-numbered minutes, and the other at triangular-numbered minutes. Will they ring together infinitely often?
**Resolution:** Put X=2m+1 and Y=n. The equality n²=m(m+1)/2 is equivalent to X²−8Y²=1 with X odd. Starting (X,Y)=(3,1), map (X,Y)↦(3X+8Y,X+3Y); this preserves X²−8Y², positive integrality and odd X, and strictly increases both coordinates. Hence infinitely many positive common minutes; 1,36,1225,... are already OEIS A001110.
**Status:** KILLED_KNOWN (KNOWN_EXACT). **Reason for permanent kill:** Exact square-triangular numbers OEIS A001110. Pell recurrence supplies infinitely many times; classical, not a novel oscillator question.
**Scope:** Human symbolic self-audit, no independent referee.

## CND-0117 / CLM-0078 — integer-radius lattice circle orbit
**Question:** Is there a positive integer R such that the Euclidean circle x²+y²=R² passes through exactly eight points (x,y) with integer coordinates?
**Plain language:** Can a circle of whole-number radius pass through exactly eight grid points?
**Resolution:** For R≥1, the four axis points (±R,0),(0,±R) are distinct. At any other integer solution x,y are both nonzero; |x|=|y| would imply R²=2x², impossible for positive integer R (irrationality of √2). The eight distinct sign-and-coordinate-swap images of (x,y) form one orbit. Thus the number of lattice points equals 4+8k (finite because |x|,|y|≤R), never 8. R=1 illustrates four.
**Status:** KILLED_EASY (NOT_SEARCHED). **Reason for permanent kill:** Exactly four axis points; every other integer point has a symmetry orbit of size eight, hence the number is 4 modulo 8 and never eight.
**Scope:** Human symbolic self-audit, no independent referee.

## CND-0118 / CLM-0079 — undirected majority pulse eventual short cycle
**Question:** On any finite undirected simple graph, colour each vertex 0 or 1. Simultaneously each tick, a vertex changes to the strict majority colour among its neighbours, retaining its current colour on a tie. Must the sequence of entire graph colourings eventually repeat with period at most two?
**Plain language:** If everyone follows the majority of their neighbours at each beat, can the whole group ever settle into a loop longer than two beats?
**Resolution:** Writing colours x_i∈{0,1} and degree d_i, the update is x_i'=1 iff 2·∑_{j~i}x_j+x_i≥d_i+1. This formula handles odd degrees, even-degree ties, and isolated vertices. It is a binary threshold rule with symmetric coefficients A_ij=2 for adjacent distinct vertices and A_ii=1; Goles–Olivos 1980 abstract expressly states that iterations of symmetric threshold functions end at a fixed point or a period-two cycle. The paper's full proof was not read; the programme does not claim an independent proof.
**Status:** KILLED_KNOWN (KNOWN_VARIANT). **Reason for permanent kill:** The symmetric-threshold theorem of Goles–Olivos (1980) states fixed points or 2-cycles; the tie-hold update embeds using symmetric neighbour weight 2 and diagonal self-weight 1. No original result established.
**Scope:** External author-institution ABSTRACT inspected, not full proof; explicit threshold encoding independently checked.

## CND-0119 / CLM-0080 — unbounded pauses and reciprocal convergence
**Question:** For every strictly increasing sequence of positive integers a_1,a_2,... with a_(n+1)−a_n→∞, must the infinite series ∑_(n=1)^∞ 1/a_n converge?
**Plain language:** If the gaps between chosen whole numbers grow without bound, must the sum of their reciprocals have a finite total?
**Resolution:** Let a_n=∑_{k=1}^n⌈log₂(k+1)⌉. Then a_(n+1)−a_n=⌈log₂(n+2)⌉→∞, while for 2^j≤n<2^(j+1), each summand in a_n is at most j+2; hence a_n≤n(j+2)<2^(j+1)(j+2). There are 2^j such n, so their reciprocal sum exceeds 1/[2(j+2)]. Summing over j≥1 diverges by comparison with the harmonic series. All a_n are positive strictly increasing integers.
**Status:** KILLED_FALSE/DEGENERATE (NOT_SEARCHED). **Reason for permanent kill:** Take a_n=∑_(k=1)^n ⌈log₂(k+1)⌉; gaps grow to infinity, but dyadic blocks show ∑1/a_n diverges.
**Scope:** Human symbolic self-audit, no independent referee.

## Cross-family dissimilarity and adversarial checks
CND-0116 asks an intersection of two *nonperiodic* event sets, not CND-0111's CRT for periodic schedules. Pell arithmetic is substantive but exact prior art (SRC-0063). CND-0117 asks discrete integer incidences under eightfold lattice symmetry; not S011's continuum area/perimeter argument. CND-0118 is symmetric and majority-driven with tie holding, rather than S008's directed three-phase chase or trivial finite-state periodicity: known 1980 two-cycle theorem applies via weight matrix. CND-0119 asks for reciprocal-series convergence under sparse integer selection; its counterexample uses controlled dyadic growth, not S008's Riemann sums.

No failed independent attacks occurred: each question had a decisive elementary proof, counterexample, or precise known reduction. External difficulty evidence is absent. No survivor or owner gate.