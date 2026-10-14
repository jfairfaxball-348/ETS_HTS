# S022 — FUTURE / UNEXECUTED: Lean 4 formalisation of existing ellipse theorem

**FUTURE — UNEXECUTED. Only a NEW explicit owner invocation in a NEW ETS_HTS conversation authorises exactly S022.** S021's audit PASS is internal mathematics, NOT a compiled Lean proof, independent reviewer assessment or historical novelty certificate.

## Mandatory objective (NO theorem extension)

Formalise precisely the **existing** CLM-0096, CLM-0099, CLM-0102, CLM-0107, CLM-0108 in Lean 4/mathlib, based on the audited proof in `sessions/S021/MATHEMATICS.md` and detailed `sessions/S021/LEAN_BLUEPRINT.md`. The headline theorem is: for EVERY finite set of n>=3 distinct sites on any ellipse with a>=b>0 and 1<=a/b<=R=sqrt(2/sin(2pi/5)-1), there EXISTS a crossing-free chronological retained nearest-two predecessor insertion order, with Euclidean distance and specified lex Cartesian ties. Corollary: nonround r=101/100 refutes circle-only uniqueness. DO NOT improve R, investigate r>R, generate fresh candidates, do a computational counterexample hunt, publish, submit to Palomar, author a paper or contact anyone. Focus on exact existing theorem, not on stronger variants.

## Entry and integrity

Independently pin LIVE remote main SHA/tree; reconstruct S021 authored sole-parent commit, ordinary non-draft PR and ordered two-parent nonforce merge with identical tree, observed PR/main hosted checks, branches/PR conflicts, rulesets/protection (403 UNKNOWN) and statuses vs checks. Reconcile authoritative/STATE.json, AGENTS.md, START_HERE, session protocol, S021 audit/attack log/blueprint/closeout, paired catalogues, CAM records and ledgers. Expected if S021 integrated: CND131 killed131; SRC79 CLM108 CAM10, 0 TRIAGED/SURVIVING, S016 original detached CAM8/9 archive exception persists, CAM3/5 failures and CAM10 floating rejection unchanged. Do not assume these counts or SHA without live verification.

## Formalisation execution

Use `sessions/S021/LEAN_BLUEPRINT.md` as the full specification, including exact definitions, draft theorem signatures, proof dependency graph, endpoint and tie cases, planned mathlib imports, analytic bottlenecks, and success criteria. Pin `lean-toolchain`, `lakefile.toml`, `lake-manifest.json`, mathlib SHA and build logs for reproduction. In an approved existing repo on one isolated session branch:
1. Formalise ellipse, finite distinct boundary sets and cyclic indexing; Euclidean squared distances; exact lex tie selection; proper crossings; chronological graph with initial triangle and retained edges; convex metric hull ears.
2. Prove n=3/4 CLM0096, full iff ear recursion CLM0099 (edge count, hull edges, last degree two and reverse insertion).
3. Prove CLM0102 analytic identity and BOTH outward derivatives, strictly increasing chords under span <Lambda; include the stated short-arc deletion theorem.
4. Prove CLM0107 with strict eligible existence even when k=5,r=R; metric minimiser among eligible spans; forward, backward and central cases INCLUDING equality cutoffs; strict two-neighbour preference irrespective of ties; recurse for all cardinalities.
5. Prove exact r=101/100<R and CLM0108 corollary.
6. Build with clean pinned Lean/mathlib and archive all actual output; run `#print axioms`, inspect statements, and reject any `sorry`, `admit`, custom new axioms, hidden weakening, cheat/trust gaps. Partial work is NOT Lean certification. Do not claim proof complete until ALL original quantifiers and cases compile unmodified. Realistic scope: an incomplete formalisation is an honest outcome, with an exact dependency map and blocking goals staged for FUTURE S023 only.

Record exact status, compiler versions/logs, theorem code and dependency provenance; avoid claiming existing mathlib lemma/module names without verifying. Palomar is an owner-gated FUTURE stage after fully clean formalisation, not S022 work. Do NOT create a separate formalisation repository without owner permission.

## Governance and integration

Exactly one S022. Record immutable INPUT, PLAN, precise Lean proof artifacts and logs/blocked obligations, novel-source limitations, CLOSEOUT and VALIDATION; update STATE/ledgers and paired records only where warranted. Attempt true checkout `python scripts/check_scaffold.py` and `python -m unittest discover -s tests -v` and classify NOT_RUN honestly if DNS/permissions prevent. Use one fresh isolated branch, one atomic authored commit, ordinary non-draft PR, observed hosted record-only checks, ordered two-parent NONFORCE merge and independently checked main/ref/tree. Stage S023 FUTURE only (implementation requires NEW explicit invocation); no S023, Palomar, publication or outreach.
