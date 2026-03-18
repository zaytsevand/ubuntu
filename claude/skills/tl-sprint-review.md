---
description: Sprint health and progress overview — analyze active sprint, blockers, velocity, risks. Use when user asks for "sprint review", "sprint health", or "sprint status".
---

# Sprint Health Review

Ask for the **project key** if not provided.

## Phase 1: Data Gathering (parallel)

1. Board & Sprint: board → active sprint → all sprint issues (limit=50)
2. Blockers: `project = <KEY> AND status != Done AND (labels = blocked OR priority = Blocker)`
3. Stale: `project = <KEY> AND status = "In Progress" AND updated <= -3d`
4. In Review: `project = <KEY> AND status IN ("Code Review", "In Review", "Design Review")`
5. Unassigned: `project = <KEY> AND sprint in openSprints() AND assignee is EMPTY`

## Phase 2: Analysis

Classify each issue: Done, On Track, At Risk (stale >3d or large scope near sprint end),
Blocked, Not Started.

Calculate:
- Sprint progress: Done / Total (%)
- Days remaining from sprint end date
- Burn rate: issues completed vs days elapsed
- Projected completion

## Phase 3: Report

```
## Sprint Review: <Sprint Name>
Period: <start> → <end> | Days remaining: N

### Progress: N/M issues (X%)
Done: N | On Track: N | At Risk: N | Blocked: N | Not Started: N

### Blockers & Risks
- ISSUE-123: <title> (assignee) — <reason>

### Stale Issues (no update >3 days)
- ISSUE-456: <title> (assignee) — last updated: <date>

### Stuck in Review
- ISSUE-789: <title> (assignee) — in review since: <date>

### Unassigned Work
- ISSUE-101: <title> (priority)

### Velocity Projection
- Burn rate: N issues/day
- Projected: Will/Won't complete by sprint end
- Recommendation: <action>
```

## Phase 4: Actions

Offer: reassign stale/unassigned issues, escalate blockers, move at-risk issues to next sprint,
add labels (blocked, at-risk), drill into a specific issue.

## Rules

- Run all queries in parallel
- Show concrete numbers, not vague summaries
- Flag issues in same status for >3 days
- Never modify issues without explicit user approval