# {Service Name}

> Short one-liner describing the service's purpose.

## Business Context

### Domain / Subdomain
<!-- Which business area or bounded context does this service belong to? -->

- **Domain:** {e.g., Payments, Lending, Customer Management}
- **Subdomain:** {e.g., SEPA Processing, Card Issuing, KYC}

### Responsibility
<!-- What is this service accountable for within the broader system? What problem does it solve? -->

{Describe the service's role, its boundaries, and how it fits into the overall architecture.}

## Owned Business Entities
<!-- Which domain entities does this service serve as the system of record for? Other services must go through this service to mutate these entities. -->

| Entity | Description |
|--------|-------------|
| {Entity} | {Brief description} |

## APIs Provided
<!-- APIs this service exposes for other services or external consumers. -->

| API | Protocol | Description | Consumers |
|-----|----------|-------------|-----------|
| {endpoint / topic} | {REST / gRPC / Kafka / SOAP} | {What it does} | {Known consumers} |

## APIs Consumed
<!-- External or internal APIs this service depends on. -->

| API | Provider | Protocol | Purpose |
|-----|----------|----------|---------|
| {endpoint / topic} | {Service or external system} | {REST / gRPC / Kafka / SOAP} | {Why it's needed} |

## Data Storage

| Store | Technology | Purpose |
|-------|------------|---------|
| {db name / schema} | {PostgreSQL / MongoDB / Redis / Kafka / S3 / ...} | {What data it holds} |

## Ownership

| Role | Person / Team |
|------|---------------|
| **Code Owner** | {name / team} |
| **Primary Contributor** | {name} |
| **Product Owner** | {name} |

## Related Jira Projects

| Project | Key | Purpose |
|---------|-----|---------|
| {Project name} | {e.g., MIG, PAY} | {e.g., feature work, bug tracking, ops tasks} |

## Source Code

| Repository | GitLab URL | Description |
|------------|------------|-------------|
| {repo name} | {https://gitlab.cardpay-test.com/group/repo} | {main service repo, shared library, etc.} |

## Tech Stack

- **Language / Runtime:** {e.g., Java 21, Java 11}
- **Framework:** {e.g., Spring Boot 3.2, Spring Boot 2.5}
- **Build Tool:** {e.g., Gradle 8.x, Maven}

## Infrastructure & Deployment

- **Runtime:** {e.g., Kubernetes, Docker Swarm, AWS ECS}
- **CI/CD:** GitLab CI — {brief pipeline description}
- **Environments:** {e.g., dev, design, test, preprod, production}

## Key Integrations & Dependencies

<!-- Upstream/downstream services, external vendors, third-party systems this service critically depends on or that critically depend on it. -->

- {Service / System} — {nature of dependency}

## Observability

- **Logging:** {where logs are shipped, structured format?}
- **Metrics:** {Grafana dashboard link, key metrics}
- **Alerting:** {PagerDuty / Alertmanager rules, runbook links}
- **Tracing:** {Jaeger / Zipkin, trace propagation details}

## SLAs / SLOs

| Metric | Target |
|--------|--------|
| Availability | {e.g., 99.9%} |
| Latency (p95) | {e.g., < 200ms} |
| Error rate | {e.g., < 0.1%} |

## Security & Compliance

- **Authentication:** {e.g., mTLS, OAuth2, API keys}
- **Authorization:** {e.g., RBAC, scope-based}
- **Data classification:** {e.g., PII, PCI-DSS scope}
- **Relevant regulations:** {e.g., PSD2, GDPR}

## Runbooks & Documentation

- {Link to runbook}
- {Link to ADRs or design docs}
- {Link to Confluence / wiki page}

## Open Questions / Known Limitations

- {Any tech debt, known issues, planned deprecations}
