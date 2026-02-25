# DevOps Repository Standards

This document defines baseline standards for repositories created from this template.

## 1) Commit style

Use **Conventional Commits**:

- `feat:` new functionality
- `fix:` bug fixes
- `docs:` documentation updates
- `chore:` maintenance changes
- `ci:` CI/CD updates
- `refactor:` internal code changes without behavior change

Examples:

- `feat: add reusable CI workflow`
- `docs: clarify branch naming policy`
- `ci: add gitleaks scanning stage`

## 2) Branch policy

- Protected branch: `main`
- No direct pushes to `main` (except emergency by maintainers)
- Changes must come through Pull Requests
- At least one code-owner review is required
- All required CI checks must pass before merge

Recommended branch naming:

- `feat/<topic>`
- `fix/<topic>`
- `docs/<topic>`
- `chore/<topic>`

## 3) Pull request expectations

Each PR should include:

- Clear summary of change and reason
- Risk/impact notes
- Testing evidence (command output or CI link)
- Rollback notes if relevant

## 4) CI standards baseline

Every repository should include checks for:

1. Markdown lint
2. YAML lint
3. Shell script lint (when scripts exist)
4. Secret scanning
5. Dependency review (when app dependencies exist)
6. Final status aggregation gate
