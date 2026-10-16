# S059 — FUTURE / UNEXECUTED — APACHE-2.0 LICENSING AND FINAL PALOMAR SUBMISSION READINESS

**TARGET STATUS: OWNER_TARGET_INSTALLED.**

**Status: FUTURE / UNEXECUTED. DO NOT EXECUTE ON INSTALLATION.**

Repository: https://github.com/jfairfaxball-348/ellipse-theorem  
Lean namespace: `ETSHTS`  
Last completed session: **S058**  
Owner-approved target: **complete the remaining Palomar mechanical submission-readiness obligations and deliver an immutable final main commit that the owner can submit, if and only if the official full-mode predictive verification passes on that same exact commit.**

## 0. Execution authority and non-authorisations

The owner has expressly selected a suitable open-source licence, explicitly permitting **Apache-2.0** ("For license you can use whatever appropriate, apache 2 or whatever"), and separately requested this next-session prompt. That authorises installing S059 as an administrative owner-steered target and, **when S059 is later invoked**, applying the standard Apache License, Version 2.0 to this repository's owner-controlled original work. It does not authorise running S059 now, relicensing material the owner does not control, or any registry submission.

A **new explicit owner invocation** after installation (including "Run next session") authorises execution of exactly S059; no extra confirmation to start S059 is required. Do **not** execute S060 in S059.

The target is technical **readiness to submit**, not actual submission or registration. NO Palomar form submission, `/api/submit`, `/register`, OAuth/gist/tag authentication, real review initiation, arXiv upload, paper drafting or public novelty claim is authorised. Predictive reusable GitHub Actions `mode: full` verification without Palomar state is explicitly within the S059 target.

## 1. Binding entry and source of truth

Pin a FRESH live canonical `main` full SHA and commit tree, verify previous S058 merge PR #76, parents and tree; enumerate open PRs/branches and CI results. The historical S058 merged-main head at this installation was `32d8fbdebc48f5af59f71fb6c675dc1c4c427d8d`; **do not assume it remains current**. Read and reconcile:

- `authoritative/STATE.json`, `AGENTS.md`, `authoritative/START_HERE.md`, `docs/SESSION_PROTOCOL.md` and this installed prompt.
- `sessions/S058/CLOSEOUT.md`, `OWNER_SUBMISSION_HANDOFF.md`, `VERIFICATION.md`, `METADATA_DRAFT.md`.
- `sessions/S056/PREFLIGHT_CL_RUNBOOK.md`, `PAPER_REGISTRY_ALIGNMENT.md`.
- `comparator.json`, `Challenge.lean`, `Solution.lean`, `lean-toolchain`, Lake files/manifest and all five exact target proof declarations.
- At execution time, inspect the **actual official pinned** `PalomarRegistry/PalomarSubmission` README, metadata contract and reusable workflow at full commit `d4e41c1d5b0d114c4859e6e5831dc6d3ad1d0d44` (or document an explicit compatibility need before selecting a later immutable official revision).

Verify entry source closure, lack of proof holes/custom axioms, and all five exact statement/definition interfaces. Neither S058's old local Comparator PASS nor its session closeout substitutes for an official full predictive PASS on the final SHA.

## 2. Owner-authorised licence: install Apache-2.0

The owner's licensing choice is **Apache-2.0**, a conventional permissive code/formalisation licence with an express patent grant. During execution:

1. Confirm the owner-controlled repository source to be licensed and inventory any third-party text/code, notices or separate upstream copyrights. Do not falsely assert rights over them or override their original licences.
2. Install the **complete unmodified standard Apache License, Version 2.0** as the single root `LICENSE` file; ensure valid nonempty UTF-8 and mechanical SPDX detection. Add any ordinary `NOTICE` or attribution only when warranted by actual provenance.
3. Set `project.license: Apache-2.0` in the real root `formalization.yaml`. Ensure exact consistency with the real `LICENSE` and Palomar's detected SPDX identifier.
4. Preserve evidence of the owner's explicit licence permission in S059's provenance notes; do not treat this administrative installation as already creating the licence file or certifying legal ownership.

If another rights-holder's approval is in fact necessary, report the precise unresolved issue rather than claiming the entire repository is licensed.

## 3. Production Palomar metadata and paper/registry alignment

Convert the archived **S058 draft**, not a new improvised narrative, into a schema-valid, mechanically credible root `formalization.yaml` **v0.4**. Validate using the upstream schema and Palomar's exact pinned metadata rules; catch all required fields, full provenance relationships, author/maintainer roles, classifications, automation method, review-status honesty and any fields invalid under the current pinned verifier. No invented ORCID, human review, compute budget or historical first-discovery claim.

Adopt the prospective paper/registry title as the **working shared title** (not a claim that a paper already exists):

**Noncrossing Two-Nearest-Predecessor Orders on Nearly Circular Ellipses**

Make `project.name`, leading README heading and future paper-title handoff match exactly. Make `project.description` start **"We prove that ..."** and foreground the genuine theorem (plain-text formula supported by the registry display, rather than untested LaTeX rendering):

`R = sqrt(2/sin(2*pi/5) - 1)`.

The statement must assert, with no weakening: for every `0 < b <= a` and `a/b <= R`, every finite set of **at least three distinct** sites on the ellipse admits an initial triangle and thereafter a retained plane/noncrossing insertion order joining every inserted site to **exactly the two Euclidean nearest earlier sites**, with **Cartesian-lexicographic distance ties**, all old edges retained, **threshold equality included**, no bound on cardinality and no positive separation assumption. Include the nonround `a/b=101/100` all-cardinality corollary, plus honest mention of the strict-convex-position metric-ear iff, full three/four-site cases and short-chord estimates. Do **not** assert optimality/sharpness of R, external peer review or historical priority.

Document an explicit **paper ↔ registry ↔ five exact Lean theorem** crosswalk for `ETSHTS.clm0096_exact`, `clm0099_exact`, `clm0102_exact`, `clm0107_exact` and `clm0108_exact`; maintain exact Challenge/Comparator fidelity, not just broad informal similarity. The written paper is not yet completed: do not manufacture approval of an unwritten manuscript. Keep the S055 novelty status `INDETERMINATE_ACCESS_GAP` distinct from proof integrity. Treat any final submitter `authorization_relationship` as a real personal assertion to be truthfully made by the owner; do not invent human authentication or attestations.

## 4. Verification — exhaust the mechanical acceptance gates

Preserve pinned modern Lean v4.35.0/Mathlib proof source and all five original exact theorem statements. Run repeated real build/repair cycles on the session branch where tool access permits, without altering frozen mathematics. Check:

- `lake build` of all substantive modules and protected Challenge/Solution modules;
- five printed standard-only axiom signatures `[propext, Classical.choice, Quot.sound]`;
- no `sorry`, `admit`, project-level axioms or `native_decide` trust gaps in substantive proofs;
- literal protected Challenge definitions/targets source fidelity and the selected **all-five** `comparator.json` coverage;
- independent sandboxed `lake comparator`, con-ron, NanoDa and Lean kernel replay;
- Palomar physical-line/module-header/public-dependency/source constraints, absence of forbidden Git submodules/LFS pointers or unpinned non-GitHub dependencies;
- metadata YAML parse, schema validation, actual root licence/SPDX match and stable commit identity;
- standard repository scaffold/tests and both PR-head Lean and governance CI runs.

Create/update a reproducible **credential-free caller workflow** that references the official reusable workflow at immutable SHA `d4e41c1d5b0d114c4859e6e5831dc6d3ad1d0d44`, with exactly matching `pipeline_commit`, public repository path, exact source commit, `comparator_config_path=comparator.json`, and `mode: full` (not merely `mode: preflight`). Work from the official documented inputs and apply only a truthful `authorization_relationship`, never infer it from a code token.

The **decisive gate** occurs **after the final ordinary PR merge**, on the exact final public `main` 40-character SHA. Run the **official pinned full predictive verification** against that SHA using the reproducible caller. Download/read the actual bounded report artifact and record full CI URL, exact SHA, PASS/FAIL, declared five roots, profile ID, profile digest, real diagnostics, and identity of the verified immutable source. An HTTP call, successful dispatch, successful preparation, a workflow `success` alone, or older local Comparator success is **NOT** the report-level full verification PASS.

**SHA freeze trap:** do not alter `main` after the final certified full-mode run and still call the prior run final-SHA evidence. If code/metadata/documentation changes after any attempted verification, merge the corrections and **rerun** the official predictive `full` check on the new last SHA. Make pre-merge S059 closeout factual but prospective; verify final SHA and machine artifact live afterwards. Do not fake evidence just because it cannot be committed without invalidating the checked SHA.

If official automation cannot be dispatched in this environment, instructions/CI are blocked, the owner has not truthfully made a required relationship statement, or a diagnostic fails, preserve the exact failure and close **NOT_READY**, not 100% ready. Continue iterative diagnostics and corrective loops as far as the environment allows.

## 5. Session records, merge and closeout

Work on a single isolated `session/S059-palomar-final-readiness` branch. Archive `sessions/S059/INPUT.md`, `PLAN.md`, `VERIFICATION.md`, `PAPER_REGISTRY_ALIGNMENT.md`, `OWNER_SUBMISSION_HANDOFF.md` and `CLOSEOUT.md`, plus diagnostic logs and machine results wherever feasible. Clearly separate tests **run** vs **not run**, PR-head vs merged-main, source-verification vs official predictive verification, and proof soundness vs novelty.

Use a non-draft ordinary PR and **two-parent merge**; verify the authored commit's parent/tree, PR-head Lean/governance, merge parents/tree, fresh `main` and independently merged-main CI. No force-push or squash. Do not invent future merge SHA or post-merge run outcome inside a pre-merge commit.

Only write **READY_FOR_OWNER_PALOMAR_SUBMISSION** if a valid root Apache-2.0 licence and final metadata exist AND every mandatory official **full-mode predictive report-level PASS** and immutable exact-final-main-SHA check is actually observed, with no unmet required input. Otherwise use **NOT_READY**, with specific diagnostics and the exact latest candidate SHA. Explicitly distinguish predictive technical readiness from guaranteed acceptance or registration.

**No actual Palomar submission or registration in S059.** Do not invent a Palomar record ID or say the title has been displayed in a public entry. The owner controls any later real registration and the final paper.

At close, restore the owner-steered process: `last_completed_session=S059`, `next_session=S060`, `next_session_target_status=AWAITING_OWNER_TARGET`, `next_session_target=null`, `next_session_authorised=false`, and only a neutral `S060 — FUTURE / UNEXECUTED — TARGET NOT INSTALLED` placeholder. Do not select or suggest the S060 objective.
