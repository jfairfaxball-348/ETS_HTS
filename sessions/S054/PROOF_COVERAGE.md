# S054 PROOF_COVERAGE — five original direct claims

| Immutable target | Literal kernel theorem | Location | Semantics |
|---|---|---|---|
| CLM0096 | `ETSHTS.clm0096_exact : CLM0096` | `ETSHTS/ConvexFourClassification.lean` | All noncollinear 3/4 sets |
| CLM0099 | `ETSHTS.clm0099_exact : CLM0099` | `ETSHTS/GenuineOuterplanarCap.lean` | Full iff / complete recursive certificate |
| CLM0102 | `ETSHTS.clm0102_exact : CLM0102` | `ETSHTS/Cutoff.lean` | Both derivatives, real short arcs, strict extension |
| CLM0107 | `ETSHTS.clm0107_exact : CLM0107` | `ETSHTS/CyclicCompetitorExact.lean` | All cardinalities, closed axis ratio, compulsory nearest predecessor edges |
| CLM0108 | `ETSHTS.clm0108_exact : CLM0108` | `ETSHTS/ExactNonround.lean` | Explicit nonround ellipse, all cardinalities |

**Coverage 5/5.** The exact root theorem axiom sets in both S053 final PR and independent merged-main logs are `[propext, Classical.choice, Quot.sound]` for each theorem; no `sorryAx` or new custom axiom. The S054 CI gate upgrades these evidence lines to enforced regressions. No mathematical source touched in S054.

The proof interface establishes: original Cartesian-lex tie semantics and Euclidean predecessor comparisons; original straight-edge retention and proper crossings; genuine-edge cap plus actual-last necessity; closed `a/b ≤ R` and arbitrary finite size; nonround all-n corollary. Nothing establishes sharpness of `R`, an external literature novelty verdict or a publication.
