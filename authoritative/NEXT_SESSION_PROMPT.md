# S039 — FUTURE / UNEXECUTED: finish exact four-point geometry and prove ear-recursion prerequisites

**Execution authority:** A new explicit owner invocation, including “run next session” referencing this file, immediately authorises exactly S039. Do not request another confirmation. Do not execute S040 in the same invocation.

Repository: https://github.com/jfairfaxball-348/ellipse-theorem
Lean namespace: `ETSHTS`.

## Frozen scope and read-first evidence

The mathematical theorem and its proof strategy remain LOCKED in `sessions/S020/MATHEMATICS.md` and `sessions/S021/MATHEMATICS.md`. Do not reopen mathematics, propose a different selector or change the theorem; this session is STRICT Lean formalisation. `ETSHTS/Targets.lean` MUST remain byte-for-byte immutable. No novelty audit, extra conjectures, publication, arXiv, Palomar or outreach. Do not treat lack of Lean proof as disproof of the frozen mathematics.

At S038 entry LIVE main was `46af6a2793280f3c39935bfcf9721fec28345d67`, tree `5e6e71b571cacef15e08c6b4a31c733924705ddf`. S037 PR #45 authored head `ab3bcc38a281379035265520de3ac6652abcca98`, normal two-parent merge `46af6a2`. Its PR and merged-main Lean/governance checks PASS. S038 introduced `ETSHTS/EarFramework.lean` with: exposed-point cannot lie inside a segment of two other finite sites; its unconditional positive-axis ellipse consequence; original Grow retention of all prior edges; planarity monotonicity; three-site base iff of exact FullEarCertificate. Independently VERIFY source via S038 hosted compilation/logs before calling any new lemma kernel-proved.

## Mandatory entry audit

Fetch fresh LIVE main SHA and tree; reconcile the S038 single-parent authored commit/tree, non-draft PR and two-parent ordinary merge/tree (if available). Check competing open PRs and branches, protection/rulesets (403 means UNKNOWN), precise PR and independent merged-main workflow conclusions, jobs, steps and full logs, the actual pinned `lake build` and `lake env lean ETSHTS.lean`, theorem-specific `#print axioms`, the forbidden proof-hole/custom-axiom scan, `python scripts/check_scaffold.py` and all seven governance tests. Lean CI establishes ONLY compiled declarations, not the unfinished exact CLMs. Record NOT_RUN for unexecuted local commands.

## Proof-first exact obligations, in priority order

**A. Full CLM0096.** Bridge S038's no-strict-segment result to exact `noThreeCollinear` for any finite positive-axis ellipse subset by formalising the collinear-triple betweenness trichotomy (do not assume it). Establish the full four-site theorem under only `noThreeCollinear`: exhaust the interior point / convex quadrilateral dichotomy; prove interior spokes are noncrossing; for convex quadruples formalise crossing diagonals, intersection O and the maximal opposite-distance triangle-inequality argument, including exact tied Euclidean predecessor rankings and proper crossings. Close `theorem clm0096_exact : CLM0096` only if actually compiled, without extra assumptions.

**B. Full CLM0099.** Extend the S038 `Grow` retention lemma into an EXACT distinct-edge counting invariant `2n-3`, prove maximal outerplanar hull-edge saturation and the last-arrival vertex is a complete metric ear. Derive the necessity of `FullEarCertificate` recursively, and prove the converse by inserting a certified ear and ruling out new proper crossings. Close `clm0099_exact : CLM0099` only when both directions compile for EVERY finite strictly convex set with card≥3.

**C. Remaining cyclic geometry.** Build the actual finite ellipse boundary angular parameterisation with unique cyclic representatives (mod 2π), strict positive wraparound gaps and their sums. Connect the S035 eligible Euclidean metric-skip minimum and S036 closed-R central floor to the real forward/backward/central competitor cases, including equality, near-antipodal points and Cartesian lex ties. Obtain an unconditional full metric-ear deletion certificate for all n and close `clm0107_exact : CLM0107`, then use the ALREADY compiled 101/100 ratio and conditional corollary to prove `clm0108_exact : CLM0108`. No changed selector or angular-minimum shortcut.

## Integrity and exit

No `sorry`, `admit`, custom `axiom`, mathematical `native_decide`, hidden hypothesis or weakened statement. One isolated S039 branch, one atomic single-parent authored commit, ordinary non-draft PR, separate green PR Lean/governance, ordinary two-parent merge, independent merged-main check and SHA/tree/parent verification. If a proof attempt is incomplete, keep ONLY genuinely compilable partial lemmas, report the exact OPEN gap and verdict PARTIAL, and prepare complete `S040 — FUTURE / UNEXECUTED` handover. Do not execute S040. Close with full next prompt and verified GitHub URLs.
