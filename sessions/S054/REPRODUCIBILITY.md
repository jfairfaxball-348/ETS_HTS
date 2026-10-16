# S054 REPRODUCIBILITY / DEPENDENCY MANIFEST

## Immutable entry and source

Main at entry `210e2c0b43c9f9bad2ec9b3b277f4e36024afc25`, source tree `42cec857ea5af3ef5dec8d638f6b8448a5ec78e5`.
S053 PR [#65](https://github.com/jfairfaxball-348/ellipse-theorem/pull/65), final head `ecca8be3c39768f1357ff5654c3e13fb4d755684`; seven source commits, each single parent beginning at `20c3719407e4e3f5534b045837276b518c436677`, verified by GitHub compare. Ordinary merge `210e2c0...` has ordered parents `20c3719407e4e3f5534b045837276b518c436677`, `ecca8be3c39768f1357ff5654c3e13fb4d755684` and exactly the same final tree as the S053 head. Branch protection GET returned **403 UNKNOWN**; ruleset collection empty; no open PRs at S054 entry. Existing historical branches are not implied open PRs.

Pinned Lean `leanprover/lean4:v4.15.0`, compiler commit `11651562caae`; Lake `5.0.0-1165156`; `lakefile.lean` and manifest pin mathlib4 `9837ca9d65d9de6fad1ef4381750ca688774e608`. Dependencies in `lake-manifest.json` are pinned by resolved commit. Reproducibility commands after an available networked checkout:

```sh
cat lean-toolchain
grep -F '9837ca9d65d9de6fad1ef4381750ca688774e608' lakefile.lean lake-manifest.json
lake exe cache get
lake build
lake env lean ETSHTS.lean
python3 scripts/check_scaffold.py
python3 -m unittest discover -s tests -v
```

The full hosted Lean action uses a mathlib cache for binary dependencies and does **recheck/build** the current Lean project and print its exact five theorem axiom lines; thus it is a pinned reproducibility check, **not an independent from-source recompilation of all mathlib**. GitHub Actions run [38889081938](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38889081938) on final S053 PR-head, and separately [38889373048](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38889373048) on merged-main, both **SUCCESS**. Separate governance [38889081706](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38889081706) (PR) and [38889372818](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38889372818) (merged-main) both **SUCCESS**. All five exact theorem axiom lines from the actual merged-main job `116934859031` are archived in `AXIOMS_MERGED_MAIN.txt`.

The CI rejects literal source tokens `sorry`, `admit`, `axiom`, `native_decide` and now requires each five exact declaration's `#print axioms` line to be exactly `[propext, Classical.choice, Quot.sound]`. These are Lean's standard axioms. This excludes project-level proof holes in current sources and nonstandard dependencies of each headline theorem; it does not prove correctness of its source definitions against an unstated informal intended problem. The exact frozen definitions and semantic audit provide that separate review.

**Environment boundary:** no local `lean`/`lake` binary and no DNS resolution for git clone in this session's container; local full rebuild and governance runner are **NOT_RUN**. The hosted workflows provide actual compilation and governance execution. Final S054 PR/main CI MUST be checked anew; historical S053 passes cannot certify a changed workflow.

The arXiv/paper, external Palomar verification, optimality and historical novelty are independent owner-gated stages.
