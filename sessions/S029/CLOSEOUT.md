# S029 closeout — PARTIAL / five full target CLMs still open

Owner explicitly authorised this single S029 on 2026-10-14. Entry main
`e617e52161e9084e43931755b1c20c0559886e17` tree
`77aecbb2365f1ba89e575b68592dae9bfb4ee26e`.
S028 two-parent merge and independently successful authored Lean/governance runs
were verified live. Its first Lean failure and one correction commit remain
in historical record, without rewriting.

S029 authored the two distinct trig/half-angle factorisation chains, exact
derivative normalisations and elementary conditional strict positivity terms
for both endpoint derivatives (11 declarations) in `ETSHTS/HalfAngle.lean`.
They are proofs only if hosted Lean compiles them. The missing real cutoff,
full calculus monotonicity theorem and exact original CLM0102 remain open.
The four-point base for all configurations, ear certificate iff, closed-R all-n
induction, and unconditional 101/100 theorem remain open. PASS gate NOT MET.

Local `lake`, `lean`, `git clone` impossible in available runtime; therefore
local Lean build, local Lean root check and Python checkout scripts: NOT_RUN.
CI outcomes after PR publication must be read, not guessed. No custom axioms,
proof holes, weaker CLM replacements, finite bounds or new novelty/publication
work. The separate governance test tests records only, not mathematics.

Historical counts unchanged: CND131 killed131 SRC87 CLM108 CAM10, final novelty
S024 conditional, detached S016/S024 historical provenance retained.
FUTURE S030 is not authorised by this S029 invocation.

## S029 CI repair exception (recorded without history rewriting)
First authored SHA `8744005db1335708377aa36914c1e4bfd5845ddf` received
Lean workflow `38621469407`, job `116049784242`: **FAILED** solely
because its final static grep caught the token `axiom` in the ROOT FILE
COMMENT on line 3. Earlier in the SAME job `lake build` and
`lake env lean ETSHTS.lean` succeeded, all 11 new declarations were
compiled and all printed Lean dependencies were standard
`propext, Classical.choice, Quot.sound`. Governance workflow
`38621469409` PASSED. This follow-up commits only a comment wording
repair and updates provenance records. The one-authored-commit preference
has an explicit two-commit exception, without force push. The repaired
head requires independent fresh hosted Lean/governance PASS before merge.
