# S014 — FUTURE / UNEXECUTED: point-insertion geometry, nearest-two growth, and changing shape

**FUTURE — UNEXECUTED. Requires a new explicit owner invocation.** This document is an administrative OWNER STEER, not execution of S014. S013 remains the last completed scientific session. No selection, proof programme, external submissions, outreach, manuscript, Lean or Palomar is authorised.

## Binding entry and integrity checks

At S014 entry, independently pin live main SHA and tree; list branches, PRs, rulesets/protection and actual checks/workflows. Reconstruct S013's single authored sole-parent commit, ordinary non-draft PR #14 and non-force ordered two-parent merge, and ensure no concurrent/incomplete S014 exists. S012 PR #13 had a research commit *followed by* a CI-only repair; preserve that nuance. Expected scientific state, until independently revalidated: **CND124, all KILLED; SRC67, CLM85, CAM3, zero TRIAGED/SURVIVING**. CAM-0003 FAILED/PARTIAL 37/54 stays frozen; CAM-0004 remains NOT registered/executed. This administrative steer neither consumes an ID nor opens a mathematical session.

## PRIMARY RESEARCH TARGET — the owner's evolving triangle idea

Owner's 2026-10-14 insight: begin with a triangle. Add a point anywhere inside or outside; connect it to its nearest two existing corners, often suggesting a fourth side, then a fifth, etc. A point along an existing side or its straight extension seems to change the angles rather than create the same new shape. Study whether interactions between **distance choice**, **straight-line topology**, **boundary vertex count** and **collinearity** lead to naturally stated, genuinely difficult mathematics. Preserve this origin/attribution and distinguish this concept from an already-known standard convex-hull or Euler formula.

**Do not assume the narrative is a theorem.** A single point has no direction, so "parallel to a line" requires a stated relation (e.g. collinear with the two endpoints of an existing side, on that segment, or on its ray extension). Explicitly decide what "shape", "corner", "existing line", "nearest", and "creates a side" mean. Fix tie-breaking for equidistant sites and specify duplicate points, intersection points, collinearity and coincident/overlapping segments. Compare three models, WITHOUT conflating them:

1. **Literal nearest-two growing straight-line graph (NG).** Begin with three noncollinear sites and triangle edges. At each step insert a fresh site P and join it to the two nearest *previous sites* by Euclidean length (deterministic tie break); keep all existing edges. This always produces an abstract connected graph with V=3+t, E=3+2t, cycle rank E−V+1=t+1 (when sites distinct, edges are distinct abstract pairs). But the drawing may cross existing edges or overlap in collinear cases; it need not be one simple polygon. If crossing-free and nonoverlapping, the planar embedding has t+1 bounded faces by Euler; no assertion about boundary side count follows.
2. **Single simple polygon boundary (SP).** To count an interior inserted point as a new *boundary* corner, replace ONE old edge UV by UP and PV, discarding UV, and require no self-intersections, nonzero new lengths and a consistently defined boundary. The two nearest sites might not be adjacent on the polygon, and even if adjacent, their insertion may cross another edge. This is NOT the same operation as retaining UV as in NG. Interior insertions may create a concave quadrilateral while the convex hull stays triangular. Collinear insertions on an existing segment subdivide it geometrically without introducing a genuine new corner if straight angles are suppressed; an extension is a different case.
3. **Convex hull (CH).** Define boundary as the convex hull of all arrived sites, vertices only at strict turns. Interior and segment-interior arrivals do not increase hull vertices; exterior arrivals insert P but can erase one or more earlier hull vertices. Connection points are the **supporting/tangent vertices**, which need not be the two *nearest* sites. A ray-collinear exterior insertion may replace an old extreme vertex, without a new strict turn.

## Required initial falsification and calibration — KNOWN/SHORT, not new candidates

Verify all these with a geometric diagram or symbolic determinant, BEFORE any finite search. Keep proof/counterexample distinct from peer-reviewed novelty evidence:

- **One-step nearest-two failure.** A=(0,0), B=(10,0), C=(0,10), P=(12,2). P's two nearest corners are B and A (squared distances 8, 148, versus 208 to C). Segment PA intersects the old edge BC at (60/7,10/7), an interior crossing. Thus joining nearest two does NOT invariably grow a simple quadrilateral, even when P is exterior and noncollinear with all original edges. This is a deliberate *kill test*, not a new conjecture.
- **Interior vs outer boundary:** with A=(0,0), B=(10,0), C=(0,10) and P=(1,1), the convex hull has three corners; the NG operation splits the triangle into regions only when both added edges are crossing-free, while an SP insertion by edge replacement may yield a concave four-corner polygon.
- **Exterior vertex erasure:** with the same triangle and P=(-1,-1), original A lies strictly inside triangle PBC; the convex hull remains three-sided, even though P is new.
- **Straight-edge case:** putting P inside segment AB and *subdividing the edge* changes V by +1 and E by +1 (cycle rank / face count unchanged); this is not NG's unconditional add-two-edges rule. Treat an extension of AB separately. Prove using point location and precise geometric definitions.

Verify the graph-cycle calculation and the connected crossing-free Euler face increment as basic prior mathematical facts, not novelty. Record that 2-nearest-neighbour proximity graphs, order-2 Voronoi regions, incremental hulls, and polygonisation already have substantial literature, and the raw universal polygon assertion is FALSE.

## Research problem-generation programme for S014

After this free pre-kill, **prioritise one promising coupling**: when does an online nearest-two metric choice preserve a crossing-free growing polygon/plane graph, and what are the strongest inevitable crossing or boundary-loss phenomena when it fails? Generate 3–5 **materially distinct** precise, school-readable questions only after auditing the nearby work. Examples are *exploratory directions*, not yet registered candidate claims:

- A sharp condition on location of the next point (inside, outside, segment, extension) so the two nearest sites are also noncrossing admissible polygon neighbours; attempt a region description as an intersection of order-2 Voronoi cells and visibility wedges.
- Extremal worst-case and best-case crossing counts, order dependence and finite forbidden configurations for repeated NG insertions; what changes if placement is adversarial versus optimally ordered?
- Existence/obstruction for a deterministic **local repair rule** (selecting two visible adjacent vertices instead of simply two nearest) that grows a simple polygon while minimizing additional total length or displaced boundary corners. Specify exactly what local information is allowed; beware trivial convex-hull insertion and standard triangulation.
- Sharp interplay of collinearity, integer-grid placement, angle changes, hull corner loss and number of enclosed regions. Demand a mathematically *natural* second constraint, not a parameter tweak chosen solely to look difficult.

Compare NG, SP, CH **both ways**, including edge cases; test that removing either coupled constraint simplifies the task. Use counterexample-first geometry and paper-source-first novel-question selection. If every honest candidate is trivially settled or known, KILL all and reorient inside the same mathematical family; do not manufacture a survivor. Only then optionally resume the prior source-led broader coupled-mechanism programme.

## Mandatory two-pass source and hardness gates

The following are **prior-art starting points, not novelty certificates**; inspect originals and scope during authorised S014:
- Incremental convex hull and tangent/visible-edge updates: https://www.cs.cmu.edu/afs/cs/academic/class/15451-f19/www/LectureNotes/2D-ConvexHull.pdf and https://jeffe.cs.illinois.edu/teaching/compgeom/2008/notes/01-convexhull.pdf .
- Planar Euler invariants: https://discrete.openmathbooks.org/dmoi2/sec_planar.html .
- Ábrego et al., *On crossing numbers of geometric proximity graphs* (Computational Geometry 2011): https://doi.org/10.1016/j.comgeo.2010.11.003 .
- Order-2 Voronoi geometry: https://cw.fel.cvut.cz/b201/_media/courses/cg/lectures/07-voronoi-ii.pdf .

For every *actual new candidate*, allocate sequential **CND-0125 onward** even when killed, with exact quantifiers, plain version, status, source/claim references, and failed/decisive proof attacks. Only TRIAGED/SURVIVING after TWO genuinely failed **different** elementary approaches, independent evidence that the exact formulation is resistant, and source-native TWO-PASS priority coverage. Query or explicitly record UNKNOWN: OEIS terms+keywords, arXiv full-text, MathOverflow/Math StackExchange, Erdős Problems/OPG, Wikipedia, Guy/CFG/BMP/Kourovka, AMM/MM problem archives, original 2025–26 primary papers, Zenodo and GitHub repositories; plus computational-geometry proceedings and bibliography. Record literal strings, date/time, endpoint, hit count/UNKNOWN, access grades, reversible translations, and known differences. A search snippet is NOT primary-source inspection; no-hit is NOT a novelty claim.

Before ANY numerical experiment, preregister CAM-0004 with frozen code/hash, bounds, environment, stop condition and raw paths. Never backfill; preserve CAM-0003 files. Update all paired source/claim/candidate/CAM registries as actually used, S014 session mathematics, novelty queries, discovery/decision/failure/phase/session ledgers and STATE. Attempt actual checkout checker and unittest; otherwise archive exact blocker. Hosted CI validates **record format only**. One fresh isolated session branch / one atomic authored research commit, ordinary non-draft PR and non-force two-parent merge if actual validation permits; independently verify remote main/tree. Leave S015 FUTURE/UNEXECUTED, not executed.

No publication, formalisation, selected programme, external outreach or proof-research escalation without separate explicit owner approval.
