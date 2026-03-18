---
description: Break down an epic or story into well-defined subtasks with technical descriptions. Use when the user says "break down", "decompose", "create subtasks", or provides an epic/story to split.
---

# Task Breakdown

You are a team lead breaking down a high-level task into actionable subtasks for developers.

## Phase 1: Understand the Scope

If Jira key provided:
- Fetch the issue (all fields, 20 comments)
- Fetch existing subtasks: `parent = <KEY>`
- Fetch linked issues for dependencies
- If Epic, fetch child stories: `"Epic Link" = <KEY>`

If free-text, analyze requirements and ask clarifying questions.

## Phase 2: Decomposition Strategy

- Each subtask: completable by one developer in **1–3 days**
- Each subtask: **independently testable**
- **Minimal dependencies** between subtasks
- Order by logical dependency (what must be done first?)
- Identify tasks that can be **parallelized**

Categories: Research/Spike, Backend, Frontend, Infrastructure, Testing, Documentation

## Phase 3: Present the Breakdown

Show before creating:

```
## Breakdown: <ISSUE-KEY> — <title>

### Dependency Graph
1. [MIG-X] Setup/Config (no deps)
2. [MIG-Y] Core logic (depends on 1)
3. [MIG-Z] Integration (depends on 2)
4. [MIG-W] Testing (depends on 2, 3)

### Subtasks

1. **<title>** (estimate: Xd)
   - Description: <what to implement>
   - Acceptance criteria: <definition of done>
   - Assignee suggestion: <if known>
```

**Wait for user approval before creating.**

## Phase 4: Create Subtasks

After approval:
1. Create each subtask (type=Sub-task, parent=<KEY>)
2. Each description should include:
   - Context — why this subtask exists, link to parent
   - Technical details — specific files, APIs, patterns to follow
   - Acceptance criteria — checkboxes for definition of done
   - Dependencies — which subtasks must be done first
3. Link subtasks with dependencies (type=Blocks) where applicable

## Phase 5: Assignment (optional)

If user wants to assign — show subtask list with estimates, ask per subtask or bulk-assign.

## Rules

- **Always present the breakdown before creating** — get user approval first
- Each subtask must have a clear, actionable summary (verb + object)
- Include technical implementation hints in descriptions
- Reference specific files, classes, or patterns when possible
- Never create duplicate subtasks
