# Golden Repo Cheatsheet

Quick explanation of the key files in this template.

- `README.md` → Project overview and getting-started instructions.
- `CONTRIBUTING.md` → Rules and steps for contributors.
- `CODEOWNERS` → Who must review specific paths.
- `SECURITY.md` → How to report vulnerabilities safely.
- `docs/standards.md` → Commit style + branch + PR + CI standards.
- `.editorconfig` → Editor formatting defaults.
- `.gitignore` → Files Git should ignore.
- `.markdownlint.json` → Markdown lint rules used by local and CI checks.
- `.yamllint.yml` → YAML lint rules used by local and CI checks.
- `Makefile` → Common local commands for checks.
- `.github/workflows/ci-reusable.yml` → Reusable CI pipeline (`workflow_call`).
- `.github/workflows/ci.yml` → Caller workflow so this repo validates itself on PR/push.
- `LICENSE` → Usage and distribution rights.

## Fast path for a new maintainer

1. Set your real owners in `CODEOWNERS`.
2. Replace the security contact in `SECURITY.md`.
3. Tune `docs/standards.md` to match team process.
4. Enable branch protection and require CI checks.
