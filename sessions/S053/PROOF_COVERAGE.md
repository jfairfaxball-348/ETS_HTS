# S053 PROOF_COVERAGE — all five original targets kernel verified

Source head `319e35b113772651381387772d3a667b0557f26c`: final code-head PR [Lean 38888429613](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38888429613), job `116931774508`, **SUCCESS**; separate governance `38888429581` **SUCCESS**. The final documentary PR-head and merged-main runs remain independent integration requirements and are recorded in PR65 history, not predicted here.

New rooted, compiled declarations:

- `s053_not_positive_barycentre`: strict exposure excludes positive affine barycentres of other original sites.
- `s053_opposite_sides_cross`: original four-site opposite strict determinant sides force proper crossing, using original openSegment witnesses.
- `s053_edge_in_one_half`: original planeEdges forbids a genuine edge mixing the two strict sides of a present chord; shared endpoints lie in the closed halves.
- `s053_restriction_split`: original edge restrictions cover H and their intersection is exactly the singleton containing the present splitting chord.
- `s053_three_site_cap`: at most the three genuine triangle edges.
- `s053_hull_incident_card` and `s053_hull_only_card`: explicit incident bound of two, then double incidence count giving at most T.card hull edges.
- `s053_genuine_outerplanar_cap`: unconditional original supported/genuine noncrossing bound H.card ≤ 2*T.card−3 for all strictly convex finite T with at least three sites. Strong induction splits at a genuine non-hull chord into two proper original subsets; exact size and overlap identities close the arithmetic.
- **`theorem clm0099_exact : CLM0099`**: literal unchanged original iff, instantiated from S052's bridge, closing the sole remaining direct theorem.

Root `#print axioms` for every new theorem, including `clm0099_exact`, is exactly `[propext, Classical.choice, Quot.sound]`. All five original exact declarations are printed in CODE_HEAD_AXIOMS.txt. No custom axiom, proof hole, mathematical native computation, hidden cap assumption, extra parameter or weakened theorem.

**Direct original coverage: 5/5.** CLM0096, CLM0099, CLM0102, CLM0107 and CLM0108 are all compiled literal theorems. Frozen Definitions blob `f5e71b625bdbf40f6c84551dd93f9ce375154519` and Targets blob `e12f117589b1852e06aa669a405a6dc3ee652549` unchanged. Historical novelty/priority and external publication are separate questions; S053 performs no publication.

Traceable hosted passes: first separation candidate exposed an algebra normalisation issue; the second pass verified separation and edge splitting (Lean38887883578 SUCCESS). Counting passes repaired an explicit missing module import and endpoint substitutions; Lean38888311981 SUCCESS verified the cap and exact CLM0099. The final code-head additionally verifies the requested global hull-only incidence count and uses it directly in the cap (Lean38888429613 SUCCESS). Corrective commits preserve ordinary ancestry without force-push.
