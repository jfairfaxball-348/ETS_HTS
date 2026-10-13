# Failure / kill ledger

Every CND that is KILLED_KNOWN, KILLED_EASY, KILLED_FALSE/DEGENERATE or KILLED_EQUIVALENT must have a permanent row:
candidate ID; old/new state; date/session; exact refutation or known match; CLM/SRC/CAM IDs; verified bounds; remaining uncertainty; reviewer. Null kill records are acceptable only in non-killed statuses. A failed novelty search is **not** a kill, nor proof of novelty. Retired candidates remain in the catalogue.

S001: no candidates generated, therefore no kills. Calibration examples are deliberately outside the catalogue.
