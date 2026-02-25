# DevOps Golden Repo Template

A reusable **golden repository template** for teams that want consistent standards, clear contribution rules, and strong CI checks from day one.

## Idea of this repository (short)

Create every new DevOps project from the same high-quality baseline so onboarding, security, and CI quality are consistent across teams.

## What this template gives you

- Core repository governance files (`CONTRIBUTING`, `SECURITY`, `CODEOWNERS`, `LICENSE`).
- Editor and Git defaults (`.editorconfig`, `.gitignore`).
- DevOps standards documentation in `docs/standards.md`.
- Reusable GitHub Actions workflow (`workflow_call`) and a caller workflow for this repo.
- A simple `Makefile` with common contributor targets.

## Repository tree (with purpose)

```text
.
├── .editorconfig                  # Consistent formatting defaults across editors
├── .gitignore                     # Common files/folders to ignore in Git
├── .markdownlint.json             # Markdown linting rules (shared local/CI behavior)
├── .yamllint.yml                  # YAML linting rules (shared local/CI behavior)
├── .github/
│   └── workflows/
│       ├── ci-reusable.yml        # Reusable CI pipeline via workflow_call
│       └── ci.yml                 # Local caller workflow (runs on PR/push)
├── CHEATSHEET.md                  # Fast reference: what each key file is for
├── CODEOWNERS                     # Review ownership mapping for paths
├── CONTRIBUTING.md                # Contributor workflow, setup, and PR expectations
├── LICENSE                        # Open-source license text (MIT by default)
├── Makefile                       # Beginner-friendly local commands (lint + checks)
├── README.md                      # Project overview and usage
├── SECURITY.md                    # Vulnerability disclosure policy
└── docs/
    └── standards.md               # Commit style, branch policy, and DevOps standards
```

## CI workflow stages

The reusable workflow includes six stages:

1. Markdown lint
2. YAML lint
3. ShellCheck (only if shell scripts exist)
4. Secret scan (gitleaks)
5. Dependency review (only if dependency manifests exist)
6. Final status aggregator (single pass/fail gate)

## How to call reusable CI from another repository

```yaml
name: ci

on:
  pull_request:
  push:
    branches: [main]

jobs:
  standards:
    uses: org/repo/.github/workflows/ci-reusable.yml@main
```

## Local commands

```bash
make help
make lint-markdown
make lint-yaml
make lint-shell
make scan-secrets
make ci-local
```

> Note: Some commands rely on tools installed on your machine.
