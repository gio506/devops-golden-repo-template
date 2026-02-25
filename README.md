# DevOps Golden Repo Template

A reusable **golden repository template** for teams that want consistent standards, clear contribution rules, and strong CI checks from day one.

## What this template gives you

- Core repository governance files (`CONTRIBUTING`, `SECURITY`, `CODEOWNERS`, `LICENSE`).
- Basic editor and ignore defaults (`.editorconfig`, `.gitignore`).
- DevOps standards documentation in `docs/standards.md`.
- A reusable GitHub Actions workflow that can be called from other repos (`workflow_call`).
- A simple `Makefile` with common contributor targets.

## Quick start

1. Click **Use this template** on GitHub.
2. Update ownership details in `CODEOWNERS` and contact details in `SECURITY.md`.
3. Adjust standards in `docs/standards.md` to match your team.
4. Add app-specific dependency files later (the CI workflow auto-enables dependency review only when relevant manifests exist).

## Repository tree (with purpose)

```text
.
├── .editorconfig                  # Consistent formatting defaults across editors
├── .gitignore                     # Common files/folders to ignore in Git
├── .github/
│   └── workflows/
│       └── ci-reusable.yml        # Reusable CI pipeline via workflow_call
├── .gitkeep                       # Placeholder file (safe to remove once repo has content)
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

The reusable workflow includes the following stages:

1. Markdown lint
2. YAML lint
3. ShellCheck (only if shell scripts exist)
4. Secret scan (gitleaks)
5. Dependency review (only if dependency manifests exist)
6. Final status aggregator (single pass/fail gate)

## How to call this reusable workflow from another workflow

```yaml
name: ci

on:
  pull_request:
  push:
    branches: [main]

jobs:
  standards:
    uses: ./.github/workflows/ci-reusable.yml
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

> Note: Some commands rely on tools installed on your machine (or Docker).
