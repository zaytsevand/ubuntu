---
description: Generate release notes from a sprint or fix version. Use when user asks for "release notes", "sprint summary", or changelog for a version/sprint.
---

# Release Notes Generator

## Input

User provides one of:
- A fix version name (e.g., "Release 3.2.0")
- A sprint name or "current sprint"
- A date range (e.g., "last 2 weeks")

## Phase 1: Gather Issues (parallel)

**By fix version:** JQL `fixVersion = "<version>" AND project = <KEY>` + version metadata

**By sprint:** Board → sprint → sprint issues (Done only)

**By date range:** JQL `project = <KEY> AND status = Done AND resolved >= "<start>" AND resolved <= "<end>"`

Also fetch development info (linked MRs) for each resolved issue.

## Phase 2: Categorize

- **Features** — Stories, Tasks with new functionality
- **Bug Fixes** — Bugs
- **Improvements** — Technical Tasks, refactoring, performance
- **Infrastructure** — DevOps, deployment, configuration changes
- **Security** — security-related fixes or improvements

Within each category, sort by priority (High → Low).

## Phase 3: Generate Release Notes

### Internal Format (for the team)

```
## Release Notes: <Version / Sprint Name>
Date: <release date> | Issues resolved: N

### Features (N)
- ISSUE-123: <summary> (@assignee) — MR: !456

### Bug Fixes (N)
- ISSUE-200: <summary> (@assignee)

### Improvements (N)
### Infrastructure (N)
### Security (N)

### Contributors
- Alice (N issues) | Bob (N issues)

### Known Issues / Carry-over
- ISSUE-600: <summary> (moved to next sprint)
```

### External Format (optional — stakeholder-facing)

If the user requests external format, omit internal details:

```
## What's New in <Version>

### New Features
- <user-facing description>

### Improvements
- <user-facing description>

### Bug Fixes
- Fixed an issue where <description>
```

## Phase 4: Publish (optional)

Offer to:
- Create a Confluence page with release notes
- Post on Jira version description
- Comment "Released in <version>" on each issue

## Rules

- Run all queries in parallel
- Only include Done/Resolved issues
- Always show Jira issue keys for traceability
- Features first, then bugs, then the rest
- Ask which format (internal/external) the user wants