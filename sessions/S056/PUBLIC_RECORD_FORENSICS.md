# S056 PUBLIC RECORD FORENSICS — evidence level matters

## Owner-supplied exact record

https://palomar-registry.org/entry.html?id=PALOMAR-2026-09-25-000010&version=1 and canonical https://palomar-registry.org/entry?id=PALOMAR-2026-09-25-000010&version=1 were attempted. The latter served only a JavaScript loading shell: "Reading registry entry..." with an explicit explanation that JS reads immutable data. The first path and the supposed machine JSON https://data.palomar-registry.org/entries/PALOMAR-2026-09-25-000010-v1.json were inaccessible. API https://data.palomar-registry.org/api/v1/results?id=PALOMAR-2026-09-25-000010 also inaccessible. Thus **title, exact public abstract, visible theorem formula, per-section DOM, hoverable types and BibTeX of this precise record are UNKNOWN**. We do NOT claim a screenshot, machine record or live render.

Cross-reference (NOT a substitute for registry data): arXiv:2609.31811, The stacking number of a tree, by John Fairfax-Ball, mentions that exact registered ID; https://arxiv.org/abs/2609.31811. It does NOT establish what the Palomar screen displays.

## Two other actual versioned entries — INDEXED SECONDARY EVIDENCE, NOT LIVE DOM

- https://palomar-registry.org/entry?id=PALOMAR-2026-09-21-000007&version=1: search-engine indexed entry title "SCOPE and REACH with almost-surely finite stopping times"; its same-title BibTeX, mathematics classifications, multiple named authors and editorial comments were indexed. Strong human-friendly mathematical heading, but YAML, pinned Challenge, hover display and live page were NOT inspected.
- https://palomar-registry.org/entry?id=PALOMAR-2026-08-21-000002&version=2: indexed heading/BibTeX uses weak technical "lennrt/palomar-formalizations"; classification, machine details, version 1/2 history indexed. The same weakness is visible in indexed https://palomar-registry.org/entry?id=PALOMAR-2026-08-21-000008&version=1. Original pinned YAML and Challenge for these examples NOT inspected.

**Do not promote search-index excerpts into rendered-page or source snapshots.** Full owner example DOM/API and all three pinned source snapshots remain access gaps.

## Reliable *source-of-field* contract (from official Palomar standard)

| Reader-facing concept | Source | Evidence limit |
|---|---|---|
| Project heading/title and future BibTeX title | formalization.yaml project.name | Official metadata; exact specimen DOM unavailable |
| Public abstract | formalization.yaml project.description | PalomarSubmission README explicit; multiline source allowed; abstract TeX rendering UNKNOWN |
| Authors and responsible maintainers | project.authors and project.responsible_maintainers | Structured; DOM position UNKNOWN |
| Source provenance and non-author credits | sources[].authors / contributors / relationship | Policy and YAML; DOM position UNKNOWN |
| ArXiv and MSC subjects | classification.arxiv, classification.msc2020 | Indexed examples show such groups |
| Informal statement/explanatory text | metadata narrative, Challenge module/docstrings, selected README | Not automatically the paper PDF |
| Formal compared theorem names + types | comparator.json selecting independent Challenge declarations | Palomar says compared declarations display and types are hoverable; exact formatting on owner example UNKNOWN |
| Machine provenance and report | pinned full repo SHA, Challenge/Solution digests, toolchain, kernel replay report | Indexed examples show verification provenance |
| Editorial and historical record | automated AI review, immutable vN history, preservation | Not expert peer review |
| Citation | versioned Palomar ID vN and immutable URL | No ellipse ID exists here; never invent one |

Official https://palomar-registry.org/about and https://palomar-registry.org/how-to-submit explain public information; https://palomar-registry.org/llms.txt documents version paths and API. PalomarSubmission README at commit d4e41c1d... explicitly says project.description is public abstract. PalomarPolicy CONTRIBUTING.md at 96b034cc... explains Challenge/Comparator.

## Permanence

Registration pins repository full commit and format, is separate owner action after seeing AI review, and is intended permanent/append-only. A normal revision gets a *new version* preserving v1. Exceptional administrator metadata corrections themselves create visible correction versions; cannot change repository, commit, project path, comparator config or metadata path. Therefore choose paper-style project.name and correct project.description **before** permanent v1, not with a plan to quietly retitle afterwards.