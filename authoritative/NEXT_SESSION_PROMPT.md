# S057 — FUTURE / UNEXECUTED: BUILD A PALOMAR-REGISTRABLE ELLIPSE-THEOREM COMMIT

**TARGET STATUS: INSTALLED BY OWNER. FUTURE / UNEXECUTED. A new explicit owner invocation is required to execute S057.**

**Owner instruction (16 October 2026):** “make the next session the Palomar prep. Aim at the end of the session is a commit that I can register on Palomar”.

**This commit installs a target; it is NOT S057 execution.** Last completed session remains S056. A subsequent explicit owner invocation (including “run next session”) executes exactly S057, without another confirmation. Do not execute S058.

Repository: https://github.com/jfairfaxball-348/ellipse-theorem (Lean namespace ETSHTS). Read live main and this installed prompt afresh at S057 entry. Reference state at administrative installation: S056 PR #72 ordinary merge a455e00f7f1b49876e17e8d1dec4bb15eabea5fc, tree cd84c1fb1dae28f274dac5f7c84c087e58737552, independent merged-main Lean run 38902835721 and governance run 38902835760 both SUCCESS. The 5/5 historically kernel-verified ORIGINAL claims remain frozen; S055 novelty verdict remains INDETERMINATE_ACCESS_GAP.

## Binding outcome — a fixed commit the owner can actually submit

**Endgame target:** an **immutable, publicly pushed 40-character Git commit** of this project (prefer the actual merged-main commit) that is suitable to enter into Palomar’s official submission form with one explicitly identified Comparator config, a compliant current Lean/Lake source snapshot, complete candid metadata, and **a successful full-mode official Palomar predictive mechanical verification report for THAT EXACT SHA**. This is more than "lake build passes". Give the owner the exact repository, SHA, project path, comparator path, metadata path, run URL/report digest, and clear instructions for the owner’s subsequent HUMAN submission and later independent registration decision. Call it **READY_FOR_OWNER_PALOMAR_SUBMISSION** only when every necessary piece is actually checked.

**Achieve this aggressively through iterative toolchain/source migration, compilation, comparator repair, metadata correction, real hosted test feedback, corrective commits and re-runs in this session**. Do not stop after a cosmetic scaffold, first pass or one failed CI attempt when more authorized work is feasible. Technical build refactoring to meet current Palomar standard IS within S057; new mathematical theorems, changed definitions of the frozen theorem, weakened assumptions, an untested rewrite, novelty advertising and substantive journal paper-writing are NOT.

**Owner retains registration control.** This session authorises creating/merging necessary GitHub commits/PRs and running the *public, non-submitting PalomarSubmission reusable GitHub Actions preflight* (including full predictive mode), along with local validators. It does NOT authorise Palomar OAuth, tags/gists for the Palomar agent challenge, POST /api/submit, POST /api/verify, editorial intake, POST /register, actual registration, arXiv, journal outreach or publication. Do not drive a Palomar web form by machine. A predictive Actions run is public on GitHub, so report its URL and disclosure. If owner-submission readiness is not achieved despite genuine attempts, issue **NOT_READY**, pin the strongest truthful commit and exact remaining gates; NEVER silently call a local Lean pass Palomar-ready.

## Mandatory first reads and fresh standards (recon is the baseline, not proof)

1. Pin fresh live main SHA/tree, branches/open PRs, STATE.json, AGENTS.md, START_HERE.md, SESSION_PROTOCOL.md and owner-steered policy. Verify S056 PR #72 final head + distinct merged-main Lean/governance SUCCESS and current actual source tree. Confirm S057 target installed separately and this invocation is distinct.
2. Read all nine \`sessions/S056/\` records, especially CURRENT_REPO_READINESS, PREFLIGHT_CL_RUNBOOK, PALOMAR_REQUIREMENTS, PAPER_REGISTRY_ALIGNMENT, RISKS_AND_DECISIONS. Re-read S020/S021 frozen mathematical proof, S053/S054 semantic audit/axiom coverage, original ETSHTS/Definitions.lean and Targets.lean, five literal direct theorem modules, S055 hostile novelty conclusion. Do NOT confuse a historical Lean 4.15 proof with an accepted contemporary Palomar verifier proof.
3. **Re-pin current live official sources on S057 execution date**, not just S056’s 16 Oct snapshots:
   - https://palomar-registry.org/how-to-submit
   - https://palomar-registry.org/llms.txt
   - https://submit.palomar-registry.org/llms.txt (read-only if accessible; no protocol request)
   - https://github.com/PalomarRegistry/PalomarPolicy/blob/main/CONTRIBUTING.md and protocol specification
   - https://github.com/PalomarRegistry/PalomarSubmission/blob/main/README.md , toolchains.json, verification-profile.json and reusable workflow
   - https://github.com/mathlib-initiative/formalization.yaml and schema v0.4; official Palomar starter and working accepted examples
   - https://github.com/leanprover/comparator and current Lean module/public-import documentation.
   Record EXACT policy/toolchain/CI full 40-character revisions and distinguish currently official commands from historical examples. At S056 the floor was Lean v4.35.0-rc2; verify it is still in effect.

## A. First design the exact, auditable statement surface and provenance

**All original mathematics is frozen** (no mathematical generalisations or rediscovery). Preserve five literal claims without extra hypotheses, rank substitutions or weaker re-statements:

- **CLM0107 (headline mandatory):** for all 0<b≤a and a/b≤R=sqrt(2/sin(2π/5)−1), EVERY finite S of ≥3 distinct points on the ellipse boundary admits a retained noncrossing chronological order. Start with the triangle; each later point adds exactly two edges to its **two Euclidean-nearest earlier points**, with predecessor Cartesian-lex tie rule; no old edges removed and no proper crossings. Equality at a/b=R INCLUDED; all cardinalities; no separation floor.
- **CLM0108 (prominent nonround corollary):** all-cardinality ratio a/b=101/100.
- **CLM0099:** for every finite strictly convex-position point set |S|≥3, planar nearest-two chronological order **iff** full recursive valid metric-ear deletion certificate, not only one direction.
- **CLM0096:** all three/four-point no-three-collinear sets, including the nonconvex four-point case.
- **CLM0102:** both endpoint outward derivative signs and the strict short directed ellipse-chord extension, for original real-lift hypotheses.

Treat **one Comparator config selecting all five direct theorems** as first design objective and one Palomar entry with all five actually compared. If genuine mechanical limitations make all five infeasible in this session, maximise a *registerable exact headline* config selecting CLM0107 (plus CLM0108 when actually passed), and make the public abstract unambiguously distinguish compared statements from supporting proofs. Never falsely advertise unselected declarations as Comparator verified. No switching to a circle-only, bounded-n, strict r<R or nearest-one theorem to get a green report.

The Challenge is a **small, readable, self-contained statement file**, with legitimate allowed imports only (Lean core / authenticated pinned Mathlib and qualified permitted other libraries per live spec). Its **entire transitive imports cannot include ETSHTS project-specific modules**, even via reexports. Provide mathematical definitions and docstrings for the exact nearest-two rule, Cartesian ordering, retained edges and crossings, if necessary. The proved Solution may import ETSHTS source after a compliant port. Establish actual definitional/type equality via Comparator, not paper-level resemblance, axioms, sorry-generated proof, namespace games, custom compilation hacks, opaque shadow imports or placeholder proof wrappers. Adverse dependency-closure and matched-type tests must be run.

## B. Execute the real technical migration — not a superficial edit

S056 found **78 existing .lean files**, old import headers, a Lean v4.15.0 pin and Mathlib 9837ca9d..., and **no** root licence, formalization.yaml, Challenge, Solution or Comparator. The S057 output must remove each blocker legitimately:

1. Choose a **currently Palomar-supported pinned Lean release** and an actually compatible, authenticated **exact Mathlib commit**, including committed correct Lake manifest; avoid floating/nightly pins. No assumption the original v4.15 proof compiles unchanged on the new toolchain. Document the historic old source commit and provide reproducible final manifest.
2. Port **every .lean source covered by the submitted repository/source graph** to Lean’s module system, including unused, nested/local dependencies, proofs and root ETSHTS.lean; honour \`module\`, \`public import\`, public declarations/definition bodies needed downstream, source-file <=10,000 *physical lines*; Challenge <=1,000 lines and 100 KiB, ideally <=300 lines/32 KiB. Use **real compiler/parser checks**, no merely inserted tokens. Preserve all historical 5 propositions and exact theorem semantics. Do not “fix” verification by hiding stale Lean files under alternative paths, symlinks or binary artefacts, nor by quietly excluding source lineage.
3. Compile full current source and the selected exact statements **on the new toolchain**, iterative repairs until green. Independently print axioms for all five exact direct theorem roots. Only \`propext\`, \`Classical.choice\`, \`Quot.sound\` are allowed; no \`sorryAx\`, \`Lean.ofReduceBool\`, custom axiom, \`admit\`, proof-by-unverified native evaluator or trusted gap.
4. Add the actual readable \`Challenge.lean\` (or selected safe dotted module), proved \`Solution.lean\`, verified \`comparator.json\` naming precisely the selected declarations and allowed axioms. Resolve root-vs-nested \`project_path\` correctly. Challenge and Solution must be separate modules; Challenger’s dependency closure MUST be trusted independently of proof imports. Compare EXACT type/declaration names and record literal formal statement code/line evidence.
5. Add correct root single SPDX licence with \`formalization.yaml project.license\` matching the actual file, **but do not invent owner authorisation to grant a licence or third-party rights**. If a licence decision is not established by repository context/owner authority, it is a real owner-choice blocker, not a made-up licensed snapshot; report accurately. No guess at ORCID or other peoples’ author credit.
6. Add accurate v0.4 \`formalization.yaml\` in the actual selected path: paper-aligned \`project.name\` and **public** \`project.description\`, authors and responsible maintainers, classifications arXiv/MSC2020 from valid catalogues, genuine \`sources\` provenance/original-proof or source-based relationship, honest \`automation.methods\` and models/human oversight, review status, known literature/semantic limits, and selected main-results alignments. Existing S055 verdict **INDETERMINATE_ACCESS_GAP**—no “first”, priority certified, optimal threshold, journal acceptance, or falsely peer-reviewed wording. Existing author credit must correspond to real repo evidence/owner direction, with all discretionary unknowns surfaced.
7. Check the repo is ordinary substantial source, not an unsupported “thin wrapper”; current Palomar substantive-source scan prevents simply pointing a new compatible shell at old non-module Lean files. Verify repo size, no forbidden submodules, LFS pointers, source aliases, dependency provenance and source-closure rules with the **official** verifier, not assumptions.

## C. Present what the owner will actually register

Use S056 proposed title **“Noncrossing Two-Nearest-Predecessor Orders on Nearly Circular Ellipses”** as the working publication-facing title, *unless exact source audit exposes a better mathematically faithful title*; mark it an owner-reviewable public-text choice, not a pre-approved paper title. The corresponding paper-facing theorem text should begin “We prove that…” in \`project.description\` (NOT the project title) and show the closed formula in Challenge documentation/README:

\[
  \frac{a}{b} \le \sqrt{\frac{2}{\sin(2\pi/5)}-1}
  \quad (R \approx 1.0502020989).
\]

The mathematical prose must explain the original triangle, exactly two Euclidean-nearest *preceding* points, tie rule, no deleted edges, planarity, no cardinality/separation restriction and closed endpoint, plus CLM0108’s nonround 101/100 corollary. Tie every asserted theorem in metadata/README to a literally compared Challenge declaration; list other results as source-proven supporting theorems only. Ensure title and public abstract are consistent with eventual paper; do NOT write an unrequested paper.

The owner wants the title and statement to appear professionally in the public record. Do not promise that \`project.description\` renders TeX: inspect the live registry display or accepted source mapping where possible. Pin the exact *strings* that will be registered and the same text for the eventual paper. A copyable proposed entry preview, formal compared statements and trusted source links are required. No fabricated Palomar ID, version, acceptance/review claim or public citation.

## D. REAL Palomar preflight: mandatory acceptance gate

After assembling and pushing the proposed fully compliant snapshot:

1. Run verified safe local/static schema, source-header/physical-line and licence checks, pinned \`lake build\`, original exact \`#print axioms\`, and legitimate Comparator smoke tests with actual official syntax. Preserve logs/hashes.
2. Install/use PalomarSubmission’s **official pinned reusable GitHub Actions verifier**, as described in its current README. Its \`mode: preflight\` prepares, but **\`mode: full\` is mandatory to certify *predictive mechanical readiness***. Supply the exact public 40-character SHA, project path and comparator config, version-pinned workflow \`uses\` and matching \`pipeline_commit\`, truthful authorisation relationship, and correct options; never invent a shell \`palomar preflight\` command. Predictive workflow is **NOT** Palomar submission, review or registration and runs publicly on GitHub. Use corrective commits/retries based on exact machine diagnostics.
3. Confirm the **full-mode** report for the **final immutable SHA actually handed to the owner** reports a genuine mechanical SUCCESS for the original selected theorem(s), correct \`palomar-standard-v1\` (or current official profile) profile/digest, proof checker(s), Challenge/Solution statement match, source closure and axioms. A \`mode: preflight\` PASS alone is insufficient; existing project CI success alone is insufficient.
4. **SHA hazard:** session closeout and merging PR change commit identity. Run and record the final full-mode predictive verifier on the **actual final merged-main SHA including metadata, archived session files, handover and final code**, not merely an earlier PR-head SHA. If the final merge changes sources or a retry requires a new commit, re-run; no extrapolation from a different commit. Use an ordinary two-parent PR merge, then independently confirm main and separate merged-main project Lean/governance and Palomar full-mode result on that precise commit.
5. Be transparent that Palomar may still return different results under its live service or fail editorial AI research-interest/alignment criteria; a predictive mechanical success is not registration guaranteed. **READY_FOR_OWNER_PALOMAR_SUBMISSION** means a validated committed package, not Palomar acceptance/registration.

## E. Required S057 tracked artefacts and owner-facing handoff

Use \`sessions/S057/\` for:
- \`INPUT.md\`, \`PLAN.md\`, \`BASELINE_AND_POLICY.md\` (fresh SHAs, exact live policy/toolchain and source blockers).
- \`MIGRATION_LEDGER.md\` (all 78 existing Lean files + added files mapped, module/public import changes, toolchain/mathlib pin, proof repairs, no hidden source).
- \`STATEMENT_FIDELITY.md\` (literal frozen original 5/5 vs new types, both-direction mathematical semantics, Challenge import closure and Comparator comparison selected declarations).
- \`METADATA_AND_PUBLIC_PREVIEW.md\` (exact intended public title/description, authors, classifications, licences, source/AI disclosure, proposed paper matching, candidate public record).
- \`PREFLIGHT_EVIDENCE.md\` (runbook, commands, actual flags, run IDs, official profile, source lint, local/CI/kernel/comparator logs, PASS/FAIL/NOT_RUN; exact pinned source SHA and meaningful failure diagnostics).
- \`OWNER_SUBMISSION_HANDOFF.md\` (ONE fully qualified repo + **one actual 40-char submission SHA** only if ready; project/comparator/metadata paths, compare list, full predictive SUCCESS report link/profile, checklist for human submission and separate later review/registration decision; otherwise prominently **NOT_READY** and exact blockers; no fake ready commit).
- \`CLOSEOUT.md\` (scope, proof count, source-line detail, actual PR/merge/CI/evidence, truth-based readiness verdict).

Retain original session records; update project README/START_HERE/current state accurately. **Only when S057 has genuinely run** set last_completed_session=S057 and replace next handover with **S058 FUTURE / UNEXECUTED — TARGET NOT INSTALLED**, \`next_session_target_status=AWAITING_OWNER_TARGET\`, \`next_session_target=null\`, \`next_session_authorised=false\`. Do not suggest, choose or install S058’s substantive target. Owner will steer later.

**No unsupported success claim.** Hard tool/compute limits or source proof migration failures may prevent achieving READY in one session. In that event, preserve real attempts and surviving code, classify NOT_READY, report exact failures and owner-only decisions, then close S057 honestly rather than pretending success or running S058. The session target is ambitious by deliberate owner choice; do not water it down or stop at a first-pass scaffold.