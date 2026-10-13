# S008 mathematics — 2026-10-13

**No new hard/open/novel problem certified.** The CND-0102..0110 investigation is mathematical only, not a model of relativity, biological EEG, or measured physical synchronization. No CAM mathematical experiment was run.

## Exact nonuniform checkerboard result — CND-0102 / CLM-0060

Let m>=1 and F=m². The open-boundary square grid consists of (m+1)² vertices and F original bounded square faces. Give each face flux +1 or -1 in Z/3 alternating by row and column; antisymmetric directed edge offsets exist and flux completely determines their gauge equivalence because the original grid is simply connected (subtract representative labelings and integrate zero-flux edges). We may delete primal edges, seeking vertex phases x with x_v-x_u=d_uv on all remaining edges.

If remaining comparisons are consistent, each remaining bounded face has zero flux. It is a union of original cells, so no such face can be one cell: each original cell has nonzero flux. Thus at most floor(F/2) bounded faces remain. Each erased edge can reduce bounded-face count by at most one (a bridge deletion reduces it by zero). Therefore at least F-floor(F/2)=ceil(F/2) edges must be deleted.

For m even, partition all faces into adjacent horizontal 2-cell dominoes. For m odd, send one corner original face to the exterior by erasing its outside boundary edge, then tile the top row minus this corner and left column minus this corner with pairs, and the remaining (m-1) by (m-1) square with pairs. In both cases every domino joins neighbouring squares of opposite flux; remove the primal edge separating its cells, exactly one per domino. Every retained bounded face has flux +1-1=0 mod3. Bounded facial cycles generate the cycle space even when bridges or isolated vertices are present; integrate phases per retained component. There are F/2 deletions if F even and (F-1)/2+1 if odd, matching the lower bound. This covers m=1. Hence **D_checker(m)=ceil(m²/2)**. A self-contained finite argument, not a priority claim; it is KILLED_EASY.

## Arbitrary flux: exact two-way reduction — CND-0103 / CLM-0061

For any finite graph G with edge requests d_uv∈Z/3, define DEL as fewest edges to remove to get consistent x, and VIOL as min over all vertex assignments x of the number of edges where x_v-x_u!=d_uv. An assignment x gives a feasible deletion set consisting of precisely its violated edges, so DEL<=VIOL. Conversely any feasible deletion set D admits a phase assignment on every retained component by assumption, with arbitrary choices on isolated vertices. Every violation of this phase assignment is in D, so VIOL<=|D|. Taking optimal D gives VIOL<=DEL. Therefore **DEL=VIOL**, including empty graphs, disconnected graphs, isolated vertices, and boundary-free shifts. This is exactly finite MAX-2-LIN over Z/3, not a novel clock/dynamical problem. A restricted special flux might still warrant separate scrutiny; unrestricted NP-hardness, where established, is not a proof of hardness for the given grid subclass.

### Planar dual face partition equivalence, boundary included

Let the original connected plane grid have F elementary bounded faces and one exterior face. Mark each dual face-vertex by its original flux, and assign arbitrary exterior label (not constrained). Erasing a primal edge merges the two incident regions precisely when its dual edge connects distinct current dual components; a primal bridge gives a dual loop and changes no face. Feasibility means **each dual component not containing the exterior has total charge 0 mod3**. In an optimal deletion set, remove redundant dual cycles to obtain a forest on all F+1 dual vertices (otherwise reinstate an erased primal bridge without changing facial constraints). Thus the optimum equals F+1-K where K is the **maximum number of connected blocks** partitioning the dual vertices so that all blocks except the one with exterior vertex have zero total charge. Conversely choose a dual spanning tree of each such block, erase the corresponding primal edges, and every retained bounded face has flux zero; cycle-space integration supplies phases. Components consisting of single zero-flux faces and the exterior-only singleton are explicitly allowed. This is a geometric formulation **of the same** frustration optimization, not a separate unexplored hardness claim.

## Affine drift is two ordinary balances — CND-0104 / CLM-0062

Fix d_uv(t)=a_uv+t*b_uv mod3 for all t>=0. Summing each edge demand around a cycle at t=0 forces sum_cycle a=0; comparing t=1 with t=0 forces sum_cycle b=0. Conversely, if both are balanced, integrate a and b along a spanning forest to u_v and w_v separately, then x_v(t)=u_v+t*w_v satisfies every edge at every t. One free additive origin for each component for u and w; isolated vertices arbitrary. Both directions include empty or acyclic graphs. This is not a genuinely new dynamical phenomenon (just two static gain-graph conditions).

## Prescribed boundaries are graph cuts — CND-0105/0106 / CLM-0063/0064

All edge requests are zero. For two terminals s,t with fixed unequal phases, any retained s-t path is impossible, so all valid deletion sets are s-t cuts; conversely after a min cut, label each surviving component by its terminal's value or arbitrarily if none, including isolated vertices. DEL equals ordinary min s-t cut. For three distinct terminals given 0,1,2 the identical argument proves equality with three-terminal **multiway cut** on the same graph in both directions. Dahlhaus et al. (SRC-0055, publisher abstract) establish the general-graph complexity distinction and polynomial-time fixed-k planar case. Therefore do NOT advertise three-terminal grid hardness based on general NP-hardness.

## Truly specified pulse-update process — CND-0107 / CLM-0065

Directed G, state x_v(t)∈Z/3. Simultaneous discrete updates: x_v(t+1)=x_v(t)+1 if at least one outgoing neighbour u satisfies x_u(t)=x_v(t)+1 mod3; otherwise it stays. No delays, no physical interpretation, isolated vertices stay. Success means **all phases equal at some finite t**. Universal synchronization is FALSE: on directed 3-cycle v0→v1→v2→v0, begin x(0)=(0,1,2). Every vertex sees its successor exactly one tick ahead; all three advance at every t, preserving unequal differences forever. Not a claim about every tree or a random update schedule; separate systems must be separately posed.

## General periodic schedule — CND-0108 / CLM-0066

For v vertices each with one of 3 states, take P deterministic global update functions f0,...,f_(P-1), called in periodic order. A configuration and clock index (x,t mod P) form a state in a finite set of size P*3^v. The transition is a deterministic function on this augmented set. Among P*3^v+1 successive observations some state repeats, and thereafter the sequence is periodic with cycle length at most P*3^v. Isolated vertices and any local or nonlocal rules are included. Eventual periodicity alone neither proves consensus nor bounded transient independent of v. Easy pigeonhole kill.

## Explicit **GENERATED** unresolved probe — CND-0109 (NO claim)

Choose m≥2 and (i,j) in its m×m face grid. Give face (r,c) charge (-1)^(r+c)∈Z/3, **except flip** charge at (i,j). Let D(m,i,j) be the minimum number of edges whose deletion allows phases on the remainder. This is precise and finite; representative choices do not affect D (gauge). The checkerboard domino construction no longer automatically makes all charges cancel when one sign is flipped, so a local correction might depend on the defect's position. But the dual-block formulation above already reduces its computation to a special gain-graph frustration instance. No matching formula, hard family, counterexample or independence from known results is established here. Neither of the two substantial failed-attack plus independent-hardness requirements is satisfied; keep GENERATED, NOT TRIAGED/SURVIVING. S009 must **first attempt to eliminate** by a sharp construction or known theorem, not promote on excitement.

## Triangular-row finite threshold — CND-0110 / CLM-0067

For p∈R, A_n(p)=sum_{k=1}^n (n+k)^(-p)=n^(1-p)*[(1/n) sum_{k=1}^n(1+k/n)^(-p)]. The bracket converges to the positive finite integral ∫_0^1(1+x)^(-p)dx by Riemann sums. So A_n→0 for p>1, A_n(1)→log2, A_n→+∞ for p<1. No mysterious convergence threshold or open question remains.

**Verification limits:** human arguments only; no local checkout tests or computational mathematics CAM; all first-pass relevant citations are graded; full-text/bibliographic novelty and exact single-defect prior-art review incomplete.
