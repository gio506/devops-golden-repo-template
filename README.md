# DevOps Golden Repo Template

A Junior+ template for DevOps portfolio projects that need a clean
`dev -> main` workflow, consistent docs, and a standards-first CI
baseline before project-specific checks are added.

## What This Template Can Be

Use this template as the starting point for:

- Terraform labs
- Docker and Compose labs
- Kubernetes starter repos
- Monitoring and logging projects
- CI/CD demo repositories
- Bash, Ansible, and infrastructure practice repos

This template is not the final application pipeline. It is the **governance and repo-quality layer** that every project should start from.

## What We Learned From The Other 14 Repos

Across the portfolio, the strongest repos shared the same patterns:

- Clear `main` and `dev` branch flow
- Small, explicit CI stages instead of one big job
- A `README.md` with local run, verify, and cleanup steps
- A `CHEATSHEET.md` for fast commands
- A `FILES_EXPLAINED.md` so reviewers can understand the repo quickly
- One smoke or verification script for runtime confidence
- Troubleshooting notes for the most likely failure mode

The weaker patterns were also obvious:

- CI failed when checks were too brittle
- Docs explained the tool but not the repo workflow
- Important files existed but their purpose was not obvious
- Project-specific checks were added without a stable baseline

This template is optimized to fix those problems first.

## Golden Repo Checklist

Every new repo created from this template should keep or add:

1. `main` and `dev` branches
2. Pull requests from `dev` into `main`
3. A `README.md` with repo map, run, verify, cleanup, and troubleshooting
4. A `CHEATSHEET.md`
5. A `FILES_EXPLAINED.md`
6. One smoke, verify, or validation script when the project has runtime behavior
7. A CI pipeline with 4 to 6 clear stages
8. Branch protection that requires the CI checks before merge

## Recommended Pipeline Shape

For Junior+ repos, aim for 4 to 6 stages:

1. Structure or docs check
2. Lint or syntax validation
3. Repo-specific validation
4. Smoke, verify, or build check
5. Optional security or dependency check
6. Final status gate

This template provides the reusable standards pipeline. Each project repo should extend it with its own domain checks.

## Official Reference Sources Behind This Template

This template is aligned to the official guidance for the tools used in the
portfolio:

- GitHub Actions workflow syntax and job orchestration
- Docker image build and Dockerfile best practices
- Terraform module structure and validation
- Kubernetes manifest and Kustomize organization
- Ansible role structure and playbook practices

Keep the repo simple, but when you upgrade a project, prefer the official docs
first and then adapt the examples to the smallest learning-friendly version.

## Repository Tree

```text
.
├── .editorconfig                       # Shared formatting defaults
├── .gitignore                          # Safe default ignore rules
├── .markdownlint.json                  # Markdown lint rules
├── .pre-commit-config.yaml             # Optional local pre-commit hooks
├── .yamllint.yml                       # YAML lint rules
├── .github/
│   ├── PULL_REQUEST_TEMPLATE.md        # PR checklist aligned with dev -> main flow
│   └── workflows/
│       ├── ci-reusable.yml             # Reusable standards CI via workflow_call
│       └── ci.yml                      # This repo's own caller workflow
├── CHEATSHEET.md                       # Fast command reference for maintainers
├── CODEOWNERS                          # Default review ownership rules
├── CONTRIBUTING.md                     # How contributors should work in this repo
├── FILES_EXPLAINED.md                  # File-by-file purpose guide
├── LICENSE                             # MIT license by default
├── Makefile                            # Common local quality targets
├── README.md                           # Main overview and template guidance
├── SECURITY.md                         # Vulnerability reporting policy
└── docs/
    ├── standards.md                    # Branch, commit, PR, and CI standards
    └── template-checklist.md           # Practical checklist for repos created from this template
```

## Local Commands

```bash
make help
make structure-check
make lint-markdown
make lint-yaml
make lint-shell
make scan-secrets
make ci-local
```

## Reusable CI

The reusable workflow intentionally focuses on **repo hygiene**:

- required files
- markdown lint
- YAML lint
- shellcheck when scripts exist
- secret scanning
- final status aggregation

Then each actual project adds its own runtime or domain workflow on top of that baseline.

## Branch Protection

Recommended GitHub settings:

- protect `main`
- require pull requests before merge
- require the final CI status gate
- require conversation resolution
- require reviews from `CODEOWNERS`

## Suggested Consumption Example

```yaml
name: ci

on:
  push:
  pull_request:

jobs:
  standards:
    uses: org/repo/.github/workflows/ci-reusable.yml@main
```
