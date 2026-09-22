import Mathlib

namespace JSP001017

/-- Vertices in the lattice graph are pairs of natural numbers with coprime coordinates. -/
def Visible (p : ℕ × ℕ) : Prop := Nat.Coprime p.1 p.2

/-- Ordinary nearest-neighbour adjacency in the integer lattice. -/
def Adj (p q : ℕ × ℕ) : Prop :=
  (p.1 + 1 = q.1 ∧ p.2 = q.2) ∨
  (q.1 + 1 = p.1 ∧ p.2 = q.2) ∨
  (p.1 = q.1 ∧ p.2 + 1 = q.2) ∨
  (p.1 = q.1 ∧ q.2 + 1 = p.2)

/-- The literal JSP avoidance condition: the two coordinates are not both prime. -/
def AvoidsPrimePrime (p : ℕ × ℕ) : Prop := ¬ (Nat.Prime p.1 ∧ Nat.Prime p.2)

/-- A literal infinite path for the published JSP wording. Injectivity supplies infinitely many
vertices; every vertex is visible, consecutive vertices are adjacent, and every vertex avoids
prime-prime coordinate pairs. -/
def HasLiteralInfinitePath : Prop :=
  ∃ path : ℕ → ℕ × ℕ,
    Function.Injective path ∧
    (∀ n, Visible (path n)) ∧
    (∀ n, Adj (path n) (path (n + 1))) ∧
    (∀ n, AvoidsPrimePrime (path n))

/-- The coordinate-1 path `(1,1), (1,2), (1,3), ...`. -/
def coordinateOnePath (n : ℕ) : ℕ × ℕ := (1, n + 1)

theorem coordinateOnePath_injective : Function.Injective coordinateOnePath := by
  intro m n h
  have h2 : m + 1 = n + 1 := congrArg Prod.snd h
  omega

theorem coordinateOnePath_visible (n : ℕ) : Visible (coordinateOnePath n) := by
  simp [Visible, coordinateOnePath, Nat.coprime_comm]

theorem coordinateOnePath_adj (n : ℕ) :
    Adj (coordinateOnePath n) (coordinateOnePath (n + 1)) := by
  simp [Adj, coordinateOnePath]
  omega

theorem coordinateOnePath_avoids (n : ℕ) : AvoidsPrimePrime (coordinateOnePath n) := by
  simp [AvoidsPrimePrime, coordinateOnePath]

/-- Complete solution of the literal published JSP-001017 wording. -/
theorem jsp_001017_literal : HasLiteralInfinitePath := by
  refine ⟨coordinateOnePath, coordinateOnePath_injective, coordinateOnePath_visible,
    coordinateOnePath_adj, coordinateOnePath_avoids⟩

end JSP001017
