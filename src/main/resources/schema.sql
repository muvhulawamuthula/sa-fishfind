-- SA FishFind — table definitions for H2 (local dev)

CREATE TABLE IF NOT EXISTS dams (
    id                      BIGINT AUTO_INCREMENT PRIMARY KEY,
    name                    VARCHAR(255) NOT NULL,
    region                  VARCHAR(255) NOT NULL,
    address                 VARCHAR(500) NOT NULL,
    latitude                DOUBLE NOT NULL,
    longitude               DOUBLE NOT NULL,
    entrance_fee_adult      DOUBLE,
    entrance_fee_child      DOUBLE,
    camping_fee_per_night   DOUBLE,
    chalet_fee_per_night    DOUBLE,
    chalets_available       BOOLEAN,
    camping_available       BOOLEAN,
    description             VARCHAR(2000),
    best_fishing_times      VARCHAR(255),
    activity_level          VARCHAR(50),
    danger_advisory         VARCHAR(1000),
    hippos_present          BOOLEAN,
    crocodiles_present      BOOLEAN,
    bilharzia_risk          BOOLEAN,
    image_url               VARCHAR(500)
);

CREATE TABLE IF NOT EXISTS fish_species (
    id                  BIGINT AUTO_INCREMENT PRIMARY KEY,
    dam_id              BIGINT NOT NULL,
    common_name         VARCHAR(255) NOT NULL,
    scientific_name     VARCHAR(255),
    best_bait           VARCHAR(500),
    best_rig            VARCHAR(500),
    best_technique      VARCHAR(500),
    average_size        VARCHAR(100),
    record_size         VARCHAR(100),
    best_season         VARCHAR(255),
    image_url           VARCHAR(500),
    FOREIGN KEY (dam_id) REFERENCES dams(id)
);

CREATE TABLE IF NOT EXISTS bait_shops (
    id                      BIGINT AUTO_INCREMENT PRIMARY KEY,
    dam_id                  BIGINT NOT NULL,
    name                    VARCHAR(255) NOT NULL,
    address                 VARCHAR(500),
    latitude                DOUBLE,
    longitude               DOUBLE,
    distance_from_dam_km    DOUBLE,
    phone_number            VARCHAR(50),
    opening_hours           VARCHAR(255),
    stock_description       VARCHAR(500),
    google_maps_url         VARCHAR(500),
    FOREIGN KEY (dam_id) REFERENCES dams(id)
);

CREATE TABLE IF NOT EXISTS resorts (
    id                    BIGINT AUTO_INCREMENT PRIMARY KEY,
    dam_id                BIGINT NOT NULL,
    name                  VARCHAR(255) NOT NULL,
    description           VARCHAR(1000),
    website_url           VARCHAR(500),
    phone_number          VARCHAR(100),
    accommodation_types   VARCHAR(500),
    fishing_access        VARCHAR(500),
    facilities            VARCHAR(1000),
    price_from            VARCHAR(200),
    FOREIGN KEY (dam_id) REFERENCES dams(id)
);
