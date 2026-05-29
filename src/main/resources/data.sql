
-- ================================================================
-- SA FishFind — Seed data for Gauteng & surrounding dams
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
 75.0, 75.0, 180.0, 1175.0,
 TRUE, TRUE,
 'Rietvlei is a pristine nature reserve dam on the south-east of Pretoria. Managed by Tshwane Municipality, it is one of the best-maintained fishing spots in Gauteng with clear water and abundant bass. Day visits are R75 per person; overnight stays are R180 per person. Chalets sleep 4 (from R1 175/night) or 6 (from R1 375/night). On the other side of the reserve, over 2 000 animals call Rietvlei home — including white rhino, buffalo, zebra, wildebeest, giraffe, and a large variety of antelope. A valid fishing permit is required and available at the gate. No night fishing permitted.',
 '05:30–08:30, 16:00–18:30',
 'HIGH',
 'No crocodiles or hippos. Bilharzia-free — water is safe. Be aware of wildlife on the reserve side — maintain a safe distance from rhino and buffalo at all times.',
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

-- ================================================================
-- ADDITIONAL DAMS (6–10)
-- ================================================================

INSERT INTO dams (name, region, address, latitude, longitude,
    entrance_fee_adult, entrance_fee_child,
    camping_fee_per_night, chalet_fee_per_night,
    chalets_available, camping_available,
    description, best_fishing_times, activity_level,
    danger_advisory, hippos_present, crocodiles_present, bilharzia_risk, image_url)
VALUES

-- 6. Klipvoor Dam
('Klipvoor Dam', 'North West — Koster',
 'Klipvoor Dam Nature Reserve, near Koster, North West Province',
 -25.2280, 27.0850,
 55.0, 25.0, 130.0, 480.0,
 TRUE, TRUE,
 'Klipvoor is a peaceful, relatively undiscovered dam nestled in the North West bushveld about 130km from Johannesburg. It sits in the Hex River and offers exceptional smallmouth yellowfish and bass fishing in rocky, clear water. The dam is not heavily fished, meaning specimens here run large. A Nature Conservation permit is required and available at the gate. The surrounding bush is home to kudu, impala, and warthog — making it a true bush fishing experience.',
 '05:30–08:30, 16:00–19:00',
 'MEDIUM',
 'No crocodiles or hippos recorded. Bilharzia risk is low. Standard bush safety applies — watch for snakes on rocky banks, particularly puff adders. Do not leave food unattended due to vervet monkeys and baboons in the area.',
 FALSE, FALSE, FALSE,
 NULL),

-- 7. Loskop Dam
('Loskop Dam', 'Mpumalanga — Groblersdal',
 'Loskop Dam Nature Reserve, R35, near Groblersdal, Mpumalanga',
 -25.4080, 29.3850,
 120.0, 60.0, 220.0, 950.0,
 TRUE, TRUE,
 'Loskop is one of South Africa''s premier big-game fishing destinations, about 180km northeast of Johannesburg. It is most famous for its TIGERFISH — hard-fighting, razor-toothed predators that explode on surface lures at dawn. The dam also holds trophy bass and massive catfish. Situated in the Loskop Dam Nature Reserve, the surrounding Big Five reserve adds an incredible dimension — you may spot elephant and lion on the banks while you fish. A wire trace is mandatory for tigerfish. Entry includes access to the reserve.',
 '04:30–07:30, 17:30–19:30',
 'HIGH',
 'CROCODILES and HIPPOS present — do NOT fish from isolated banks or wade. Only fish from established, visible launch areas and well-lit resort banks. Hippo paths cross the bank at night — never fish after dark without a guide. Bilharzia risk HIGH — avoid all water contact. This is wild Africa: lion, elephant, and buffalo are present in the reserve.',
 TRUE, TRUE, TRUE,
 NULL),

-- 8. Buffelspoort Dam
('Buffelspoort Dam', 'North West — Magaliesberg',
 'Buffelspoort Dam, R104, Buffelspoort, North West Province',
 -25.6670, 27.6500,
 40.0, 20.0, 110.0, 420.0,
 TRUE, TRUE,
 'Buffelspoort is a small, intimate dam set against the dramatic Magaliesberg mountains, just 10km from Hartbeespoort. Popular with day-trippers and weekend anglers from Pretoria and Johannesburg, it offers relaxed carp and catfish fishing in a scenic valley setting. The dam is smaller than Harties and less commercialised — making it ideal for families and first-time anglers. Several small resorts and caravan parks line the southern shore. The mountain backdrop makes for spectacular early morning sessions.',
 '05:30–08:30, 16:30–18:30',
 'MEDIUM',
 'No crocodiles or hippos. Bilharzia risk is low. The dam receives heavy recreational boat traffic on weekends — stay clear of ski boat lanes when fishing from the bank. Mountain weather changes fast in the Magaliesberg — bring a rain jacket for afternoon sessions.',
 FALSE, FALSE, FALSE,
 NULL),

-- 9. Rust de Winter Dam
('Rust de Winter Dam', 'Limpopo — North of Pretoria',
 'Rust de Winter Nature Reserve, R33, Rust de Winter, Limpopo',
 -25.1670, 28.6170,
 50.0, 25.0, 140.0, 520.0,
 TRUE, TRUE,
 'Rust de Winter is a wild, remote dam set in the thornveld of the Limpopo/Gauteng border, about 80km north of Pretoria on the R33. It is one of the least-pressured dams accessible from Gauteng, making fish sizes above average. The dam holds excellent largemouth bass in rocky structure, along with strong populations of carp and Mozambique tilapia. The surrounding Rust de Winter Nature Reserve is home to kudu, zebra, and giraffe. A highly recommended destination for anglers who want to escape the crowds.',
 '05:00–08:30, 16:00–19:00',
 'MEDIUM',
 'No crocodiles confirmed in the main dam. Hippo sightings are extremely rare. Bilharzia risk is low but monitor local advisories. Standard bushveld precautions apply — watch for snakes, especially mambas and cobras on warm rocky banks. Malaria risk is negligible at this latitude but use repellent for evening sessions.',
 FALSE, FALSE, FALSE,
 NULL),

-- 10. Witbank Dam
('Witbank Dam', 'Mpumalanga — eMalahleni',
 'Witbank Dam Nature Reserve, eMalahleni (Witbank), Mpumalanga',
 -25.8670, 29.2330,
 45.0, 20.0, 125.0, 460.0,
 TRUE, TRUE,
 'Witbank Dam sits within the Witbank Dam Nature Reserve on the eastern highveld, about 130km east of Johannesburg on the N12. Despite being surrounded by the industrial heartland of Mpumalanga, the reserve is a genuine green oasis with good water quality and healthy fish populations. It is one of the best-kept bass secrets on the highveld — the rocky structure and deepwater points hold large largemouth bass year-round. Carp anglers also rate it highly for its consistent big-fish action. An easy day trip from Gauteng.',
 '05:00–08:00, 16:30–19:00',
 'HIGH',
 'No crocodiles or hippos. Bilharzia risk is low — the highveld altitude and water temperature reduce risk. Water quality has improved significantly following reserve rehabilitation. Be aware of strong afternoon thunderstorms in summer — the highveld weather can turn quickly. Leave the water immediately at the first sign of lightning.',
 FALSE, FALSE, FALSE,
 NULL);

-- ================================================================
-- FISH SPECIES — additional dams (6–10)
-- ================================================================

-- Klipvoor (dam_id = 6)
INSERT INTO fish_species (dam_id, common_name, scientific_name, best_bait, best_rig, best_technique, average_size, record_size, best_season)
VALUES
(6, 'Smallmouth Yellowfish', 'Labeobarbus aeneus', 'Nymphs, small jigs, maize, worms', 'Light euro nymph, small split shot', 'Fly fishing or ultra-light spinning in rocky shallows', '0.5–2 kg', '4.8 kg', 'Spring–Summer (Aug–Feb)'),
(6, 'Largemouth Bass', 'Micropterus salmoides', 'Crankbaits, jigs, soft plastic worms', 'Texas rig, drop shot', 'Rocky point and structure fishing — lightly pressured fish are aggressive', '1–3 kg', '5.2 kg', 'Year-round, peaks spring'),
(6, 'Common Carp', 'Cyprinus carpio', 'Boilies, maize, tiger nuts', 'Hair rig, running lead', 'Long-range bottom fishing in deeper water', '3–10 kg', '19 kg', 'Autumn–Winter'),
(6, 'Tilapia (Bream)', 'Oreochromis mossambicus', 'Worms, maize, dough', 'Small float rig', 'Float fishing near inlet and weed edges', '0.3–0.8 kg', '1.6 kg', 'Summer');

-- Loskop (dam_id = 7)
INSERT INTO fish_species (dam_id, common_name, scientific_name, best_bait, best_rig, best_technique, average_size, record_size, best_season)
VALUES
(7, 'Tigerfish', 'Hydrocynus vittatus', 'Live tilapia, surface lures, large spinners, poppers', 'Wire trace (40lb+), treble hook, heavy monofilament', 'Live bait under float at dawn — or cast surface poppers aggressively at first and last light', '0.5–2 kg', '4.1 kg', 'Summer (Nov–Mar) — peak Jan–Feb'),
(7, 'Largemouth Bass', 'Micropterus salmoides', 'Large swimbaits, jigs, crankbaits', 'Texas rig, Carolina rig', 'Structure fishing around submerged trees and rocky points', '1.5–3.5 kg', '5.6 kg', 'Spring (Aug–Oct)'),
(7, 'Sharptooth Catfish', 'Clarias gariepinus', 'Live bait, chicken liver, pilchards, dead fish', 'Heavy running sinker, circle hook, wire trace', 'Night fishing anchored on the bottom near inflows', '3–12 kg', '35 kg', 'Summer nights'),
(7, 'Common Carp', 'Cyprinus carpio', 'Maize, boilies, bread', 'Bolt rig, hair rig', 'Bottom fishing in bays and shallow flats', '4–11 kg', '24 kg', 'Autumn–Winter');

-- Buffelspoort (dam_id = 8)
INSERT INTO fish_species (dam_id, common_name, scientific_name, best_bait, best_rig, best_technique, average_size, record_size, best_season)
VALUES
(8, 'Common Carp', 'Cyprinus carpio', 'Maize, boilies, bread, sweetcorn', 'Hair rig, method feeder', 'Bottom fishing from bank, especially near reed beds', '3–9 kg', '17 kg', 'Year-round, peaks autumn'),
(8, 'Sharptooth Catfish', 'Clarias gariepinus', 'Chicken liver, sardines, dead bait', 'Running sinker, circle hook', 'Night fishing — anchor bait on bottom near deeper channels', '2–7 kg', '22 kg', 'Summer nights'),
(8, 'Largemouth Bass', 'Micropterus salmoides', 'Crankbaits, spinnerbaits, soft plastics', 'Texas rig, jig', 'Casting to rocky points and structure along the mountain face', '0.8–2 kg', '3.5 kg', 'Spring–Summer'),
(8, 'Tilapia (Bream)', 'Oreochromis mossambicus', 'Maize, worms, bread balls', 'Small float rig, size 10 hook', 'Float fishing in the shallows near resort pontoons', '0.3–0.7 kg', '1.4 kg', 'Summer');

-- Rust de Winter (dam_id = 9)
INSERT INTO fish_species (dam_id, common_name, scientific_name, best_bait, best_rig, best_technique, average_size, record_size, best_season)
VALUES
(9, 'Largemouth Bass', 'Micropterus salmoides', 'Soft plastics, jigs, crankbaits, topwater', 'Texas rig, drop shot, ned rig', 'Rocky structure and submerged thornbush — fish are naive and aggressive', '1.5–3.5 kg', '5.9 kg', 'Year-round, peaks spring and autumn'),
(9, 'Common Carp', 'Cyprinus carpio', 'Boilies, maize, hemp seed', 'Hair rig, running lead', 'Long-range bottom fishing on sandy flats', '4–11 kg', '20 kg', 'Autumn–Winter (Mar–Aug)'),
(9, 'Tilapia (Bream)', 'Oreochromis mossambicus', 'Worms, maize, bread', 'Light float rig', 'Float fishing in the shallows and near rocky margins', '0.3–0.9 kg', '1.7 kg', 'Summer (Oct–Mar)'),
(9, 'Sharptooth Catfish', 'Clarias gariepinus', 'Chicken livers, fish pieces, earthworms', 'Running sinker, large hook', 'Night fishing — bottom of deeper channels', '2–8 kg', '21 kg', 'Warm season nights');

-- Witbank (dam_id = 10)
INSERT INTO fish_species (dam_id, common_name, scientific_name, best_bait, best_rig, best_technique, average_size, record_size, best_season)
VALUES
(10, 'Largemouth Bass', 'Micropterus salmoides', 'Swimbaits, jigs, topwater frogs, drop shot', 'Texas rig, finesse ned rig', 'Rocky structure and submerged points — this fishery is seriously underrated', '1.5–4 kg', '6.4 kg', 'Year-round, peaks spring (Aug–Oct)'),
(10, 'Common Carp', 'Cyprinus carpio', 'Boilies, maize, tiger nuts, pellets', 'Hair rig, bolt rig, method feeder', 'Bottom fishing — consistent big fish on the eastern bank flats', '4–13 kg', '25 kg', 'Autumn–Winter'),
(10, 'Sharptooth Catfish', 'Clarias gariepinus', 'Dead bait, chicken liver, sardines', 'Running sinker, circle hook', 'Night fishing in deeper water near the dam wall', '3–9 kg', '28 kg', 'Summer nights'),
(10, 'Tilapia (Bream)', 'Oreochromis mossambicus', 'Maize, worms, dough balls', 'Small float rig', 'Float fishing near reed margins and inlet streams', '0.3–0.8 kg', '1.9 kg', 'Summer');

-- ================================================================
-- BAIT SHOPS — additional dams (6–10)
-- ================================================================

-- Near Klipvoor (dam_id = 6)
INSERT INTO bait_shops (dam_id, name, address, latitude, longitude, distance_from_dam_km, phone_number, opening_hours, stock_description, google_maps_url)
VALUES
(6, 'Koster Bait & Tackle', 'Voortrekker St, Koster, North West', -25.2154, 26.9012, 14.5, '018 583 1234', 'Mon–Sat 06:00–17:00', 'Yellowfish flies, light spinning gear, carp bait, maize, worms. Local permit info available.', NULL),
(6, 'Swartruggens Outdoor', 'Main Rd, Swartruggens', -25.6432, 26.6854, 32.0, '018 585 5678', 'Mon–Fri 07:30–17:00, Sat 07:00–13:00', 'General fishing supplies, rods, hooks, line, basic lures. Fuel and supplies available.', NULL);

-- Near Loskop (dam_id = 7)
INSERT INTO bait_shops (dam_id, name, address, latitude, longitude, distance_from_dam_km, phone_number, opening_hours, stock_description, google_maps_url)
VALUES
(7, 'Loskop Tiger Tackle', 'Groblersdal Main St, Groblersdal', -25.1654, 29.3912, 28.0, '013 262 1234', 'Mon–Sat 05:30–17:30', 'Tigerfish specialist — wire traces, surface lures, poppers, heavy mono. Live bait available. Also stock bass and carp gear.', NULL),
(7, 'Bush & Bass — Marble Hall', 'Voortrekker Rd, Marble Hall', -24.9812, 29.2943, 45.0, '013 261 5678', 'Tue–Sun 06:00–17:00', 'Premium lures, tiger tackle, fly fishing gear. Knowledgeable staff with up-to-date dam conditions.', NULL);

-- Near Buffelspoort (dam_id = 8)
INSERT INTO bait_shops (dam_id, name, address, latitude, longitude, distance_from_dam_km, phone_number, opening_hours, stock_description, google_maps_url)
VALUES
(8, 'Buffelspoort Bait Shop', 'R104, Buffelspoort Village', -25.6712, 27.6423, 0.9, '012 258 1234', 'Daily 05:30–18:00', 'Live bait, maize, carp rigs, catfish tackle, rod hire for beginners. Dam permit available on-site.', 'https://maps.google.com/?q=Buffelspoort+Bait+Shop'),
(8, 'Magalies Mountain Tackle', 'Hartbeespoort Rd, Schoemansville', -25.7198, 27.8564, 12.5, '012 253 5678', 'Tue–Sun 06:00–17:00', 'Carp and bass specialist. Good selection of Magaliesberg-specific yellowfish gear and flies.', NULL);

-- Near Rust de Winter (dam_id = 9)
INSERT INTO bait_shops (dam_id, name, address, latitude, longitude, distance_from_dam_km, phone_number, opening_hours, stock_description, google_maps_url)
VALUES
(9, 'Rust de Winter Store', 'R33, Rust de Winter Village', -25.1543, 28.5965, 7.5, '012 734 1234', 'Mon–Sat 07:00–17:00', 'Basic fishing supplies, maize, worms, hooks, line. Cold drinks and snacks. Friendly local advice.', NULL),
(9, 'Bela-Bela Fishing Hub', 'Voortrekker St, Bela-Bela (Warmbaths)', -24.8843, 28.2912, 38.0, '014 736 5678', 'Mon–Fri 07:00–17:30, Sat 06:00–14:00', 'Full range carp and bass gear, boilies, lures, rods and reels. Specialist in bushveld fishing techniques.', NULL);

-- Near Witbank (dam_id = 10)
INSERT INTO bait_shops (dam_id, name, address, latitude, longitude, distance_from_dam_km, phone_number, opening_hours, stock_description, google_maps_url)
VALUES
(10, 'Highveld Tackle & Bait', 'Mandela St, eMalahleni (Witbank)', -25.8754, 29.2143, 4.2, '013 653 1234', 'Mon–Sat 06:00–17:30', 'Bass specialist — full lure range, jigs, drop shot gear, finesse tackle. Carp bait and live worms also stocked.', NULL),
(10, 'Middelburg Fishing World', 'Walter Sisulu St, Middelburg', -25.7734, 29.4632, 22.0, '013 243 5678', 'Mon–Fri 07:00–17:00, Sat 07:00–14:00', 'Large store — rods, reels, clothing, lures, bait, tackle boxes. Competition gear and advice available.', NULL);
