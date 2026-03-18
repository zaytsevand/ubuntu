# AI Architecture Documentation — Team Manual

> How to use the AI-discoverable service documentation across our banking platform repositories.

## What Was Added

Every microservice repository now contains a `.ai/service-description.md` file — a structured description of the service's purpose, dependencies, APIs, tech stack, and ownership. A centralized architecture repo ties everything together.

## Repository Layout

```
architecture/banking/                         ← centralized docs
├── service-index.md                          ← master list of all ~67 services
├── service-dependencies.md                   ← Mermaid dependency diagram
├── service-description-template.md           ← template for new services
└── .ai-database/                             ← AI knowledge base (memories, workflows, skills)

<any-service-repo>/                           ← per-service docs
└── .ai/
    └── service-description.md                ← structured service context
```

## Quick Start

### 1. Understand the platform

Read the centralized index to see what services exist and how they relate:

```
architecture/banking/service-index.md            # table of all services by domain
architecture/banking/service-dependencies.md     # visual dependency diagram (Mermaid)
```

### 2. Understand a specific service

Open the `.ai/service-description.md` in the service repo. It covers:

- **Business context** — domain, subdomain, responsibility
- **Owned entities** — what data this service is the source of truth for
- **APIs provided / consumed** — protocols, endpoints, consumers
- **Data storage** — databases, caches, queues
- **Tech stack** — language, framework, build tool
- **Key integrations** — upstream/downstream dependencies
- **Ownership** — code owner, team, Jira project

### 3. Add a new service

1. Copy `architecture/banking/service-description-template.md` to `<new-repo>/.ai/service-description.md`
2. Fill in all sections
3. Add the service to `architecture/banking/service-index.md`
4. Add the service node + connections to `architecture/banking/service-dependencies.md`

### 4. Update when dependencies change

When you add or remove a dependency between services:

1. Update `.ai/service-description.md` in **both** the consumer and provider repos (APIs Provided / APIs Consumed tables)
2. Update `architecture/banking/service-dependencies.md` (add/remove the connection)
3. If a new queue/topic is involved, update the service index

## Using with AI Assistants (Windsurf / Cursor / Copilot)

The `.ai/` folder is designed to be automatically picked up by AI coding assistants. When an AI agent opens a repo, it can read `.ai/service-description.md` to understand:

- What the service does before writing code
- Which services to consider for cross-service changes
- What APIs exist before adding new integrations

### Windsurf-specific

The `.ai-database/` folder in the architecture repo contains exported workflows, skills, and memories. To bootstrap a new Windsurf workspace:

1. Clone `architecture/banking`
2. Copy `.ai-database/workflows/*.md` → your workspace's `.windsurf/workflows/`
3. Copy `.ai-database/skills/*.md` → your workspace's `.windsurf/skills/`
4. Memories in `.ai-database/memories/` can be fed to the AI as context in your first conversation

## File Formats

| File | Format | Editable by |
|------|--------|-------------|
| `service-description.md` | Markdown with tables | Developers |
| `service-index.md` | Markdown table | Architecture maintainers |
| `service-dependencies.md` | Mermaid diagram in Markdown | Architecture maintainers |
| `.ai-database/*` | Markdown | AI agent maintainers |

## FAQ

**Q: Do I need to update `.ai/service-description.md` for every PR?**
No. Update it when the service's contracts change — new APIs, new dependencies, new data stores, ownership changes.

**Q: What if the description is wrong or incomplete?**
Fix it. These are living documents. A partial description is better than none.

**Q: Does this replace Confluence/wiki?**
No. This is a lightweight, code-adjacent reference optimized for AI agents and quick developer onboarding. Detailed design docs, ADRs, and runbooks still live in Confluence.

**Q: Can I preview the dependency diagram?**
Yes. Paste the Mermaid block from `service-dependencies.md` into [mermaid.live](https://mermaid.live) or view it directly in GitLab's Markdown renderer.
