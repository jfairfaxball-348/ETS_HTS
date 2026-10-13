# S008 comparative discovery report

**Net: 9 CND (0102..0110); 8 killed immediately; 1 GENERATED (CND-0109), zero TRIAGED/SURVIVING/SELECTED.** Cumulative 110, killed 109, generated 1; SRC 57, CLM 67, CAM 2 unchanged.

| Mechanism | Candidate | Mathematical verdict | Independent difficulty | Novelty grade / action |
|---|---|---|---|---|
| Alternating checkerboard flux | CND-0102 | Exact ceil(m²/2) proved by face bound and domino tiling | NONE (two successful arguments) | KILLED_EASY |
| Arbitrary square flux | CND-0103 | Two-way equality with MAX-2-LIN(Z3), dual connected partition | General difficulty not inherited by subclass | KILLED_EQUIVALENT |
| Linear clock drift | CND-0104 | Two independent cycle-balance conditions | NONE | KILLED_EQUIVALENT |
| Two forced boundary clocks | CND-0105 | Two-way equality to min s-t edge cut | NONE | KILLED_EQUIVALENT |
| Three forced boundary clocks | CND-0106 | Two-way equality to 3-way cut; planar fixed k already tractable | Not a fresh hardness claim | KILLED_EQUIVALENT |
| Simultaneous chase oscillator | CND-0107 | 3-cycle perpetual rotation refutes synchronization | NONE | KILLED_FALSE/DEGENERATE |
| P-periodic finite updates | CND-0108 | finite pigeonhole eventual period bound | NONE | KILLED_EASY |
| Single flipped checkerboard cell | CND-0109 | Precisely defined **UNRESOLVED GENERATED ONLY** | NONE; two failed attacks not documented, no hardness | SHALLOW_SEARCH_NO_HIT only; deep native unfinished |
| Triangular-row sums | CND-0110 | elementary Riemann-sum threshold at p=1 | NONE | KILLED_EASY |

**Decision:** S009 should confront the CND-0109 defect directly: derive sharp bounds from charged dual connected partitions, try a tiling/matching correction, and test bidirectional translations against specific theorems **before** any preregistered finite exhaustive CAM. If it dies, retain kill and regenerate; otherwise only TRIAGED after two distinct failed attacks and independent difficulty evidence. Zero S008 scientific computations; no claim that 0109 is new, hard or open.
