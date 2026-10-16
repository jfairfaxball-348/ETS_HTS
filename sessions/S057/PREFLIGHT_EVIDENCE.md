# S057 — actual hosted compiler evidence / NOT_READY

Baseline independently green old-Lean project: GitHub Actions 38907772899 at entry main 69d4ee9d24c37fb62c65b4c53e1a30af75ebdcb2. The runs below are distinct PUBLIC CI work on the isolated session branch, NOT official Palomar submission or full predictive verification.

| Modern experimental CI run | Actual observation |
|---|---|
| https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38908066357 | FAILED precompiler, initial mistaken expectation 78 substantive vs actual 77 plus lakefile. Corrected script. |
| https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38908198290 | Compiler FAIL Cutoff.lean unknown Real.arctan_lt_arctan and Real.arctan_le_arctan after successful 77-file source transform, pin, lake update, Mathlib cache. |
| https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38908559862 | Compiler FAIL CyclicGapObstruction.lean private rational witness names forbidden in public theorem signatures. |
| https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38908980013 | Compiler FAIL RationalChord.lean analogous s034_X/Y/D visibility. |
| https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38909338320 | Compiler FAIL EarSufficiency.lean Finset.not_mem_erase API removal, list disjoint orientation and looping simp. |
| https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38909868510 | Compiler FAIL EarSufficiency.lean list disjoint proof after partial Mathlib API repairs. |
| https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38910404282 | Compiler FAIL EarSufficiency.lean list disjoint proof binder order/type mismatch at revised lines 73,75; full build never completed. |

The isolated CI dynamically used actual Lean v4.35.0 + exact Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679 and genuine lake update / cache retrieval, not just static textual rewrites. The experimental patch script in the repo is not itself a verified modern migrated proof. Modern five-root #print axioms: NOT_RUN because lake build failed. Comparator Challenge import closure: NOT_ASSEMBLED. Root SPDX licence and compliant v0.4 formalization.yaml: ABSENT. PalomarSubmission official mode=preflight: NOT_RUN; official mode=full: NOT_RUN; no run URL/digest/profile SUCCESS exists. No /api/submit, /api/verify, review, register or other public Palomar state action was sent. No ready full-40-character submission commit exists.

A mode=preflight-only success would not have established mechanical readiness anyway. Full predictive official workflow requires exact submitted SHA and pinned PalomarSubmission d4e41c1d5b0d114c4859e6e5831dc6d3ad1d0d44, options comparator_config_path and truthful relationship; next formal package work is owner-gated, not automated by S057 closeout.
