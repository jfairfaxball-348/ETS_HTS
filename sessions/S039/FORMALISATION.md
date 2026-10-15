# S039 — strict Lean partial result, exact edge-counting step

The mathematical proof is unchanged. The unchanged source of the assertion `exactlyTwoNearest` supplies two distinct predecessors, even in Euclidean distance ties resolved by Cartesian lex order.

* `s039_insert_edges_supported` shows every new edge is supported by the old sites together with the current vertex, assuming the old graph was similarly supported.
* `s039_fresh_insert_two_edges` shows an arrival absent from the old finite site set contributes **exactly two** fresh edges under the unchanged mandatory selector and inherited endpoint-support invariant. This rules out duplicates within the new pair and membership in the old graph.

These are local preconditions for the global `2n-3` induction; they do not establish freshness from the complete ordered `List.Nodup` history, outerplanar extremality or either implication of full CLM0099 for card≥4. They do not close CLM0096, CLM0107 or CLM0108. No alteration of `ETSHTS/Targets.lean` or theorem mathematical strategy. Source proof terms require new GitHub CI for compiler/kernel certification.
