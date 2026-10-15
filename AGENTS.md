# Ellipse theorem — binding agent instructions

## Identity and authority

Canonical repository: `https://github.com/jfairfaxball-348/ellipse-theorem`. This is a **rename** of `jfairfaxball-348/ETS_HTS` (same GitHub repo ID 1416869836), not a second repository. Preserve its old session history and `ETSHTS` Lean module names unless a separately justified, compiler-tested refactor is authorised.

Binding order: **live canonical main SHA/tree** → `authoritative/STATE.json` → this file → `authoritative/START_HERE.md` → `docs/SESSION_PROTOCOL.md` → next prompt. Reconcile live refs, PRs, checks and governance; don't infer present facts from dated records.

## Active scope and owner gates

The historical S001–S024 programme generated and audited questions. Its discovery-only restrictions are **historical**, superseded prospectively by the owner's explicit decision to formalise the ellipse theorem. S024 was the final conditional novelty review; S025 began Lean formalisation. **S026 onward is an exact Lean proof programme**, not a renewed open-problem hunt or further historical novelty audit.

Exactly **one numbered session** per fresh explicit owner invocation. **A numbered Lean formalisation session is not restricted to one lemma, one file or one compiler pass:** pursue all tractable dependencies and exact target closures iteratively, including repeated compiler-guided repairs, until completion or a real context/compute/tool boundary. On an honest boundary preserve verified progress and hand off unfinished obligations in the next FUTURE/UNEXECUTED prompt; do not run that next session. A FUTURE/UNEXECUTED handover is not permission to run it. Owner-requested documentation/rename changes are **administrative**, not numbered research sessions; they do not advance `last_completed_session`. Paper writing, Palomar, arXiv, publication and outreach remain separate owner-gated tasks.

## Non-negotiable theorem

- CLM0096: full three/four-point base lemma.
- CLM0099: for strictly convex finite sets, existence of a plane retained-nearest-two order **iff** a **complete recursive metric-ear deletion certificate**.
- CLM0102: **both endpoint outward derivatives** and strict short directed ellipse chord extension.
- CLM0107: for EVERY finite `n ≥ 3` set of distinct ellipse sites, `a ≥ b > 0`, `1 ≤ a/b ≤ R = sqrt(2/sin(2π/5)−1)`, exactly the **two nearest Euclidean predecessors** in Cartesian lex ties, every previous edge retained, no proper crossings. Include `r=R`, near-coincident sites, and all n.
- CLM0108: the exact all-n `101/100` nonround corollary.

`R` is a sufficient threshold, not known sharp. Do NOT weaken to circles, bounded n, minimum separation, changed ties, omitted edges or strict `r<R`. A `def CLM... : Prop` or `#check` is a specification, **not a proof**. The S025 `lake build` compiled definitions and five helper proofs ONLY; all five CLM claims remain unproved. Formal completion requires genuine Lean proof terms for exact statements, clean pinned `lake build`, theorem-specific `#print axioms` and semantic audits. No `sorry`, `admit`, custom axioms, hidden theorem assumptions or mathematical `native_decide` trust gaps.

## Integrity and archive

Historical registry counts after S025: **CND131 all killed, SRC87, CLM108, CAM10, zero surviving open-problem candidates**. Preserve old failures and detached S016 CAM8/9. If entirely new candidate research or computations are explicitly authorised later, consult historical novelty, difficulty, source-grading and computation-preregistration protocols. Do not automatically rerun those gates for the fixed Lean proof. S024's `CONDITIONAL_NOVELTY_SUPPORTED` does **not** certify first discovery or external peer review.

For each numbered research session use one isolated branch, a coherent authored commit (with additional traceable corrective commits if hosted Lean CI exposes errors), ordinary non-draft PR, and GitHub **two-parent merge** where available; independently check authored sole parent/tree, merge parents/tree, fresh main and hosted checks. Never force-push. Unobserved tests are NOT_RUN, 403 endpoints UNKNOWN, absent checks ABSENT_NOT_PASS. Governance CI checks record FORMAT, not mathematics; Lean CI checks only the declarations actually proved.

Never fabricate citations, novelty verdicts, checks, computations, or repository facts. No external mathematical announcements until separately authorised.
