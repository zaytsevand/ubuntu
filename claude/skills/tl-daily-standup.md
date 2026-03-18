---
description: Prepare daily standup summary — what's done, in progress, blocked, needs attention. Use when user asks for "standup", "daily standup", or "standup report".
---

# Daily Standup Report

Ask for the **project key** if not provided.

## Phase 1: Data Gathering (parallel)

1. Recently resolved (last 24h): `project = <KEY> AND status CHANGED TO Done AFTER -1d`
2. In Progress: `project = <KEY> AND status = "In Progress" AND sprint in openSprints()`
3. In Review: `project = <KEY> AND status IN ("Code Review", "In Review", "Design Review") AND sprint in openSprints()`
4. Blocked: `project = <KEY> AND (labels = blocked OR priority = Blocker) AND status NOT IN (Done, Canceled)`
5. Newly created (last 24h): `project = <KEY> AND created >= -1d`
6. Sprint info for days remaining

Note: On Mondays use `-3d` for "yesterday" window.

## Phase 2: Report

```
## Daily Standup — <date>
Sprint: <name> | Days remaining: N

### Completed Yesterday (N)
- ISSUE-123: <summary> (@assignee)

### In Progress (N)
- ISSUE-200: <summary> (@assignee)

### Waiting for Review (N)
- ISSUE-300: <summary> (@assignee)

### Blocked (N)
- ISSUE-400: <summary> (@assignee) — <reason>

### New Issues (N)
- ISSUE-500: <summary> (priority: High)

### Attention Needed
- <stale items, overdue, unassigned high-priority work>
```

## Rules

- Run all queries in parallel
- Keep it concise — for a 15-minute standup
- Group by status, not by person (unless user requests per-person)
- If >10 items in any category, show top 5 by priority and summarize the rest
- Never modify issues without explicit approval