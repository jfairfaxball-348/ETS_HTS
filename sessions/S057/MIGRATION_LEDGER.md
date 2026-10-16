# S057 — exact source inventory and compiler migration ledger

Experiment script: scripts/s057_try_modern_port.py, pinned run workflow .github/workflows/s057-port.yml. The 77 substantive files below are all enumerated and edited by the actual script in a disposable GitHub runner checkout; lakefile.lean is the separately handled 78th Lean file. File paths are preserved (no aliases/hidden source). The script preprends module, publicises imports, and uses an exposed public section; it pins Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679 and requires real lake update/build/cache and five exact axiom checks before writing any modified source to the branch. The protected build gate never passed, so changes below are experimental transformations, NOT committed successfully compiled modern sources.

Compiler-guided repairs attempted: Cutoff old Real.arctan_lt_arctan / arctan_le_arctan renamed to monotonicity APIs; CyclicGapObstruction witness s033_v/u/x visibility raised to public for exported theorem; RationalChord s034_X/Y/D raised similarly; EarSufficiency Finset.not_mem_erase replacement, nonlooping list/Finset membership proof and revised disjointness proof. All claims remain mathematically unchanged. Sixth run still fails at EarSufficiency. Nonmath visibility changes and tactic repairs are not assumed valid without successful compiler proof. Full modern source build and axiom audit FAIL/NOT_RUN, respectively.

## All original project source files (1:1 migration script input)
01. ETSHTS.lean
02. ETSHTS/ActualLastNecessity.lean
03. ETSHTS/AnalyticBounds.lean
04. ETSHTS/AngularCutoff.lean
05. ETSHTS/CentralChordBand.lean
06. ETSHTS/CentralCutoffIdentity.lean
07. ETSHTS/CentralOriginalSites.lean
08. ETSHTS/CentralRatio.lean
09. ETSHTS/CertificateCases.lean
10. ETSHTS/CompetitorPhaseIndex.lean
11. ETSHTS/ConvexChordSeparation.lean
12. ETSHTS/ConvexFourBarycentric.lean
13. ETSHTS/ConvexFourClassification.lean
14. ETSHTS/ConvexFourExact.lean
15. ETSHTS/ConvexFourGeometry.lean
16. ETSHTS/ConvexFourHull.lean
17. ETSHTS/ConvexFourOrder.lean
18. ETSHTS/ConvexFourSelector.lean
19. ETSHTS/Cutoff.lean
20. ETSHTS/CyclicCompetitorBackwardIndex.lean
21. ETSHTS/CyclicCompetitorBands.lean
22. ETSHTS/CyclicCompetitorExact.lean
23. ETSHTS/CyclicCompetitorLifts.lean
24. ETSHTS/CyclicCompetitorRank.lean
25. ETSHTS/CyclicCompetitorReverseBand.lean
26. ETSHTS/CyclicEllipseHull.lean
27. ETSHTS/CyclicEllipseHullSides.lean
28. ETSHTS/CyclicEllipseIncident.lean
29. ETSHTS/CyclicEllipseMembership.lean
30. ETSHTS/CyclicEllipseNeighbourBridge.lean
31. ETSHTS/CyclicEllipseOrientation.lean
32. ETSHTS/CyclicEllipsePhase.lean
33. ETSHTS/CyclicEllipseSkip.lean
34. ETSHTS/CyclicFinite.lean
35. ETSHTS/CyclicGapObstruction.lean
36. ETSHTS/Definitions.lean
37. ETSHTS/Derivatives.lean
38. ETSHTS/EarCounting.lean
39. ETSHTS/EarFramework.lean
40. ETSHTS/EarInduction.lean
41. ETSHTS/EarSufficiency.lean
42. ETSHTS/EligibleSkip.lean
43. ETSHTS/EllipseConvex.lean
44. ETSHTS/EuclideanChord.lean
45. ETSHTS/ExactNonround.lean
46. ETSHTS/FiniteEllipsePhase.lean
47. ETSHTS/FiniteHullNeighbours.lean
48. ETSHTS/Foundation.lean
49. ETSHTS/FourPoint.lean
50. ETSHTS/FourTailBridge.lean
51. ETSHTS/GenuineEdges.lean
52. ETSHTS/GenuineOuterplanarCap.lean
53. ETSHTS/GlobalCount.lean
54. ETSHTS/GrowCounting.lean
55. ETSHTS/HalfAngle.lean
56. ETSHTS/HereditaryGeometry.lean
57. ETSHTS/HullInsertion.lean
58. ETSHTS/HullLastBridge.lean
59. ETSHTS/HullSaturation.lean
60. ETSHTS/HullShield.lean
61. ETSHTS/LastArrival.lean
62. ETSHTS/LastOrder.lean
63. ETSHTS/NecessityInduction.lean
64. ETSHTS/NoThreeCollinear.lean
65. ETSHTS/OuterplanarEdgeSplit.lean
66. ETSHTS/OuterplanarSplit.lean
67. ETSHTS/Partial.lean
68. ETSHTS/QuantitativeSkip.lean
69. ETSHTS/RatioWindow.lean
70. ETSHTS/RationalBound.lean
71. ETSHTS/RationalChord.lean
72. ETSHTS/ShortArcLifts.lean
73. ETSHTS/Targets.lean
74. ETSHTS/ThreePredecessors.lean
75. ETSHTS/TriangleInterior.lean
76. ETSHTS/TriangleInteriorExact.lean
77. ETSHTS/TriangleInteriorOrder.lean

The only other .lean source is lakefile.lean, exempt from module-header requirement but still subject to physical line cap. No source-hidden wrapper or solver replacement was introduced.
