# Ellipse theorem — retained exact nearest-two insertion

Canonical repository https://github.com/jfairfaxball-348/ellipse-theorem, renamed from ETS_HTS (same ID 1416869836), Lean namespace `ETSHTS`.

## Exact headline
`R=sqrt(2/sin(2π/5)−1)`. **CLM0107:** every finite n≥3 set of distinct sites on an ellipse with `a≥b>0`, `a/b≤R` including equality, admits triangle-first retained insertion of precisely the two compulsory Euclidean-nearest predecessors, Cartesian lex ties and no proper crossings, with no n bound or separation hypothesis. **CLM0108:** same for nonround `a/b=101/100`, all n. **CLM0096:** all 3/4-point general-position sets. **CLM0099:** full metric-ear recursive iff on strictly convex finite sets. **CLM0102:** both strict outward derivatives and full real-lift four-endpoint extension.

## Progress through S030
S028 independent derivative identities and S029 exact half-angle factorisations with conditional signs were verified by hosted Lean 4.15.0, including standard axiom checks.
S030 adds [Cutoff](ETSHTS/Cutoff.lean), with a candidate Lean proof of exact `clm0102_exact : CLM0102` using `Real.arctan` identities, strict short-arc cutoff and endpoint monotonicity. **This requires new independent hosted Lean verification.** `Targets.lean` is unchanged. CLM0096, CLM0099, CLM0107 and CLM0108 remain unproved, so full-project PASS is still OPEN.

See [S030 formalisation](sessions/S030/FORMALISATION.md), [STATE](authoritative/STATE.json) and [S031 future prompt](authoritative/NEXT_SESSION_PROMPT.md). Pinned Lean 4.15.0, mathlib `9837ca9d65d9de6fad1ef4381750ca688774e608`.
Historical counts CND131 all killed, SRC87, CLM108, CAM10; final S024 novelty conditional, not external confirmation. Paper/Palomar/outreach owner-gated.
