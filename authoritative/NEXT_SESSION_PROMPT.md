# S030 — FUTURE / UNEXECUTED: finish the strict real cutoff and full CLM0102 in Lean

**FUTURE / UNEXECUTED. Requires a NEW explicit owner invocation.**
Canonical repository: https://github.com/jfairfaxball-348/ellipse-theorem ; Lean namespace `ETSHTS`.

## Entry
Read fresh main SHA/tree, STATE, AGENTS, START_HERE, SESSION_PROTOCOL,
S029 mathematical record and PR/merge/Lean/governance evidence. S028 PR33
repaired source passed hosted Lean and governance; verify S029 independently,
including new `#print axioms`, compiler output and exact proof signatures.
Pinned Lean 4.15.0/mathlib `9837ca9d65d9de6fad1ef4381750ca688774e608`.
If S029 CI failed, repair exact compiler errors before adding new claims.

## Unchanged exact headline targets
- CLM0096: ALL general-position 3/4-point sets, including interior and convex.
- CLM0099: exact if-and-only-if FULL metric-ear recursive certificate for
  strictly convex finite sets, including planar edge bound and reversal.
- CLM0102: BOTH strict outward derivatives for `0<φ−θ<lambda a b` and
  full four-parameter strict outward extension.
- CLM0107: closed R all-n (n≥3) strict-convex ellipse sites; compulsory
  nearest two, Cartesian lex ties, retained edges and no proper crossing.
- CLM0108: unqualified all-n 101/100 nonround consequence.

## Primary thrust
S029 factorised both exact endpoint derivatives into
`4 sin(δ/2) [M cos(δ/2)−D cos(phase)]`, and supplies algebraic bracket
strict positivity from `D/M<cos(δ/2)`. **Do not stop at those CONDITIONAL
lemmas.** Formalise directly under `0<b≤a,0<δ<4atan(b/a)`:
1. `0<sin(δ/2)` from the precise restricted arc.
2. `cos(δ/2)>D/M` using exact `cos(2atan(b/a))`, positive denominators,
   `0<2atan(b/a)≤π/2` and strict cosine monotonicity.
3. Apply both independently factorised derivative sign theorems with NO
   extra hypotheses beyond CLM0102.
4. Prove the two continuous strict endpoint monotonicity inequalities on
   arbitrary real-lift intervals, and the `θ₀≤θ₁<φ₀≤φ₁` case split.
5. Construct **an unconditional theorem of the exact existing
   `ETSHTS.CLM0102` Prop** and inspect `#print axioms`.
Spend remaining effort on CLM0096 all four points and CLM0099 full ear iff;
resume CLM0107 shortest metric eligible skip-chord proof and CLM0108 only
after actual dependencies. Mathematical notes are not substitutes for Lean.

## Verification and exit
Run pinned `lake build`, `lake env lean ETSHTS.lean`, print axioms and
semantic target audit; independently check separate hosted Lean and governance
jobs. No `sorry`, `admit`, custom axioms, mathematical `native_decide`,
weakened/conditional CLM replacements, restricted n, omitted lex ties, or
changed R endpoint. **PASS only if ALL FIVE exact CLM targets have
unconditional kernel proof terms**, else PARTIAL/OPEN with explicit blockers.

Exactly ONE S030 session, isolated branch and one authored atomic commit,
ordinary non-draft PR/two-parent merge only after passing actual CI;
queue S031 FUTURE/UNEXECUTED. Preserve CND131 all killed/SRC87/CLM108/CAM10
and final S024 conditional novelty. No new novelty review, Palomar, paper,
submission or outreach.
