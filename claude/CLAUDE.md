# Claude Code — Global Rules

## Environment

- Running inside WSL (Linux) — do NOT prefix commands with `wsl`
- Shell: bash/zsh with standard Linux utilities available

## Git Workflow

- Never commit directly to `main` or `master`
- Use `git push -u origin <branch>` for first push

## Implementation Approach

- Each repo has `.ai/service-description.md` — read this first when working in a repo
- Prefer existing patterns over new abstractions
- Refactor first, implement second — never mix the two

## User Preferences

- Concise responses — short bullet points, no verbose explanations
- No emojis unless explicitly requested
