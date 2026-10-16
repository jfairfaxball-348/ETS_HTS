# S058 verification ledger — real checks, successes, and failures

Entry main: `bae8c6273dd6531d6ecc792b8ae158cfe747e23b`, tree `86c4e17bc619d1b86c14a2da4302d6e3bc90b7b0`.
Isolated work branch: `session/S058-palomar-readiness`.

## Modern source migration

- S057 last inherited failure: https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38910404282 (EarSufficiency list disjointness).
- S058 successive genuine hosted CI probes: `38915112181`, `38915863024`, `38916534603`, `38917373457`, `38918000006`, `38918918052`: FAIL in specific source or tactic compatibility paths. Their outcomes were preserved and not overwritten.
- **Success**: https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38919803107, protected checkout source migration, modern `lake update`/cache, full `lake build`, Challenge+Solution build, five exact `#print axioms` checks, no forbidden proof holes. Upon full success GitHub runner pushed commit `335d01af8dd929aa3934026e82d00ae1192290f5` of real migrated sources.
- Original modern Lean v4.35.0, Mathlib `56a005855ea17e0b0958f73ec801ae140b0a1679`, complete committed Lake manifest.

## Local independent comparator in hosted GitHub Actions (NOT official Palomar full verifier)

- First comparison https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38920755624 FAILED at Ubuntu AppArmor/Bubblewrap unprivileged userns after successful build. We installed Palomar's actual pinned Bubblewrap 0.12.0 scoped AppArmor installer, not disabled sandbox checks.
- Second comparison https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38921673587 FAILED on real `lake comparator`: `Challenge constant is not a definition: 'ETSHTS.Grow'`. Corrected Comparator `definition_names` to omit both inductive constructors/types (Grow and FullEarCertificate).
- **PASS**: https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38922156993 on exact public SHA `fcb9e607ef8cccac80470dfcbbdd9b0801caf0de`. All five selected exact theorem roots; source-level Challenge fidelity PASS; full modern build PASS; independently sandboxed `lake comparator` completed with `Your solution is okay!`; con-ron accepted 28317 declarations (`--verified`), NanoDa ACCEPTED, Lean default kernel ACCEPTED. Five `Challenge.lean` placeholders carry ordinary expected `sorry` warning; the substantive Solution proved them.
- This result is a genuine successful *local Comparator invocation in a public GitHub runner*, **not** Palomar's official hosted `mode: full` predictive workflow or its report/profile/digest.

## Unpassed Palomar readiness gates

1. No explicit owner-authorised root standard SPDX licence; no right inferred to grant one.
2. No FINAL validated `formalization.yaml` v0.4 in root with project.license; source archive only includes DRAFT, intentionally invalid licence token.
3. Official pinned `PalomarRegistry/PalomarSubmission/.github/workflows/submission.yml@d4e41c1d5b0d114c4859e6e5831dc6d3ad1d0d44` **mode=full** NOT_RUN. No machine PASS report, digest or profile. Current local Comparator alone is insufficient.
4. Official PASS on the final merged-main SHA NOT_RUN; no entry readiness claimed; no real Palomar submission, review or registration.

Novely assessment remains `INDETERMINATE_ACCESS_GAP`. Any future approval of licence/metadata or relationship statement requires actual owner authorisation. No SHA certified submit-ready.
