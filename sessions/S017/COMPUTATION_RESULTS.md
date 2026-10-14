# S017 CAM-0010 — preregistered bounded floating screen (NOT an exact certificate)
Before execution, local file campaigns/ellipse_cam0010.py was frozen with SHA256 7634597897a5130aa2eae26d19726b662a58e30d52256124c7aa92174c615dd6 and preregistration file SHA256 955e01369682f14a0d8c6a3bfb852b8e59a244bfbfc18ffd5ead6445b88e78fe. Python 3.13.5, numpy2.3.5 scipy1.17.0, seed2026101417. Ten fixed cells: 5 axis ratios x 2 site sizes, 20,000 random sets per cell (200,000), 2 differential-evolution searches per cell (20 total). Source and raw output archived in campaigns. No adaptation/early stopping.

| axis ratio | n5 raw apparent positives | n6 raw apparent positives | strongest recorded deficit |
|---|---:|---:|---:|
| 1.01 | 0 | 1 | ~1.7e-31 |
| 1.02 | 0 | 2 | ~7.1e-31 |
| 1.2 | 0 | 2 | ~3.2e-31 |
| 2 | 1 | 1 | ~3.9e-31 |
| 5 | 2 | 6 | +6.0457 (floating n6), +0.5020 (floating n5) |

**Critical invalidation:** Raw near-circle positive angles include identical or machine-neighbour equal floats after Dirichlet underflow and wrapped optimisation; their tiny signed deficits (~10^-31) are numerical cancellation. Because the task requires *distinct* points and strict Euclidean distance comparisons, they are **NOT COUNTEREXAMPLES**. CAM-0010 marks a completed exploration, not a successful rigorous witness or verified exact claim. Aspect 5:1 already has S016 rational 5-site proof. No extrapolation about any ellipse.

CAM-0008/9 original detached six-file archive was not available to S017; original unreconciled archive remains a separate open integrity deviation and no owner file was secretly reconstituted.
