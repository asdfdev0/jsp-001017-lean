# Scope note

This proof resolves only the literal wording currently published for JSP-001017.

Published JSP wording:

> In the lattice graph of coprime coordinate pairs, is there an infinite path avoiding every point with both coordinates prime?

Literal witness:

`(1,1), (1,2), (1,3), ...`

Every pair is coprime, consecutive vertices are nearest-neighbours, and `1` is not prime, so no vertex has both coordinates prime.

This does **not** solve Erdős problem #1212. The maintained/source formulation imposes the additional condition that both coordinates are greater than `1` and asks that at least one coordinate be composite at every vertex. That stronger problem remains outside the scope of this repository.
