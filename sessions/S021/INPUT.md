# S021 — owner invocation and immutable source prompt

Explicit owner invocation in a NEW ETS_HTS conversation, 2026-10-14 Europe/London: `run this session https://github.com/jfairfaxball-348/ETS_HTS/blob/main/authoritative/NEXT_SESSION_PROMPT.md`.

## Live S021 entry prompt (verbatim)

# S021 — FUTURE / UNEXECUTED: hostile theorem audit; formalisation handoff IF the proof survives

**FUTURE — UNEXECUTED. Requires a new explicit owner invocation in a NEW ETS_HTS conversation.** This owner steer changes the future S021 plan; this administrative edit is NOT S021 execution, does not run S022 or Lean, and does not authorise Palomar, a manuscript, publication or outside contact.

## Binding owner instruction (2026-10-14)

"If we have something genuinely interesting here, let's make the next session the hostile theorum audit, but if it survives let's move to formalisation of what we have rather than trying to extend it."

Therefore S021 is a **hostile theorem audit, not an extension session**. Its only mathematical objective is to establish whether S020 CLM-0107/0108 withstand independent adversarial reconstruction. If the complete proof survives, the immediate successor must be **Lean 4 formalisation of existing results**, with no additional threshold optimisation, new conjecture, computational hunt or strengthened theorem. S021 must prepare a formalisation blueprint and stage S022 FUTURE; S021 must NOT implement S022.

## Entry and reconciliation (mandatory)

1. Independently pin LIVE main SHA/tree, not a remembered reference. Reconstruct S020's sole-parent authored commit ebc949d8a7788cd390dfd6b4a2923af9509d0956 (parent 7a4d5dc0ccff46ae1fadcab7bc35b777d912f59b), ordinary non-draft PR #22, both observed hosted record-only checks, ordered two-parent nonforce merge c265375c74a2b72f3d6760d3425eebd1b4d78322, and identical authored/merge tree 2355c4c1a3a86c1515640edede1e2839a15fd76b. Independently check the live state; do NOT assume these hashes remain the head.
2. Inspect all branches/PRs/competing S021, jobs/check-runs/statuses, rulesets, and branch protection (403 UNKNOWN; no check ABSENT_NOT_PASS). Read authoritative/STATE.json, AGENTS.md, START_HERE, session/novelty/difficulty protocols, S016–S020 mathematics, claims, candidates, sources, campaigns and phase/decision/failure/session ledgers.
3. Expected integrated records: CND131 ALL killed, including CND-0131 KILLED_FALSE/DEGENERATE; SRC79 CLM108 CAM10 TRIAGED0 SURVIVING0. Original S016 six-file CAM8/9 archive SHA256 f30f4fbed674e26c7be26f434a915fd5062ac08f6c6d18d1c98d5a460640cb35 still OFF GitHub. Do not fabricate replacements. Preserve CAM3/5 FAILED and CAM10 false near-duplicate float signals. S019 CAD was theoretical, NOT executed. Novelty and external review not independently certified.

## Adversarial proof audit: NO strengthening, NO threshold hunting

Target CLM-0107: for every n>=3 and every set of n distinct points on an ellipse of axis ratio 1<=r=a/b<=R=sqrt(2/sin(2pi/5)-1) approximately 1.0502020989, some chronological nearest-two-predecessor insertion order is crossing-free (start with triangle, retain edges, Euclidean distances with lexicographic ties). Target CLM-0108: this implies noncircle r=101/100 disproves circle-only uniqueness CND-0131.

**Attempt to break the proof rather than endorse it.** Independently reconstruct the entire dependency chain, without simply copying S020:

A. CLM-0099 iff recursive removal of a metric convex-hull ear equals the existence of a plane chronological nearest-two predecessor order. Audit the planar graph edge count, exposed hull edges, 2-neighbour final vertex, reverse insertion without proper crossings, lex ties and strict convexity. Check the CLM-0096 complete four-point base and n=3 case.

B. S018 CLM-0102 endpoint-extension derivative for chords on an ellipse. Derive independently the exact derivative, angular parameter and strict monotonicity cutoff Lambda=4atan(b/a); address equalities and swapped endpoints, not just intuition or diagrams. Prove no illicit opposite-direction chord comparison is used.

C. CLM-0107 global ear: cyclic gaps sum 2pi; eligible two-step spans sum 4pi, and for k>=5 at least one is strictly below Lambda. Prove that choosing a **minimum metric skip chord AMONG eligible spans** makes both immediate-neighbour chords strictly shorter. Audit short forward competitors using the next eligible span, short backward competitors using the previous eligible span, and the central band [Lambda,2pi-Lambda] using floor 4ab^2/(a^2+b^2). Verify the bound 2a sin(2pi/5), the exact inequality r^2+1<=2/sin(2pi/5), and every strict/weak and endpoint transition. Audit whether arbitrary close sites, wraparound at 2pi, nested clusters, near-antipodal support points, symmetric equal distances, and removal of an ear at every remaining k are all genuinely covered. Specially challenge k=5 and equality at r=R.

D. CLM-0108: verify that 101/100 lies strictly inside the exact symbolic interval WITHOUT reliance on a rounded decimal, and that the ALL-finite-site universal quantifier is truly established. Do not infer an exact full ellipse classification, optimality of R or historical priority.

E. Search for a rigorously specified counterconfiguration or a decisive omitted case. A numerical CAM is allowed ONLY if indispensable and preregistered before any execution with exact rational squared distances, immutable code/hash/input/stopping rule/raw and independent exhaustive order certification. No floating near-zero evidence and no reuse of failed CAM3/5 or CAM10 pseudo-witnesses. Native literature and independent difficulty checks, where performed, must log dated literal queries, original-source access grades and UNKNOWN rather than invented zero counts; do not infer novelty from missing evidence.

## Required audit outcome: fail-closed four-way gate

At conclusion explicitly declare ONE outcome, with a lemma-by-lemma audit table, concrete attack attempts, unresolved obligations and their scope:

1. **AUDIT_PASS_CONDITIONAL_FORMALISATION** — every necessary lemma, endpoint, tie, quantifier and recursive step has been independently reconstructed and no fatal gap remains. This is only a rigorous internal audit, NOT external peer review, a published novelty certificate, or Lean verification. Preserve CLM-0107, CLM-0108 and CND-0131 statuses unless a correction is warranted. **Immediately pivot the next session to Lean formalisation of exactly what we have.** In S021 create sessions/S021/LEAN_BLUEPRINT.md containing:
   - precise definitions for ellipse-boundary points, Euclidean squared distance, lex tie selection, cyclic ordering, no proper edge crossings, chronological graph, convex hull neighbours and metric-ear deletion;
   - Lean 4/mathlib theorem statements, explicit variables/hypotheses and dependency graph for CLM-0096, CLM-0099, CLM-0102, CLM-0107 and CLM-0108;
   - needed helper lemmas (finite cyclic indexing, orientation/crossing, ellipse trigonometry/derivatives, chord comparison, real-algebraic bounds, strict tie/endpoint cases, well-founded finite ear deletion, reversal);
   - proof decomposition, anticipated mathlib coverage and honest analytic bottlenecks, repository/toolchain choices, exact pass/fail acceptance criteria (no sorry, no new axioms, no weakened hypotheses; compile in clean Lean environment), reproducibility and Palomar readiness as a future gate;
   - a complete FUTURE S022 Lean-formalisation execution prompt in authoritative/NEXT_SESSION_PROMPT.md. S022 implementation requires a NEW explicit owner invocation. A separate formalisation repo may be recommended, not created without permission.
   Do NOT attempt R improvement, r>R bad-set discovery, new open-problem candidates or unrelated mathematics after PASS.

2. **REPAIR_REQUIRED** — a specific gap exists that may be repairable. Identify exact false/unproved step and give best rigorous repair within the audit; if not fully repaired, fail the gate, correct claim/candidate status transparently when warranted, and stage S022 FUTURE proof-repair rather than Lean.

3. **REFUTED** — produce a decisive mathematical disproof or exact counterexample, correct paired claim/candidate/STATE records with provenance and stage S022 FUTURE recovery rather than Lean.

4. **INCONCLUSIVE** — some essential lemma or case remains unchecked; write precise unresolved obligations and stage S022 FUTURE further audit, NOT Lean.

## S021 repository outputs and process

Complete exactly ONE S021 from its later explicit invocation. Produce INPUT/PLAN, hostile mathematical audit, attempted falsifications and outcomes, novelty access limitations, closeout/validation and, only on PASS, LEAN_BLUEPRINT and staged Lean implementation prompt. Do not create unnecessary CND/SRC/CLM/CAM; only change mathematical statuses on warranted proof corrections; keep JSON/Markdown paired. Update STATE and ledgers honestly. Attempt true-checkout python scripts/check_scaffold.py and python -m unittest discover -s tests -v (NOT_RUN if GitHub DNS prevents checkout). One isolated branch, one atomic authored commit, ordinary non-draft PR, observed hosted governance-only CI, NONFORCE ordered two-parent merge and independently rechecked main SHA/ref/tree. Stage S022 FUTURE, no S022 execution, Lean implementation, Palomar, paper or external work in S021.
