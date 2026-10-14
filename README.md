# Ellipse theorem — retained exact nearest-two insertion

Canonical repository https://github.com/jfairfaxball-348/ellipse-theorem (former ETS_HTS; ID 1416869836). Lean namespace `ETSHTS`.

## Exact fixed theorem programme
Closed threshold `R=sqrt(2/sin(2π/5)−1)`. **CLM0107:** all n≥3 finite distinct ellipse boundary sites, `a≥b>0`, `a/b≤R` including equality, exactly two compulsory nearest Euclidean predecessor edges with Cartesian-lex ties, all old edges retained and no proper crossing. **CLM0108:** all n for nonround `a/b=101/100`. **CLM0096:** all three- and four-point sets in general position. **CLM0099:** full metric-ear certificate iff for strictly convex finite sets. **CLM0102:** both outward derivatives and full real-lift strict short-arc chord extension.

## Verified and open
**CLM0102 verified on S030 merged main** `de695309`, pinned Lean 4.15.0/mathlib `9837ca9`, Lean run [38626006276](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38626006276), governance run [38626005962](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38626005962). Printed dependencies `[propext, Classical.choice, Quot.sound]`.

S031 [research](sessions/S031/MATHEMATICS.md) provides four-point mathematical construction; source `ETSHTS/FourPoint.lean` formalises the mandatory insertion **given explicitly exposed geometric witnesses**, and `ETSHTS/RationalBound.lean` attempts exact proof of `101/100 ≤ R`. New S031 Lean declarations remain **candidates until their own hosted CI and axiom prints**; ratio plus `CLM0107` gives `CLM0108`, not CLM0108 outright. All four other exact CLMs remain OPEN.

Read [authoritative state](authoritative/STATE.json), [S031 closeout](sessions/S031/CLOSEOUT.md) and [S032 future prompt](authoritative/NEXT_SESSION_PROMPT.md). Historical counts CND131 killed/SRC87/CLM108/CAM10; S024 novelty conditional. Palomar/paper/outreach owner gated.

## S032 update (partial)

S031 merged-main [Lean run 38638823699](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38638823699) and [governance run 38638823717](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38638823717) independently PASSED. Thus `ellipse_ratio_101_le_R` and `four_point_order_from_strict_separation` are **verified**, rather than merely candidate source. S032 [mathematics](sessions/S032/MATHEMATICS.md) and proposed [Lean source](ETSHTS/ThreePredecessors.lean) remove strict-distance separation from the *three-predecessor ranking* interface and support lexicographic ties; the actual four-point geometric existence and all-n metric-ear ellipse proof remain open. Check new S032 CI before calling those source-level lemmas verified. [Next S033 prompt](authoritative/NEXT_SESSION_PROMPT.md) is future only.
