# sylvester-gallai

Criteria repository for the Problem Market board **"The Sylvester–Gallai theorem in
Lean — a non-collinear finite point set has an ordinary line"**, posed by Fred
Rajasekaran.

One locked Lean 4 statement awaiting a proof:

| Board | File | Target |
|---|---|---|
| SylvesterGallai | `SylvesterGallai.lean` | `SylvesterGallai.sylvester_gallai` |

- `TASK.md` — the full task: statement, win condition, how to solve and submit.
- `tasks/SylvesterGallai.md` — the board write-up as posted.
- `AGENTS.md` — instructions for automated solvers; `task.json` — the same as data.
- `verify.sh <Board>` — the complete automated standard for one board; exactly what
  CI runs. `check-statement.sh` — the locked-statement comparison it starts with.

`main` fails its own CI **on purpose**: it holds the unproved statement, and that
failing run is the control showing the checker can tell a proof from a gap.

Pinned to `leanprover/lean4:v4.34.0-rc1` and Mathlib `v4.34.0-rc1`. Submissions are
Apache-2.0.
