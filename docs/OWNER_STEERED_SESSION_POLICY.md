# Binding owner-steered numbered session process (effective 16 October 2026)

This is an owner-approved administrative process change made **after completed S054**; it is **not S055 execution** and does not select S055's content.

## Authority and two distinct owner actions

1. **Install target.** Only the owner can decide the target of a new numbered session (initially S055). An explicit instruction to install that specific goal permits an administrative update to `authoritative/NEXT_SESSION_PROMPT.md` and `authoritative/STATE.json`. Record `next_session_target_status=OWNER_TARGET_INSTALLED`, a substantive owner-supplied `next_session_target`, and `next_session_authorised=false`. Do not start work or assume installation implies execution. Make the installed prompt `FUTURE / UNEXECUTED` and clearly attribute the target to the owner.
2. **Execute later.** Only a **new explicit owner invocation** to run that installed session permits execution. Shorthand like "run next session" is sufficient only after the exact target has been installed. If it is still pending, do not guess; request the target.

## Normal numbered session closure

Record the real session `INPUT`, `PLAN`, mathematical/code artefacts, proof coverage, exact tests and axioms, blockers, `CLOSEOUT`, full PR/check/merge chain and archival ledger. Keep all substantive unresolved obligations in the closeout as **facts**. Stop without recommending a follow-up target, priority, direction, specific S### assignment or automatic research/publication plan. Do not manufacture a next prompt from incomplete obligations.

Set `last_completed_session` to the completed session and `next_session` to the next number **for bookkeeping only**. Set `next_session_target_status=AWAITING_OWNER_TARGET`, `next_session_target=null`, `next_session_authorised=false` and a minimal `FUTURE / UNEXECUTED — TARGET NOT INSTALLED` placeholder. The title/number is not a plan.

## Current snapshot

S054 passed the five original exact Lean proof/semantic/axiom gates and was integrated via ordinary PR #66 / merge `259bbfd6c83703c9783bb670e34b81b583972a37`. After separate owner direction on 16 October 2026, **S055's target was installed as a hostile prior-art/novelty audit of the original exact ellipse theorem**. S055 remains FUTURE / UNEXECUTED and requires a **new explicit owner invocation** before work starts. The former provisional S055 independent verification/publication readiness brief was **superseded without being executed**; it does not carry authorisation and must not be silently restored. After S055 closes, the target for S056 is again uninstalled pending the owner's direction.

All frozen original theorems and source files remain unchanged. Paper, Palomar, arXiv, outreach and external verification each require owner direction. This policy governs future sessions regardless of whether the selected target is Lean, documentation, external verification or another subject.
