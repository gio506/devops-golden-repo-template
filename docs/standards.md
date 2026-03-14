# DevOps Repository Standards

This template is designed for portfolio and learning repos that still follow a professional workflow.

## 1. Branch Strategy

- Permanent branches:

  - `main`: protected, merge-only
  - `dev`: active integration branch

- Normal workflow:

  - branch from `dev`
  - commit in small focused steps
  - open PR into `dev` if needed
  - merge `dev` into `main` through PR when ready

For small solo repos, direct work on `dev` is acceptable, but `main` should still stay protected.

## 2. Commit Style

Prefer short, readable commit messages:

- `Add alert rule checks`
- `Fix Debian nginx smoke test`
- `Modularize VPC layout`
- `Add Redis sidecar flow`

Conventional prefixes are acceptable, but clarity is more important than strict format.

## 3. Required Repo Files

Every repo created from this template should keep:

- `README.md`
- `CHEATSHEET.md`
- `FILES_EXPLAINED.md`
- `.github/workflows/*`
- `docs/standards.md`

Add these when relevant:

- `scripts/smoke.sh`
- `scripts/verify.sh`
- `.pre-commit-config.yaml`
- domain-specific docs such as `CHANGELOG.md`, `RELEASE.md`, or environment notes

## 4. README Expectations

Every README should answer:

- what the repo does
- what files matter
- how to run it locally
- how to verify it
- how to clean it up
- what usually fails first

## 5. CI Expectations

Project CI should use 4 to 6 clear stages.

Good examples from the portfolio:

- lint -> validate -> test -> build
- lint -> config validate -> stack up -> smoke -> verify -> cleanup
- fmt -> validate -> lint -> plan
- lint -> cluster create -> deploy -> rollout -> smoke -> cleanup

Avoid giant single-job workflows when separate stages make failures easier to understand.

## 6. PR Expectations

Each PR should include:

- what changed
- why it changed
- how it was checked locally
- what CI stages should prove
- risk or rollback notes if behavior changed

## 7. Repository Quality Rules

- keep scripts non-destructive by default
- document prerequisites explicitly
- prefer one obvious command path for local verification
- add troubleshooting for the most likely failure
- keep examples realistic but small

## 8. GitHub Settings To Enforce

- protect `main`
- require pull requests before merge
- require required status checks
- require conversation resolution
- require CODEOWNERS reviews when appropriate
