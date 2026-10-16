# S058 owner Palomar handoff — **NOT_READY FOR SUBMISSION**

## Verified proof and comparator outcome

Original exact five theorem names and full propositions are preserved under Lean v4.35.0:
`ETSHTS.clm0096_exact`, `ETSHTS.clm0099_exact`, `ETSHTS.clm0102_exact`, `ETSHTS.clm0107_exact`, `ETSHTS.clm0108_exact`.
Root Comparator relative path: `comparator.json`, containing all five theorem names and 27 supporting definition declarations. Strongest public successful local comparison: https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38922156993 on `fcb9e607ef8cccac80470dfcbbdd9b0801caf0de`. Con-ron, NanoDa and Lean accepted the proof; modern source build and exact statement-fidelity checks also passed.

## Public-facing title and abstract (CANDIDATE only)

**Title:** Noncrossing Two-Nearest-Predecessor Orders on Nearly Circular Ellipses

**Prospective record abstract:**
We prove that every finite set of at least three distinct sites on an ellipse with semiaxes a >= b > 0 and a/b <= sqrt(2/sin(2*pi/5)-1) admits a noncrossing retained order joining each inserted site after an initial triangle to exactly its two Euclidean nearest predecessors. Cartesian-lexicographic ties are resolved exactly and old edges are retained. The sufficient threshold includes equality, imposes no size or separation bound, and yields the nonround all-cardinality example a/b=101/100. We also prove a metric-ear certificate iff in strictly convex position, complete three/four-site cases, and ellipse short-chord derivative/extension estimates. No threshold sharpness or historical priority is claimed.

This is aligned with the prospective paper and `sessions/S058/METADATA_DRAFT.md` but NO final paper title has been approved. Metadata rendering on a real submitted Palomar entry remains unobserved; don't promise TeX styling.

## Exact blockers (owner choices and official machine verification)

- **Root SPDX licence: OWNER CHOICE REQUIRED.** No `LICENSE` has been granted or created. An actual explicit choice such as MIT or Apache-2.0 from the rights holder would be required, then a full standard text installed with matching `project.license`. Do not construe "run" or "continue" as a copyright grant.
- Final production `formalization.yaml` v0.4 not installed. Draft contains `OWNER_SPDX_CHOICE_REQUIRED`, intentionally invalid and outside root. Author/maintainer, automation and provenance claims need final factual approval; no invented ORCID.
- The submitter must truthfully decide and affirm their `authorization_relationship` according to the Palomar form; current session does not assert that human statement as a machine credential.
- Run official credential-free **predictive** `mode: full` reusable workflow, pinned to `d4e41c1d5b0d114c4859e6e5831dc6d3ad1d0d44`, with exact **FINAL MAIN SHA**, `comparator_config_path=comparator.json`. Require machine-reported PASS, actual profile ID and digest; otherwise NOT_READY. Repo URL alone and local `lake comparator` PASS are insufficient.
- No actual submit/register action has been authorised or taken. S055 novelty verdict `INDETERMINATE_ACCESS_GAP` remains active, distinct from Lean proof soundness.

**Submission candidate commit SHA: NONE certified.** The previous Comparator success is proof-validation evidence, not submission certification. Consult `sessions/S058/VERIFICATION.md` for source checks and real CI links. Owner directs whether/when a new session is installed; no automatic S059 target.
