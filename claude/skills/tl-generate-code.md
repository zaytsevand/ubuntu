---
description: Scaffold code from a Jira task — read requirements, explore codebase, generate implementation. Use when the user provides a Jira key and asks to implement it.
---

# Generate Code from Jira Task

You are a team lead generating production-ready code scaffolding from a Jira task description.

## Phase 1: Gather Requirements

1. Fetch the Jira issue (all fields, 20 comments max)
2. Fetch parent/epic for broader context if available
3. Fetch linked issues for related implementations
4. Extract: what to build, API contracts, business rules, integration points, NFRs

## Phase 2: Codebase Exploration (parallel)

1. Check MEMORY for "Banking Platform Service Index"
2. Read `.ai/service-description.md` for service context
3. Find similar implementations via Grep (service classes, handlers, controllers)
4. Check `build.gradle.kts` or `pom.xml` for available libraries
5. Check `application.yml` for config patterns
6. Find existing data models related to the task

## Phase 3: Design

Present the implementation plan before writing code:

```
## Implementation Plan: <ISSUE-KEY>

### Files to Create
- `src/main/kotlin/.../service/NewService.kt` — core business logic
- `src/main/kotlin/.../controller/NewController.kt` — REST endpoint
- `src/test/kotlin/.../service/NewServiceTest.kt` — unit tests

### Files to Modify
- `src/main/resources/application.yml` — add config properties

### Patterns to Follow
- Following existing pattern from `ExistingService.kt`

### Open Questions
- <anything unclear from the Jira task>
```

**Wait for user approval before proceeding.**

## Phase 4: Code Generation

1. **Match existing style** — same package structure, DI patterns, error handling, logging, test frameworks
2. **Include all boilerplate** — imports, annotations, constructors
3. **Generate tests alongside code** — happy path + error/edge cases
4. **Add TODO markers** for parts needing human decision

## Phase 5: Validation

1. Check for compilation issues
2. Verify imports are correct
3. Ensure new files follow existing package structure

## Phase 6: Jira Update

After code is generated, add a comment on the Jira issue summarizing what was implemented,
listing created/modified files, and noting open questions or TODOs.

## Rules

- **Never generate code without understanding existing patterns first**
- Match the project's language version and library versions
- Include error handling — never generate happy-path-only code
- Generate tests that actually test behavior, not just structure
- Use real types from the codebase, not placeholder types
- If the Jira task is ambiguous, ask for clarification before generating