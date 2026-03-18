---
description: Work with Jira issues — get project overview, create/update issues, link them. Use when the user asks about Jira, sprint status, or wants to create/manage issues.
---

# Jira Issue Management

Always ask the user for the **project key** if not provided or inferable.

## Phase 1: Project Overview (parallel)

1. Active sprint — board → active sprint → sprint issues
2. Epics — `issuetype = Epic AND project = <KEY> AND status != Done`
3. Blockers — `labels = blocked AND project = <KEY> AND status != Done`
4. By status — In Progress, To Do (by priority), In Review

### Report Format

```
## Project: <KEY> — <Project Name>

### Active Sprint: <Sprint Name> (<start> → <end>)
Goal: <sprint goal>
- Total: N | Done: N | In Progress: N | To Do: N | Blocked: N

### Open Epics
- EPIC-123: <title> (<status>)

### Blockers
- ISSUE-456: <title> (assignee) — blocked

### In Review
- ISSUE-789: <title> (assignee)

### Top Priority To Do
- ISSUE-101: <title> (priority)
```

After presenting, ask: "What would you like to do next?"

## Phase 2: Issue Creation

Collect fields — ask only for missing ones:

| Field | Required |
|---|---|
| Summary | Yes |
| Issue type | Yes |
| Description | No |
| Parent / Epic | No (ask for Story/Subtask) |
| Assignee | No |
| Priority | No (default: Medium) |
| Labels | No |

- **NEVER create without at least a summary and issue type**
- For Subtasks, always require a parent issue key
- For batch creation, create all at once efficiently

## Phase 3: Issue Linking

1. Ask for link type if not specified (common: Blocks, Relates to, Duplicates)
2. Confirm direction
3. Create the link

## Phase 4: Issue Updates

1. Fetch current issue details to show current state
2. Apply only changed fields
3. For status transitions, get transitions list first

## Rules

- **Always confirm** before creating or modifying issues
- **Run independent fetches in parallel**
- **Never guess** project keys, issue types, or component names
- After any action, offer a logical next step
