# Claude Code — local inventory

Snapshot of `~/.claude` and `~/.claude.json` taken 2026-10-15. Reinstall list, not a backup (no tokens, no env values).
Usage = slash-command invocations found in `~/.claude/history.jsonl`.

## Plugins (`enabledPlugins`)

| Plugin | Marketplace | Version | State | Notes |
|---|---|---|---|---|
| context-mode | context-mode | 1.0.146 | on | `ctx_*` tools keep big output out of context |
| pyright-lsp | claude-plugins-official | 1.0.0 | on | Python symbol lookups |
| superpowers | claude-plugins-official | 6.4.1 | on | used: systematic-debugging (37), receiving-code-review (24), brainstorming (16) |
| memsearch | memsearch-plugins | 0.4.1 | on | past-session recall |
| github | claude-plugins-official | user | on | GitHub MCP tools |
| ast-index | ast-index-marketplace | 3.47.2 | on | structural code search |
| modularity | vladikk-modularity | 1.5.0 | on | balanced-coupling reviews |
| humanizer | humanizer | 2.8.2 | on | |
| ponytail | ponytail | 5.2.0 | on | |
| context7 | claude-plugins-official | | off | |
| caveman | caveman | | off | |
| frontend-design | claude-plugins-official | | project scope only | |

Marketplaces: context-mode, memsearch-plugins, ast-index-marketplace, vladikk-modularity, humanizer, caveman, ponytail (+ claude-plugins-official).

## User skills (`~/.claude/skills`)

archify, chorus-core, chorus-learn, chorus-review (56 uses), chorus-sdlc (38), coryphaeus, gh-stack, goal-loop (36 as `/goal`),
graphify, open-vscode (26), prj-win-cleanup, problem-brief, spec-walkthrough (30), plus a `synced/` folder.

Most-used skills that come from projects/plugins: speckit-implement (141), speckit-specify (112), speckit-plan (107),
speckit-tasks (85), speckit-clarify (80), speckit-analyze (77), deep-research (16), prj-build-exe-windows (13).

## Subagents (`~/.claude/agents`)

alan-cooper-advisor, arch-governance-agent, bjarne-stroustrup-persona, delivery-and-ops-advisor, don-norman-advisor,
eliyahu-goldratt-advisor, eric-evans-advisor, guido-python-reviewer, kent-beck-persona, mark-richards-architect,
security-and-trust-advisor, uncle-bob-architect.

## Mods (`~/.claude/dev-mods`)

Four mod folders; only one has content: `brief-sidebar` (problem-brief sidebar). The other three are empty.

## MCP servers

| Server | Scope | Transport | Command / URL |
|---|---|---|---|
| grafana | user | stdio | `~/.local/bin/mcp-grafana-jobgenie` (wrapper; holds the token) |
| headroom | user | stdio | `headroom` |
| serena | user | stdio | `uvx` |
| claude-context | `~/` and LinkedInTools | stdio | `npx` |
| openrouter | LinkedInTools | http | https://mcp.openrouter.ai/mcp |

Also provided by plugins: context-mode, github. claude.ai connectors (Gmail, Drive, Docs, Excalidraw) are account-side, not local.

## Other

- Output style: `expanded-prose` (`~/.claude/output-styles/`)
- Status line: `~/.claude/statusline-command.sh`
- Global rules: `CLAUDE.md`, `RTK.md` (rtk 1.0.1 token proxy, hook-rewritten commands)
- Hooks and permissions live in `~/.claude/settings.json` (not copied here: machine-specific paths)

## Stale in this repo

`claude/settings.json` still allows `mcp__atlassian__*` and `mcp__gitlab__*`, and `claude/CLAUDE.md` is the old GitLab/Jira
workflow; neither matches the setup above.
