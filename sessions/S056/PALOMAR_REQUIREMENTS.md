# S056 PALOMAR REQUIREMENTS (source state read 2026-10-16)

Official primary sources:
- https://palomar-registry.org/how-to-submit
- https://palomar-registry.org/about
- https://palomar-registry.org/llms.txt
- https://github.com/PalomarRegistry/PalomarPolicy/blob/96b034cc31a72a63d4f4041911dce337a85c9a04/CONTRIBUTING.md
- https://github.com/PalomarRegistry/PalomarSubmission/blob/d4e41c1d5b0d114c4859e6e5831dc6d3ad1d0d44/README.md
- https://github.com/PalomarRegistry/PalomarSubmission/blob/d4e41c1d5b0d114c4859e6e5831dc6d3ad1d0d44/toolchains.json
- https://github.com/mathlib-initiative/formalization.yaml/blob/99c678e569c7c4c0772db297c5ddd5e4c9b6322e/README.md

1. Public GitHub immutable pushed FULL 40-character commit; branch/tag is not a substitute. Choose root or explicit nested project/comparator/metadata paths. Repository checkout <500 MiB; Git LFS pointers/submodules restrictions apply.
2. Selected project has exactly one lakefile.toml OR lakefile.lean, lean-toolchain release/RC >= **v4.35.0-rc2** as currently specified by toolchains.json (schema 2), and committed manifest mandatory when using lakefile.lean. Mathlib pin and Lean toolchain must be compatible/matching. This repo's v4.15.0 is **below** published minimum.
3. Exactly one nonempty, valid standard SPDX licence file at repository root (case-insensitive accepted names e.g. LICENSE/LICENCE/COPYING); project.license must agree.
4. All submitted .lean sources, including unused/nested/contained path source, must use new Lean module system (lakefile.lean exempt from header only), each <=10,000 *physical* lines; source symlinks refused; Challenge <=1,000 lines AND <=100 KiB, preferably <=300 lines/32 KiB. Existing older imports require public module/import/body migration and rebuild, not a superficial prepend.
5. Independent readable Challenge module + distinct proved Solution module + comparator.json naming each compared declaration and their identical types. Challenge transitive imports ONLY Lean core/allowlisted pinned Mathlib and qualified Tau Ceti/CSLib; NOT custom ETSHTS definitions. Solution may use other pinned GitHub proof dependencies within rules.
6. Deliberate Challenge sorry allowed; Solution proof must use no sorryAx, Lean.ofReduceBool or custom axioms; permitted only propext, Classical.choice and Quot.sound. Submission policy validates comparator configuration and dependency closure; replay uses Lean and toolchain-bundled independent kernels (NanoDa/con-ron).
7. formalization.yaml current v0.4: project.name <=300 characters; nonempty project.description (public abstract), project.authors, project.responsible_maintainers, project.license and structured sources/relationships; 1–8 arXiv categories and up to 8 MSC2020 codes; automation.methods and review.status. Optional ORCID only if current real record/check digit; source contributors separate from bibliographic authors. Original-proof source relationship must be truthful and is NOT independent priority certification; owner later decides exact record.
8. One Comparator config produces one public entry even if it selects multiple theorems; several configs result in separate entries. All selected theorems must align with stated mathematical scope.
9. Preliminary form/HTTP checks are **bounded** and can explicitly be incomplete; full preparation scans all source, compiles independently protected Challenge; Comparator then checks exact matched proof/statement and permitted axioms; private AI editorial review checks fidelity and research-interest floor. No expert human referee, no journal publication, no novelty certification.
10. Human browser OAuth or agent tag+secret gist are authorisation protocols. Machines must NOT drive the web form. Actual POST /api/submit triggers public verification and creates public input/run provenance; POST /register only AFTER review and explicit owner instruction. Withdraw before registering cannot erase public verification traces; registration intended permanent/versioned.

All caps/restrictions from the above pinned current official sources. Future toolchain policy may shift and must be re-read at the time of any later package.