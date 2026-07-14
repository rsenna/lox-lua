# AGENTS.md

## Repository

This repository is **lox-lua**, a dependency-free work-in-progress Lua implementation of a Lox interpreter. The repository slug is the canonical project name in documentation and release metadata.

## Working rules

- Read `README.md` and `SPEC.md` before changing behavior.
- Keep changes focused; do not bundle unrelated cleanup with a feature or fix.
- Do not commit secrets, generated dependency directories, build outputs, editor state, or local absolute paths.
- Preserve existing licenses and attribution.
- Update `README.md` and `SPEC.md` when user-visible behavior, support status, setup, or architecture changes.
- Prefer the smallest supported dependency upgrade. Major upgrades must include migration notes and validation.

## Setup

No dependency installation is required.

## Validation

Run the applicable commands before opening a pull request:

- `lua src/runner.lua`
- `./lox-lua`

If a tool or platform is unavailable, record exactly what was not run and why.

## Project-specific guidance

Follow the language progression from Crafting Interpreters. Keep scanner, parser, AST, and evaluator responsibilities separate. Add small source fixtures for every language rule.

## Pull requests

Explain the problem, the chosen approach, user/developer impact, tests run, and remaining limitations. Keep commits reviewable and never report a check as passing unless it was executed.
