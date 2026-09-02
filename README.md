# SA FishFind API

Backend REST API for a South African freshwater fishing guide focused on Gauteng and nearby highveld dams. It serves dam metadata (fees, safety, GPS), species/bait/rig guidance, nearby bait shops, resorts, Haversine proximity search, and a Claude-powered fishing advisor.

**Companion frontend:** [muvhulawamuthula/fishfind-app](https://github.com/muvhulawamuthula/fishfind-app) (React Native + web). This repo also ships a small static explorer at `/` (`src/main/resources/static/index.html`).

---

## Scope (what the seed data actually covers)

Local startup loads **`schema.sql` + `data.sql`**. The seed currently includes **10 dams** (not five):

| # | Dam | Region (as seeded) |
|---|-----|--------------------|
| 1 | Rietvlei Dam | Gauteng East — Pretoria |
| 2 | Hartbeespoort Dam | Gauteng North-West |
| 3 | Roodekopjes Dam | Gauteng North-West — Brits |
| 4 | Vaal Dam | Gauteng South — Vaal Triangle |
| 5 | Bronkhorstspruit Dam | Gauteng East — Ekurhuleni |
| 6 | Klipvoor Dam | North West — Koster |
| 7 | Loskop Dam | Mpumalanga — Groblersdal |
| 8 | Buffelspoort Dam | North West — Magaliesberg |
| 9 | Rust de Winter Dam | Limpopo — North of Pretoria |
| 10 | Witbank Dam | Mpumalanga — eMalahleni |

Each dam is seeded with fish species (bait / rig / technique), bait shops, and resorts where applicable. Older marketing copy that said “5 dams only” is outdated relative to `data.sql`.

**Explicitly out of scope today:** user accounts, favourites, catch logs, auth-gated APIs, image upload pipelines, and a full nationwide dam catalogue.

---

## Tech stack

| Layer | Choice |
|-------|--------|
| Language / runtime | Java 17 |
| Framework | Spring Boot **3.2.5** |
| Persistence | Spring Data JPA |
| Local DB | H2 in-memory (`jdbc:h2:mem:fishfinddb`), SQL init always on |
| Prod DB | Azure SQL (SQL Server) via `azure` profile |
| HTTP client (AI) | Spring WebFlux `WebClient` → Anthropic Messages API |
| AI model (code) | `claude-opus-4-8` in `AiAdvisorService` |
| Security | Spring Security + OAuth2 resource-server on classpath; **all `/api/v1/**` currently `permitAll`** |
| Build | Maven (`pom.xml`) |
| Hosting / CI | Azure App Service `sa-fishfind-api`; GitHub Actions on `main` |

---

## Quick start

**Prerequisites:** JDK 17+, Maven 3.8+. Anthropic API key required only for the advisor endpoint.

```bash
git clone https://github.com/muvhulawamuthula/sa-fishfind.git
cd sa-fishfind
export ANTHROPIC_API_KEY=sk-ant-...   # optional for dam GETs; required for /advisor/ask
mvn spring-boot:run
```

- API base: `http://localhost:8080`
- Static UI: `http://localhost:8080/`
- H2 console (local only): `http://localhost:8080/h2-console`  
  JDBC URL `jdbc:h2:mem:fishfinddb` · user `sa` · password empty

```bash
mvn clean package          # build
mvn test                   # tests (none committed yet; CI uses -DskipTests)
mvn clean package -DskipTests   # matches deploy workflow
```

---

## API at a glance

| Method | Path | Notes |
|--------|------|--------|
| `GET` | `/api/v1/dams` | All dams + nested species, bait shops, resorts |
| `GET` | `/api/v1/dams/{id}` | `404` if missing |
| `GET` | `/api/v1/dams/name/{name}` | Case-insensitive name match |
| `GET` | `/api/v1/dams/nearby?lat=&lng=&radius=` | Haversine km radius (default **100**) |
| `GET` | `/api/v1/dams/filter/chalets` | `chaletsAvailable = true` |
| `GET` | `/api/v1/dams/filter/camping` | `campingAvailable = true` |
| `POST` | `/api/v1/advisor/ask` | Body: `{ "damId", "question" }` |

CORS is currently `@CrossOrigin(origins = "*")` on both controllers — tighten before a public production hardening pass.

Full request/response shapes: **[docs/api.md](docs/api.md)**  
Layering, data model, security, deploy: **[docs/architecture.md](docs/architecture.md)**

### Smoke tests

```bash
curl -s http://localhost:8080/api/v1/dams | head
curl -s "http://localhost:8080/api/v1/dams/nearby?lat=-26.18&lng=28.32&radius=100"
curl -s -X POST http://localhost:8080/api/v1/advisor/ask \
  -H "Content-Type: application/json" \
  -d '{"damId":2,"question":"Best rig for sharptooth catfish at Hartbeespoort?"}'
```

---

## Project layout

```
src/main/java/com/safishfind/
├── SaFishFindApplication.java
├── config/AppConfig.java           # SecurityFilterChain + WebClient bean
├── controller/
│   ├── DamController.java          # /api/v1/dams/**
│   └── AiAdvisorController.java    # /api/v1/advisor/**
├── service/
│   ├── DamService.java             # queries + manual entity→DTO mapping
│   └── AiAdvisorService.java       # dam context → Anthropic Messages API
├── repository/DamRepository.java   # JPA + native Haversine query
├── model/                          # Dam, FishSpecies, BaitShop, Resort
└── dto/                            # DamDTO (+ nested), AiChatRequest/Response
src/main/resources/
├── application.properties          # default (H2) profile
├── application-azure.properties    # azure profile
├── schema.sql / data.sql           # local schema + seed
└── static/index.html               # lightweight dam browser
.github/workflows/deploy-azure.yml
```

`DamRepository.findByRegionIgnoreCase` exists but is **not** exposed by a controller endpoint yet.

---

## Configuration

| Variable | Used when | Purpose |
|----------|-----------|---------|
| `ANTHROPIC_API_KEY` | Always (advisor) | Anthropic `x-api-key` |
| `SPRING_PROFILES_ACTIVE=azure` | Prod | Switch datasource to Azure SQL |
| `AZURE_SQL_SERVER` | `azure` | Server hostname prefix (before `.database.windows.net`) |
| `AZURE_SQL_DATABASE` | `azure` | Database name |
| `AZURE_SQL_USERNAME` / `AZURE_SQL_PASSWORD` | `azure` | SQL auth |
| `AZURE_STORAGE_ACCOUNT` / `AZURE_STORAGE_KEY` | `azure` props only | Declared for blob images — **not wired in application code yet** |

Local defaults live in `application.properties` (`ddl-auto=none`, SQL init always). Azure profile uses `ddl-auto=validate` and disables the H2 console.

---

## Deploy (Azure)

Workflow: `.github/workflows/deploy-azure.yml` on push to `main` (and `workflow_dispatch`).

1. Builds with Temurin 17: `mvn clean package -DskipTests`
2. If `AZURE_CLIENT_ID` (and related OIDC secrets) are set, logs into Azure via federated credentials and deploys the JAR to App Service **`sa-fishfind-api`** (production slot)
3. If those secrets are absent, the job still builds; cloud deploy steps are skipped

Set App Service env vars for the `azure` profile (`SPRING_PROFILES_ACTIVE`, SQL + Anthropic keys) before expecting a live API against Azure SQL.

---

## Honest status / roadmap

| Area | Status |
|------|--------|
| Dam catalogue API + seed (10 dams) | Done |
| GPS nearby search (Haversine) | Done |
| AI advisor with dam-grounded prompts | Done (needs API key; fails soft on Anthropic errors) |
| Static HTML explorer | Done |
| React Native / web client (separate repo) | Done (external) |
| Automated tests | Not present in tree; CI skips tests |
| Auth / user accounts / favourites | Not implemented (`anyRequest().authenticated()` reserved for future) |
| Azure Blob image pipeline | Config placeholders only |
| National / complete SA coverage | Not claimed — seed is Gauteng-centric plus selected nearby dams |

---

## License / ownership

Private project under [muvhulawamuthula](https://github.com/muvhulawamuthula). Fee and safety data in seed files are illustrative guide content — verify on-site before travel.
