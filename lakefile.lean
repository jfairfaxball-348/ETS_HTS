import Lake
open Lake DSL

package «ETSHTS» where

-- Immutable mathlib commit behind v4.15.0, verified on GitHub on 2026-10-14.
require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @ "9837ca9d65d9de6fad1ef4381750ca688774e608"

@[default_target]
lean_lib ETSHTS where

-- Palomar independent statement/proof module surfaces; neither is the default build target.
lean_lib Challenge where

lean_lib Solution where
