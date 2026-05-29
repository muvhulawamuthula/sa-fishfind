
-- ================================================================
-- SA FishFind — Seed data for the 5 Gauteng dams
-- ================================================================

-- ── DAMS ─────────────────────────────────────────────────────────

INSERT INTO dams (name, region, address, latitude, longitude,
    entrance_fee_adult, entrance_fee_child,
    camping_fee_per_night, chalet_fee_per_night,
    chalets_available, camping_available,
    description, best_fishing_times, activity_level,
    danger_advisory, hippos_present, crocodiles_present, bilharzia_risk, image_url)
VALUES

-- 1. Rietvlei Nature Reserve Dam
('Rietvlei Dam', 'Gauteng East — Pretoria',
 'Rietvlei Nature Reserve, Rietvallei Rd, Wierda Park, Pretoria',
 -25.8754, 28.3214,
 185.0, 90.0, NULL, NULL,
 FALSE, FALSE,
 'Rietvlei is a pristine nature reserve dam on the south-east of Pretoria. Managed by Tshwane Municipality, it is one of the best-maintained fishing spots in Gauteng with clear water and abundant bass. A valid fishing permit (purchased at the gate) is required. No night fishing permitted. Game viewing while you fish is a bonus — expect zebra, wildebeest, and rhino on the banks.',
 '05:30–08:30, 16:00–18:30',
 'HIGH',
 'No crocodiles or hippos. Bilharzia-free — water is safe. Avoid contact with water to prevent minor skin irritations. Be aware of wildlife on the banks — maintain a safe distance from rhino and buffalo.',
 FALSE, FALSE, FALSE,
 NULL),

-- 2. Hartbeespoort Dam
('Hartbeespoort Dam', 'Gauteng North-West',
 'Hartbeespoort Dam, R512, Hartbeespoort, North West Province',
 -25.7396, 27.8754,
 50.0, 25.0, 180.0, 650.0,
 TRUE, TRUE,
 'Harties is the most iconic fishing destination near Gauteng, sitting in the Magalies mountains about 75km from Johannesburg. The dam suffers from hyacinth weed but carp and catfish thrive here. Numerous resorts and camping sites line the banks. Boat fishing is popular. A permit is required and available at municipal offices or resorts. Warning: algae blooms occur in summer — check conditions before going.',
 '05:00–08:00, 17:00–19:30',
 'HIGH',
 'No crocodiles recorded. Hippo sightings are extremely rare but possible in remote northern coves. Main risk is strong boat traffic — stay visible. Bilharzia possible in stagnant shallows — avoid wading. Blue-green algae blooms in summer can be toxic to pets.',
 FALSE, FALSE, TRUE,
 NULL),

-- 3. Roodekopjes Dam
('Roodekopjes Dam', 'Gauteng North-West — Brits',
 'Roodekopjes Dam, near Brits, North West Province',
 -25.6122, 27.7983,
 60.0, 30.0, 150.0, 500.0,
 TRUE, TRUE,
 'Roodekopjes is a hidden gem in the Crocodile River catchment area near Brits, about 90km from Johannesburg. Less crowded than Harties, it offers excellent carp and yellowfish fishing. The rocky banks and clear water make it a favourite for fly fishermen targeting yellowfish. Camping facilities are basic but scenic. A Nature Conservation permit is required.',
 '05:00–08:30, 16:30–19:00',
 'MEDIUM',
 'Low wildlife risk on the main fishing areas. Crocodiles are present further upstream in the Crocodile River system — stay on established bank areas and do not fish in isolated coves after dark. Bilharzia risk is low but present — avoid contact with slow-moving water near reeds.',
 FALSE, TRUE, TRUE,
 NULL),

-- 4. Vaal Dam
('Vaal Dam', 'Gauteng South — Vaal Triangle',
 'Vaal Dam, R59, Vaal Marina, Gauteng / Free State border',
 -26.8721, 28.1354,
 80.0, 40.0, 200.0, 800.0,
 TRUE, TRUE,
 'The Vaal Dam is the largest freshwater dam in Gauteng and arguably the best bass fishing destination in South Africa. Stretching across the Gauteng/Free State border, it offers over 500km of shoreline. Vaal Marina is the central hub with resorts, boat launches, and camping. Yellowfish, carp, and largemouth bass are all trophy-sized here. The Vaal River below the dam wall is world-class for largemouth yellowfish on fly.',
 '04:30–08:00, 17:00–20:00',
 'HIGH',
 'No crocodiles in the main dam. Hippos are occasionally reported near Grootvaly and isolated northern arms — exercise caution after dark. Bilharzia risk is MODERATE in the upper reaches and Vaal River — do not wade or swim. Water quality varies seasonally — check Rand Water advisories before consuming local fish.',
 TRUE, FALSE, TRUE,
 NULL),

-- 5. Bronkhorstspruit Dam
('Bronkhorstspruit Dam', 'Gauteng East — Ekurhuleni',
 'Bronkhorstspruit Dam, Bronkhorstspruit Nature Reserve, R25, Gauteng',
 -25.7842, 28.7431,
 45.0, 20.0, 120.0, 450.0,
 TRUE, TRUE,
 'Bronkhorstspruit is Gauteng''s best-kept secret — a large, relatively uncrowded dam 65km east of Johannesburg on the R25. The clear water and rocky structure make it a world-class bass fishery. Tournament bass anglers rate it among the top 5 dams in SA. Yellowfish and carp are also abundant. The adjacent nature reserve makes it a scenic getaway. Facilities are comfortable — camping, chalets, and a boat launch are all available.',
 '05:00–08:30, 16:30–19:00',
 'MEDIUM',
 'No crocodiles or hippos — one of the safest dams in Gauteng. Bilharzia risk is low. Baboons are present in the nature reserve — secure food and do not leave tackle unattended. Occasional boomslang and puff adder sightings on rocky banks — watch where you step.',
 FALSE, FALSE, FALSE,
 NULL);

-- ================================================================
-- FISH SPECIES (linked to dam IDs 1–5 in insert order)
-- ================================================================

-- Rietvlei (dam_id = 1)
INSERT INTO fish_species (dam_id, common_name, scientific_name, best_bait, best_rig, best_technique, average_size, record_size, best_season)
VALUES
(1, 'Largemouth Bass', 'Micropterus salmoides', 'Soft plastic worms, crankbaits, spinnerbaits', 'Texas rig, drop shot', 'Lure fishing — cast to structure and reed edges', '1–2.5 kg', '4.2 kg', 'Year-round, peaks in spring (Aug–Oct)'),
(1, 'Smallmouth Bass', 'Micropterus dolomieu', 'Small jigs, finesse worms, tube baits', 'Drop shot, ned rig', 'Finesse fishing around rocky points', '0.5–1.2 kg', '2.1 kg', 'Year-round'),
(1, 'Common Carp', 'Cyprinus carpio', 'Maize, bread, boilies, worms', 'Hair rig, running lead', 'Bottom fishing with PVA bag', '3–8 kg', '15 kg', 'Year-round, peaks autumn–winter'),
(1, 'Tilapia (Bream)', 'Oreochromis mossambicus', 'Maize, bread, earthworms', 'Fixed float, small hook', 'Float fishing in shallows', '0.3–0.8 kg', '1.5 kg', 'Summer (Nov–Mar)');

-- Hartbeespoort (dam_id = 2)
INSERT INTO fish_species (dam_id, common_name, scientific_name, best_bait, best_rig, best_technique, average_size, record_size, best_season)
VALUES
(2, 'Common Carp', 'Cyprinus carpio', 'Maize, boilies, bread, tiger nuts', 'Hair rig, method feeder, bolt rig', 'Bottom fishing — long-range casting from bank', '4–10 kg', '22 kg', 'Autumn–Winter (Apr–Aug)'),
(2, 'Sharptooth Catfish', 'Clarias gariepinus', 'Chicken liver, shad, dead bait, sardines', 'Running sinker, circle hook', 'Night fishing — dead bait on bottom', '2–8 kg', '28 kg', 'Summer nights (Nov–Mar)'),
(2, 'Largemouth Bass', 'Micropterus salmoides', 'Crankbaits, swimbaits, soft plastics', 'Texas rig, jig', 'Casting to weed edges and structure', '1–2 kg', '3.8 kg', 'Spring (Aug–Oct)'),
(2, 'Tilapia (Bream)', 'Oreochromis mossambicus', 'Maize, worms, dough', 'Fixed float, size 8 hook', 'Float fishing near inlet areas', '0.3–1 kg', '1.8 kg', 'Summer');

-- Roodekopjes (dam_id = 3)
INSERT INTO fish_species (dam_id, common_name, scientific_name, best_bait, best_rig, best_technique, average_size, record_size, best_season)
VALUES
(3, 'Smallmouth Yellowfish', 'Labeobarbus aeneus', 'Flies, small jigs, worms, maize', 'Euro nymph, dry fly, small split shot', 'Fly fishing or light spinning in flowing water', '0.5–2 kg', '4.5 kg', 'Spring–Autumn (Aug–Apr)'),
(3, 'Largescale Yellowfish', 'Labeobarbus marequensis', 'Maize, worms, soft plastic grubs', 'Light running rig, float', 'Drift fishing in current', '1–4 kg', '8 kg', 'Summer'),
(3, 'Common Carp', 'Cyprinus carpio', 'Boilies, maize, tiger nuts', 'Hair rig, PVA bag', 'Long-range bottom fishing', '3–9 kg', '18 kg', 'Year-round'),
(3, 'Largemouth Bass', 'Micropterus salmoides', 'Crankbaits, jigs, frogs (near reeds)', 'Texas rig, frog setup', 'Topwater early morning, structure fishing', '1–2.5 kg', '4 kg', 'Spring–Summer');

-- Vaal Dam (dam_id = 4)
INSERT INTO fish_species (dam_id, common_name, scientific_name, best_bait, best_rig, best_technique, average_size, record_size, best_season)
VALUES
(4, 'Largemouth Bass', 'Micropterus salmoides', 'Swimbaits, jigs, crankbaits, drop shot', 'Texas rig, Carolina rig, ned rig', 'Structure fishing — focus on points and humps', '1.5–3.5 kg', '5.8 kg', 'Spring (Aug–Nov)'),
(4, 'Largescale Yellowfish', 'Labeobarbus marequensis', 'Flies, worms, maize, soft plastics', 'Light rig, fly fishing', 'Fly fishing below the dam wall — world class', '1–5 kg', '10.2 kg', 'Late summer–autumn'),
(4, 'Common Carp', 'Cyprinus carpio', 'Maize, boilies, pellets, bread', 'Bolt rig, method feeder, hair rig', 'Long-range fishing with bait boat or spod', '5–12 kg', '26 kg', 'Autumn–Winter'),
(4, 'Sharptooth Catfish', 'Clarias gariepinus', 'Live bait, chicken livers, shad, pilchards', 'Circle hook, heavy running sinker', 'Night fishing — anchor and wait', '3–10 kg', '32 kg', 'Summer nights'),
(4, 'Tilapia (Bream)', 'Oreochromis mossambicus', 'Maize, worms, bread', 'Small float rig', 'Float fishing in shallow bays', '0.3–0.8 kg', '2.1 kg', 'Summer');

-- Bronkhorstspruit (dam_id = 5)
INSERT INTO fish_species (dam_id, common_name, scientific_name, best_bait, best_rig, best_technique, average_size, record_size, best_season)
VALUES
(5, 'Largemouth Bass', 'Micropterus salmoides', 'Swimbaits, jigs, topwater frogs, drop shot', 'Texas rig, finesse rig, jig', 'Targeting rocky structures and timber — tournament-quality fish', '1.5–4 kg', '6.1 kg', 'Year-round, peaks spring'),
(5, 'Common Carp', 'Cyprinus carpio', 'Boilies, maize, hemp, tiger nuts', 'Hair rig, leadcore leader', 'Surface fishing in summer, bottom in winter', '4–12 kg', '21 kg', 'Autumn–Winter'),
(5, 'Smallmouth Yellowfish', 'Labeobarbus aeneus', 'Nymphs, small jigs, maize', 'Light euro nymph rig', 'Fly fishing in rocky shallows and inflows', '0.5–2 kg', '3.8 kg', 'Spring–Summer'),
(5, 'Sharptooth Catfish', 'Clarias gariepinus', 'Chicken liver, dead fish, sardines', 'Running sinker, large circle hook', 'Night fishing on the bottom near inflows', '2–7 kg', '18 kg', 'Summer');

-- ================================================================
-- BAIT SHOPS (nearest to each dam)
-- ================================================================

-- Near Rietvlei (dam_id = 1)
INSERT INTO bait_shops (dam_id, name, address, latitude, longitude, distance_from_dam_km, phone_number, opening_hours, stock_description, google_maps_url)
VALUES
(1, 'Rietvlei Fishing & Tackle', 'Garsfontein Rd, Moreleta Park, Pretoria', -25.8612, 28.3014, 3.2, '012 345 6789', 'Mon–Sat 06:00–18:00, Sun 06:00–14:00', 'Full range: carp rigs, bass lures, maize, boilies, live bait. Permit renewal on-site.', 'https://maps.google.com/?q=Rietvlei+Fishing+Tackle+Pretoria'),
(1, 'Tackle Africa — Garsfontein', 'Garsfontein Village, Pretoria East', -25.8523, 28.2946, 5.1, '012 345 9876', 'Mon–Fri 07:00–17:30, Sat 06:00–15:00', 'Lures, rods, reels, line, hooks. Good stock of drop-shot finesse gear for bass.', NULL);

-- Near Hartbeespoort (dam_id = 2)
INSERT INTO bait_shops (dam_id, name, address, latitude, longitude, distance_from_dam_km, phone_number, opening_hours, stock_description, google_maps_url)
VALUES
(2, 'Harties Bait & Tackle', 'Main Rd, Hartbeespoort Village', -25.7421, 27.8812, 1.2, '012 253 1234', 'Daily 05:00–18:00', 'Live bait, maize, boilies, carp rigs, catfish tackle, basic rod and reel combos.', 'https://maps.google.com/?q=Harties+Bait+Tackle+Hartbeespoort'),
(2, 'RiverEdge Fishing Supplies', 'R512, Schoemansville', -25.7198, 27.8564, 4.8, '012 253 5678', 'Tue–Sun 06:00–17:00', 'Premium carp gear, boilies, bait boats, alarms. Good selection of fly fishing equipment.', NULL);

-- Near Roodekopjes (dam_id = 3)
INSERT INTO bait_shops (dam_id, name, address, latitude, longitude, distance_from_dam_km, phone_number, opening_hours, stock_description, google_maps_url)
VALUES
(3, 'Brits Fishing & Outdoor', 'Van Velden St, Brits', -25.6287, 27.7742, 6.5, '012 252 3456', 'Mon–Fri 07:00–17:00, Sat 06:00–14:00', 'Yellowfish flies, carp bait, light spinning gear, permits. Knowledgeable staff for local conditions.', NULL),
(3, 'Crocodile River Tackle', 'R511, Hartbeespoort side', -25.6812, 27.8123, 11.2, '012 253 8765', 'Sat–Sun 05:30–16:00', 'Specialist yellowfish and bass gear. Custom fly tying available on weekends.', NULL);

-- Near Vaal Dam (dam_id = 4)
INSERT INTO bait_shops (dam_id, name, address, latitude, longitude, distance_from_dam_km, phone_number, opening_hours, stock_description, google_maps_url)
VALUES
(4, 'Vaal Marina Tackle Shop', 'Vaal Marina Resort, Vaal Dam', -26.8654, 28.1287, 0.8, '016 365 1234', 'Daily 05:00–19:00', 'Full service: bass lures, carp bait, live bait, ice, permits. Rod hire available.', 'https://maps.google.com/?q=Vaal+Marina+Tackle+Shop'),
(4, 'SA Bass Pro — Vereeniging', 'Voortrekker Rd, Vereeniging', -26.6743, 27.9312, 28.5, '016 422 5678', 'Mon–Sat 08:00–17:30', 'Premium bass tournament gear — Deps, Megabass, Shimano, Daiwa. Competition setup specialists.', NULL);

-- Near Bronkhorstspruit (dam_id = 5)
INSERT INTO bait_shops (dam_id, name, address, latitude, longitude, distance_from_dam_km, phone_number, opening_hours, stock_description, google_maps_url)
VALUES
(5, 'Bronnie Bait & Tackle', 'Louis Trichardt St, Bronkhorstspruit', -25.8012, 28.7254, 3.5, '013 932 1234', 'Mon–Sat 06:00–17:30', 'Bass lures, carp bait, live earthworms, local knowledge. Best stop before the dam gate.', NULL),
(5, 'Eastrand Fishing Supplies', 'Rynfield Ave, Benoni', -26.1543, 28.3212, 42.0, '011 849 5678', 'Mon–Fri 07:00–17:00, Sat 07:00–14:00', 'Large selection — full carp and bass range, rods, reels, clothing, tackle boxes. Good prices.', NULL);
