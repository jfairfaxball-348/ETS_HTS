# S050 PLAN — complete one immutable exact theorem

1. Verify live normal S049 integration, original frozen source blobs, exact `clm0107_exact` source, and previously proved `ellipse_ratio_101_le_R` and `clm0108_of_clm0107`.
2. Fresh branch `session/S050-clm0108-exact-nonround`. Add `ETSHTS/ExactNonround.lean`, proving precisely `theorem clm0108_exact : CLM0108 := clm0108_of_clm0107 clm0107_exact`; do not weaken definitions or add premises.
3. Import into `ETSHTS.lean`, append `#print axioms ETSHTS.clm0108_exact`, require kernel compilation with only usual standard axioms. Validate root, no forbidden holes.
4. Archive source coverage/CI/proof dependency and mark exactly four original claims (0096,0102,0107,0108) verified **only once CI succeeds**.
5. Author FUTURE/UNEXECUTED S051 focused on original `CLM0099` necessity, preserving actual chronological last insertion; do not prove or run it in S050. Standard PR, both final PR-head checks and independent merged-main checks required.
