# Owner steer — 2026-10-14: nearest-two point insertion and the evolving triangle

**ADMINISTRATIVE HANDOFF ONLY; S014 NOT EXECUTED.** Origin: owner's intuitive thought experiment on adding points to a triangle and joining to nearest two corners. Owner explicitly asks to change/add this target in upcoming S014. The binding expanded instructions are in [NEXT_SESSION_PROMPT](../authoritative/NEXT_SESSION_PROMPT.md). No CND/SRC/CLM/CAM has been registered or changed by this steering update. All examples are cheap **pre-kill calibrations**, not research novelty claims.

## Geometric semantics to separate

1. **A graph of lines:** keep original edges and attach P to two nearest older vertices. For t inserted distinct sites, V=3+t, E=3+2t, cycle-space dimension E−V+1=t+1. If the straight-line drawing is planar and nonoverlapping, exactly t+1 bounded faces follow from Euler. This has nothing to do with exterior polygon side count.
2. **A polygon through all arrived points:** replace an old edge UV by UP,PV if noncrossing; exterior and interior points can enter the boundary. Concavity is allowed; inserting an interior point by edge replacement often removes a notch of area. The nearest two old sites need not be a valid edge or viable replacement.
3. **A convex hull:** hull boundary may retain three corners after adding internal or exterior points, can gain one at an external point, or lose previously extreme corners. Nearest pair is *not* the same as tangent pair.

The user's phrase "parallel to or straight off one of its existing lines" is not a literal property of a point. Future formalisation must distinguish on-edge collinearity, prolongation of an edge, coincident points, and a line drawn parallel to an edge through P. All contain different degeneracies. Equal-distance nearest-neighbour ties require deterministic tie breaks.

## Exact one-point warnings (independent hand calculation)

Take A=(0,0), B=(10,0), C=(0,10). At P=(12,2), squared distances to B,A,C are respectively 8,148,208. The nearest pair is B,A. Yet segment P-A meets segment B-C at (60/7,10/7), interior to both; thus nearest-two does not even guarantee a plane embedding for the first new point. P=(1,1) is strictly inside ABC and leaves its convex hull as a triangle. P=(-1,-1) is exterior and puts A strictly inside PBC, leaving exactly 3 strict hull corners. P on open AB with edge subdivision gives ΔV=+1, ΔE=+1, Δbounded-faces=0; by contrast two added edges in a plane embedding give ΔV=+1, ΔE=+2, Δbounded-faces=+1.

The standard Euler and hull facts are not findings of a new open problem. The correct question-generation route is to couple *nearest-two distance decisions* with *noncrossing insertions / evolving boundary / collinearity* and aggressively verify that each variant is not already known or trivial.

## Prior art to inspect in the future S014 session

- [CMU incremental convex hull lecture](https://www.cs.cmu.edu/afs/cs/academic/class/15451-f19/www/LectureNotes/2D-ConvexHull.pdf): visible chain and supporting edges.
- [Illinois convex hull lecture](https://jeffe.cs.illinois.edu/teaching/compgeom/2008/notes/01-convexhull.pdf): randomized incremental hull.
- [Open Mathematics planar Euler exposition](https://discrete.openmathbooks.org/dmoi2/sec_planar.html): face invariant.
- [Ábrego et al. (2011), crossing numbers of geometric proximity graphs](https://doi.org/10.1016/j.comgeo.2010.11.003): nearest-neighbour proximity crossings.
- [Second-order Voronoi lecture](https://cw.fel.cvut.cz/b201/_media/courses/cg/lectures/07-voronoi-ii.pdf): regions selecting nearest two sites.

These are research orientation links, not new registered SRC IDs or evidence of full literature coverage. S014 remains future and separately owner-gated.
