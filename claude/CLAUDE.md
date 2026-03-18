# Claude Code — Global Rules

## Environment

- Running inside WSL (Linux) — do NOT prefix commands with `wsl`
- Shell: bash/zsh with standard Linux utilities available

## GitLab

- Host: `gitlab.cardpay-test.com`
- Always set `GITLAB_HOST=gitlab.cardpay-test.com` when running `glab` commands
- Use `glab` CLI for all GitLab operations (MRs, pipelines, discussions)
- For multi-line content (MR descriptions, comments), write to `/tmp/` file then use it

## Git Workflow

- Feature branches are always cut from `dev`, never from `main`/`master`
- MRs always target `dev` branch
- Branch naming: `feature/JIRA-123-short-description`
- Never commit directly to `main` or `master`
- Use `git push -u origin <branch>` for first push

## Banking Platform Architecture

- Each repo has `.ai/service-description.md` — read this first when working in a repo
- Service index: `~/code/architecture/banking/service-index.md`
- Dependency diagram: `~/code/architecture/banking/service-dependencies.md`
- Template: `~/code/architecture/banking/service-description-template.md`

## Implementation Approach

- Read `.ai/service-description.md` before making changes
- Check `~/code/architecture/banking/service-dependencies.md` for upstream/downstream impact
- Prefer existing patterns over new abstractions
- Refactor first, implement second — never mix the two
- If new Feign clients, queue listeners/publishers, or REST calls are added → run `/update-architecture`

## MR Review Approach

- Always fetch the full Jira ticket — don't rely only on the MR description
- Severity levels: BLOCKER, MAJOR, MINOR, NIT
- Post feedback with `file:line` references
- Check for accidental IDE artifacts (unused imports, autocomplete mistakes)

## User Preferences

- Concise responses — short bullet points, no verbose explanations
- No emojis unless explicitly requested
