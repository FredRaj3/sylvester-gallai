# The Sylvester–Gallai theorem in Lean

Criteria repository for the Problem Market board "The Sylvester–Gallai theorem in Lean —
a non-collinear finite point set has an ordinary line".

## The problem

Prove in Lean 4, against pinned Mathlib, that a finite set of points in the real plane,
not all collinear, has an **ordinary line**: a line passing through exactly two of the
points.

```lean
theorem sylvester_gallai (P : Finset (EuclideanSpace ℝ (Fin 2)))
    (hP : ¬ Collinear ℝ (P : Set (EuclideanSpace ℝ (Fin 2)))) :
    ∃ p ∈ P, ∃ q ∈ P, p ≠ q ∧
      ∀ r ∈ P, r ∈ affineSpan ℝ ({p, q} : Set (EuclideanSpace ℝ (Fin 2))) →
        r = p ∨ r = q
```

**The statement uses only Mathlib** — `Finset`, `Collinear`, `affineSpan`,
`EuclideanSpace`. There are no definitions of ours to audit.

Notes on the encoding: `¬ Collinear` forces `|P| ≥ 3` (Mathlib's `Collinear` holds for
any set of at most two points, so there is no degenerate-set loophole); `p ≠ q` makes
`affineSpan ℝ {p, q}` a genuine line; and the final clause says that line meets `P` in
`p` and `q` only.

## Expected route

Kelly's argument: among all (point, spanning line) pairs with the point off the line,
take one minimizing the point–line distance, and derive a contradiction unless some
line is ordinary. The work is Euclidean bookkeeping — orthogonal projection, distance
comparisons — all of which Mathlib's inner-product-space API supports.

## Win condition (locked)

Close the `sorry` in `SylvesterGallai.lean` keeping the statement **verbatim**;
sorry-free; axiom-clean (`#print axioms SylvesterGallai.sylvester_gallai` reporting
only `propext`, `Classical.choice`, `Quot.sound` — `sorryAx` is caught transitively);
`lake build` green against the pinned toolchain and Mathlib revision. **Mathlib only**
— helper lemmas and new files are welcome, additional dependencies are not.

The locked region is everything from the top of the statement file through the `:= by`
opening the proof; `check-statement.sh` strips comments and blank lines and compares
the rest against the pinned criteria commit. Adding a hypothesis is proving a
different theorem, not partial progress.

## How to solve it

    git clone https://github.com/FredRaj3/sylvester-gallai.git
    cd sylvester-gallai
    ./preflight.sh          # tools, disk, network — two seconds
    lake exe cache get      # required first, or Lean compiles Mathlib from source
    ./verify.sh SylvesterGallai

`verify.sh` is the script CI runs — the same one, not an equivalent. Working through
an agent? Point it at `AGENTS.md`; `task.json` carries the same constraints as data.

Note that `main` fails its own CI on purpose: it holds the unproved statement, and
that failing run is the control demonstrating the check can tell a proof from a gap.

## How to submit

Fork the repository, close the sorry, open a pull request, and submit the pull request
link on the board. CI re-runs `verify.sh` and publishes the axiom report.

**Note that `lake build` executes arbitrary code** — true of any Lean project, ours
included. The trust surface is a short lakefile, one dependency, and a statement file
containing no `#eval`, `initialize` or custom elaborators.

Submissions must be Apache-2.0 licensed so they can be archived and republished as
part of the public record. Where an effort to upstream related material into Mathlib
exists, coordinate rather than duplicate.
