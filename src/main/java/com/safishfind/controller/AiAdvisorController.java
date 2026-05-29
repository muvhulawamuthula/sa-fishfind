package com.safishfind.controller;

import com.safishfind.dto.AiChatRequest;
import com.safishfind.dto.AiChatResponse;
import com.safishfind.service.AiAdvisorService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/advisor")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class AiAdvisorController {

    private final AiAdvisorService aiAdvisorService;

    // POST /api/v1/advisor/ask
    // Body: { "damId": 1, "question": "What bait works best for carp here?" }
    @PostMapping("/ask")
    public ResponseEntity<AiChatResponse> askAdvisor(@RequestBody AiChatRequest request) {
        AiChatResponse response = aiAdvisorService.ask(request);
        return ResponseEntity.ok(response);
    }
}
