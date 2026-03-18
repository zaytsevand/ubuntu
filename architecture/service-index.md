# Banking Platform — Service Index

> Centralized index of all services in the banking platform. Each service has a `.ai/service-description.md` file in its repository for AI agent discovery.

## BaaS Platform (`baas/`)

| Repository | Service | Description |
|------------|---------|-------------|
| [api-gateway](https://gitlab.cardpay-test.com/baas/api-gateway) | BaaS API Gateway | Central API gateway — orchestrates customer onboarding, card issuing, accounts, payments (SmartVista, Temenos, Salesforce, SumSub) |
| [commons](https://gitlab.cardpay-test.com/baas/commons) | BaaS Commons | Shared domain library (domain-commons) — DTOs, domain objects, utilities |
| [smartvista-oob-service](https://gitlab.cardpay-test.com/baas/smartvista-oob-service) | SmartVista OOB Service | 3D Secure Out-of-Band authentication — bridges SmartVista ACS with mobile app |
| [webhook-service](https://gitlab.cardpay-test.com/baas/webhook-service) | BaaS Webhook Service | Event dispatch to partners — HTTP callbacks, email (SES), Slack |
| [cicd](https://gitlab.cardpay-test.com/baas/cicd) | BaaS CI/CD | Shared GitLab CI pipelines, Dockerfiles, build scripts |

## Core Banking System (`banking/`)

### CBS Core

| Repository | Service | Description |
|------------|---------|-------------|
| [cbs](https://gitlab.cardpay-test.com/banking/cbs) | CBS | Main backoffice monolith — operations, accounts, customers, documents, messaging |
| [cbs-executor](https://gitlab.cardpay-test.com/banking/cbs-executor) | CBS Executor | Operation execution engine — payments, AML, SmartVista, Temenos (14 modules) |
| [cbs-api-gateway](https://gitlab.cardpay-test.com/banking/cbs-api-gateway) | CBS API Gateway | Spring Cloud Gateway — HTTP-to-AMQP bridging for CBS operations |
| [cbs-permissions](https://gitlab.cardpay-test.com/banking/cbs-permissions) | CBS Permissions | RBAC permission management for CBS operations |
| [cbs-rate-plans](https://gitlab.cardpay-test.com/banking/cbs-rate-plans) | CBS Rate Plans | Fee/commission rate plans and pricing rules |
| [cbs-scheduler](https://gitlab.cardpay-test.com/banking/cbs-scheduler) | CBS Scheduler | Scheduled job execution (EOD, reconciliation, reporting) |
| [cbs-reports](https://gitlab.cardpay-test.com/banking/cbs-reports) | CBS Reports | Financial/regulatory report generation (async via RabbitMQ) |
| [cbs-operation-logs](https://gitlab.cardpay-test.com/banking/cbs-operation-logs) | CBS Operation Logs | Operation audit event consumer (RabbitMQ → Oracle) |
| [cbs-exchange-router](https://gitlab.cardpay-test.com/banking/cbs-exchange-router) | CBS Exchange Router | Currency exchange operation routing |
| [cbs-ui](https://gitlab.cardpay-test.com/banking/cbs-ui) | CBS UI | Backoffice web interface (AngularJS/Grunt) |

### CBS SmartVista Integration

| Repository | Service | Description |
|------------|---------|-------------|
| [cbs-sv-apigate](https://gitlab.cardpay-test.com/banking/cbs-sv-apigate) | CBS SV API Gate | Consumes SmartVista card events from `cbsSvApiGate` RabbitMQ queue |
| [cbs-sv-integrator](https://gitlab.cardpay-test.com/banking/cbs-sv-integrator) | CBS SV Integrator | Bidirectional CBS↔SmartVista sync via `svOperationExecutor` queue |

### CBS Shared Libraries

| Repository | Service | Description |
|------------|---------|-------------|
| [executor-toolset](https://gitlab.cardpay-test.com/banking/executor-toolset) | Executor Toolset | Operation executor framework, test utilities, security, tracing, protobuf |
| [cbs-toolset](https://gitlab.cardpay-test.com/banking/cbs-toolset) | CBS Toolset | CBS protobuf definitions |

## Temenos Integration (`banking/`)

### Temenos Core

| Repository | Service | Description |
|------------|---------|-------------|
| [temenos-gateway-api](https://gitlab.cardpay-test.com/banking/temenos-gateway-api) | Temenos Gateway API | T24 gateway — accounts, companies, transactions, exchange rates |
| [temenos-events-service](https://gitlab.cardpay-test.com/banking/temenos-events-service) | Temenos Events Service | ActiveMQ→SNS bridge — T24 XML events to AWS SNS topics |

### Payment Connectors (Temenos)

| Repository | Service | Description |
|------------|---------|-------------|
| [temenos-sepa-connector](https://gitlab.cardpay-test.com/banking/temenos-sepa-connector) | Temenos SEPA Connector | T24 ↔ SEPA Credit Transfers / Direct Debits |
| [temenos-swift-connector](https://gitlab.cardpay-test.com/banking/temenos-swift-connector) | Temenos SWIFT Connector | T24 ↔ SWIFT MT/MX messages |
| [temenos-si-connector](https://gitlab.cardpay-test.com/banking/temenos-si-connector) | Temenos SEPA Instant Connector | T24 ↔ SEPA Instant (SCT Inst) |
| [temenos-target-connector](https://gitlab.cardpay-test.com/banking/temenos-target-connector) | Temenos TARGET Connector | T24 ↔ TARGET2/T2 RTGS |
| [temenos-fps-connector](https://gitlab.cardpay-test.com/banking/temenos-fps-connector) | Temenos FPS Connector | T24 ↔ UK Faster Payments |

### Payment Infrastructure

| Repository | Service | Description |
|------------|---------|-------------|
| [cbs-ips](https://gitlab.cardpay-test.com/banking/cbs-ips) | CBS IPS | International Payment Services — SWIFT/SEPA/TARGET2 agents (legacy CBS path) |
| [sepa-instant](https://gitlab.cardpay-test.com/banking/sepa-instant) | SEPA Instant | SCT Inst processing engine — CloudHSM signing |
| [sepa-instant-cbs-temenos-router](https://gitlab.cardpay-test.com/banking/sepa-instant-cbs-temenos-router) | SEPA Instant Router | Routes SEPA Instant between CBS and Temenos paths |

## Internet Banking — iBank (`banking/`)

### iBank Backend

| Repository | Service | Description |
|------------|---------|-------------|
| [ibank-backend](https://gitlab.cardpay-test.com/banking/ibank-backend) | iBank Backend | Core BFF — drafts, payments, beneficiaries, templates, helpdesk, Open API |
| [ibank-auth-api](https://gitlab.cardpay-test.com/banking/ibank-auth-api) | iBank Auth API | Authentication/MFA service |
| [ibank-notification](https://gitlab.cardpay-test.com/banking/ibank-notification) | iBank Notification | Push (FCM), email notifications |
| [ibank-onboarding-api](https://gitlab.cardpay-test.com/banking/ibank-onboarding-api) | iBank Onboarding API | Customer onboarding, KYC flows |
| [ibank-open-api](https://gitlab.cardpay-test.com/banking/ibank-open-api) | iBank Open API | PSD2-compliant Open Banking (AIS/PIS) |
| [ibank-solr](https://gitlab.cardpay-test.com/banking/ibank-solr) | iBank Solr | Custom Solr Docker image for transaction/helpdesk search |
| [mobile-gateway-api](https://gitlab.cardpay-test.com/banking/mobile-gateway-api) | Mobile Gateway API | Mobile BFF for iOS/Android apps |
| [bff-auth-api](https://gitlab.cardpay-test.com/banking/bff-auth-api) | BFF Auth API | Authentication BFF for frontends |
| [browser-extension-gateway](https://gitlab.cardpay-test.com/banking/browser-extension-gateway) | Browser Extension Gateway | Backend for Unlimit browser extension |
| [chat-api](https://gitlab.cardpay-test.com/banking/chat-api) | Chat API | Real-time chat backend (Go) |

### iBank Frontend

| Repository | Service | Description |
|------------|---------|-------------|
| [unlimint-ui](https://gitlab.cardpay-test.com/banking/unlimint-ui) | Unlimint UI | Angular web frontend for iBank |
| [unac-frontend-shared](https://gitlab.cardpay-test.com/banking/unac-frontend-shared) | UNAC Frontend Shared | Shared Angular UI component library (unac-ui-kit) |
| [ibank-ui-auth-api](https://gitlab.cardpay-test.com/banking/ibank-ui-auth-api) | iBank UI Auth API | Angular auth UI library |

## AML / Compliance (`banking/`)

| Repository | Service | Description |
|------------|---------|-------------|
| [aml-screening](https://gitlab.cardpay-test.com/banking/aml-screening) | AML Screening | Sanctions/PEP screening — real-time and batch |
| [aml-blacklist-index](https://gitlab.cardpay-test.com/banking/aml-blacklist-index) | AML Blacklist Index | Sanctions list ingestion and indexing (EU, UN, UK OFSI, OFAC) |
| [aml-payment](https://gitlab.cardpay-test.com/banking/aml-payment) | AML Payment | Payment hold/release/reject based on AML screening |
| [aml-ui](https://gitlab.cardpay-test.com/banking/aml-ui) | AML UI | Compliance officer web interface |
| [cbs-de-aml](https://gitlab.cardpay-test.com/banking/cbs-de-aml) | CBS DE AML | Germany-specific AML (BaFin reporting) |

## FX / Treasury (`banking/`)

| Repository | Service | Description |
|------------|---------|-------------|
| [fx-router](https://gitlab.cardpay-test.com/banking/fx-router) | FX Router | FX operation routing + RabbitMQ event publishing |
| [fx-sucden-connector](https://gitlab.cardpay-test.com/banking/fx-sucden-connector) | FX Sucden Connector | Sucden currency market adapter |
| [auto-fx-ui](https://gitlab.cardpay-test.com/banking/auto-fx-ui) | Auto FX UI | FX operations web interface |

## Crypto (`banking/`)

| Repository | Service | Description |
|------------|---------|-------------|
| [crypto-api](https://gitlab.cardpay-test.com/banking/crypto-api) | Crypto API | Wallet management, balances, blockchain operations |
| [crypto-accounting](https://gitlab.cardpay-test.com/banking/crypto-accounting) | Crypto Accounting | Crypto ledger, double-entry accounting |
| [crypto-buysell-api](https://gitlab.cardpay-test.com/banking/crypto-buysell-api) | Crypto Buy-Sell API | Fiat↔crypto exchange (Go) |
| [buysell-backoffice](https://gitlab.cardpay-test.com/banking/buysell-backoffice) | BuySell Backoffice | Crypto operations backoffice (Angular) |

## Platform Services (`banking/`)

| Repository | Service | Description |
|------------|---------|-------------|
| [dictionaries-api](https://gitlab.cardpay-test.com/banking/dictionaries-api) | Dictionaries API | Reference data — countries, currencies, banks, rates, IBAN validation |
| [transactions-api](https://gitlab.cardpay-test.com/banking/transactions-api) | Transactions API | Transaction search/history — aggregates CBS, Solr, cards |
| [reports-api](https://gitlab.cardpay-test.com/banking/reports-api) | Reports API | Client statement/report generation (JasperReports) |
| [limits-api](https://gitlab.cardpay-test.com/banking/limits-api) | Limits API | Transaction limits validation (RHA) |
| [user-management-api](https://gitlab.cardpay-test.com/banking/user-management-api) | User Management API | User profiles, roles, Keycloak sync |
| [cards-api](https://gitlab.cardpay-test.com/banking/cards-api) | Cards API | Card operations and status management |
| [payee-confirmation-api](https://gitlab.cardpay-test.com/banking/payee-confirmation-api) | Payee Confirmation API | UK CoP verification (ObConnect) |
| [cbs-ibank-notifier](https://gitlab.cardpay-test.com/banking/cbs-ibank-notifier) | CBS iBank Notifier | T24 transaction sync → RabbitMQ → transactions-api |
| [stable-scheduler](https://gitlab.cardpay-test.com/banking/stable-scheduler) | Stable Scheduler | Platform job scheduler |
| [service-map](https://gitlab.cardpay-test.com/banking/service-map) | Service Map | Architecture visualization tool |

## Security / MFA (`banking/`)

| Repository | Service | Description |
|------------|---------|-------------|
| [futurae-proxy](https://gitlab.cardpay-test.com/banking/futurae-proxy) | Futurae Proxy | Futurae MFA integration proxy |

## Integration Bridges (`banking/`)

| Repository | Service | Description |
|------------|---------|-------------|
| [baas-integration-api](https://gitlab.cardpay-test.com/banking/baas-integration-api) | BaaS Integration API | CBS↔BaaS bridge + client library |
| [baas-gateway-api](https://gitlab.cardpay-test.com/banking/baas-gateway-api) | BaaS Gateway API | Legacy BaaS gateway for banking services |

## B2B Cards Platform (`b2bcards/`)

### B2B Cards Backend

| Repository | Service | Description |
|------------|---------|-------------|
| [app](https://gitlab.cardpay-test.com/b2bcards/backend/app) | B2B Partner API | Core partner API — card issuance, customer management, accounts, webhooks, reporting (PHP/Laravel) |
| [issuing-api](https://gitlab.cardpay-test.com/b2bcards/backend/issuing-api) | B2B Issuing API | Card issuance & lifecycle management — SmartVista SOAP/OCI8 integration |
| [dashboard-api](https://gitlab.cardpay-test.com/b2bcards/backend/dashboard-api) | B2B Dashboard API | Admin dashboard backend — partner management, KYC, task management |
| [webhooks-api](https://gitlab.cardpay-test.com/b2bcards/backend/webhooks-api) | B2B Webhooks API | Webhook event listener/handler for external system callbacks |
| [cards-worker](https://gitlab.cardpay-test.com/b2bcards/backend/cards-worker) | B2B Cards Worker | Background jobs — card pool sync, expiration checks, failed issuance retries |
| [cbs-worker](https://gitlab.cardpay-test.com/b2bcards/backend/cbs-worker) | B2B CBS Worker | CBS sync worker — account updates and banking operations via RabbitMQ |
| [iframes-api](https://gitlab.cardpay-test.com/b2bcards/backend/iframes-api) | B2B IFrames API | Embedded iframe backend — card operations for partner-facing UI |
| [iframes](https://gitlab.cardpay-test.com/b2bcards/backend/iframes) | B2B IFrames | Iframe view rendering — Laravel app serving embedded partner portal |
| [sv-socket](https://gitlab.cardpay-test.com/b2bcards/backend/sv-socket) | B2B SV Socket | SmartVista real-time socket server — ISO8583 message handling (OpenSwoole) |
| [transaction-acs-api](https://gitlab.cardpay-test.com/b2bcards/backend/transaction-acs-api) | B2B Transaction ACS API | 3D Secure authentication for card transactions |
| [rabbitmq-bridge-listener](https://gitlab.cardpay-test.com/b2bcards/backend/rabbitmq-bridge-listener) | B2B RabbitMQ Bridge | Cross-service event bridging — consumes and redistributes RabbitMQ messages |
| [entity-history-manager](https://gitlab.cardpay-test.com/b2bcards/backend/entity-history-manager) | B2B Entity History | Entity audit trail and version tracking (placeholder) |
| [metrics-exporter](https://gitlab.cardpay-test.com/b2bcards/backend/metrics-exporter) | B2B Metrics Exporter | Application metrics export to Prometheus (placeholder) |
| [database](https://gitlab.cardpay-test.com/b2bcards/backend/database) | B2B Database | Shared database package — models, migrations, seeders for all B2B services |
| [dumps-invoices](https://gitlab.cardpay-test.com/b2bcards/backend/dumps-invoices) | B2B Dumps Invoices | Invoice report generation from transaction CSV data |
| [dumps-reconcilation](https://gitlab.cardpay-test.com/b2bcards/backend/dumps-reconcilation) | B2B Dumps Reconciliation | Transaction reconciliation — BaaS vs SmartVista matching (PHP CLI) |

### B2B Cards Frontend

| Repository | Service | Description |
|------------|---------|-------------|
| [dashboard](https://gitlab.cardpay-test.com/b2bcards/frontend/dashboard) | B2B Dashboard UI | Admin dashboard — Vue.js 2 / Vuetify (partners, cards, transactions, webhooks) |
| [front](https://gitlab.cardpay-test.com/b2bcards/frontend/front) | B2B Customer UI | Customer-facing iframe app — Nuxt.js 2 / Vuetify (card management) |

### B2B Cards Shared Libraries

| Repository | Service | Description |
|------------|---------|-------------|
| [core](https://gitlab.cardpay-test.com/b2bcards/backend/packages/core) | B2B Core | Core domain library — models, services, enums, CBS/KYC/Salesforce integrations (v1.33) |
| [dictionaries](https://gitlab.cardpay-test.com/b2bcards/backend/packages/dictionaries) | B2B Dictionaries | Shared enums — currencies, card statuses, gender, document types |

### B2B Cards Emulators

| Repository | Service | Description |
|------------|---------|-------------|
| [smart-vista](https://gitlab.cardpay-test.com/b2bcards/backend/emulators/smart-vista) | B2B SV Emulator | SmartVista emulator — card issuing, transactions, CBS interaction |
| [cbs](https://gitlab.cardpay-test.com/b2bcards/backend/emulators/cbs) | B2B CBS Emulator | Core Banking System emulator — accounts, transactions, balances |
| [kyc](https://gitlab.cardpay-test.com/b2bcards/backend/emulators/kyc) | B2B KYC Emulator | SumSub KYC verification emulator (MongoDB) |
| [sales-force](https://gitlab.cardpay-test.com/b2bcards/backend/emulators/sales-force) | B2B Salesforce Emulator | Salesforce CRM emulator — customer and sales data |
| [sms-gate](https://gitlab.cardpay-test.com/b2bcards/backend/emulators/sms-gate) | B2B SMS Gate Emulator | SMS gateway emulator — OTP delivery simulation |

### B2B Cards Infrastructure

| Repository | Service | Description |
|------------|---------|-------------|
| [application](https://gitlab.cardpay-test.com/b2bcards/application) | B2B Application | Docker Compose orchestration — version manifests for all microservices |
| [cicd](https://gitlab.cardpay-test.com/b2bcards/cicd) | B2B CI/CD | GitLab CI pipelines, Docker build configs, multi-environment deployment |
| [data-analysis](https://gitlab.cardpay-test.com/b2bcards/data-analysis) | B2B Data Analysis | SQL query repository — MongoDB and PostgreSQL analysis queries |
| [diagrams](https://gitlab.cardpay-test.com/b2bcards/analysis/diagrams) | B2B Diagrams | Architecture diagrams — PlantUML process flows and system design |
| [mongo-gui](https://gitlab.cardpay-test.com/b2bcards/services/mongo-gui) | B2B Mongo GUI | Web-based MongoDB admin UI (Node.js/Express) |
