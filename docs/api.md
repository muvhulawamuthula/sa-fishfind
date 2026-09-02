# API reference

Base URL (local): `http://localhost:8080`  
API prefix: `/api/v1`  
Content type: `application/json`

All dam and advisor routes below are **public** (`permitAll`) as of `AppConfig`. Controllers set `@CrossOrigin(origins = "*")`.

Seeded catalogue size: **10 dams** (see README / `data.sql`). IDs below assume insert order on a fresh H2 boot (1 = Rietvlei … 10 = Witbank).

---

## Dams

### `GET /api/v1/dams`

Returns every dam with nested collections.

**Response:** `200 OK` — `DamDTO[]`

```bash
curl -s http://localhost:8080/api/v1/dams
```

### `GET /api/v1/dams/{id}`

**Path:** `id` — dam primary key  

**Response:** `200 OK` — `DamDTO` · `404 Not Found` if absent

```bash
curl -s http://localhost:8080/api/v1/dams/1
```

### `GET /api/v1/dams/name/{name}`

Case-insensitive exact name match (`findByNameIgnoreCase`).

**Examples:** `Rietvlei Dam`, `Hartbeespoort Dam`

**Response:** `200` / `404`

```bash
curl -s http://localhost:8080/api/v1/dams/name/Rietvlei%20Dam
```

### `GET /api/v1/dams/nearby`

GPS proximity search (Haversine, km).

| Query param | Required | Default | Description |
|-------------|----------|---------|-------------|
| `lat` | yes | — | Latitude |
| `lng` | yes | — | Longitude |
| `radius` | no | `100` | Radius in kilometres |

**Response:** `200 OK` — `DamDTO[]` sorted nearest-first

```bash
curl -s "http://localhost:8080/api/v1/dams/nearby?lat=-26.18&lng=28.32&radius=100"
```

### `GET /api/v1/dams/filter/chalets`

Dams where `chaletsAvailable` is true.

### `GET /api/v1/dams/filter/camping`

Dams where `campingAvailable` is true.

```bash
curl -s http://localhost:8080/api/v1/dams/filter/camping
```

---

## DamDTO shape

Top-level fields (from `DamDTO` / entity mapping):

| Field | Type | Notes |
|-------|------|--------|
| `id` | number | |
| `name` | string | Unique |
| `region` | string | Free-text region label from seed |
| `address` | string | |
| `latitude` / `longitude` | number | WGS84 |
| `entranceFeeAdult` / `entranceFeeChild` | number | ZAR in seed |
| `campingFeePerNight` / `chaletFeePerNight` | number | |
| `chaletsAvailable` / `campingAvailable` | boolean | |
| `description` | string | Long guide copy |
| `bestFishingTimes` | string | e.g. dawn/dusk windows |
| `activityLevel` | string | Seed uses `HIGH` / `MEDIUM` |
| `dangerAdvisory` | string | |
| `hipposPresent` / `crocodilesPresent` / `bilharziaRisk` | boolean | |
| `imageUrl` | string \| null | Often null in seed |
| `fishSpecies` | `FishSpeciesDTO[]` | |
| `nearbyBaitShops` | `BaitShopDTO[]` | |
| `resorts` | `ResortDTO[]` | |

### FishSpeciesDTO

`id`, `commonName`, `scientificName`, `bestBait`, `bestRig`, `bestTechnique`, `averageSize`, `recordSize`, `bestSeason`, `imageUrl`

### BaitShopDTO

`id`, `name`, `address`, `latitude`, `longitude`, `distanceFromDamKm`, `phoneNumber`, `openingHours`, `stockDescription`, `googleMapsUrl`

### ResortDTO

`id`, `name`, `description`, `websiteUrl`, `phoneNumber`, `accommodationTypes`, `fishingAccess`, `facilities`, `priceFrom`

Example (abbreviated):

```json
{
  "id": 1,
  "name": "Rietvlei Dam",
  "region": "Gauteng East — Pretoria",
  "latitude": -25.8754,
  "longitude": 28.3214,
  "entranceFeeAdult": 75.0,
  "chaletsAvailable": true,
  "campingAvailable": true,
  "activityLevel": "HIGH",
  "hipposPresent": false,
  "crocodilesPresent": false,
  "bilharziaRisk": false,
  "fishSpecies": [
    {
      "commonName": "Largemouth Bass",
      "bestBait": "Soft plastic worms, crankbaits, spinnerbaits",
      "bestRig": "Texas rig, drop shot"
    }
  ],
  "nearbyBaitShops": [],
  "resorts": []
}
```

---

## AI advisor

### `POST /api/v1/advisor/ask`

Grounds Claude on one dam’s DTO, then answers the angler’s question.

**Request body (`AiChatRequest`):**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `damId` | number | yes | Existing dam id |
| `question` | string | yes | Free-text question |

```json
{
  "damId": 2,
  "question": "What bait works best for bass at Hartbeespoort?"
}
```

**Response (`AiChatResponse`):** `200 OK`

| Field | Type | Description |
|-------|------|-------------|
| `answer` | string | Model text, or soft-failure message if Anthropic call fails |
| `damName` | string | Resolved dam name |
| `damId` | number | Echo of resolved id |

```bash
curl -s -X POST http://localhost:8080/api/v1/advisor/ask \
  -H "Content-Type: application/json" \
  -d '{"damId":2,"question":"Best rig for sharptooth catfish?"}'
```

**Behaviour notes:**

- Requires `ANTHROPIC_API_KEY` for a real model answer.
- Unknown `damId` currently throws (not mapped to a clean `404` response).
- Anthropic errors are logged; client still receives HTTP 200 with a temporary-unavailable style `answer`.
- Model id in source: `claude-opus-4-8` (`AiAdvisorService`).

---

## Errors / status codes (as implemented)

| Situation | Typical HTTP status |
|-----------|---------------------|
| Dam found | `200` |
| Dam id/name missing | `404` (GET by id/name only) |
| List / filter / nearby | always `200` (possibly empty list) |
| Advisor success or Anthropic soft-fail | `200` |
| Advisor unknown dam | uncaught exception → framework error response (not a curated DTO) |

There is no global `@ControllerAdvice` API error envelope in this codebase.

---

## Not exposed (but present in code)

| Capability | Location | HTTP? |
|------------|----------|-------|
| Find by region | `DamRepository.findByRegionIgnoreCase` | No controller mapping |
| Actuator health matcher | `AppConfig` permits `/actuator/health` | Actuator dependency not in `pom.xml` |

---

## Getting started checklist for API consumers

1. Boot API locally (`mvn spring-boot:run`) or point at deployed App Service.  
2. Call `GET /api/v1/dams` to discover ids and nested payloads.  
3. Use `nearby` with device GPS for distance-sorted suggestions.  
4. Call `POST /api/v1/advisor/ask` only when an Anthropic key is configured.  
5. Treat fee/safety fields as guide data — confirm on site before travel.  
