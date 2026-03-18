---
description: Update architecture docs when new services or dependencies are added. Trigger after adding new Feign clients, queue listeners/publishers, REST calls, or creating a new service.
---

# Update Architecture Documentation

Triggered when: a new service is created, a new dependency (REST/Feign/gRPC/queue) is added, or a
service description needs updating.

## Step 1: Identify What Changed

Determine the scope:
- **New repo/service** — needs `.ai/service-description.md`
- **New API dependency** (Feign client, REST, gRPC) — update consumer + provider descriptions
- **New queue dependency** (RabbitMQ, SNS/SQS, ActiveMQ) — update publisher + consumer
- **New library dependency** — update consumer description
- **Tech stack change** — update the affected service description

## Step 2: Update `.ai/service-description.md`

1. Read template: `~/code/architecture/banking/service-description-template.md`
2. If file doesn't exist, create `<repo>/.ai/service-description.md` from template
3. Edit only affected sections (APIs Provided, APIs Consumed, Key Integrations, Tech Stack, etc.)
4. Ensure GitLab URL follows: `https://gitlab.cardpay-test.com/<group>/<repo>`

## Step 3: Update Dependent Services

If service A now calls service B:
- Add B to A's **APIs Consumed** table
- Add A to B's **APIs Provided** Consumers column
- Add both to each other's **Key Integrations** section

## Step 4: Update Centralized Index

Edit `~/code/architecture/banking/service-index.md`:
- Add new service to the correct category table
- Format: `| [repo-name](https://gitlab.cardpay-test.com/group/repo) | Display Name | One-liner |`
- Keep tables sorted alphabetically within each category

## Step 5: Update Dependency Diagram

Edit `~/code/architecture/banking/service-dependencies.md`:

### Diagram Rendering Rules

1. **Only render service-to-service edges.** A "service" is a deployed application with its own repo.
2. **Do NOT render data stores** (PostgreSQL, Oracle, Redis, Solr, MongoDB, DynamoDB) — they are private to the owning service and documented in each service's `.ai/service-description.md`.
3. **Do NOT render message brokers** (RabbitMQ, SNS/SQS, Amazon MQ) as standalone nodes — **except** when a broker is the primary integration mechanism between two services (e.g., cbs-api-gateway publishes to a queue that cbs-executor consumes). In that case, show the edge as a dashed line directly between the two services with a label indicating the broker.
4. **External systems** (Temenos T24, SmartVista, Keycloak, Firebase, etc.) are rendered when a service calls them directly.
5. **Keycloak** is omitted from edges — nearly every service uses it; showing it would clutter the diagram. It is assumed as a universal dependency.
6. **Edge types:**
   - `A ==> B` — Synchronous REST / gRPC / Feign call
   - `A --> B` — Connection to external system (thin solid)
   - `A -.->|label| B` — Async messaging between services (dashed, with broker label)
7. **When to add a new edge:** Only after confirming the dependency exists in source code (Feign client, HTTP client, queue listener/publisher, gRPC stub).
8. **When to add a new service node:** Only when the service has its own repo under `~/code/banking/` and a `.ai/service-description.md`.

### Available subgraphs / classDef

- IBANK_FE / IBANK_BE → `ibank`
- PLATFORM → `platform`
- CBS / CBS_SV → `cbs`
- TEMENOS → `temenos`
- PAY_CONN / PAY_INFRA → `pay`
- AML → `aml`
- FX → `fx`
- CRYPTO → `crypto`
- BAAS / BRIDGE → `baas`
- MFA_GRP → `ibank`
- EXT → `ext`

## Step 6: Update MEMORY

Update the Banking Platform Service Index memory entry:
- Add new service to the correct category with a one-liner
- Update queue topology if new queues were added

## Step 7: Verify

1. `.ai/service-description.md` exists and is accurate for all affected repos
2. `service-index.md` has the new/updated entry
3. `service-dependencies.md` diagram has the new node and connections
4. MEMORY is updated

## Rules

- Node labels in diagram must be **exact repo names** — never shorten
- Always update **BOTH sides** of a dependency (consumer + provider)
- Derive descriptions from code (build files, configs, source) — no assumptions