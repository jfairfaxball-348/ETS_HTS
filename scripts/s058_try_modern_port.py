#!/usr/bin/env python3
"""S058 trial port. Only run on isolated session branch; no changes to math statements."""
import pathlib
import re

ROOT = pathlib.Path(".")
files = sorted([*ROOT.glob("ETSHTS.lean"), *ROOT.glob("ETSHTS/**/*.lean")])
assert len(files) == 77, f"Refuse source count drift: {len(files)}"
for p in files:
    old = p.read_text(encoding="utf-8")
    if p.as_posix() == "ETSHTS/AngularCutoff.lean":
        assert "Real.arctan_lt_arctan" in old
        old = old.replace("Real.arctan_lt_arctan", "Real.arctan_strictMono")
    if p.as_posix() == "ETSHTS/Cutoff.lean":
        # Mathlib API renames only; preserve the literal CLM0102 proposition.
        assert "Real.arctan_lt_arctan" in old and "Real.arctan_le_arctan" in old
        old = old.replace("Real.arctan_lt_arctan", "Real.arctan_strictMono")
        old = old.replace("Real.arctan_le_arctan", "Real.arctan_mono")
    if p.as_posix() == "ETSHTS/CyclicGapObstruction.lean":
        # New module system forbids private defs in exported theorem types.
        # Change visibility, not data or mathematical content.
        for name in ("s033_v", "s033_u", "s033_x"):
            assert f"private def {name} " in old
            old = old.replace(f"private def {name} ", f"def {name} ")
    if p.as_posix() == "ETSHTS/EarSufficiency.lean":
        # API and simplifier migration; retains original explicit planarity argument.
        assert "Finset.not_mem_erase v S" in old
        old = old.replace("exact (Finset.not_mem_erase v S) hvrest",
                          "exact (by simp : v ∉ S.erase v) hvrest")
        old = old.replace("simpa [List.disjoint_singleton] using hnot",
                          """intro x hx y hy hxy
      have hy' : y = v := by simpa using hy
      exact hnot (by simpa [hxy, hy'] using hx)""")
        old = old.replace("""            simp [List.append_assoc, Finset.insert_eq, Finset.union_comm,
              Finset.union_left_comm, Finset.union_assoc]""",
                          """            ext x
            simp [List.mem_append, or_left_comm, or_assoc]""")
    if p.as_posix() == "ETSHTS/LastArrival.lean":
        # Lean 4.35 nodup_append now returns a pairwise inequality proof.
        old_block = """  have hnot : v ∉ (previous ++ rest).toFinset := by
    have hdisj : (previous ++ rest).Disjoint [v] :=
      (List.nodup_append.mp hn).2.2
    intro hv
    have hv' : v ∈ previous ++ rest := by simpa using hv
    exact (List.disjoint_singleton.mp hdisj) hv'"""
        new_block = """  have hnot : v ∉ (previous ++ rest).toFinset := by
    intro hv
    have hv' : v ∈ previous ++ rest := by simpa using hv
    have hne := (List.nodup_append.mp hn).2.2 v hv' v (by simp)
    exact hne rfl"""
        assert old_block in old
        old = old.replace(old_block, new_block)
    if p.as_posix() == "ETSHTS/ActualLastNecessity.lean":
        old_block = """  have hdisj : ([p, q, r] ++ rest).Disjoint [v] :=
    (List.nodup_append.mp hn).2.2
  have hnot : v ∉ ([p, q, r] ++ rest).toFinset := by
    intro hv
    exact (List.disjoint_singleton.mp hdisj) (by simpa using hv)"""
        new_block = """  have hnot : v ∉ ([p, q, r] ++ rest).toFinset := by
    intro hv
    have hv' : v ∈ [p, q, r] ++ rest := by simpa using hv
    have hne := (List.nodup_append.mp hn).2.2 v hv' v (by simp)
    exact hne rfl"""
        assert old_block in old
        old = old.replace(old_block, new_block)
    if p.as_posix() == "ETSHTS/LastOrder.lean":
        old_block = """  have hdisj : ([p, q, r] ++ xs).Disjoint [v] :=
    (List.nodup_append.mp hn).2.2
  have hnot : v ∉ ([p, q, r] ++ xs).toFinset := by
    intro hv
    exact (List.disjoint_singleton.mp hdisj) (by simpa using hv)"""
        new_block = """  have hnot : v ∉ ([p, q, r] ++ xs).toFinset := by
    intro hv
    have hv' : v ∈ [p, q, r] ++ xs := by simpa using hv
    have hne := (List.nodup_append.mp hn).2.2 v hv' v (by simp)
    exact hne rfl"""
        assert old_block in old
        old = old.replace(old_block, new_block)
    if p.as_posix() == "ETSHTS/ConvexFourClassification.lean":
        # Removal of Finset.not_mem_erase in newer Mathlib.
        assert old.count("exact (Finset.not_mem_erase v S) hbad") == 3
        old = old.replace("exact (Finset.not_mem_erase v S) hbad",
                          "exact (by simp : v ∉ S.erase v) hbad")
    if p.as_posix() == "ETSHTS/RationalChord.lean":
        # Same public theorem signature issue for three homogeneous coordinate helpers.
        for name in ("s034_X", "s034_Y", "s034_D"):
            assert f"private def {name} " in old
            old = old.replace(f"private def {name} ", f"def {name} ")
    # Full source-wide mechanical rename of retired Mathlib arctan comparison APIs.
    old = old.replace("Real.arctan_lt_arctan", "Real.arctan_strictMono")
    old = old.replace("Real.arctan_le_arctan", "Real.arctan_mono")
    if old.lstrip().startswith("module"):
        raise SystemExit(f"Already migrated; do not rewrite {p}")
    lines = old.splitlines(keepends=True)
    indices = [i for i,s in enumerate(lines) if re.match(r"^import [A-Za-z0-9_.]+\s*$", s)]
    if not indices or indices != list(range(len(indices))):
        raise SystemExit(f"Unexpected import header in {p}: {indices}")
    for i in indices:
        lines[i] = "public " + lines[i]
    lines.insert(0,"module\n")
    lines.insert(len(indices)+1,"\n@[expose] public section\n\n")
    new = "".join(lines)
    if new.count("\n") >= 10000:
        raise SystemExit(f"Line cap exceeded: {p}")
    p.write_text(new,encoding="utf-8")
    print(f"PORT {p} lines={len(new.splitlines())}")
pathlib.Path("lean-toolchain").write_text("leanprover/lean4:v4.35.0\n",encoding="utf-8")
lake = pathlib.Path("lakefile.lean")
body=lake.read_text(encoding="utf-8")
old="9837ca9d65d9de6fad1ef4381750ca688774e608"
new="56a005855ea17e0b0958f73ec801ae140b0a1679"
assert old in body
lake.write_text(body.replace(old,new),encoding="utf-8")
print("PIN Lean v4.35.0, Mathlib",new,"; manifest must be regenerated by lake update")
