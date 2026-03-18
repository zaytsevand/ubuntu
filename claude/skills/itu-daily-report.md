---
description: Generate daily ITU project status report for CTO/CIO. Covers payment rails, deployments, infrastructure tracks, individual contributions, stale issues, and action items.
---

# ITU Daily Report Generation

## Step 1: Fetch All Open Issues and Recent Activity (parallel)

1. All open issues: `project = ITU AND status not in (Done, Closed, Resolved) ORDER BY updated DESC` (limit 50)
2. Updated last 24h: `project = ITU AND updated >= -1d ORDER BY updated DESC`
3. Stale (>14 days): `project = ITU AND status not in (Done, Closed, Resolved) AND updated <= -14d ORDER BY updated ASC`
4. Recently completed (last 3 days): `project = ITU AND status in (Done, Closed, Resolved) AND updated >= -3d ORDER BY updated DESC`

## Step 2: Identify Rail Deployment Umbrella Task

Search: `project = ITU AND summary ~ "PROD Deployment" AND issuetype = Task ORDER BY created DESC`

Fetch with all fields and 20 comments. Then fetch subtasks: `parent = <umbrella_key> ORDER BY key ASC`

If a TEST Deployment umbrella exists, fetch its subtasks too for comparison.

Subtasks typically map to: SEPA, SEPA Instant, SWIFT, TARGET2 — each with lambdas, connectors, routers.

## Step 3: Identify Deployment and Release Tickets

Search: `project = ITU AND (issuetype = Deployment OR summary ~ "RELEASE" OR summary ~ "Deploy" OR summary ~ "Hotfix") AND status not in (Done, Closed, Resolved) ORDER BY priority DESC, updated DESC`

## Step 4: Fetch Comments on Key Issues (parallel batches of 10)

Fetch full details + 20 comments for any issue that is:
- Part of the rail deployment tracker
- A deployment/release ticket
- In Progress or In Review for >7 days
- Stale (>14 days no update)
- High priority

Comments reveal: blockers, already-deployed items, architecture changes, security approval state.

## Step 5: Compile the Report

Keep it concise — for CTO/CIO presentation. Bold individual names for accountability.

### Section 1: Payment Rails Deployment Status
Table: Rail | Subtask | Status | Notes
- Mark each as Done or show blocker
- Note architecture changes from comments
- Summary: X of Y rails deployed, what remains and why

### Section 2: Active Deployments and Releases
- List all deployment/release tickets with status
- Note: in validation, pending, blocked
- Highlight hotfixes or urgent releases
- Cross-reference comments — if deployment confirmed in comments, note it even if status not updated

### Section 3: Active Infrastructure Tracks
Group open issues into workstreams:
- Infrastructure migrations (SFTP, HSM, cloud account moves)
- Security approvals and reviews
- Observability and monitoring
- Network/connectivity changes

For each: one-liner status, **assignee name bolded**, blockers.

### Section 4: Today's Completions
Bullet: ticket key, summary, **assignee name bolded**.

### Section 5: Actions Needed
Numbered list:
- Tickets to close (with evidence from comments)
- Escalations (stuck approvals, approaching deadlines)
- Re-scoping needed (architecture changes invalidating subtasks)
- Follow-ups on stale items with no comment activity

## Guidelines

- Always attribute work to individuals — bold their last name
- Check comments before flagging as stale — may be active in comments but status not updated
- Cross-reference deployment tickets — a Validation ticket may already be deployed (check comments)
- Highlight deadlines — EOL dates, migration windows, release dates
- Do not hardcode specific issue keys — discover dynamically via JQL
- Report must be presentable to CTO/CIO without additional context