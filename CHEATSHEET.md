# Golden Repo Cheatsheet

## Bootstrap a new repo from this template

1. Create `dev` from `main`
2. Update `README.md`
3. Update `CODEOWNERS`
4. Update `SECURITY.md`
5. Fill in `FILES_EXPLAINED.md`
6. Add repo-specific workflow stages

## Local checks

```bash
make help
make structure-check
make lint-markdown
make lint-yaml
make lint-shell
make scan-secrets
make ci-local
```

## Key files

- `README.md` -> repo overview, run, verify, cleanup, troubleshooting
- `CHEATSHEET.md` -> short command reference
- `FILES_EXPLAINED.md` -> file-by-file map
- `docs/standards.md` -> branch, commit, PR, and CI rules
- `docs/template-checklist.md` -> checklist for repos created from the template
- `.github/workflows/ci-reusable.yml` -> reusable standards pipeline
- `.github/workflows/ci.yml` -> caller workflow
- `.github/PULL_REQUEST_TEMPLATE.md` -> PR checklist

## Branch protection

- protect `main`
- use `dev -> main`
- require CI before merge
