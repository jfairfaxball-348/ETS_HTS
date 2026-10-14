# S025 — scope and execution plan (2026-10-14)

- Owner explicitly invokes exactly S025. S024 was the final conditional prior-art audit; do not repeat it.
- Entry main `e784a449a64a9dd2c2e6dd8c7f9aad1b88b54de5`, tree `909335c945b1f85a0f1ef4fadfc9e64359ef8e8c`; S024 authored `797b7c5081a2a717b7672e441ac62bf61302aab8` sole parent `4f154b1a...`, PR #28 merged with ordered two parents (`4f154b1a...`, `797b7c50...`). Main hosted governance run 38592940317 SUCCESS, checks **record format only**. Rulesets []; branch-protection detailed read HTTP 403 UNKNOWN; no open PR at entry.
- Create ONE branch and ONE atomic authored commit. Pin Lean 4.15.0, mathlib git commit 9837ca9d65d9de6fad1ef4381750ca688774e608 and the transitive dependency SHAs from the upstream v4.15.0 manifest. The handwritten lock is not validated by Lake until a real build.
- Implement exact full theorem statements and finite construction model first; prove foundational helper lemmas; add actual Lean CI separate from governance.
- Try executable build using hosted GitHub CI because local Lean/Lake is absent and local shell has DNS failure. Capture results if available; never label unobserved as PASS.
- Reconcile all surviving proof obligations without reducing n, the threshold endpoint, nearest-two tie rule, or ellipse ratios. No theorem extension, Palomar, paper, arXiv, journal, or outreach.
- Archive truthful formalisation blockers and queue precisely S026 **continued Lean repair and theorem proof**, separately owner-gated; no renewed novelty-audit loop.
