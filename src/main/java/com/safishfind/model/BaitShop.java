package com.safishfind.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Entity
@Table(name = "bait_shops")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class BaitShop {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "dam_id", nullable = false)
    private Dam dam;

    @Column(nullable = false)
    private String name;

    private String address;

    private Double latitude;
    private Double longitude;

    // Distance from dam gate in km
    private Double distanceFromDamKm;

    private String phoneNumber;

    // Opening hours e.g. "Mon-Fri 06:00-18:00, Sat-Sun 05:00-17:00"
    private String openingHours;

    // What they stock
    @Column(length = 500)
    private String stockDescription;

    private String googleMapsUrl;
}
