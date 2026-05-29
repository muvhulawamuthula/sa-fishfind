# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Run locally (H2 in-memory DB, seeds data automatically)
export ANTHROPIC_API_KEY=sk-ant-your-key-here
mvn spring-boot:run

# Build JAR
mvn clean package

# Build skipping tests (matches CI behaviour)
mvn clean package -DskipTests

# Run tests
mvn test

# Run a single test class
mvn test -Dtest=DamServiceTest

# H2 console (local dev only)
open http://localhost:8080/h2-console
# JDBC URL: jdbc:h2:mem:fishfinddb  Username: sa  Password: (empty)
```

## Architecture

**Spring Boot 3.2 / Java 17 REST API** with two profiles:
- **Default (local)**: H2 in-memory DB, seeded from `schema.sql` + `data.sql` at startup.
- **azure**: Azure SQL Database (SQL Server dialect); activated by `SPRING_PROFILES_ACTIVE=azure`.

### Request flow

```
HTTP request
  → DamController / AiAdvisorController
  → DamService / AiAdvisorService
  → DamRepository (JPA / H2 or Azure SQL)
```

`AiAdvisorService` does not use the Anthropic SDK — it calls the Anthropic REST API directly via Spring's `WebClient` (configured in `AppConfig`). It fetches the full `DamDTO` first, builds a rich system prompt from it (species, bait shops, safety advisories), then calls `claude-sonnet-4-20250514`.

`DamService` maps `Dam` entities to `DamDTO` manually (no MapStruct). `DamDTO` contains nested `FishSpeciesDTO` and `BaitShopDTO` inner classes.

### Data model

Three tables with `fish_species` and `bait_shops` foreign-keyed to `dams`. The Haversine formula for GPS proximity search lives in a native `@Query` on `DamRepository.findDamsNearLocation`.

### Security

All `/api/v1/**` endpoints are currently public (`permitAll`). Spring Security + OAuth2 resource server are on the classpath for future Azure AD B2C integration — tighten `AppConfig.filterChain` before adding user-specific endpoints.

## Key env vars

| Variable | Where used |
|---|---|
| `ANTHROPIC_API_KEY` | Injected into `AiAdvisorService` via `@Value` |
| `SPRING_PROFILES_ACTIVE=azure` | Switches to Azure SQL (Azure App Service) |
| `AZURE_SQL_SERVER`, `AZURE_SQL_DATABASE`, `AZURE_SQL_USERNAME`, `AZURE_SQL_PASSWORD` | Azure profile datasource |
| `AZURE_STORAGE_ACCOUNT`, `AZURE_STORAGE_KEY` | Azure Blob (images — referenced in azure profile, not yet wired in code) |

## CI/CD

Push to `main` triggers `.github/workflows/deploy-azure.yml`: builds the JAR (`-DskipTests`) and deploys to Azure App Service `sa-fishfind-api` via publish profile stored in `AZURE_WEBAPP_PUBLISH_PROFILE` GitHub secret.
