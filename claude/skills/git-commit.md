---
description: Generate a Conventional Commits message with Jira context, then commit and push. Use when the user says "commit", "git commit", or asks to commit changes.
allowed-tools:
  - Bash(git status:*)
  - Bash(git diff:*)
  - Bash(git add:*)
  - Bash(git branch:*)
  - Bash(git log:*)
  - AskUserQuestion
---

# Git Commit

Generate Conventional Commits messages that tell a complete story for future code archeology, with
Jira ticket context from the branch name.

## Critical Rules

- **NEVER commit directly to main or master branches** — ask the user to switch to a feature branch
- **NEVER add Co-Authored-By or mention Claude Code in commit messages**
- **NEVER use `git add -A` or `git add .`** — only commit files that are already staged and
  understood
- Use heredoc for multi-line commit messages

## Workflow

### 1. Gather Context

Run in parallel:

- `git status` — current state
- `git diff --staged` — staged changes (fall back to `git diff` if nothing staged)
- `git log --oneline -5` — recent commits for style reference
- `git branch --show-current` — current branch

### 2. Extract Jira Ticket (if applicable)

Parse the branch name for Jira ticket IDs (e.g. `feature/PROJ-123-description`, `PROJ-123`). If
found, include it as a reference in the commit message.

### 3. Ask Why

**Always ask the user why the change was made** using AskUserQuestion. Analyze the diff and propose
3-4 specific, plausible motivations as options (the user can always pick "Other").

### 4. Compose Commit Message

**Format:**

```
type: concise subject line (PROJ-123)

Why: [user's explanation + Jira context if available]

What changed:
- [technical summary of modifications]
```

**Types:** feat, fix, docs, style, refactor, test, chore, perf, ci

### 5. Commit and Push

After user confirms the message:

```bash
git commit -m "$(cat <<'EOF'
type: subject line (PROJ-123)

Why: ...

What changed:
- ...
EOF
)"
```

Then `git push`.

## Example

```
feat: add tool execution timeout handling (AGP-582)

Why: Tools hung indefinitely when external APIs failed, blocking the
MCP server and causing user-facing timeouts in the chat interface.

What changed:
- Added configurable timeout wrapper around tool execution
- Implemented graceful timeout error messages
- Updated tool registry to support per-tool timeout config

```
