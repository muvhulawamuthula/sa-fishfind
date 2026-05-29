package com.safishfind.service;

import com.safishfind.dto.DamDTO;
import com.safishfind.model.BaitShop;
import com.safishfind.model.Dam;
import com.safishfind.model.FishSpecies;
import com.safishfind.model.Resort;
import com.safishfind.repository.DamRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class DamService {

    private final DamRepository damRepository;

    public List<DamDTO> getAllDams() {
        return damRepository.findAll()
                .stream()
                .map(this::toDTO)
                .collect(Collectors.toList());
    }

    public Optional<DamDTO> getDamById(Long id) {
        return damRepository.findById(id).map(this::toDTO);
    }

    public Optional<DamDTO> getDamByName(String name) {
        return damRepository.findByNameIgnoreCase(name).map(this::toDTO);
    }

    public List<DamDTO> getDamsNearMe(double lat, double lng, double radiusKm) {
        return damRepository.findDamsNearLocation(lat, lng, radiusKm)
                .stream()
                .map(this::toDTO)
                .collect(Collectors.toList());
    }

    public List<DamDTO> getDamsWithChalets() {
        return damRepository.findByChaletsAvailableTrue()
                .stream()
                .map(this::toDTO)
                .collect(Collectors.toList());
    }

    public List<DamDTO> getDamsWithCamping() {
        return damRepository.findByCampingAvailableTrue()
                .stream()
                .map(this::toDTO)
                .collect(Collectors.toList());
    }

    // ── Mapper: Dam entity → DamDTO ──────────────────────────────

    private DamDTO toDTO(Dam dam) {
        DamDTO dto = new DamDTO();
        dto.setId(dam.getId());
        dto.setName(dam.getName());
        dto.setRegion(dam.getRegion());
        dto.setAddress(dam.getAddress());
        dto.setLatitude(dam.getLatitude());
        dto.setLongitude(dam.getLongitude());
        dto.setEntranceFeeAdult(dam.getEntranceFeeAdult());
        dto.setEntranceFeeChild(dam.getEntranceFeeChild());
        dto.setCampingFeePerNight(dam.getCampingFeePerNight());
        dto.setChaletFeePerNight(dam.getChaletFeePerNight());
        dto.setChaletsAvailable(dam.getChaletsAvailable());
        dto.setCampingAvailable(dam.getCampingAvailable());
        dto.setDescription(dam.getDescription());
        dto.setBestFishingTimes(dam.getBestFishingTimes());
        dto.setActivityLevel(dam.getActivityLevel());
        dto.setDangerAdvisory(dam.getDangerAdvisory());
        dto.setHipposPresent(dam.getHipposPresent());
        dto.setCrocodilesPresent(dam.getCrocodilesPresent());
        dto.setBilharziaRisk(dam.getBilharziaRisk());
        dto.setImageUrl(dam.getImageUrl());

        // Map fish species
        if (dam.getFishSpecies() != null) {
            dto.setFishSpecies(dam.getFishSpecies().stream()
                    .map(this::toSpeciesDTO)
                    .collect(Collectors.toList()));
        }

        // Map bait shops
        if (dam.getNearbyBaitShops() != null) {
            dto.setNearbyBaitShops(dam.getNearbyBaitShops().stream()
                    .map(this::toBaitShopDTO)
                    .collect(Collectors.toList()));
        }

        // Map resorts
        if (dam.getResorts() != null) {
            dto.setResorts(dam.getResorts().stream()
                    .map(this::toResortDTO)
                    .collect(Collectors.toList()));
        }

        return dto;
    }

    private DamDTO.FishSpeciesDTO toSpeciesDTO(FishSpecies s) {
        DamDTO.FishSpeciesDTO dto = new DamDTO.FishSpeciesDTO();
        dto.setId(s.getId());
        dto.setCommonName(s.getCommonName());
        dto.setScientificName(s.getScientificName());
        dto.setBestBait(s.getBestBait());
        dto.setBestRig(s.getBestRig());
        dto.setBestTechnique(s.getBestTechnique());
        dto.setAverageSize(s.getAverageSize());
        dto.setRecordSize(s.getRecordSize());
        dto.setBestSeason(s.getBestSeason());
        dto.setImageUrl(s.getImageUrl());
        return dto;
    }

    private DamDTO.ResortDTO toResortDTO(Resort r) {
        DamDTO.ResortDTO dto = new DamDTO.ResortDTO();
        dto.setId(r.getId());
        dto.setName(r.getName());
        dto.setDescription(r.getDescription());
        dto.setWebsiteUrl(r.getWebsiteUrl());
        dto.setPhoneNumber(r.getPhoneNumber());
        dto.setAccommodationTypes(r.getAccommodationTypes());
        dto.setFishingAccess(r.getFishingAccess());
        dto.setFacilities(r.getFacilities());
        dto.setPriceFrom(r.getPriceFrom());
        return dto;
    }

    private DamDTO.BaitShopDTO toBaitShopDTO(BaitShop b) {
        DamDTO.BaitShopDTO dto = new DamDTO.BaitShopDTO();
        dto.setId(b.getId());
        dto.setName(b.getName());
        dto.setAddress(b.getAddress());
        dto.setLatitude(b.getLatitude());
        dto.setLongitude(b.getLongitude());
        dto.setDistanceFromDamKm(b.getDistanceFromDamKm());
        dto.setPhoneNumber(b.getPhoneNumber());
        dto.setOpeningHours(b.getOpeningHours());
        dto.setStockDescription(b.getStockDescription());
        dto.setGoogleMapsUrl(b.getGoogleMapsUrl());
        return dto;
    }
}
