package com.safishfind.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DamDTO {

    private Long id;
    private String name;
    private String region;
    private String address;
    private Double latitude;
    private Double longitude;

    // Fees
    private Double entranceFeeAdult;
    private Double entranceFeeChild;
    private Double campingFeePerNight;
    private Double chaletFeePerNight;
    private Boolean chaletsAvailable;
    private Boolean campingAvailable;

    // Info
    private String description;
    private String bestFishingTimes;
    private String activityLevel;

    // Safety
    private String dangerAdvisory;
    private Boolean hipposPresent;
    private Boolean crocodilesPresent;
    private Boolean bilharziaRisk;

    private String imageUrl;

    private List<FishSpeciesDTO> fishSpecies;
    private List<BaitShopDTO> nearbyBaitShops;

    // ── Nested DTOs ──────────────────────────────────────────────

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class FishSpeciesDTO {
        private Long id;
        private String commonName;
        private String scientificName;
        private String bestBait;
        private String bestRig;
        private String bestTechnique;
        private String averageSize;
        private String recordSize;
        private String bestSeason;
        private String imageUrl;
    }

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class BaitShopDTO {
        private Long id;
        private String name;
        private String address;
        private Double latitude;
        private Double longitude;
        private Double distanceFromDamKm;
        private String phoneNumber;
        private String openingHours;
        private String stockDescription;
        private String googleMapsUrl;
    }
}
