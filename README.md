# SA FishFind API 🎣
### South Africa's premier Gauteng fishing guide — backend API

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
- **Java 17** + **Spring Boot 3.2**
- **Azure App Service** (hosting)
- **Azure SQL Database** (production data)
- **H2** (local development / testing)
- **Anthropic Claude API** (AI fishing advisor)
- **GitHub Actions** (CI/CD deploy pipeline)

---

## Running locally

### Prerequisites
- Java 17+
- Maven 3.8+
- An Anthropic API key

### Steps

```bash
# Clone the repo
git clone https://github.com/your-org/sa-fishfind-api.git
cd sa-fishfind-api

# Set your Anthropic API key
export ANTHROPIC_API_KEY=sk-ant-your-key-here

# Run (uses H2 in-memory DB + seeds all 5 dams automatically)
mvn spring-boot:run
```

The API will start on `http://localhost:8080`

### Test the endpoints

```bash
# Get all 5 dams
curl http://localhost:8080/api/v1/dams

# Get Hartbeespoort by name
curl http://localhost:8080/api/v1/dams/name/Hartbeespoort%20Dam

# Get dams near your GPS location (e.g. Benoni)
curl "http://localhost:8080/api/v1/dams/nearby?lat=-26.18&lng=28.32&radius=100"

# Ask the AI fishing advisor
curl -X POST http://localhost:8080/api/v1/advisor/ask \
  -H "Content-Type: application/json" \
  -d '{"damId": 1, "question": "What bait works best for bass at Rietvlei?"}'

# Browse H2 console (local dev only)
open http://localhost:8080/h2-console
```

---

## API endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/v1/dams` | All 5 dams |
| GET | `/api/v1/dams/{id}` | Dam by ID |
| GET | `/api/v1/dams/name/{name}` | Dam by name |
| GET | `/api/v1/dams/nearby?lat=&lng=&radius=` | Dams near GPS location |
| GET | `/api/v1/dams/filter/chalets` | Dams with chalets |
| GET | `/api/v1/dams/filter/camping` | Dams with camping |
| POST | `/api/v1/advisor/ask` | AI fishing advisor |

---

## Deploying to Azure

1. Create an **Azure App Service** (Java 17, Linux)
2. Create an **Azure SQL Database**
3. Set these environment variables in Azure App Service:
   - `SPRING_PROFILES_ACTIVE=azure`
   - `ANTHROPIC_API_KEY=sk-ant-...`
   - `AZURE_SQL_SERVER=your-server`
   - `AZURE_SQL_DATABASE=fishfinddb`
   - `AZURE_SQL_USERNAME=your-user`
   - `AZURE_SQL_PASSWORD=your-password`
4. Download the **Publish Profile** from Azure and add it as `AZURE_WEBAPP_PUBLISH_PROFILE` in GitHub Secrets
5. Push to `main` — GitHub Actions handles the rest

---

## Project structure
```
src/main/java/com/safishfind/
├── SaFishFindApplication.java   ← Entry point
├── controller/
│   ├── DamController.java       ← Dam REST endpoints
│   └── AiAdvisorController.java ← AI chat endpoint
├── service/
│   ├── DamService.java          ← Business logic
│   └── AiAdvisorService.java    ← Anthropic API integration
├── repository/
│   └── DamRepository.java       ← Database queries
├── model/
│   ├── Dam.java                 ← Dam entity
│   ├── FishSpecies.java         ← Species entity
│   └── BaitShop.java            ← Bait shop entity
├── dto/
│   ├── DamDTO.java              ← API response object
│   ├── AiChatRequest.java       ← AI request
│   └── AiChatResponse.java      ← AI response
└── config/
    └── AppConfig.java           ← Security + WebClient config
```

---

## Next steps
- **Step 2**: React Native + React Web frontend (Expo)
- **Step 3**: User accounts + favourite dams
- **Step 4**: Fishing log / catch journal
- **Step 5**: Community catches + photos
