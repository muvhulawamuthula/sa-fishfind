package com.safishfind.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Entity
@Table(name = "resorts")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Resort {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "dam_id", nullable = false)
    private Dam dam;

    @Column(nullable = false)
    private String name;

    @Column(length = 1000)
    private String description;

    private String websiteUrl;
    private String phoneNumber;
    private String accommodationTypes;
    private String fishingAccess;

    @Column(length = 1000)
    private String facilities;

    private String priceFrom;
}
