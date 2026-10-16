# Ellipse theorem — binding agent instructions

## Identity and authority

Canonical repository: `https://github.com/jfairfaxball-348/ellipse-theorem`. This is a **rename** of `jfairfaxball-348/ETS_HTS` (same GitHub repo ID 1416869836), not a second repository. Preserve its old session history and `ETSHTS` Lean module names unless a separately justified, compiler-tested refactor is authorised.

Binding order: **live canonical main SHA/tree** → `authoritative/STATE.json` → this file → `authoritative/START_HERE.md` → `docs/SESSION_PROTOCOL.md` → next prompt. Reconcile live refs, PRs, checks and governance; don't infer present facts from dated records.

## Active scope and owner gates

The historical S001–S024 programme generated and audited questions. Its discovery-only restrictions are **historical**, superseded prospectively by the owner's explicit decision to formalise the ellipse theorem. S024 was the final conditional novelty review; S025 began Lean formalisation. **S026–S054 completed the original exact Lean proof programme**; all five original direct theorems have kernel proofs and passed the S054 final audit. Subsequent sessions are **owner-directed** and have no automatic research, publication, verification or novelty agenda.

**Owner-steered sessions (binding from 16 October 2026):** The owner alone chooses each numbered session's next target. No agent may choose, propose, install or pre-author a substantive next-session task during normal closeout. Close every executed session as usual: verified results, evidence, failures, blockers, citations, code/PR/CI/merge facts and outstanding obligations **as facts**, without a suggested next target or next step. The only prospective handover after closing S### is a neutral S(###+1) `FUTURE / UNEXECUTED — TARGET NOT INSTALLED` placeholder, with `next_session_target_status=AWAITING_OWNER_TARGET`, `next_session_target=null`, and `next_session_authorised=false`.

Installing the next target requires a **separate explicit owner instruction specifying that target**. Installing it is an *administrative change*, does not execute a session and does not change `last_completed_session`. Only once the target is installed in `authoritative/NEXT_SESSION_PROMPT.md` and `STATE.json` as owner-approved (`OWNER_TARGET_INSTALLED`) may a **new explicit owner invocation** (including the usual "run next session") execute exactly that one numbered session. A generic request to run while the target is uninstalled must not be construed as choosing a target or authorising execution; ask for the owner's target instead. A `FUTURE/UNEXECUTED` prompt is never itself permission to execute. Owner-requested governance changes are administrative, not numbered sessions; paper writing, Palomar, arXiv, publication and outreach remain separately owner-gated.

For any owner-authorised Lean development, pursue all tractable dependencies and exact target closures iteratively, including repeated compiler-guided repairs, until the authorised target is completed or a genuine context/compute/tool boundary is met. Preserve verified progress and blockers in that session's closeout. Never silently continue into a subsequent session.

## Non-negotiable theorem

- CLM0096: full three/four-point base lemma.
- CLM0099: for strictly convex finite sets, existence of a plane retained-nearest-two order **iff** a **complete recursive metric-ear deletion certificate**.
- CLM0102: **both endpoint outward derivatives** and strict short directed ellipse chord extension.
- CLM0107: for EVERY finite `n ≥ 3` set of distinct ellipse sites, `a ≥ b > 0`, `1 ≤ a/b ≤ R = sqrt(2/sin(2π/5)−1)`, exactly the **two nearest Euclidean predecessors** in Cartesian lex ties, every previous edge retained, no proper crossings. Include `r=R`, near-coincident sites, and all n.
- CLM0108: the exact all-n `101/100` nonround corollary.

`R` is a sufficient threshold, not known sharp. Do NOT weaken to circles, bounded n, minimum separation, changed ties, omitted edges or strict `r<R`. A `def CLM... : Prop` or `#check` is a specification, **not a proof**. The historical S025 `lake build` compiled definitions and five helper proofs only. S053 supplied literal Lean proofs for all five CLM claims; S054 independently audited their final pinned build, original target semantics and theorem-specific standard-only `#print axioms`. Any subsequent claim of completion still requires genuine Lean proof terms, pinned compilation and precise semantic/axiom audits. No `sorry`, `admit`, custom axioms, hidden theorem assumptions or mathematical `native_decide` trust gaps.

## Integrity and archive

Historical registry counts after S025: **CND131 all killed, SRC87, CLM108, CAM10, zero surviving open-problem candidates**. Preserve old failures and detached S016 CAM8/9. If entirely new candidate research or computations are explicitly authorised later, consult historical novelty, difficulty, source-grading and computation-preregistration protocols. Do not automatically rerun those gates for the fixed Lean proof. S024's `CONDITIONAL_NOVELTY_SUPPORTED` does **not** certify first discovery or external peer review.

For each numbered research session use one isolated branch, a coherent authored commit (with additional traceable corrective commits if hosted Lean CI exposes errors), ordinary non-draft PR, and GitHub **two-parent merge** where available; independently check authored sole parent/tree, merge parents/tree, fresh main and hosted checks. Never force-push. Unobserved tests are NOT_RUN, 403 endpoints UNKNOWN, absent checks ABSENT_NOT_PASS. Governance CI checks record FORMAT, not mathematics; Lean CI checks only the declarations actually proved.

Never fabricate citations, novelty verdicts, checks, computations, or repository facts. No external mathematical announcements until separately authorised.
