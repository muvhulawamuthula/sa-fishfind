
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

-- Klipvoor (dam_id = 6) — resorts added after bait shops section below
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

-- ================================================================
-- RESORTS (dams that have on-site or nearby resort accommodation)
-- ================================================================

-- Rietvlei (dam_id = 1)
INSERT INTO resorts (dam_id, name, description, website_url, phone_number, accommodation_types, fishing_access, facilities, price_from)
VALUES
(1, 'Rietvlei Nature Reserve Chalets',
 'The official Tshwane Municipality chalets situated right on the banks of Rietvlei Dam inside the nature reserve. Self-catering units sleep 4 or 6 guests. Deep water in front of the chalets makes them ideal for overnight fishing sessions. The reserve''s 2 000+ animals — including white rhino, buffalo, and giraffe — are visible from the stoep.',
 'http://www.rietvlei.co.za',
 '012 480 9944',
 'Self-catering chalets (4-sleeper and 6-sleeper)',
 'Direct dam frontage — fish from the chalet stoep. Fishing permit required and available at the gate.',
 'Private braai areas, ablution facilities, secure parking, nature reserve access, game viewing',
 '4-sleeper from R1 175/night · 6-sleeper from R1 375/night');

-- Hartbeespoort (dam_id = 2)
INSERT INTO resorts (dam_id, name, description, website_url, phone_number, accommodation_types, fishing_access, facilities, price_from)
VALUES
(2, 'Magalies Park (First Group)',
 'A 4-star full-service resort on the edge of Hartbeespoort Dam, one hour from Johannesburg. Offers chalets from 1-bedroom to 3-bedroom units, all within walking distance of the dam. The resort has its own fishing bank with direct dam access — popular species include carp over 22 kg, largemouth bass, and catfish. One of the best-equipped resorts at Harties.',
 'https://www.firstgroup-sa.co.za/magalies-park',
 NULL,
 '1-bedroom, 2-bedroom, and 3-bedroom self-catering chalets; hotel rooms with Jacuzzi',
 'Direct dam bank fishing. Boat launch on site. Fishing tackle hire available.',
 'Water park, 18-hole golf course, full spa, multiple swimming pools, restaurant, kids entertainment, hiking trails',
 'From R1 800/night'),
(2, 'De Rust Angling Resort',
 'One of Hartbeespoort''s most dedicated fishing resorts, De Rust offers direct dam access with well-maintained fishing banks. A favourite among carp and catfish anglers who want to be as close to the water as possible. Relaxed atmosphere with basic but comfortable facilities.',
 NULL,
 NULL,
 'Chalets and camping',
 'Direct dam access — fishing banks maintained specifically for angling. One of the best night fishing spots on Harties.',
 'Braai facilities, ablution blocks, slipway access',
 'Contact resort for rates'),
(2, 'Ifafi Aquatic Club',
 'A members-focused aquatic and fishing club on the Ifafi arm of Hartbeespoort Dam. Offers flat-style accommodation with direct waterfront access. Popular with bass anglers targeting the quieter Ifafi inlet. A more private alternative to the busier Schoemansville side.',
 'https://ifafiaquaticclub.co.za',
 NULL,
 'Flat accommodation (self-catering)',
 'Private dam frontage on the Ifafi arm — quieter fishing away from main boat traffic.',
 'Slipway, braai areas, ablution facilities, secure access',
 'Contact for rates'),
(2, 'Kommandonek',
 'A popular resort on the Hartbeespoort Dam offering camping and chalet accommodation with dam access. Well-known in the local fishing community for its accessible banks and friendly atmosphere. Situated near the Crocodile River inlet arm of the dam.',
 'https://www.facebook.com/Kommandonek/',
 NULL,
 'Chalets, camping, caravan sites',
 'Dam bank access for fishing. Good position near the Crocodile River inlet — productive for carp and catfish.',
 'Swimming pool, braai areas, ablution blocks, children''s play area',
 'Contact resort for rates'),
(2, 'Schoemansville Resort',
 'Situated in the historic Schoemansville village — the oldest settlement at Hartbeespoort Dam — this resort offers cabin-style accommodation with easy access to the dam. Schoemansville is one of the most popular fishing areas on Harties, particularly for bass anglers targeting the rocky points.',
 'https://schoemansville-resort.business.site/',
 NULL,
 'Self-catering cabins',
 'Short walk to dam. Schoemansville rocky banks are a prime bass fishing location.',
 'Braai facilities, parking, proximity to local restaurants and bait shops',
 'Contact resort for rates'),
(2, 'Meerhof Resort',
 'Lakeside resort on the Meerhof arm of Hartbeespoort Dam. A quieter, more residential section of the dam popular with local Gauteng anglers who want a peaceful weekend getaway. The Meerhof bank offers good carp and catfish fishing with less boat traffic than the main dam.',
 'https://www.facebook.com/meerhofoewer',
 NULL,
 'Self-catering accommodation',
 'Direct lakeside access. Meerhof arm is known for good carp fishing in the reed edges.',
 'Braai facilities, parking, dam access',
 'Contact resort for rates');

-- Bronkhorstspruit (dam_id = 5)
INSERT INTO resorts (dam_id, name, description, website_url, phone_number, accommodation_types, fishing_access, facilities, price_from)
VALUES
(5, 'Bajadam Resort',
 'The premier fishing and boating resort at Bronkhorstspruit Dam, with nearly 4 km of dam waterfront — the longest of any resort on the dam. Both anglers and motorboat enthusiasts are welcome. Shaded camping sites with electricity are available close to the ablution facilities, or pitch your tent on the water''s edge for all-night fishing sessions. The thick bank grass is a favourite for bass anglers.',
 'https://www.bajadam.co.za',
 NULL,
 'Camping (powered and unpowered), waterside tent pitches',
 'Nearly 4 km of private dam waterfront. Waterside camping for overnight fishing. Bass, carp, barbell, and kurper.',
 'Kids play area, lapa and fireplace, ablution blocks, electricity points, slipway, secure access',
 'Contact for current rates'),
(5, 'Kaia Manzi Family Resort',
 'A well-appointed family resort nestled on the scenic banks of Bronkhorstspruit Dam, about 60 minutes from Johannesburg, Pretoria, and Witbank. Regularly hosts top angling competitions. Offers a range of accommodation from self-catering units to guesthouse rooms. The resort provides direct dam access and is one of the most comfortable options at the dam.',
 'https://kaiamanzi.co.za',
 '+27 71 851 1346',
 'Self-catering open-plan units, guesthouse rooms (2-guest), camping (private and communal)',
 'Direct dam access for fishing and boating. Hosts angling competitions. Bass fishing is the main draw.',
 'Restaurant, two conference rooms, swimming pools with water slide, braai areas, dam slipway',
 'Contact for current rates');

-- Vaal Dam (dam_id = 4)
INSERT INTO resorts (dam_id, name, description, website_url, phone_number, accommodation_types, fishing_access, facilities, price_from)
VALUES
(4, 'Vaal Marina Resort',
 'A self-catering dam-front resort on the Gauteng shores of the Vaal Dam, spanning 26 hectares with a 350 m waterfront. Described as a fisherman''s paradise — chalets are positioned as close as 20 m from the dam. One of the most well-equipped resorts on the Vaal, with a full slipway, jetty, and water sports facilities. Common species: barbel and large carp.',
 'https://vaalmarinaresort.co.za',
 '071 186 7867',
 'Modern self-catering chalets (various sizes)',
 '350 m of dam waterfront. Chalets 20 m from dam edge. Slipway and jetty. Rod hire available.',
 'Swimming pools (adult and children''s), water sports, slipway, jetty, braai areas, kids playground, daily housekeeping',
 'Contact for current rates'),
(4, 'RoeMar Resort (formerly Van Driel''s Fishing)',
 'A serious angling destination on the Gauteng side of the Vaal Dam, approximately 8 km from Villiers crossing. Features 1 km of private waterfront with approximately 1 m depth drop per 10 m from shore — ideal for big carp and bass. Twelve rustic off-the-grid waterfront cabins and 14 designated waterfront camping stands ensure every guest has private shore access.',
 'https://www.vandrielsfishing.co.za',
 '061 056 1064',
 '12 waterfront cabins (4-sleeper), 1 cabin (2-sleeper), Die Oewerhuis guesthouse (sleeps 8), 14 waterfront camping stands',
 '1 km of private shoreline — 20–30 m per guest. Deep water drop-off ideal for carp and bass. Kiosk supplies ice, wood, and bait.',
 'Solar/gas power, ablution block, kiosk (bait, ice, wood), fenced property bordering game farm, birdwatching',
 'Contact for current rates'),
(4, 'The View on Vaal Resort',
 'A scenic resort on the Vaal Dam known for its large shaded trees, expansive waterfront, and braai amenities right on the water''s edge. Popular with families and anglers alike. Offers day visitor access as well as overnight accommodation. The wide open waterfront is ideal for bank fishing for carp, bass, and catfish.',
 'https://www.theviewonvaalresort.co.za',
 NULL,
 'Chalets and day visitor facilities',
 'Direct dam waterfront access. Large shaded fishing banks. Day visitor fishing also available.',
 'Braai areas, large shaded trees, waterfront views, day visitor facilities',
 'Contact for current rates');

-- Roodekopjes (dam_id = 3)
INSERT INTO resorts (dam_id, name, description, website_url, phone_number, accommodation_types, fishing_access, facilities, price_from)
VALUES
(3, 'Dennekruin Fishing Resort',
 'A dedicated family fishing and camping resort established in 2000 on the banks of Roodekopjes Dam, 28 km outside Brits on the R511. One of the best-equipped angling resorts in the North West, with 23 spacious fishing swims catering to casual, competitive, and professional anglers alike. Surrounded by bushveld and home to 249 recorded bird species. Day visitor access is also available subject to availability.',
 'https://dennekruinfishingresort.co.za',
 '081 274 6166',
 'Glamping cabins, fisherman cabins, waterside camping sites',
 '23 designated fishing swims on Roodekopjes Dam. Direct dam bank access. Day visitor angling permitted.',
 'Swimming pool, clean ablution blocks, braai facilities, membership programme, day visitor access, birdwatching',
 'Contact resort for current rates'),
(3, 'Roodekoppies Hengeloord',
 'A well-known fishing and camping resort on Roodekopjes Dam, popular with local anglers from the Brits and Pretoria areas. The resort is managed by passionate anglers and offers direct dam bank access with good carp and catfish fishing. A favourite for weekend getaways from Gauteng.',
 'https://www.facebook.com/p/Roodekoppies-Hengeloord-100079554965857/',
 NULL,
 'Camping and caravan sites',
 'Direct dam bank access. Carp, catfish, yellowfish, and bass. Popular with both night and day anglers.',
 'Braai facilities, ablution blocks, dam access',
 'Contact resort for current rates');

-- Klipvoor (dam_id = 6)
INSERT INTO resorts (dam_id, name, description, website_url, phone_number, accommodation_types, fishing_access, facilities, price_from)
VALUES
(6, 'Koster Dam Nature Resort',
 'A peaceful nature resort on the banks of Koster Dam, situated near Klipvoor Dam in the Koster area of North West Province. The resort prides itself on putting guests first and offering a true escape into nature. Ideal for anglers who want to combine a fishing getaway with boating and water sports. Strict catch-and-release policy with no keepnets allowed — ensuring healthy fish populations for future visits.',
 'https://kosterdamresort.co.za',
 '060 369 3215',
 'Camping',
 'Catch-and-release fishing on Koster Dam. No keepnets policy. Bass, carp, barber, kurper, and yellowfish.',
 'Camping facilities, boating, water skiing, braai areas',
 'Contact resort for current rates'),
(6, 'Borakalalo National Park Camp',
 'The official SANParks camp inside Borakalalo National Park, which surrounds Klipvoor Dam. The park is one of the least-visited national parks in South Africa, meaning incredible solitude on the water. Fishing from the dam bank is permitted with a valid permit. The park is home to white rhino, brown hyena, and over 360 bird species. A true wilderness fishing experience within reach of Gauteng.',
 'https://www.sanparks.org/parks/borakalalo',
 NULL,
 'Tented camps and basic camping',
 'Bank fishing permitted on Klipvoor Dam with SANParks permit. One of the most remote and undisturbed fishing spots near Gauteng.',
 'Game drives, hiking trails, birdwatching, ablution facilities',
 'Contact SANParks for current rates');

-- Buffelspoort (dam_id = 8)
INSERT INTO resorts (dam_id, name, description, website_url, phone_number, accommodation_types, fishing_access, facilities, price_from)
VALUES
(8, 'ATKV Buffelspoort',
 'A full-service family resort in the heart of the Magaliesberg bushveld, less than an hour from Pretoria and Johannesburg. Set against the dramatic Magaliesberg mountain range with direct access to Buffelspoort Dam. One of the best-equipped resorts in the area, offering a wide range of accommodation from villas to camping. Carp up to 29.7 kg (a former SA record) and largemouth bass up to 6.5 kg have been landed at this dam.',
 'https://buffelspoort.co.za',
 '+27 14 572 1000',
 'Villas (8-sleeper), houses (2–5-sleeper), rondavels (2–8-sleeper), tenthouses (4-sleeper), camping',
 'Direct dam access. Fishing from non-electrified bank sites. Bass and carp fishing.',
 'Heated indoor and outdoor pools, cold pools, jacuzzis, restaurant, sports bar, shop, golf, tennis, minigolf, squash, waterslide, trampolines, ATM',
 'Contact resort for current rates'),
(8, 'Buffelspoort Dam Rest Camp',
 'The official dam-side rest camp managed by the local municipality, situated right on the water''s edge. Most campsites are on or very near the water, making it ideal for bank fishing. Non-electrified sites are specifically permitted for fishing. Minimum two-night stay required on weekends and peak season. Simple, affordable, and genuinely close to the water.',
 'https://buffelspoortdam.co.za',
 '+27 74 344 3496',
 'Non-electrified camping (fishing allowed), electrified camping (waterfront and non-waterfront)',
 'Non-electrified sites: fishing permitted directly in front. Waterfront electrified sites reserved for boats.',
 'Braai facilities, ablution blocks, waterfront camping, boating access',
 'Non-electrified from R200/night · Waterfront from R270/night');

-- Rust de Winter (dam_id = 9)
INSERT INTO resorts (dam_id, name, description, website_url, phone_number, accommodation_types, fishing_access, facilities, price_from)
VALUES
(9, 'Rust de Winter Dam Nature Reserve',
 'The official Limpopo Department of Economic Development reserve resort at Rust de Winter Dam, situated about 80 km north of Pretoria. A pristine 500-hectare dam surrounded by broad-leaved woodland, riverine forest, and thornveld. Over 400 bird species have been recorded here. The reserve is a rustic breakaway for fishing enthusiasts — boat and shore fishing are both available. Note: tap water on-site is not suitable for drinking.',
 'https://www.lwr.gov.za/lodges/resorts/rustdewinter',
 '+27 15 293 8015',
 'Camping with basic ablution facilities (no electricity)',
 'Both shore and boat fishing available. Largemouth bass, common carp, and canary kurper. Catch-and-release encouraged.',
 'Camping, boating, walking trails, mountain biking, self-drive routes, 4x4 routes, conference hall, food and beverage services, birdwatching (400+ species)',
 'Contact reserve for current rates'),
(9, 'Rust de Winter Safaris',
 'A private safari and accommodation operation in the Rust de Winter area, offering guided fishing and birdwatching experiences on and around Rust de Winter Dam. A more personalised alternative to the main reserve camp, with guided boat fishing options and expert local knowledge on bass, carp, and bird species.',
 'https://www.rustdewintersafaris.com',
 NULL,
 'Private accommodation and guided day experiences',
 'Guided boat fishing on Rust de Winter Dam. Expert local knowledge on bass and carp spots.',
 'Guided fishing, birdwatching tours, bushveld walks',
 'Contact for guided fishing rates');

-- Witbank (dam_id = 10)
INSERT INTO resorts (dam_id, name, description, website_url, phone_number, accommodation_types, fishing_access, facilities, price_from)
VALUES
(10, 'Maanlig Resort',
 'A resort situated directly on the banks of Witbank Dam, incorporating quality amenities while maintaining a homelike atmosphere. One of the most comfortable options at the dam for both leisure and corporate guests. Witbank Dam holds the former South African largemouth bass record of 6.045 kg (caught 1997), and fish between 3–4 kg are regularly landed here.',
 'https://www.maanligresort.co.za',
 NULL,
 'Chalets and resort accommodation',
 'Direct dam access. Witbank Dam is home to trophy largemouth bass (former SA record dam), carp, and catfish.',
 'State-of-the-art facilities, dam views, braai areas',
 'Contact resort for current rates'),
(10, 'eMalahleni Recreation Resort',
 'The municipal resort adjacent to Witbank Dam Nature Reserve, offering affordable camping within the reserve boundaries. 48 camping sites, each accommodating up to 4 people, with fully functioning ablution blocks. A practical base for anglers who want no-frills, close-to-the-water access without resort prices. Situated inside the reserve, game viewing is possible alongside fishing.',
 'https://www.emalahleni.gov.za',
 NULL,
 '48 camping sites (4 people per site)',
 'Dam access within the nature reserve. Bass, carp, and catfish. Reserve is surrounded by highveld bushveld.',
 'Ablution blocks with showers, braai facilities, swimming pools, parks, mini-golf, nature reserve access',
 'Contact municipality for current rates'),
(10, 'The Beach Resort Witbank',
 'A popular campground and fishing spot on the shores of Witbank Dam at Naauwpoort, eMalahleni. A well-known spot among local Mpumalanga anglers for relaxed bank fishing, particularly for bass and carp. The informal, community-atmosphere resort is a favourite for weekend camping trips from Witbank and surrounding areas.',
 'https://www.facebook.com/beachresort.witbank/',
 NULL,
 'Camping and caravan sites',
 'Waterside camping with direct dam bank access. Bass and carp fishing.',
 'Braai facilities, dam access, camping sites',
 'Contact resort for current rates');

-- Loskop Dam (dam_id = 7)
INSERT INTO resorts (dam_id, name, description, website_url, phone_number, accommodation_types, fishing_access, facilities, price_from)
VALUES
(7, 'Loskopdam, A Forever Resort',
 'The main resort at Loskop Dam, operated by Forever Resorts. Sits directly on the banks of Loskop Dam in the Loskop Dam Nature Reserve. Offers 40 log cabins, 18 chalets, 8 family houses, a guesthouse, caravan park with 281 powered stands, and a youth hostel. Fishing from the resort banks gives access to tigerfish, bass, carp, and catfish. The surrounding Big Five reserve is included in your stay.',
 'https://www.foreverloskopdam.co.za',
 NULL,
 'Log cabins (40), chalets (18), family houses (8), guesthouse (3-bedroom), caravan/camping (281 stands), youth hostel',
 'Direct dam bank fishing. 27 fish species available. Boat charter available for tigerfish. Wire traces essential — tigerfish present.',
 'Swimming pool, mini-golf, pool table, tennis, volleyball, paintball, trampoline, Big Five nature reserve access, conference facilities',
 'From R130 per person'),
(7, 'Arends Rus',
 'A small, intimate self-catering log cabin retreat perched on a private koppie overlooking Loskop Dam. Three well-equipped cabins each sleep 4 guests and offer stunning dam views from private decks. A peaceful alternative to the main Forever Resort. Guests can bring their own boat or charter from Arends Rus for tigerfish and sunset cruises. Cash or EFT only — no card facilities.',
 'https://arendsrus.com',
 '+27 82 888 5341',
 '3 self-catering log cabins (2 bedrooms, 4-person capacity each)',
 'Dam views from private deck. Boat charter available for tigerfish fishing. Bring own tackle including wire traces.',
 'Private deck, outdoor shower, braai area, fully equipped kitchen, covered parking, spectacular dam views',
 'Contact for current rates');
