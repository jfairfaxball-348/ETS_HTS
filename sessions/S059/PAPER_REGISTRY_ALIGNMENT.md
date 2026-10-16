# S059 paper ↔ registry ↔ five exact Lean theorems

Working common title: **Noncrossing Two-Nearest-Predecessor Orders on Nearly Circular Ellipses**. This is a prospective manuscript title, not evidence a paper exists. The root `formalization.yaml` description is the prospective public abstract. No observed Palomar registered entry or LaTeX-rendering behaviour exists.

Let `R = sqrt(2/sin(2*pi/5) - 1)`. **Main theorem** (CLM0107): for each `0 < b <= a` with `a/b <= R` and every finite set S of **at least three distinct** points on the ellipse with semiaxes a,b, there is an initial triangle and then a retained straight-line planar/noncrossing order, connecting each inserted vertex to **exactly its two Euclidean nearest earlier vertices**, breaking equal squared-distance predecessor ties by **Cartesian lexicographic order**. Old edges remain. This covers equality `a/b = R`, every cardinality, arbitrarily close distinct sites; no positive separation bound. No claim of threshold sharpness or historical first priority.

| Prospective paper result | Registry abstract / Challenge | Exact Lean theorem | Source module |
| --- | --- | --- | --- |
| Complete no-three-collinear three/four-site cases | Supportive base cases, selected Comparator root | `ETSHTS.clm0096_exact : CLM0096` | `ETSHTS.ConvexFourClassification` |
| Strict-convex-position order iff full recursive metric-ear certificate | Supportive structural iff, both directions | `ETSHTS.clm0099_exact : CLM0099` | `ETSHTS.GenuineOuterplanarCap` |
| Both outward endpoint chord-derivative signs and strict short-arc extension | Supporting exact analytic estimate | `ETSHTS.clm0102_exact : CLM0102` | `ETSHTS.Cutoff` |
| Closed threshold R, finite all-cardinality noncrossing two-nearest retained insertion | Lead theorem and formula | `ETSHTS.clm0107_exact : CLM0107` | `ETSHTS.CyclicCompetitorExact` |
| Nonround ellipse a/b=101/100 at all finite cardinalities | Explicit noncircular corollary | `ETSHTS.clm0108_exact : CLM0108` | `ETSHTS.ExactNonround` |

`Challenge.lean` imports trusted Mathlib only and copies the frozen definitions and targets, exposing five untrusted statement placeholders; `Solution.lean` imports the original proven ETSHTS source without replacing the targets; `comparator.json` selects all five. `sorry` in Challenge is intentional; `sorry` is forbidden in substantive source. Historical S058 comparator success is not the official Palomar full-mode PASS.

The selected mathematical result was internally audited, but the independent S055 prior-art verdict is **INDETERMINATE_ACCESS_GAP**. The manuscript remains unwritten. Neither novelty, external peer review nor a Palomar review outcome is claimed.
