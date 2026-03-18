---
description: Team capacity and workload overview — see who's overloaded, who's free, and rebalance. Use when user asks about "team workload", "capacity", or "who can take this".
---

# Team Workload Analysis

Ask for the **project key** if not provided. Team members will be auto-discovered from sprint issues.

## Phase 1: Data Gathering (parallel)

1. Active sprint issues — board → sprint → all issues (summary, status, assignee, priority, updated)
2. In Progress per person: `project = <KEY> AND status = "In Progress" AND sprint in openSprints()`
3. In Review per person: `project = <KEY> AND status IN ("Code Review", "In Review") AND sprint in openSprints()`
4. Blocked: `project = <KEY> AND (labels = blocked OR priority = Blocker) AND status != Done`
5. Unassigned: `project = <KEY> AND sprint in openSprints() AND assignee is EMPTY AND status != Done`
6. Recently completed: `project = <KEY> AND sprint in openSprints() AND status = Done ORDER BY updated DESC` (limit=20)

## Phase 2: Build Workload Map

For each team member:
- Total assigned, In Progress, In Review, Blocked, Done this sprint
- **Load score**: In Progress × 3 + In Review × 2 + To Do × 1

## Phase 3: Report

```
## Team Workload: <Project> — Sprint <name>

### Workload Matrix
| Member | To Do | In Progress | In Review | Blocked | Done | Load |
|--------|-------|-------------|-----------|---------|------|------|
| Alice  | 2     | 3 ⚠️       | 1         | 0       | 4    | 13   |

### Overloaded (>2 items In Progress)
- Alice — 3 items in progress, consider reassigning:
  - ISSUE-123: <title>

### Underutilized (no active work)
- Carol — 0 items in progress, available for:
  - Unassigned: ISSUE-101

### Blocked Team Members
- Bob — blocked on ISSUE-200 (<reason>)

### Unassigned Issues (N)
- ISSUE-101: <title> (priority: High)

### Recommendations
1. Reassign ISSUE-789 from Alice → Carol
2. Unblock Bob's ISSUE-200 — escalate to <team>
```

## Phase 4: Actions

Offer: reassign issues, unblock, assign unassigned, balance load.

## Rules

- Run all queries in parallel
- Flag anyone with >2 items In Progress as overloaded
- Flag anyone with 0 In Progress as potentially underutilized
- Show concrete issue keys and titles, not just numbers
- Never reassign without explicit user approval
- Consider priority when suggesting reassignments (High first)