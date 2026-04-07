# Architectural Decision Log

Records of significant technical decisions made for this template and why they were made.

---

## ADR-001: Use GitHub Actions over GitLab CI

**Date**: 2025-03-01
**Status**: Accepted

**Context**: Needed a CI/CD platform for a portfolio of public GitHub repositories.

**Decision**: Use GitHub Actions.

**Rationale**:
- Native integration — no separate auth tokens
- Free for public repos
- `workflow_call` enables reusable pipeline definitions across repos
- Wider ecosystem of community actions

**Trade-offs accepted**: GitLab CI has faster local testing with `gitlab-runner`. GitHub Actions requires `act` or remote runs for debugging.

---

## ADR-002: Conventional Commits required

**Date**: 2025-03-01
**Status**: Accepted

**Context**: Git history was unreadable across projects. Commit messages like "fix", "update", "asdf" made auditing impossible.

**Decision**: Enforce Conventional Commits format in all repos.

**Rationale**:
- CI can auto-generate CHANGELOGs
- Humans can understand history without reading diffs
- Forces engineers to categorize their change (feat vs fix vs chore)

**Enforcement method**: Pre-commit hook + PR template checklist.

---

## ADR-003: ShellCheck mandatory for all bash scripts

**Date**: 2025-03-05
**Status**: Accepted

**Context**: A production script failed due to an unquoted variable (`rm -rf $DIR/` with empty `$DIR` = `rm -rf /`). This was a real incident.

**Decision**: All `.sh` files must pass ShellCheck before merge.

**Rationale**: ShellCheck catches the specific class of bugs that cause data loss in bash scripts.

**Implementation**: Added to `ci.yml` as a blocking step.

---

## ADR-004: All workflows must have timeout-minutes

**Date**: 2025-04-07
**Status**: Accepted

**Context**: A hanging docker build consumed 6 hours of GitHub Actions minutes before timing out at the 6h runner limit. The pipeline appeared "running" when it was actually stuck.

**Decision**: Every job must declare `timeout-minutes` appropriate to its expected duration.

**Default values** used in this template:
- Structure/lint checks: 5 min
- Test/build jobs: 10–15 min
- Docker operations: 20 min max
