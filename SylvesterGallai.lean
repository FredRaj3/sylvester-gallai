/-
Copyright (c) 2026 Fred Rajasekaran. All rights reserved.
Released under Apache 2.0 license.

# The Sylvester–Gallai theorem in Lean — locked statement

Specification for the Problem Market task "The Sylvester–Gallai theorem in Lean — a
non-collinear finite point set has an ordinary line". A submission closes the `sorry`
below, keeping the statement verbatim. Everything from the top of this file through
the `:= by` is the locked region. See tasks/SylvesterGallai.md for the full task.
-/
import Mathlib

namespace SylvesterGallai

theorem sylvester_gallai (P : Finset (EuclideanSpace ℝ (Fin 2)))
    (hP : ¬ Collinear ℝ (P : Set (EuclideanSpace ℝ (Fin 2)))) :
    ∃ p ∈ P, ∃ q ∈ P, p ≠ q ∧
      ∀ r ∈ P, r ∈ affineSpan ℝ ({p, q} : Set (EuclideanSpace ℝ (Fin 2))) →
        r = p ∨ r = q := by
  sorry

end SylvesterGallai
