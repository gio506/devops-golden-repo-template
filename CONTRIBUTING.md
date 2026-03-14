# Contributing Guide

Thanks for contributing. This template is meant to stay practical,
teach good habits, and remain usable across Terraform, Docker,
Kubernetes, CI/CD, Bash, and monitoring repos.

## 1) Before you start

- Read `README.md` for repository purpose.
- Read `docs/standards.md` for branch and CI rules.
- Read `docs/template-checklist.md` before creating a new repo
  from this template.
- Open an issue for major changes before implementation.

## 2) Branch strategy

- Do not work directly on `main`.
- Create feature branches from `dev`.
- Merge finished work into `dev`, then open PRs from `dev`
  to `main`.
- Use branch names like:

  - `feat/<short-description>`
  - `fix/<short-description>`
  - `docs/<short-description>`
  - `chore/<short-description>`

## 3) Commit style

Use short, readable commit messages:

- `Add reusable workflow template`
- `Fix shellcheck stage condition`
- `Improve standards examples`

## 4) Pull request checklist

- [ ] CI passes.
- [ ] Changes are documented (README/docs if needed).
- [ ] Security impact is considered.
- [ ] PR description includes what changed and why.
- [ ] Required repo files still exist
  (`README`, `CHEATSHEET`, `FILES_EXPLAINED`).

## 5) Code review expectations

- Keep PRs focused and small where possible.
- Be respectful and clear in comments.
- Resolve all blocking feedback before merge.
