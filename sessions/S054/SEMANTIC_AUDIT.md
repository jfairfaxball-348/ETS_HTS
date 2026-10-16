# S054 SEMANTIC_AUDIT — original claims compared with proofs

**Verdict: PASS, conditional solely on final S054 CI/integration replay.** This is a source-level identity and proof-interface audit, not an external peer review or proof of historical novelty. No theorem definitions or Lean proof modules are changed in S054.

## Immutable reference and exact types

- `ETSHTS/Definitions.lean` original blob `f5e71b625bdbf40f6c84551dd93f9ce375154519`.
- `ETSHTS/Targets.lean` original blob `e12f117589b1852e06aa669a405a6dc3ee652549`.
- `clm0096_exact : CLM0096` in `ConvexFourClassification.lean`: **every** `Finset Point` of cardinality 3 or 4 with no three collinear, including inside-triangle and exposed-convex cases. No generic-position tightening to all-convex cases.
- `clm0099_exact : CLM0099` in `GenuineOuterplanarCap.lean`: **iff** for every finite strictly-exposed `S` with `card ≥ 3`, not only sufficiency. The certificate is recursively full, with a valid exact-nearest ear at each deletion.
- `clm0102_exact : CLM0102` in `Cutoff.lean`: two signed outward endpoint derivatives and strict chord extension on *any real unwrapped arc* shorter than `lambda`, no hidden separation bound.
- `clm0107_exact : CLM0107` in `CyclicCompetitorExact.lean`: all finite distinct boundary subsets with `card ≥ 3`, all `0 < b ≤ a`, **closed** `a/b ≤ R` including equality; no upper bound on cardinality or minimum spacing, and no irrational/phase-generic assumption.
- `clm0108_exact : CLM0108` in `ExactNonround.lean`: universal *every finite site-set* on ellipse with semiaxes `101/100, 1` and strict inequality `1 < 101/100`.

## Original semantics preserved

`Point = ℝ × ℝ`; `sqDist` is Cartesian Euclidean squared distance, so all `priority` ranking is exact squared-distance followed by Cartesian lexicographic order of competing predecessors. `exactlyTwoNearest` fixes exactly two distinct least-ranked predecessors. `Grow` begins at three distinct sites with all three triangle edges, makes the two compulsory edges on each fresh arrival and retains all existing edges through union; `planeEdges` forbids proper crossings of independent *original open straight segments*. The total order is a NoDup list covering the actual finite `S`. There is no substitution of nearest global neighbours, relaxed insertion, round-circle metric or edge-deletion freedom.

The CLM0099 converse uses the **actual last** member of a given chronological `Grow` witness, not any independently removable vertex. Original edge counting is `2|S|−3`; hull-side saturation follows from a cap for original `H : Finset Edge` together with separately proved genuine-two-distinct-endpoints and support invariants. The cap does **not** falsely apply to arbitrary empty/singleton edges merely satisfying `planeEdges`. The S053 splitting proof uses the original orientation, original `openSegment` intersection, actual present splitting chord, two proper original vertex subsets, original edge restrictions and singleton overlap. Its hull-only branch double-counts original genuine incidences. The reverse direction reinserts a *complete* valid metric-ear certificate, keeping original edges.

The CLM0107 all-cardinality proof instantiates a direct ≥5 original-site `metricEar` theorem plus the genuine 3/4-point tail theorem, relying on the minimised **Euclidean skip chord among eligible gaps**, real-lift short-direction bounds and closed central band; it does not derive its claim from the incomplete CLM0099 necessity direction. CLM0108 instantiates CLM0107 and the exact rational ratio lemma.

S020/S021 remain frozen; `R = sqrt(2/sin(2π/5) − 1)` is sufficient, **not claimed optimal**. This programme does not establish novelty, peer review or publication by Lean compilation.
