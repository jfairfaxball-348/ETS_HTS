# S056 — FUTURE / UNEXECUTED: PALOMAR REGISTRATION RECON, PREFLIGHT CLI AND PAPER–REGISTRY PRESENTATION

**TARGET STATUS: INSTALLED BY OWNER. FUTURE / UNEXECUTED. A new explicit owner invocation is required to execute S056.**

**Owner installation instruction, 16 October 2026:** “Well we move onto Palomar. Next session is a review/recon of the Palomar registration, what is needed and how it works. Specifically around the preflight CL stuff, and pay particular attention to what is actually displayed on a record in the register... look here: https://palomar-registry.org/entry.html?id=PALOMAR-2026-09-25-000010&version=1. I want the title and statement to be lined up with what is ultimately in the paper that is written. Something like ‘we prove;’ then the impressive looking theorem/formula. Make the next session prompt please.”

**Administrative installation ONLY.** This is not execution of S056; no Palomar submission, verification, registration, paper-writing, or S057 target is authorised by this installation.

Repository: https://github.com/jfairfaxball-348/ellipse-theorem. Lean namespace: \`ETSHTS\`. Last completed: **S055** (hostile novelty audit), merged PR #70, main commit \`01ea142c6a419a63e8ab3ea175d3e2bdcd19a953\`. Prior five exact Lean theorem targets remain complete; S055 current novelty verdict \`INDETERMINATE_ACCESS_GAP\`. All original mathematics is frozen.

## Sole mission — get the Palomar pathway and public presentation exactly right, **without submitting**

Conduct a concrete, source-verified reconnaissance of the Palomar Registry's current submission specification, *preflight CL/CLI* tooling and checks, authentication/review/registration flow, and above all what a public versioned registration **actually shows**. Produce an actionable, honest readiness analysis and **paper-aligned title/statement/abstract draft** for the eventual ellipse-theorem Palomar entry. This session is a planning-and-audit session, not a publication or submission session.

Do not promote “it passes Lean” into “Palomar-ready”; do not assume Palomar is a journal, a priority certificate, or an external expert peer review.

## Mandatory entry and scope integrity

1. Pin a **fresh** live canonical \`main\` commit/tree, open PRs/branches, current \`authoritative/STATE.json\`, \`AGENTS.md\`, \`authoritative/START_HERE.md\`, \`docs/SESSION_PROTOCOL.md\` and owner-steered policy. Verify S055 #70 merge and separate final PR-head and merged-main Lean/governance evidence, and record any discrepancies.
2. Read S020/S021 mathematical originals, S053/S054 semantic and proof evidence, \`ETSHTS/Definitions.lean\` and \`ETSHTS/Targets.lean\`, plus S055 \`CLAIM_MATRIX\`, \`HOSTILE_FINDINGS\` and \`CLOSEOUT\`. Preserve original theorem quantifiers, Euclidean nearest-*two predecessor* ranking with Cartesian-lex ties, retention/no proper crossings, all cardinalities, **closed** sufficient aspect-ratio bound and the nonround 101/100 corollary. Never claim the constant is optimal or novelty certified.
3. Audit repository *current as-is* readiness: project root versus nested Lake layout; \`lean-toolchain\`, \`lakefile.*\`, \`lake-manifest.json\`; exact module headers/public imports/source-file line counts; existing licence and SPDX identity; current Challenge/Solution/Comparator/config/YAML presence and compatibility; mathlib/Lean version; substantive versus thin wrapper. Label **PRESENT**, **MISSING**, **INCOMPATIBLE**, **UNKNOWN** with exact file/line evidence. No unapproved theorem changes, repository migration or technical “fixes” this session.

## 1. Study the ACTUAL PUBLIC REGISTER — owner-provided example is mandatory

**Primary exact example:** https://palomar-registry.org/entry.html?id=PALOMAR-2026-09-25-000010&version=1 (canonical JS route may be \`/entry?id=PALOMAR-2026-09-25-000010&version=1\`). This is the user's reference for how an entry appears.

- Inspect the rendered public page when technically possible, including top-line **title**, summary/abstract, author(s), classification, displayed mathematical statement or formatted compared declarations, hoverable Lean types, links to pinned Challenge, Comparator, dependencies, verification, editorial review, repository/commit, preservation, version history, and citation/BibTeX.
- Where JavaScript prevents reliable inspection, inspect the immutable machine record at \`https://data.palomar-registry.org/entries/PALOMAR-2026-09-25-000010-v1.json\`, the version manifest and \`https://data.palomar-registry.org/api/v1/results?id=PALOMAR-2026-09-25-000010\` using the publicly documented data API. Follow source links to its pinned \`formalization.yaml\`, \`Challenge.lean\`, \`comparator.json\`, and compare where the rendered strings come from. **Do not pretend data JSON is a rendered screenshot**; separate API-confirmed versus DOM-visible fields. If access still fails, explicitly mark which display points are **UNKNOWN** and use additional real entries.
- Inspect at least **two further entries** with contrasting title/abstract/statement presentation, using exact versioned URLs and source snapshots. Include one visibly good journal-like example and, if one exists, one technical/weakly titled example. Record what readers see and what they must click. Do not invent display fields or infer them from the repository name.
- Map **every relevant visible section → exact source field or file**, with citation, screenshot/quoted field when accessible. Critically distinguish \`formalization.yaml: project.name\` (default displayed title), \`project.description\` (public abstract), Comparator-selected Challenge declarations (formal statement surface), Challenge module/docstrings/README (informal statement and context), and the mathematical paper title/theorem which is not automatically a Palomar field. Check whether title overrides/normalisation exist in the live schema rather than assuming an undocumented capability.
- Establish permanence/versioning: why a cosmetic “we'll fix it afterwards” strategy is poor, what a versioned correction can and cannot do, and what the public citation actually preserves.

## 2. Thorough Palomar specification and **preflight CL/CLI** reconnaissance

Start with live official sources and version/date each finding:

- https://palomar-registry.org/how-to-submit
- https://palomar-registry.org/about
- https://palomar-registry.org/llms.txt
- https://submit.palomar-registry.org/llms.txt
- https://github.com/PalomarRegistry/PalomarPolicy/blob/main/CONTRIBUTING.md
- Palomar's current \`PalomarSubmission\` mechanical policy and Comparator specs; the current \`mathlib-initiative/formalization.yaml\` schema and starter repo.
- Any officially supported local **preflight CLI/CL**, scripts, comparator invocation, local CI recipe or agent protocol. **Find the real command names and flags from sources**; “CL” may be an owner's shorthand, not a published Palomar binary. Never invent a \`palomar preflight\` command.

Produce a **reproducible preflight command/runbook**, making the difference between (i) static local lint/format/schema check, (ii) Lake/Lean kernel build and original \`#print axioms\`, (iii) Comparator Challenge/Solution equality and statement dependency closure, (iv) source scan and metadata validation, (v) Palomar *bounded preliminary form/intake checks*, (vi) full remote verification using the official protocol, and (vii) editorial AI alignment review and **separate human-authorised permanent registration**.

Inspect specifically:

- Immutable publicly pushed **40-character SHA**; how project/comparator/metadata paths are selected; root versus nested projects; pinned toolchain/manifest, supported Lean/mathlib.
- A concise independent \`Challenge.lean\`, conventionally \`Solution.lean\` and \`comparator.json\` with exactly named compared declarations and identical types; Challenge statement allowed \`sorry\` but proved Solution must have **no \`sorryAx\`, no custom axioms, no \`Lean.ofReduceBool\`**. Only standard axioms \`propext\`, \`Classical.choice\`, \`Quot.sound\`; this does not automatically clear a bad Challenge dependency.
- **Challenge import closure:** allowed Lean/core Mathlib/Tau Ceti versions, no project-specific/opaque forbidden Challenge imports. A major possible packaging issue for the existing \`ETSHTS\` definitions must be **exposed**, not assumed solved; compare multiple packaging architectures (substantive repo versus permitted thin wrapper) without altering the theorem.
- Current **every \`.lean\` source must be a module** and have ≤10,000 physical lines, including unused files/contained path dependencies, with Challenge ≤1,000 lines and ≤100 KiB. Show risks of conversion, public imports, definition export, split modules, and source-scope rules. Root single-SPDX licence and \`formalization.yaml\` source/origin/maintainer/AI/review metadata.
- Current \`formalization.yaml\` schema fields \`project.name\`, \`project.description\`, authors/maintainers, \`classification.arxiv\` and \`msc2020\`, \`sources\` provenance and exact relationship, \`automation.methods\`, \`review.status\`, licence, ORCID if used; historical originality **uncertain after S055**, so no unqualified “first”, “novel”, or “accepted publication” claim.
- The difference between owner/maintainer **authorisation**, agent tag+gist challenge proof, GitHub OAuth (human), preflight/preliminary dry run, actual **\`POST /api/submit\`**, verification, private review, explicit opt-in register and irreversible/append-only public consequences. Recording a provisional path must NOT initiate any of these public or permanent actions.
- Strict access/conduct: machines must not drive the web form; if a local command would create a public workflow, tag, gist, OAuth request, Palomar submission ID or verification, it is **NOT** a harmless preflight. Only non-submitting, non-publishing local inspection/checks are authorised in S056, and report \`NOT_RUN\` if unavailable.

For any candidate CLI commands give their exact source URL, version/commit, execution location, prerequisites, inputs, expected outputs and whether they mutate files/network/public state. Identify what cannot be verified without actually assembling a compliant package.

## 3. Paper–registry alignment: title, “WE PROVE ...”, and prominent formula

Treat this as the core public-facing deliverable, **not decorative copywriting**. The paper has not yet been written and its final title is not settled; create **paper-facing candidates for owner decision** rather than pretend an approved title exists. Review the actual 5/5 exact theorems and avoid silently excluding a separately advertised headline theorem.

- Propose **2–4 serious mathematical titles**, prioritise a preferred title, and explain how the same title should appear in the eventual paper, README front matter, \`formalization.yaml project.name\` and Palomar heading. It should describe the **noncrossing insertion theorem for finite ellipse-boundary point sets under compulsory two-nearest-predecessor edges**, rather than merely “ellipse-theorem”, “ETSHTS”, “my Lean project” or an inflated novelty claim.
- Draft **one tight, paper-style abstract** and one **reader-facing theorem display**, starting naturally **“We prove that ...”** and then prominently displaying the exact mathematical aspect-ratio threshold, e.g.
  
  \[
  R=\sqrt{\frac{2}{\sin(2\pi/5)}-1}\approx 1.0502020989.
  \]
  
  A **provisional typographical sketch only** (NOT a substitute for the original theorem): For every finite set \`S\` of at least three distinct points on an ellipse of semiaxes \`a≥b>0\`,
  
  \[
  \frac{a}{b}\le \sqrt{\frac{2}{\sin(2\pi/5)}-1}
  \quad\Longrightarrow\quad
  \exists\text{ a noncrossing retained two-nearest-predecessor insertion order on }S.
  \]
  
  Spell out: initial triangle, each subsequent vertex attaches to exactly its two Euclidean-nearest **earlier** points, Cartesian-lexicographic tie rule, previous edges not removed; there is **no bound on |S|**, no minimum separation assumption, and the endpoint equality \`a/b=R\` is included. Avoid claiming “optimal threshold” or all ellipses. A mathematical formula is useful only if it accurately encodes the theorem.
- Make the **public entry mock-up** section by section: title, exact displayed abstract as a reader would see it, comparison declaration heading(s), source snapshot and author's provenance, mathematical statement block, relevant corollary \`a/b=101/100\`, supporting CLM0099 metric-ear iff (decide whether one entry or multiple compared declarations), other CLM0096/CLM0102 base analytic lemmas. Show what is actually configurable and where each string must be maintained. Distinguish a LaTeX paper formula from the rendered Lean statement and demonstrate exact semantic alignment.
- Write a **three-way crosswalk**: **paper title/abstract/theorem ↔ Palomar \`project.name\`/\`description\`/Challenge docs/Comparator ↔ original \`ETSHTS\` theorem declarations**. Classify each material phrase/quantifier as \`MATCH\`, \`GAP\`, \`REQUIRES_CHANGE\` or \`PROVISIONAL\`. Handle 5/5 theorems explicitly and show how a submission focusing on only CLM0107 could accurately describe supporting theorems.
- Review whether “We prove” is most appropriate at the *start of the public abstract* rather than in \`project.name\` (a journal-style title normally should not begin that way). Check line breaks and formula rendering in Palomar abstract versus math display **empirically**; don't assume Markdown/LaTeX is rendered in a plain-text abstract field. If no rich formula rendering in abstract, use clean prose there, and locate the exact symbolic theorem in the Challenge/readable compared statement and eventual paper. Prioritise professional mathematics over flashy misrepresentation.
- Decide how the paper will refer to Palomar immutable ID/version **once it actually exists**. No placeholder fabricated ID or claim the ellipse theorem is registered.

## 4. Required S056 artefacts (commit genuine evidence on one isolated session branch)

Archive in \`sessions/S056/\`:

1. \`INPUT.md\` — owner's installed instruction, the later execution invocation, pinned source refs.
2. \`PLAN.md\` — recon plan, explicit access limitations.
3. \`PUBLIC_RECORD_FORENSICS.md\` — mandatory user example + ≥2 real comparisons, observed page/JSON and fields-to-render mapping, permanent public exposure.
4. \`PALOMAR_REQUIREMENTS.md\` — cited living standards with revision/version and exact caps.
5. \`PREFLIGHT_CL_RUNBOOK.md\` — verified actual CL/CLI tooling, commands, safe/dangerous classification, local/hosted gates, expected outputs; no invented commands.
6. \`CURRENT_REPO_READINESS.md\` — file-level live gap matrix and feasibility of Challenge/Solution/Comparator without modifying original mathematics.
7. \`PAPER_REGISTRY_ALIGNMENT.md\` — 2–4 title candidates with one recommendation; “We prove ...” statement and threshold; public mock-up and exact crosswalk for all relevant CLMs, source map for each field.
8. \`RISKS_AND_DECISIONS.md\` — unresolved owner decisions, formal trust/novelty cautions, no claims of submission readiness unless actually established.
9. \`CLOSEOUT.md\` — source-level conclusions, actual tests and \`NOT_RUN\` statements, PR/CI/merge facts/gaps, owner gate.

This is enough to support a **subsequent owner decision**, but it must not write an unrequested paper, submit to Palomar, or install a next target.

## Session boundaries and formal exit

**NO** Palomar form submission, protocol initiation, public verification run, tag/gist challenge, OAuth flow, registration or withdrawal, publication, journal contact, arXiv upload, press announcement or irreversible external action. No new mathematics, theorem weakening, ratio optimisation, proof rewrite, novelty “upgrade”, or change to frozen original \`Definitions.lean\`, \`Targets.lean\` or verified Lean proof modules. Read-only local lint/dry-run or inspection allowed if actually safe and source-supported.

Use one isolated branch from fresh \`main\`, real authored commit(s), ordinary non-draft PR, merge via GitHub **merge** (two parents) and separate, actually observed PR-head and merged-main Lean/governance checks. Never misreport \`NOT_RUN\` as \`PASS\`. Do not use stale Palomar docs where 2026 policy has changed; cite dates and access gaps.

**Owner-steered closeout:** S056 completes with an honest report of the requirements, sample public presentation, commands, gaps and best paper/registry wording **for owner consideration**. Do **not recommend, choose or install S057's substantive target.** Replace the next prompt with a **non-executable S057 target-not-installed placeholder**, set \`last_completed_session=S056\`, \`next_session=S057\`, \`next_session_target_status=AWAITING_OWNER_TARGET\`, \`next_session_target=null\`, \`next_session_authorised=false\`. **Do not execute S057.**
