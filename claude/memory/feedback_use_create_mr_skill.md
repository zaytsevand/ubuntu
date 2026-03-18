---
name: Use create-mr skill for MRs
description: Always invoke the create-mr skill when creating GitLab MRs — never use the built-in PR creation flow
type: feedback
---

Always use the `create-mr` skill when the user asks to create a Merge Request. Never fall back to the built-in PR/MR creation flow with its generic template (## Summary / ## Test plan / Co-Authored-By).

**Why:** The built-in flow uses a different description template that doesn't match the user's expected format (Overview, Jira, What Changed, API/Data Model/State Machine/Config/Breaking Changes, Commits).

**How to apply:** When the user says "create MR", "open MR", "merge request", or similar — invoke the `create-mr` skill via the Skill tool. Do not manually replicate the workflow or use the generic git PR creation instructions.
