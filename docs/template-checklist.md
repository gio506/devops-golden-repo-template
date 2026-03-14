# Template Checklist

Use this checklist when creating a new repo from this template.

## Baseline

- [ ] Create `dev` from `main`
- [ ] Update `README.md` with repo-specific purpose
- [ ] Update `CODEOWNERS`
- [ ] Update `SECURITY.md` contact
- [ ] Update `FILES_EXPLAINED.md`

## Docs

- [ ] Add local run steps
- [ ] Add verification steps
- [ ] Add cleanup steps
- [ ] Add troubleshooting notes
- [ ] Keep `CHEATSHEET.md` short and practical

## Scripts

- [ ] Add `scripts/smoke.sh` or `scripts/verify.sh` if the repo has runtime behavior
- [ ] Keep scripts safe and repeatable
- [ ] Make script names predictable

## CI

- [ ] Keep the standards workflow
- [ ] Add 4 to 6 repo-specific stages
- [ ] Make failures easy to diagnose
- [ ] Add a final required status gate when useful

## Branch Policy

- [ ] Work in `dev`
- [ ] Merge to `main` through PR
- [ ] Require passing checks before merge
