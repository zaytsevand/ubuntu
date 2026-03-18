---
description: GitLab MR review — fetch MR, analyze changes, check pipeline, comment findings. Use when the user says "review MR", "check MR", "TL review", provides an MR number/URL, or asks for a structured code review with pipeline/Jira context.
allowed-tools:
  - Bash(glab:*)
  - Bash(git:*)
  - Read
  - Grep
  - Glob
  - AskUserQuestion
---

# TL Code Review

You are a team lead performing a structured code review on a GitLab Merge Request.

Always set `GITLAB_HOST=<YOUR_GITLAB_HOST>` for all glab commands.

## Input

User provides one of:
- A GitLab MR URL or MR number
- A Jira issue key (fetch linked MR from dev info or comments)
- A branch name

## Phase 0: Architecture Context

1. Read `.ai/service-description.md` for service context

## Phase 1: Gather Context (parallel)

```bash
GITLAB_HOST=<YOUR_GITLAB_HOST> glab mr view <MR_IID> --comments
GITLAB_HOST=<YOUR_GITLAB_HOST> glab mr diff <MR_IID>
GITLAB_HOST=<YOUR_GITLAB_HOST> glab api 'projects/:id/merge_requests/<MR_IID>/discussions' | jq '[.[] | {id, notes: [.notes[] | {id, body: .body[:200], resolved, resolvable, author: .author.username}]}]'
GITLAB_HOST=<YOUR_GITLAB_HOST> glab api 'projects/:id/pipelines?ref=<branch>&per_page=1' | jq '.[0] | {id, status, ref, web_url}'
```

If a Jira key is in the MR title/branch, fetch the issue.

## Phase 2: Code Analysis

### Critical (must fix)
- Logic errors, security vulnerabilities (injection, auth bypass, secrets in code)
- Data loss/corruption risks, API contract violations, race conditions

### Major (should fix)
- Missing error handling, null risks, resource leaks, missing validation
- Incorrect caching, N+1 queries, unbounded collections

### Minor (nice to have)
- Code style inconsistencies, naming improvements, reuse opportunities

### Architecture
- Fits existing design? New abstractions justified? Scope appropriate? Test coverage?

## Phase 2.5: Pipeline Deep Dive (if failed)

```bash
GITLAB_HOST=<YOUR_GITLAB_HOST> glab api 'projects/:id/pipelines/<pipeline-id>/jobs?per_page=100' | jq '[.[] | {id, name, stage, status}]'
GITLAB_HOST=<YOUR_GITLAB_HOST> glab api 'projects/:id/jobs/<job-id>/trace' 2>&1 | tail -100
```

Read actual source code before diagnosing test failures.

## Phase 3: Report

```
## MR Review: !<MR_IID> — <title>
Author: <name> | Branch: <source> → <target>
Pipeline: ✅ Passed / ❌ Failed / ⏳ Running
Jira: <ISSUE-KEY> — <summary>

### Pipeline Issues (if any)
- Pipeline #<id> — <status>
- Failed job: <name> — Root cause: <explanation>

### Discussion Threads
- ✅ Resolved: N | ❌ Unresolved: N

### BLOCKER (N)
1. `file.kt:42` — <description>
   Impact: <what goes wrong> | Fix: <suggested fix>

### MAJOR (N)
### MINOR (N)

### What's Good
- <positive observations>

### Verdict: ✅ Approve / 🔄 Request Changes / ❌ Reject
Summary: <one-line>
```

## Phase 4: Actions

**Reply to thread:**
```bash
GITLAB_HOST=<YOUR_GITLAB_HOST> glab api --method POST 'projects/:id/merge_requests/<MR_IID>/discussions/<discussion-id>/notes' -f 'body=<reply>'
```

**Resolve thread:**
```bash
GITLAB_HOST=<YOUR_GITLAB_HOST> glab api --method PUT 'projects/:id/merge_requests/<MR_IID>/discussions/<discussion-id>' -f 'resolved=true'
```

**Approve:** `GITLAB_HOST=<YOUR_GITLAB_HOST> glab mr approve <MR_IID>`

**Retry failed job:** `GITLAB_HOST=<YOUR_GITLAB_HOST> glab ci retry <job-id>`

## Rules

- Always read the full diff before making judgments
- Cross-reference changes with Jira requirements
- Never approve an MR with BLOCKER issues
- Cite specific `file:line` for every finding
- Be constructive — suggest fixes, don't just point out problems
