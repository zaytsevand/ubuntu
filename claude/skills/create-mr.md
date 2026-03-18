---
description: Create a GitLab Merge Request with a detailed, auto-generated description. Use when the user says "create MR", "merge request", "open MR", or asks to create/submit an MR.
allowed-tools:
  - Bash(git log:*)
  - Bash(git diff:*)
  - Bash(git branch:*)
  - Bash(git status:*)
  - Bash(git merge-base:*)
  - Bash(git remote:*)
  - Bash(glab:*)
  - AskUserQuestion
---

# Create GitLab Merge Request

Generate a descriptive Merge Request via `glab mr create`, with an auto-generated description that
highlights API changes, data model changes, state machine changes, configuration changes, and
breaking changes.

## Critical Rules

- **NEVER create an MR from main or master** — the user must be on a feature branch
- **NEVER include AI attribution** in the MR description
- **ALWAYS ask the user to confirm** the generated title and description before creating the MR
- Target branch defaults to `dev` unless the user specifies otherwise
- Always set `GITLAB_HOST=gitlab.cardpay-test.com` when running glab commands

## Workflow

### 1. Gather Context

Run in parallel:

- `git branch --show-current` — current branch name
- `git merge-base HEAD dev` — find the fork point
- `git status` — ensure working tree is clean or all changes are committed

### 2. Validate

- If on `main`, `master`, or `dev`, stop and ask the user to switch to a feature branch.
- If there are uncommitted changes, warn the user and ask whether to proceed.

### 3. Collect the Diff

Using the merge-base from step 1:

- `git log --oneline <merge-base>..HEAD` — list of commits on this branch
- `git diff <merge-base>..HEAD --stat` — file-level summary of changes
- `git diff <merge-base>..HEAD -- '*.yaml' '*.yml'` — OpenAPI / config YAML changes
- `git diff <merge-base>..HEAD -- '*.kt' '*.java'` — source code changes

### 4. Extract Jira Ticket

Parse the branch name for a Jira ticket ID (e.g. `feature/PROJ-123-description`). If found,
include it as a reference in the MR title and description.

### 5. Analyze Changes and Compose Description

Analyze the diffs and commit log. Structure the MR description using this template:

```markdown
## Overview

[1–3 sentence summary of what this MR does and why]

## Jira

[PROJ-123](https://jira.cardpay.com/browse/PROJ-123) *(omit section if no ticket found)*

## What Changed

- [Bullet list of logical changes grouped by area]

## API Changes

[List any new/modified/removed endpoints, request/response schema changes, status code changes.
State "None" if no API changes.]

## Data Model Changes

[List any new/modified/removed entities, fields, database migrations, DTO changes.
State "None" if no data model changes.]

## State Machine Changes

[List any changes to state transitions, statuses, or workflow logic.
State "None" if no state machine changes.]

## Configuration Changes

[List any changes to application config, feature flags, environment variables, deployment config.
State "None" if no configuration changes.]

## ⚠️ Breaking Changes

[List any backward-incompatible changes: removed endpoints, renamed fields, changed contracts,
migration requirements. State "None" if no breaking changes.]

## Commits

[List of commits from git log, formatted as a bullet list]
```

**Guidelines for analysis:**

- For **API changes**, look at OpenAPI specs (`api/spec/`), controllers, request/response DTOs
- For **data model changes**, look at entity classes, DTOs, schema files
- For **state machine changes**, look for status enums, transition logic, state-related services
- For **configuration changes**, look at `application.yml`, `*.properties`, config classes
- For **breaking changes**, flag any removed or renamed public endpoints, changed contracts

### 6. Ask User to Confirm

Present the generated **title** and **description** to the user using AskUserQuestion. Offer
options:

- **Create MR** — proceed as-is
- **Edit title** — let the user provide a different title
- **Edit description** — let the user revise the description
- **Cancel** — abort

### 7. Create the MR

Write the description to a temp file and create via glab:

```bash
cat > /tmp/mr_desc.txt << 'MRDESC'
<description content>
MRDESC

GITLAB_HOST=gitlab.cardpay-test.com glab mr create \
  --title "<title>" \
  --description "$(cat /tmp/mr_desc.txt)" \
  --target-branch dev
```

After creation, display the MR URL to the user.
