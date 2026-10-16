# S055 — FUTURE / UNEXECUTED: hostile prior-art and novelty audit of the exact ellipse theorem

**TARGET STATUS: INSTALLED BY OWNER. FUTURE / UNEXECUTED. A new explicit owner invocation is required to execute S055.**

**Installation authority:** On 16 October 2026 the owner explicitly directed: "The next stage is prior art/novelty audit. Please install that as the next session." This updates only the future session's target; **this installation does not execute S055**, authorise S056, publish, seek third-party review, or change any mathematics.

Repository: https://github.com/jfairfaxball-348/ellipse-theorem. Lean namespace: `ETSHTS`. Last completed session: S054. The five *literal original* direct theorems were Lean-proved in S053 and semantically/axiom-audited in S054. Those are mathematical/formalisation results, **not** evidence of literature novelty or priority.

## Sole objective — independently determine what is novel, known, equivalent or still unknown

Conduct a **substantial, hostile, current prior-art search** of the precise formalised theorem, supporting lemmas and presentation-level claims. The central question is whether earlier mathematical literature already proves the theorem or a mathematically equivalent, stronger or easily specialised result. This must not be framed as an exercise to defend a favourable novelty verdict. If a match is found, identify it prominently, reduce the verdict accordingly, and explain the exact theorem-level relationship.

Examine at least these frozen mathematical statements **without weakening or paraphrasing away their quantifiers**:

1. **CLM0107 (main result):** For every finite `n ≥ 3` set of *distinct points* on any ellipse `a ≥ b > 0` with `a/b ≤ R = sqrt(2/sin(2π/5) − 1)`, including **equality** at `R`, there is an insertion order that adds edges to the **two nearest Euclidean predecessors**, with **Cartesian lexicographic tie-breaking**, retains all previous edges and leaves no proper crossings. This is about **an existence of chronological orders**, not just a static two-nearest-neighbour graph, Delaunay triangulation or arbitrary noncrossing spanning graph.
2. **CLM0108:** The genuinely non-circular all-cardinality `a/b = 101/100` instance.
3. **CLM0099:** The exact **iff** classification of finite strictly convex position sets by a **complete recursive metric-ear deletion certificate**, including both necessity and sufficiency.
4. **CLM0096:** Full three/four-point no-three-collinear geometric base cases, assessed for originality separately, including possibility they are folklore.
5. **CLM0102:** Both endpoint outward derivative statements and the *strict* short-directed-arc Euclidean chord extension on ellipses; test for existing known inequalities rather than claim a basic analytic lemma is new.
6. The claimed role of `R` must remain **sufficient, not asserted optimal**. Independently distinguish novelty of a numerical threshold, of a structural existence theorem, of proof technique, and of a formalised Lean statement.

## Mandatory source and search method

- Pin fresh live canonical `main` SHA/tree and audit lineage: S054 #66 and post-S054 owner-gate administrative PR #67, including separate merged-main pinned Lean/governance checks and original frozen Definitions/Targets. Reconcile `STATE`, `AGENTS`, `START_HERE`, `docs/OWNER_STEERED_SESSION_POLICY.md`, `docs/SESSION_PROTOCOL.md`, and previously audited novelty records. Do not mistake successfully compiled Lean theorems for independent priority evidence.
- Read **`sessions/S020/MATHEMATICS.md`, `sessions/S021/MATHEMATICS.md`, `sessions/S024/CLOSEOUT.md`, `sessions/S024` novelty/source evidence**, and S053/S054 coverage and semantics; build a faithful claim matrix **before searching**.
- Follow `docs/NOVELTY_PROTOCOL.md` as a floor. Query original phrasing and reformulate in **at least three genuinely different mathematical vocabularies**: (i) online/incremental straight-line geometric graphs and two closest *previous* neighbours, (ii) elimination/ear-deletion orders and convex or outerplanar graphs, and (iii) greedy geometric triangulations, visibility/nearest-neighbour proximity graphs, chordal structures, order-type/ellipse versus circle metric geometry. Search static k-NNG and Delaunay literature too, but prove actual implication in the right direction before treating as a match.
- Search recent **2025–2026** preprints and the entire older foundational chain, including bibliographies/citation trails, arXiv, publisher/journal pages, scholarly catalogues, MathSciNet/zbMATH when accessible, Google Scholar or equivalent citation indices when accessible, MathOverflow/Math.StackExchange, OEIS *where relevant*, mathematical books/monographs/problem sections, dissertations, and research repositories. Log inaccessible sources precisely; do not imply database completeness.
- Explicitly re-open or try to access the historically critical **2004 ordered θ/nearest-neighbour** result, **1992 greedy triangulation** paper and the **2011 Ábrego et al.** author-hosted manuscript discussed in S024. Trace their cited precedents and forward citations. An inaccessible full paper remains **UNKNOWN**, not proof of non-overlap. Check publication versions and theorem numbers.
- For every significant candidate source, record authors, complete title, date, version, bibliographic identifiers/DOI/URL, exact theorem/section/page, inspection level (`METADATA_ONLY`, `ABSTRACT_INSPECTED`, `STATEMENT_INSPECTED`, `PROOF_INSPECTED`, `SECONDARY_ONLY`), how accessed, and precisely what it implies. Clearly separate a search snippet from inspected text. Correct any previously overgraded source and preserve historical records rather than silently overwrite them.
- Maintain a **dated reproducible literal search log**: database, query string, UTC or Europe/London timestamp, filters, result count **or UNKNOWN**, hits inspected, follow-up and access errors. Enumerate **closest threatening prior art**, even when it undermines novelty. Use paper originals wherever accessible; test actual logical implication including all finite n, arbitrary site subsets, chronological tie rule, retained edges, closed aspect bound and certificate iff.
- Write a bidirectional comparison for proposed equivalences; if a stronger known theorem covers the main result, clearly identify the specialisation and label the originality claim unsupported even if our proof differs. Conversely, do not dismiss close results because they use different names or definitions.

## Required S055 deliverables

Archive in `sessions/S055/`: `INPUT.md` (verbatim owner authorisation and entry refs), `PLAN.md`, `CLAIM_MATRIX.md`, `NOVELTY_QUERIES.md`, `PRIOR_ART_MATRIX.md`, `SOURCE_DOSSIER.md`, `HOSTILE_FINDINGS.md`, and `CLOSEOUT.md`. Produce source-level exact comparisons and explicit crosswalk to S024 claims/source grades. Use source IDs consistently when registering new literature; keep JSON/Markdown registries in sync when changed.

Issue **one sharply qualified final verdict** separately for: (a) exact CLM0107, (b) CLM0099 and other structural components, (c) numerical ratio/nonround instance, (d) originality of proof methodology, and (e) practical paper novelty. Suggested evidence statuses: `KNOWN_EXACT`, `KNOWN_EQUIVALENT`, `KNOWN_STRONGER`, `KNOWN_VARIANT`, `NO_MATCH_LOCATED_IN_LOGGED_SEARCH`, `INDETERMINATE_ACCESS_GAP`. These are **audit conclusions**, not declarations of historic priority. Explain any changes to the earlier S024 `CONDITIONAL_NOVELTY_SUPPORTED` assessment; if justified, update the current state with correct provenance, but do not retroactively rewrite S024.

**Do not** assert "first", "unprecedented", "publishable", "novelty verified", or "not in the literature" solely from unproductive searches. An honest negative or indeterminate verdict is better than unwarranted optimism.

## Frozen scope, exit, and owner steering

This is **literature and novelty auditing only**. Do **not** invent new mathematics, vary the theorem threshold, add/change Lean proofs or definitions, construct an optimised bound, produce/submit a paper or arXiv preprint, contact editors/referees, or initiate public priority announcements. Original exact mathematics is frozen as in S020/S021 and S053/S054. Research citations and factual state may be updated as audit evidence warrants.

Use one isolated session branch, genuine authored commit(s), ordinary non-draft PR, GitHub two-parent merge, and independent PR-head and **merged-main** governance/Lean checks. No local compiler test can be claimed if unavailable. Close S055 with a complete evidence-based report, gaps and blockers. **Do not suggest or install an S056 target**; replace the next prompt with only `# S056 — FUTURE / UNEXECUTED — TARGET NOT INSTALLED`, set `next_session_target_status=AWAITING_OWNER_TARGET`, `next_session_target=null`, `next_session_authorised=false`, and leave the next target to the owner. **Do not execute S056.**
