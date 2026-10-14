# Ellipse theorem — retained exact nearest-two insertion

**Canonical active repository** https://github.com/jfairfaxball-348/ellipse-theorem — this is a rename of `ETS_HTS` with its original repository ID 1416869836, historical programme archive and Git history intact. The `ETSHTS` Lean namespace is retained for compatibility.

## Exact result under formalisation

Let `R = sqrt(2 / sin(2π/5) − 1)`. **CLM-0107** asserts that every finite set of `n≥3` distinct sites on every ellipse with `a≥b>0` and `a/b≤R` (including the closed equality endpoint) admits some initial triangle followed by mandatory insertion of **exactly** two Euclidean-nearest predecessors, Cartesian lex tie-breaking, all earlier edges retained, and no proper crossings. No minimum site separation or bound on `n`. The ratio bound is sufficient, not claimed sharp. **CLM-0108** asserts this for the particular nonround ellipse `a/b=101/100`, for every finite `n≥3`.

## Verification status after S028

- Paper proof: S020, internally adversarially audited S021; **not** kernel-checked or externally peer reviewed.
- Final prior art audit: S024 `CONDITIONAL_NOVELTY_SUPPORTED` for continued formalisation, **not** a priority certificate.
- S025 foundation: actual hosted pinned Lean builds passed; five low-level lemmas.
- **S026**: additional actual `theorem` declarations in [ETSHTS/Partial.lean](ETSHTS/Partial.lean): 3-site insertion-order base, triangle planarity, 3-point metric-ear certificate base, explicit ellipse chord expansion, strict-gap-to-metric-ear bridge, and conditional all-n CLM0108 reduction. [Full S026 record](sessions/S026/FORMALISATION.md). S026 merged-main hosted Lean and governance jobs both PASSED (separate checks).
- **S027**: four new analytic proof candidates in [ETSHTS/AnalyticBounds.lean](ETSHTS/AnalyticBounds.lean): exact ellipse distance dilation, two circle-plus-anisotropy decompositions and all-angles b²/a² circle-distance bounds. Their S027 hosted Lean CI passed on authored branch and merged main; they do not resolve the derivative/ear/all-n obligations.
- **S028**: [ETSHTS/Derivatives.lean](ETSHTS/Derivatives.lean) provides five new Lean source proof candidates — two **independently calculated endpoint HasDerivAt proofs**, their exact derivative identities, and the exact unit-circle squared-chord cosine formula. These require S028 hosted Lean CI. The strict derivative signs and full short-arc extension remain open.
- **Five headline CLM0096/0099/0102/0107/0108 still NOT PROVED**: [ETSHTS/Targets.lean](ETSHTS/Targets.lean) still gives *Prop specifications*, not theorem proof terms. In particular four sites, full ear iff, the strict signs and extension following both exact derivatives, closed-R all-n induction, and exact nonround bound remain open.
- Palomar, paper, arXiv, journal submission and outreach are separately owner-gated and not started.

Pinned source: `lean-toolchain` Lean 4.15.0; `lakefile.lean` mathlib commit `9837ca9d65d9de6fad1ef4381750ca688774e608`. Run `lake build` and `lake env lean ETSHTS.lean`, inspect theorem-specific `#print axioms`; a passing build proves **only the actual declarations in source**, not the five unproved definitions. Governance workflow checks historical record format, not mathematics.

Start with [STATE](authoritative/STATE.json), [AGENTS](AGENTS.md), [FORMALISATION handover](docs/FORMALISATION_HANDOVER.md), [S026 evidence](sessions/S026/FORMALISATION.md), and the [S029 FUTURE/UNEXECUTED prompt](authoritative/NEXT_SESSION_PROMPT.md). Owner must freshly authorise S029.

Historical research preserved: 131 candidates all killed, 87 sources, 108 claims, 10 campaigns; detached S016 and failed computations not rewritten.
