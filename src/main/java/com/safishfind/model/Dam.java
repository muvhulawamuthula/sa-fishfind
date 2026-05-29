package com.safishfind.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

import java.util.List;

@Entity
@Table(name = "dams")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Dam {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String name;

    @Column(nullable = false)
    private String region;          // e.g. "Gauteng North"

    @Column(nullable = false)
    private String address;

    @Column(nullable = false)
    private Double latitude;

    @Column(nullable = false)
    private Double longitude;

    // Fees (in Rands)
    private Double entranceFeeAdult;
    private Double entranceFeeChild;
    private Double campingFeePerNight;
    private Double chaletFeePerNight;

    private Boolean chaletsAvailable;
    private Boolean campingAvailable;

    // Fishing activity description
    @Column(length = 2000)
    private String description;

    // Best fishing times as a simple string (e.g. "05:00-08:00, 17:00-19:00")
    private String bestFishingTimes;

    // General activity level: HIGH / MEDIUM / LOW
    private String activityLevel;

    // Danger advisory text
    @Column(length = 1000)
    private String dangerAdvisory;

    // Hippos / crocs present
    private Boolean hipposPresent;
    private Boolean crocodilesPresent;
    private Boolean bilharziaRisk;

    // Image URL stored in Azure Blob
    private String imageUrl;

    // Relationships
    @OneToMany(mappedBy = "dam", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<FishSpecies> fishSpecies;

    @OneToMany(mappedBy = "dam", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<BaitShop> nearbyBaitShops;
}
