# ETS_HTS — binding agent instructions

## Authority and reconstruction
Live remote main -> authoritative/STATE.json -> AGENTS.md -> authoritative/START_HERE.md -> docs/SESSION_PROTOCOL.md. Pin the remote SHA and tree, inspect all branch/PR/session conflicts and gate state before edits. Do not infer remote state from earlier session notes. Where records conflict, stop and document reconciliation; do not silently choose a convenient history.

## Scope and owner gates
Exactly ONE numbered session per explicit owner invocation. A FUTURE/UNEXECUTED prompt is a handoff, never authorisation. This programme produces carefully stated research QUESTIONS, not results. Do not turn a session into a proof programme. S001 is bootstrap and governance only, with calibration examples permitted. S002 must not be executed during S001. Owner separately authorises selection for research, proof projects, publication, preprints, OEIS, MathOverflow, mathematician contact, or external postings.

## Candidate and evidence contracts
Assign CND-#### sequentially to every generated candidate; keep catalogue/CANDIDATES.json and .md paired. Required: exact statement; plain-language statement; domain; generation origin/mechanism; status; novelty grade; difficulty evidence; kill record; source/claim/CAM references. Candidate statuses are GENERATED, TRIAGED, KILLED_KNOWN, KILLED_EASY, KILLED_FALSE/DEGENERATE, KILLED_EQUIVALENT, SURVIVING, SHORTLISTED, SELECTED_FOR_RESEARCH. The last status requires an explicit owner gate; no automatic promotion.
Novelty grades: NOT_SEARCHED, SHALLOW_SEARCH_NO_HIT, DEEP_SEARCH_NO_HIT, KNOWN_EXACT, KNOWN_VARIANT, KNOWN_EQUIVALENT. A no-hit does not establish novelty. Use only the wording "No prior statement located after the documented searches" with documented limitations.
Source SRC-#### must carry URL/DOI, author, date and access grade (METADATA_ONLY, ABSTRACT_INSPECTED, STATEMENT_INSPECTED, PROOF_INSPECTED, SECONDARY_ONLY). Search snippets are not source inspection. Claim CLM-#### has SOURCE_STATED, PROGRAMME_PROVED, COMPUTED_EXACT, HEURISTIC or INHERITED_UNVERIFIED. Computations prove no assertion outside their finite registered range.
Before running any computation, register CAM-####, input bounds, stopping rule, code location/version/hash, environment and output preservation path; never backfill the preregistration.

## Mandatory scrutiny
Every surviving candidate needs the two-pass novelty protocol and the cheap difficulty kill battery. Search OEIS (terms and keywords), arXiv full-text, MathOverflow/Math.SE, Erdős Problems, Open Problem Garden, Wikipedia unsolved lists, Guy, Croft–Falconer–Guy, Brass–Moser–Pach, Kourovka, Mathematics Magazine/AMM problems, 2025–2026 preprints and Zenodo/GitHub repositories. Log every literal query, date, scoped endpoint, hit count, access level and limitations; unavailable searches are UNKNOWN, not zero hits. Translate each candidate into two or three other mathematical descriptions and search those too.

## GitHub and integrity
One isolated branch per session, one atomic authored session commit, ordinary PR, non-force *two-parent* merge to main if available. Independently verify branch commit's sole parent, its tree, merge's two parents, remote main and tree; capture blockers honestly. Never force-push. Hosted checks count only if observed; no checks means ABSENT_NOT_PASS. Endpoint HTTP 403 and unavailable rules are UNKNOWN, not unprotected. The checker and CI validate RECORD FORMAT and GOVERNANCE ONLY—not novelty, mathematical difficulty or correctness.

## Ethical boundaries
No fabricated citations, access claims, search queries, result counts, data, hashes, merge SHAs, PRs, check runs or findings. Attribute all inspirations. Kill false/easy/equivalent candidates with transparent records and preserve their lineage. Do not quietly delete failed ideas.
