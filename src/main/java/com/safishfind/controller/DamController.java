package com.safishfind.controller;

import com.safishfind.dto.DamDTO;
import com.safishfind.service.DamService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/dams")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")  // Tighten this in production
public class DamController {

    private final DamService damService;

    @GetMapping
    public ResponseEntity<List<DamDTO>> getAllDams() {
        return ResponseEntity.ok(damService.getAllDams());
    }

    @GetMapping("/{id}")
    public ResponseEntity<DamDTO> getDamById(@PathVariable Long id) {
        return damService.getDamById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping("/name/{name}")
    public ResponseEntity<DamDTO> getDamByName(@PathVariable String name) {
        return damService.getDamByName(name)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping("/nearby")
    public ResponseEntity<List<DamDTO>> getDamsNearMe(
            @RequestParam double lat,
            @RequestParam double lng,
            @RequestParam(defaultValue = "100") double radius) {
        return ResponseEntity.ok(damService.getDamsNearMe(lat, lng, radius));
    }

    @GetMapping("/filter/chalets")
    public ResponseEntity<List<DamDTO>> getDamsWithChalets() {
        return ResponseEntity.ok(damService.getDamsWithChalets());
    }

    @GetMapping("/filter/camping")
    public ResponseEntity<List<DamDTO>> getDamsWithCamping() {
        return ResponseEntity.ok(damService.getDamsWithCamping());
    }
}
