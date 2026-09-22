# JSP-001017 — literal published statement

This repository formalizes the **literal wording currently published for JSP-001017**:

> In the lattice graph of coprime coordinate pairs, is there an infinite path avoiding every point with both coordinates prime?

Under that wording the path `(1,1), (1,2), (1,3), ...` is an immediate witness: every vertex has coprime coordinates, consecutive vertices are grid-adjacent, and no vertex has both coordinates prime because `1` is not prime.

The main theorem is `JSP001017.jsp_001017_literal`.

This repository **does not claim to solve Erdős problem #1212**. The maintained/source formulation imposes the additional restriction that both coordinates are greater than `1` and asks for a composite coordinate at every vertex. That stronger problem is not proved here.

## Reproduce

```bash
lake exe cache get
lake build
lake env lean JSP001017.lean
```

Lean is pinned in `lean-toolchain`; Mathlib is pinned to `db584cd6d46c92f209a44c0f1c829460d327499d`.
