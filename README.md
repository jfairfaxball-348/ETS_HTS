# Ellipse theorem — retained exact nearest-two insertion

Canonical repository https://github.com/jfairfaxball-348/ellipse-theorem
(renamed from ETS_HTS, original GitHub repository ID 1416869836).
Lean namespace `ETSHTS`.

## Exact theorem target

`R=sqrt(2/sin(2π/5)−1)`.
**CLM0107:** every finite set of n≥3 distinct sites on every ellipse
`a≥b>0`, `a/b≤R` (including equality) admits an initial triangle
followed by exactly two compulsory nearest Euclidean predecessors, with
Cartesian lexicographic ties, all old edges retained, and no proper crossings.
No minimum separation or upper bound on n.
**CLM0108:** all finite n≥3 on nonround ellipse `a/b=101/100`.
CLM0096 covers all three/four-site general-position sets, CLM0099 is the
FULL recursive metric-ear iff, and CLM0102 has BOTH strict outward
derivatives plus full strict outward endpoint extension.

## Formalisation status after S029

- S020/S021: paper proof and internal hostile audit; not kernel-checked or
  externally peer reviewed. S024 conditional novelty audit only.
- S025–S027: foundational Lean proofs, triangle and chord-bound lemmas,
  verified by the separate hosted Lean checks.
- S028: [independent HasDerivAt endpoint proofs](ETSHTS/Derivatives.lean),
  exact derivative values and circle cosine-chord identity. Corrected source
  passed hosted Lean and separate governance; PR33 merged at `e617e52`.
- **S029**: [half-angle factors and conditional strict sign proofs](ETSHTS/HalfAngle.lean)
  for both independent endpoints. [Detailed proof and barriers](sessions/S029/FORMALISATION.md).
  These source terms require S029 hosted Lean check: no local compiler.
- **All five exact CLM0096/0099/0102/0107/0108 remain unproved**.
  S029's strict-sign theorems take explicit half-angle cutoff hypotheses;
  the real arctangent threshold, strict extension calculus, universal four-
  point and metric ear iff, closed-R all-n, and all-n 101/100 proof are
  NOT formalised. `ETSHTS/Targets.lean` is unaltered (five `Prop` defs).

Pin: `leanprover/lean4:v4.15.0`, mathlib
`9837ca9d65d9de6fad1ef4381750ca688774e608`.
Run `lake build`, `lake env lean ETSHTS.lean`, inspect `#print axioms`.
A passing build certifies declarations actually in source, never a bare
`def CLM...` or `#check`.

Start with [STATE](authoritative/STATE.json), [AGENTS](AGENTS.md),
[S029](sessions/S029/FORMALISATION.md), and
[FUTURE S030](authoritative/NEXT_SESSION_PROMPT.md).
Palomar, paper, arXiv, journal and outreach remain owner-gated.
Historical counts CND131 all killed/SRC87/CLM108/CAM10 unchanged.
