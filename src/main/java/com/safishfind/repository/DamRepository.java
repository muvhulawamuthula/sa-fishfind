package com.safishfind.repository;

import com.safishfind.model.Dam;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface DamRepository extends JpaRepository<Dam, Long> {

    Optional<Dam> findByNameIgnoreCase(String name);

    List<Dam> findByRegionIgnoreCase(String region);

    List<Dam> findByChaletsAvailableTrue();

    List<Dam> findByCampingAvailableTrue();

    // Find dams near a GPS coordinate (within ~50km radius)
    @Query(value = """
        SELECT * FROM dams
        WHERE (6371 * ACOS(
            COS(RADIANS(:lat)) * COS(RADIANS(latitude)) *
            COS(RADIANS(longitude) - RADIANS(:lng)) +
            SIN(RADIANS(:lat)) * SIN(RADIANS(latitude))
        )) < :radiusKm
        ORDER BY (6371 * ACOS(
            COS(RADIANS(:lat)) * COS(RADIANS(latitude)) *
            COS(RADIANS(longitude) - RADIANS(:lng)) +
            SIN(RADIANS(:lat)) * SIN(RADIANS(latitude))
        )) ASC
        """, nativeQuery = true)
    List<Dam> findDamsNearLocation(double lat, double lng, double radiusKm);
}
