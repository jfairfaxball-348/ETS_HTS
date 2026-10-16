# S056 PREFLIGHT CL / CLI RUNBOOK — VERIFIED PATHS ONLY, ALL NOT_RUN

No Palomar-hosted standalone shell command called "palomar preflight" is documented in the inspected official source. Owner "CL" cannot be assumed the name of a binary. **An official reusable GitHub Actions predictive preflight DOES exist**; inspect PalomarSubmission pinned d4e41c1d5b0d114c4859e6e5831dc6d3ad1d0d44 README and workflow submission.yml.

## G1. Local fixed-revision/static inspection (no Palomar state)
From actual repo checkout:
    git rev-parse HEAD
    git status --porcelain
    git ls-files '*.lean'
Palomar how-to-submit explicitly gives git rev-parse HEAD to obtain full immutable SHA; other two are ordinary Git read-only commands. A reliable UTF-8 and physical-line counter plus actual Lean module parser must check the entire source graph, not grep first line only. Licence/SPDX and source/symlink checks remain absent as standalone Palomar CLI. Local tool NOT_RUN.

## G2. Original Lean build and axioms (NO Palomar verification)
    lake build
    lake env lean ETSHTS.lean
These existing-project Lake commands build and print original theorem axioms (ETSHTS.lean has #print axioms declarations). They create .lake outputs and may fetch dependencies; no Palomar submit action. Must be rerun after any toolchain/module migration. Lean/lake absent here: NOT_RUN. Historic v4.15 passes are not a Palomar compatible build.

## G3. YAML validation, upstream schema only (not full Palomar policy)
    check-jsonschema --schemafile https://raw.githubusercontent.com/mathlib-initiative/formalization.yaml/main/schema/formalization.schema.json formalization.yaml
Exactly documented by upstream README https://github.com/mathlib-initiative/formalization.yaml#validating. Requires check-jsonschema tool and network to retrieve schema, reads local formalization.yaml. Metadata file absent, so NOT_RUN. Palomar demands stricter source, ORCID, licence and provenance checks.

## G4. Real protected Challenge/Solution Comparator
PalomarSubmission calls toolchain-bundled **lake comparator** internally after compiling Challenge in a protected allowlisted import closure, then exporting/replaying proof and independent kernel checks. It has configurable comparator.json statement/solution module names and compared declaration list, permitted axioms policy. We did NOT extract a pinned direct local Comparator CLI argument protocol from a real assembled config; do not invent "lake comparator --preflight". This gate NOT_ASSEMBLED, NOT_RUN.

## G5/G6. Official predictive public GitHub Actions job
Canonical published workflow: PalomarRegistry/PalomarSubmission/.github/workflows/submission.yml at commit d4e41c1d5b0d114c4859e6e5831dc6d3ad1d0d44.
Inputs from official README:
    repository: jfairfaxball-348/ellipse-theorem
    commit: <ACTUAL PUBLIC 40-CHAR SOURCE SHA>
    pipeline_commit: d4e41c1d5b0d114c4859e6e5831dc6d3ad1d0d44
    request_id: preflight001
    mode: preflight
    options: '{"comparator_config_path":"comparator.json","authorization_relationship":"I am a responsible author or maintainer"}'
The job must use **uses: PalomarRegistry/PalomarSubmission/.github/workflows/submission.yml@d4e41c1d5b0d114c4859e6e5831dc6d3ad1d0d44** and matching pipeline_commit. Mode preflight invokes verify_submission.py prepare; mode full continues into expensive protected proof verification. Both are predictive only, no Palomar submission token. **They create public GitHub Actions run/logs, not a local/private dry-run**, so S056 has NOT run one. Repo packaging currently absent; neither mode would certify readiness. Official README https://github.com/PalomarRegistry/PalomarSubmission/blob/d4e41c1d5b0d114c4859e6e5831dc6d3ad1d0d44/README.md.

## G7. Palomar public and permanent stages — NO EXECUTION AUTHORITY
Bounded web form/HTTPS intake is advisory, not complete scan. Actual POST /api/submit opens submission and publicly dispatched verifier with disclosed commit/relationship inputs; GitHub OAuth or agent challenge pushes a public tag and creates a secret gist to prove access. Review then private AI alignment evaluation. After review an owner can separately instruct **POST /register** with review_sha256 to authorise durable versioned registration, otherwise withdraw. NEVER treat any of these as preflight and never drive form as machine. Sources https://palomar-registry.org/llms.txt and https://palomar-registry.org/how-to-submit. Submission-host llms.txt could not be fetched; no direct endpoint test.

**Run status S056:** static GitHub source inspection PASS (read only); local schema/Lean/Comparator NOT_RUN; predictive external Actions workflow NOT_RUN; Palomar intake, verification, review, registration NOT_RUN/NOT_AUTHORISED.