# Architecture

## Purpose

`sa-fishfind` is a read-heavy Spring Boot API that exposes fishing-spot data for a Gauteng-focused (plus nearby highveld) guide, and an optional Claude advisor that answers questions using that same structured data as context.

There is no separate BFF: mobile/web clients (and the bundled static page) call `/api/v1/**` directly.

## Runtime profiles

| Profile | Activation | Database | Schema source |
|---------|------------|----------|---------------|
| default (local) | (none) | H2 mem `fishfinddb` | `schema.sql` then `data.sql` (`spring.sql.init.mode=always`, `ddl-auto=none`) |
| `azure` | `SPRING_PROFILES_ACTIVE=azure` | Azure SQL via JDBC SQL Server URL | Expect tables already present; `ddl-auto=validate` |

H2 console is enabled only on the default profile (`/h2-console`).

## Request flow

```
Client (fishfind-app / curl / static index.html)
    │
    ▼
DamController  ──────────────►  DamService  ──►  DamRepository (JPA / native SQL)
AiAdvisorController ──► AiAdvisorService ─┬──► DamService.getDamById
                                          └──► WebClient → api.anthropic.com/v1/messages
```

- Controllers are thin: HTTP mapping + `ResponseEntity` status codes.
- `DamService` owns query orchestration and **manual** `Dam` → `DamDTO` mapping (no MapStruct). Nested collections (`fishSpecies`, `nearbyBaitShops`, `resorts`) are mapped in the same transaction (`@Transactional(readOnly = true)`).
- `AiAdvisorService` loads a full `DamDTO`, builds a system prompt from fees, species, safety flags, and bait shops, then POSTs to Anthropic. On failure it returns a graceful fallback answer rather than a 5xx (controller still returns HTTP 200 with that payload). Missing `damId` surfaces as an unchecked `RuntimeException` today.

## Package responsibilities

| Package | Role |
|---------|------|
| `config.AppConfig` | `WebClient` bean; `SecurityFilterChain` (CSRF off; public matchers for static + `/api/v1/dams/**` + `/api/v1/advisor/**` + `/actuator/health`; everything else authenticated) |
| `controller.*` | REST surface, CORS `*` |
| `service.*` | Business logic + outbound AI |
| `repository.DamRepository` | CRUD helpers + Haversine native query |
| `model.*` | JPA entities |
| `dto.*` | API contracts |

## Data model

Four tables, FK from children → `dams.id`:

```
dams 1───* fish_species
     1───* bait_shops
     1───* resorts
```

**Dam** fields include GPS (`latitude`/`longitude`), entrance/camping/chalet fees, availability flags, narrative description, best fishing times, activity level, danger advisory, and wildlife/health flags (`hipposPresent`, `crocodilesPresent`, `bilharziaRisk`).

**FishSpecies** stores common/scientific names plus bait, rig, technique, size, and season strings used both in API responses and AI prompts.

**BaitShop** / **Resort** are presentation-oriented related rows (distance, hours, maps URL; accommodation types, facilities, price bands).

Local DDL lives in `src/main/resources/schema.sql`. Seed content for **10 dams** (and related rows) lives in `data.sql`. Production Azure SQL must be provisioned/migrated separately; this repo does not ship Flyway/Liquibase.

### Proximity search

`DamRepository.findDamsNearLocation` runs a **native** Haversine query (Earth radius 6371 km), filters by `:radiusKm`, and orders ascending by distance. Default radius from the controller is **100** km when omitted.

Note: the native SQL uses H2-friendly `RADIANS`/`ACOS` functions. Behaviour on Azure SQL should be verified before relying on `/nearby` in production (dialect/function differences are a known risk for untested native queries).

## AI advisor design

- Endpoint: `POST /api/v1/advisor/ask`
- Model constant in code: `claude-opus-4-8`
- Headers: `x-api-key`, `anthropic-version: 2023-06-01`
- `max_tokens`: 1024
- System prompt is dam-specific and instructs a local SA angling tone; answers should prefer seeded facts
- No Anthropic SDK — plain JSON over `WebClient`
- Key: `anthropic.api.key` ← env `ANTHROPIC_API_KEY` (empty default locally)

## Security posture (current)

Spring Security + `spring-boot-starter-oauth2-resource-server` are dependencies, but **no JWT issuer / resource-server configuration is active**. Public fishing APIs are intentionally open. Comments in `AppConfig` call out locking down before production user features.

`/actuator/health` is permitted in the filter chain; ensure the Actuator dependency/endpoints match what you expose in each environment (starter-actuator is not listed in `pom.xml` today — the matcher is forward-looking).

## Static frontend

`src/main/resources/static/index.html` is served by Spring Boot’s default static resource handling. Security permits `/`, `/index.html`, `/static/**`, `/favicon.ico`.

## CI / CD

`.github/workflows/deploy-azure.yml`:

1. Checkout + JDK 17 (Temurin) + Maven cache  
2. `mvn clean package -DskipTests`  
3. Conditional Azure login (OIDC: `AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, `AZURE_SUBSCRIPTION_ID`)  
4. Conditional deploy of `target/*.jar` to App Service name `sa-fishfind-api`

Build always runs; deploy is skipped when Azure OIDC secrets are unset.

## Known gaps / non-goals

- No automated tests in the repository tree  
- `findByRegionIgnoreCase` unused by HTTP API  
- Azure Blob settings in `application-azure.properties` are unused by Java code  
- Image URLs on entities are mostly null in seed data  
- CORS wide open; CSRF disabled (typical for token APIs, but there is no token auth yet)  
- Advisor does not stream; uses `.block()` on the reactive client  

