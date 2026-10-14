# Start here — ellipse theorem formalisation

Canonical repository https://github.com/jfairfaxball-348/ellipse-theorem
(former ETS_HTS, same repository ID 1416869836). Lean namespace `ETSHTS`.

**After S029: full CLM0096/0099/0102/0107/0108 target proof terms OPEN.**
S028 independent endpoint derivative declarations were verified by separate
hosted Lean and governance checks and merged via PR33 at e617e52.
S029 adds two exact half-angle factorisations and algebraic conditional strict
positivity in [ETSHTS/HalfAngle.lean](../ETSHTS/HalfAngle.lean), subject to its
own hosted Lean CI. It does NOT close `CLM0102` because the sine/cosine
short-arc inequalities and strict extension calculus are not yet formalised.

At next entry independently reconcile the live main/PR and hosted jobs;
read [STATE](STATE.json), [AGENTS](../AGENTS.md),
[session protocol](../docs/SESSION_PROTOCOL.md), and
[S029 FORMALISATION](../sessions/S029/FORMALISATION.md).
Pinned Lean 4.15.0, mathlib
`9837ca9d65d9de6fad1ef4381750ca688774e608`.
New [S030 prompt](NEXT_SESSION_PROMPT.md) is FUTURE / UNEXECUTED and
requires explicit owner authorisation.

Historical CND131 all killed, SRC87 CLM108 CAM10, S016 detachment and
S024 last `CONDITIONAL_NOVELTY_SUPPORTED` audit remain unchanged.
Palomar, paper, arXiv, journal and outreach are owner-gated.
