package com.safishfind.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Entity
@Table(name = "fish_species")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class FishSpecies {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "dam_id", nullable = false)
    private Dam dam;

    @Column(nullable = false)
    private String commonName;          // e.g. "Carp"

    private String scientificName;      // e.g. "Cyprinus carpio"

    @Column(length = 500)
    private String bestBait;            // e.g. "Maize, bread, boilies"

    @Column(length = 500)
    private String bestRig;             // e.g. "Hair rig, method feeder"

    @Column(length = 500)
    private String bestTechnique;       // e.g. "Bottom fishing, float fishing"

    private String averageSize;         // e.g. "2-8 kg"
    private String recordSize;         // e.g. "14 kg"

    // Season availability
    private String bestSeason;         // e.g. "Year-round, peaks in summer"

    private String imageUrl;
}
