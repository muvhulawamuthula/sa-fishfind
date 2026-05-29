# SA FishFind API
### South Africa's premier Gauteng fishing guide — backend API

> **Frontend:** [github.com/muvhulawamuthula/fishfind-app](https://github.com/muvhulawamuthula/fishfind-app)

---

## The 5 dams covered

| Dam | Region | Distance from JHB |
|-----|--------|-------------------|
| Rietvlei Dam | Pretoria SE | ~40 km |
| Hartbeespoort Dam | NW Gauteng | ~75 km |
| Roodekopjes Dam | Near Brits | ~90 km |
| Vaal Dam | South Gauteng | ~85 km |
| Bronkhorstspruit Dam | East Gauteng | ~65 km |

---

## Tech stack

| Layer | Technology |
|-------|-----------|
| Runtime | Java 17 + Spring Boot 3.2 |
| Database (local) | H2 in-memory — auto-seeded at startup |
| Database (prod) | Azure SQL Database |
| AI advisor | Anthropic Claude API (`claude-sonnet-4-6`) |
| Hosting | Azure App Service |
| CI/CD | GitHub Actions → Azure |

---

## Running locally

**Prerequisites:** Java 17+, Maven 3.8+, Anthropic API key

```bash
git clone https://github.com/muvhulawamuthula/sa-fishfind.git
cd sa-fishfind

export ANTHROPIC_API_KEY=sk-ant-...

# Starts on :8080 with H2 in-memory DB, all 5 dams seeded automatically
mvn spring-boot:run
```

**H2 console** (local only): `http://localhost:8080/h2-console`
JDBC URL: `jdbc:h2:mem:fishfinddb` · Username: `sa` · Password: *(empty)*

---

## API reference

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/v1/dams` | All 5 dams with full detail |
| GET | `/api/v1/dams/{id}` | Dam by ID |
| GET | `/api/v1/dams/name/{name}` | Dam by name (case-insensitive) |
| GET | `/api/v1/dams/nearby?lat=&lng=&radius=` | Dams near a GPS coordinate, sorted by distance |
| GET | `/api/v1/dams/filter/chalets` | Dams with chalets available |
| GET | `/api/v1/dams/filter/camping` | Dams with camping available |
| POST | `/api/v1/advisor/ask` | AI fishing advisor |

**Advisor request body:**
```json
{ "damId": 1, "question": "What bait works best for bass at Rietvlei?" }
```

**Quick smoke test:**
```bash
# All dams
curl http://localhost:8080/api/v1/dams

# Nearby search (Benoni coords)
curl "http://localhost:8080/api/v1/dams/nearby?lat=-26.18&lng=28.32&radius=100"

# AI advisor
curl -X POST http://localhost:8080/api/v1/advisor/ask \
  -H "Content-Type: application/json" \
  -d '{"damId": 2, "question": "Best rig for sharptooth catfish at Hartbeespoort?"}'
```

---

## Deploying to Azure

1. Create an **Azure App Service** (Java 17, Linux) and an **Azure SQL Database**
2. Set these App Service environment variables:

| Variable | Value |
|----------|-------|
| `SPRING_PROFILES_ACTIVE` | `azure` |
| `ANTHROPIC_API_KEY` | `sk-ant-...` |
| `AZURE_SQL_SERVER` | your server name (without `.database.windows.net`) |
| `AZURE_SQL_DATABASE` | `fishfinddb` |
| `AZURE_SQL_USERNAME` | your SQL username |
| `AZURE_SQL_PASSWORD` | your SQL password |

3. Download the **Publish Profile** from the App Service and add it as the `AZURE_WEBAPP_PUBLISH_PROFILE` GitHub secret
4. Push to `main` — GitHub Actions builds and deploys automatically

---

## Project structure

```
src/main/java/com/safishfind/
├── SaFishFindApplication.java
├── config/
│   └── AppConfig.java              — Security + WebClient bean
├── controller/
│   ├── DamController.java          — Dam REST endpoints
│   └── AiAdvisorController.java    — AI advisor endpoint
├── service/
│   ├── DamService.java             — Business logic + entity→DTO mapping
│   └── AiAdvisorService.java       — Anthropic API integration
├── repository/
│   └── DamRepository.java          — JPA queries incl. Haversine proximity
├── model/
│   ├── Dam.java
│   ├── FishSpecies.java
│   └── BaitShop.java
└── dto/
    ├── DamDTO.java                 — API response (with nested species + shops)
    ├── AiChatRequest.java
    └── AiChatResponse.java
```

---

## Roadmap

- [x] REST API — 5 Gauteng dams, fish species, bait shops, GPS proximity search
- [x] AI fishing advisor (Claude-powered)
- [x] React Native + Web frontend ([fishfind-app](https://github.com/muvhulawamuthula/fishfind-app))
- [ ] User accounts + favourite dams
- [ ] Fishing log / catch journal
- [ ] Community catches + photos
