# S001 — Bootstrap "Easy to State, Hard to Solve" (ETS_HTS): a governed hunt for genuinely new open problems

Repository: https://github.com/jfairfaxball-348/ETS_HTS
This invocation authorises exactly ONE session: S001, bootstrap and governance only. S002 is NOT authorised. If the repository is empty, create a minimal seed commit (e.g. .gitignore) so that main exists, record that seed honestly, and do the authored scaffold on an isolated session branch.

## Programme aim (headline)

Find, state precisely and audit a small number of mathematical problems that are:
1. EASY TO STATE: understandable by a strong high-school student in at most ~3 sentences, with no specialist definitions beyond standard ones (integers, graphs, maps, grids, sequences, games, colourings, tilings).
2. HARD TO SOLVE: they resist every obvious attack. There must be concrete evidence of difficulty: failed elementary approaches, computational data that does not settle them, heuristics pointing both ways, or a link to known deep phenomena. A conjecture is not "hard" just because we didn't try.
3. GENUINELY NOVEL: not already stated, solved, or trivially equivalent to something in the literature or folklore.
4. NATURAL AND INTERESTING: a reason to care, such as elegance, surprising behaviour, links to known problems (Collatz, four colour, Erdős-type, Earth–Moon), or a sharp yes/no or exact-value question.

The deliverable of the whole programme is STATEMENTS, not proofs. Proof attempts are allowed only as difficulty probes or to kill a candidate (for example, showing it is easy or false). Resolving a candidate is a later, separately authorised phase.

## Binding programme rules (write these into AGENTS.md)

- Single authority: live remote main → authoritative/STATE.json → AGENTS.md → START_HERE → session protocol. Reconcile branches, PRs and records before writing anything.
- One numbered session per explicit owner invocation. Prompts marked FUTURE/UNEXECUTED never authorise themselves.
- Candidates: assign CND-#### with fields: exact statement; plain-language statement; domain; origin/mechanism (how it was generated); status; novelty grade; difficulty evidence; kill record.
  - Statuses: GENERATED, TRIAGED, KILLED_KNOWN (already in the literature), KILLED_EASY (solved quickly), KILLED_FALSE/DEGENERATE, KILLED_EQUIVALENT (trivially equivalent to a known problem), SURVIVING, SHORTLISTED, SELECTED_FOR_RESEARCH (owner-gated).
- Novelty grades, kept honest: NOT_SEARCHED, SHALLOW_SEARCH_NO_HIT, DEEP_SEARCH_NO_HIT, KNOWN_EXACT, KNOWN_VARIANT, KNOWN_EQUIVALENT. "No hit found" is never "novel". At most we can say no prior statement was located after a documented search of named sources and query lists.
- Sources: SRC-#### with URL/DOI, date, author and an honest access grade (METADATA_ONLY, ABSTRACT_INSPECTED, STATEMENT_INSPECTED, PROOF_INSPECTED, SECONDARY_ONLY). A search excerpt is not inspection.
- Claims: CLM-#### with status SOURCE_STATED, PROGRAMME_PROVED, COMPUTED_EXACT, HEURISTIC, INHERITED_UNVERIFIED. Computational evidence proves only its registered finite range.
- Computation: pre-register under CAM-#### (ranges, code, versions, hashes, stopping rules) before running. No "the computer says it's hard" claims without archived data.
- Required novelty sources for every surviving candidate: OEIS (exact terms and keywords), arXiv full-text search, MathOverflow/Math.SE, Erdős Problems database, Open Problem Garden, Wikipedia lists of unsolved problems, Guy's *Unsolved Problems in Number Theory*, Croft–Falconer–Guy *Unsolved Problems in Geometry*, Brass–Moser–Pach, the Kourovka notebook (group theory), Mathematics Magazine/AMM problem sections, recent 2025–2026 preprints and Zenodo/GitHub research repos. Log every query string and result count.
- GitHub: one isolated branch per session, one atomic authored session commit, ordinary PR, non-force two-parent merge, and independent verification of main, parents and tree. Zero hosted checks ≠ CI pass; endpoints you can't reach are UNKNOWN.
- Ethics: no invented citations, searches, OEIS lookups, data, hashes, PRs or CI results. No claim of novelty or importance beyond the evidence. Attribute every inspiration. Publication, preprints, OEIS submissions, MathOverflow posts and any contact with mathematicians each require separate explicit owner authorisation.

## S001 scope (do exactly this)

1. Entry evidence: pin the live main SHA/tree (or record "empty repo"), branches, PRs, workflows and protections (403 → UNKNOWN). Archive this owner instruction verbatim in sessions/S001/INPUT.md.
2. Scaffold, mirroring the Earth-Moon-problem programme layout:
   - AGENTS.md, README.md, authoritative/{START_HERE.md, STATE.json, NEXT_SESSION_PROMPT.md}
   - docs/{SESSION_PROTOCOL, DECISION_LOG, FAILURE_LEDGER (kill ledger), SESSION_LEDGER, PHASE_GATE_LEDGER, NOVELTY_PROTOCOL, DIFFICULTY_PROTOCOL, INTEGRITY_CHECKLIST}.md
   - catalogue/{SOURCES, CLAIMS, CANDIDATES}.{md,json} (paired and kept in sync)
   - campaigns/README.md; research/{GENERATION_MECHANISMS, TASTE_CRITERIA, PRIOR_ART_LANDSCAPE}.md
   - sessions/S001/{INPUT, PLAN, CLOSEOUT}.md
   - scripts/check_scaffold.py (stdlib governance checks: required files, ID uniqueness, valid statuses, sources referenced exist, candidate fields present, STATE/next-prompt consistency)
   - tests/ and a GitHub Actions workflow running both. State clearly that these checks validate records, not mathematics.
3. Write the methodology documents (substantive, not filler):
   - TASTE_CRITERIA: a scoring rubric (statement length, prerequisite level, naturalness, sharpness of the question, difficulty evidence, novelty grade, connections, computational testability, risk of triviality), plus worked examples scored against it: Collatz, four colour, Erdős–Straus, the happy ending problem, Hadwiger–Nelson, Earth–Moon. These calibrate the rubric; they are not candidates.
   - GENERATION_MECHANISMS: concrete, reproducible ways to produce candidates. For example:
     - mutate famous problems (change the operation, the base, the dimension, the surface, the number of layers);
     - "two constraints at once" combinations (as Earth–Moon is to four colour);
     - extremal or exact-value questions in small finite systems;
     - dynamical iterations on integers, digits, permutations or graphs;
     - games and tilings;
     - questions suggested by unexplained computed sequences (an OEIS-gap search);
     - questions arising from existing open-problem lists one step removed.
     Each mechanism has a known failure mode (e.g. mutations are often already studied, trivially easy, or ugly).
   - NOVELTY_PROTOCOL: two-pass audit (shallow triage, then deep). Required sources and query logging. Equivalence checks (restate the candidate in 2–3 other languages, e.g. graph / number / game, and search each). Rules for grading.
   - DIFFICULTY_PROTOCOL: a cheap kill battery to run before any candidate survives:
     - small-case brute force;
     - an obvious invariant or counting argument;
     - reduction to a known theorem;
     - a probabilistic or heuristic estimate;
     - check whether a quick solution exists in standard references;
     - "would a strong olympiad student solve it in a day?"
     Surviving the battery is evidence, not proof, of hardness.
   - PRIOR_ART_LANDSCAPE: map the major existing lists of open problems and what kinds of problems are over-mined (where "new" ideas are probably known) versus under-explored.
4. Phases in PHASE_GATE_LEDGER:
   0. Bootstrap (S001).
   1. Generation + triage.
   2. Deep novelty audit of the shortlist.
   3. Difficulty probing + computational evidence.
   4. Owner selection of one or more problems.
   5. Optional research programme on a selected problem (separately authorised).
   6. Optional publication of the problem statement (owner-gated).
   Gates are evidence-driven, never automatic.
5. Do NOT generate, search or audit candidates in S001 beyond the calibration examples. S001 is administrative.
6. Write a complete FUTURE UNEXECUTED S002 prompt: the first synthesis session. Target ~40–100 generated candidates across at least 5 mechanisms and several domains. Triage all of them with the rubric and kill battery, run a deep novelty audit on the top ~10, and end with a shortlist of 3–5 SURVIVING candidates, each with:
   - exact statement and a one-paragraph plain-language version;
   - why it's natural;
   - difficulty evidence (computations registered as CAM);
   - novelty grade with the full query log;
   - the nearest known problems and how it differs.
   S002 must record every kill with its reason and must not claim novelty or difficulty beyond the evidence. No S003, proof programme, posting or publication.
7. Exit: update STATE/ledgers. One atomic commit on the session branch, ordinary PR, non-force merge where available, independent verification of the merge parents and main. The S001 closeout must not pre-write outgoing SHAs or PR numbers; S002 reconciles them from live evidence.
