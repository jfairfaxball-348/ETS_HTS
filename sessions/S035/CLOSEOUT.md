# S035 closeout — PARTIAL; original selector, no new mathematical research

S035 is an owner-invoked strict Lean formalisation session from verified live main `44fd957c2a455e5528251a183afa919a117313d1` / tree `c3684a46e17ba1547e13d0a50f766c6443aa3ff1`. S034 had one authored parent, one non-draft PR #40, ordinary two-parent merge with matching tree, independent successful PR and merged-main Lean/governance checks; specific Lean axiom prints and governance logs were read.

The new `ETSHTS/EligibleSkip.lean` formalises SIX proof substeps from the frozen S020 eligible **metric** skip-chord selector: cyclic-average eligibility, finite eligible metric minimum, strict incident skip-chord bounds, forward competitor, backward competitor, and tie-safe global-floor-to-metric-ear closure. See FORMALISATION.md for precise hypotheses and unresolved geometrical interfaces. `ETSHTS/Targets.lean` remains byte-for-byte immutable. No selector experiments, theorem replacement, threshold optimisation, or novelty audit.

Target verdict: CLM0102 already genuine Lean proof; CLM0096 (complete four-site), CLM0099 (full iff), CLM0107 (all n, closed R), CLM0108 (concrete all n) remain UNPROVED. No original S020 proof defect demonstrated. The S035 source proof terms must be independently confirmed by hosted PR and merged-main CI before being called kernel-verified. Local Lean/lake and local test execution: NOT_RUN (not installed / no reachable git remote).

S036 is FUTURE / UNEXECUTED at `authoritative/NEXT_SESSION_PROMPT.md`, and must continue this identical frozen formalisation. No external actions. S035 overall PARTIAL.

## GitHub gate recovery

Original S035 PR #41 compiled all six theorems with standard axioms, but its governance workflow failed: the S036 prompt did not contain the validator's literal lower-case phrase “new explicit owner invocation”. PR #41 was **closed without merge**, rather than bypassing CI or adding a second authored commit. Its failed check remains visible. A fresh replacement branch/PR from the same verified main with ONE self-contained authored commit corrects only this administrative gate, preserving the exact same Lean source. This means two PR attempts exist for S035, an explicit procedural deviation from the preferred one-attempt protocol, but the integrated replacement (if checks pass) has one authored atomic commit and an ordinary two-parent merge. Neither attempt executes S036.
