package com.safishfind.service;

import com.safishfind.dto.AiChatRequest;
import com.safishfind.dto.AiChatResponse;
import com.safishfind.dto.DamDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Slf4j
public class AiAdvisorService {

    private final DamService damService;
    private final WebClient webClient;

    @Value("${anthropic.api.key}")
    private String anthropicApiKey;

    private static final String ANTHROPIC_API_URL = "https://api.anthropic.com/v1/messages";
    private static final String MODEL = "claude-opus-4-8";

    public AiChatResponse ask(AiChatRequest request) {
        // Fetch the dam's full data to give Claude context
        DamDTO dam = damService.getDamById(request.getDamId())
                .orElseThrow(() -> new RuntimeException("Dam not found: " + request.getDamId()));

        String systemPrompt = buildSystemPrompt(dam);

        // Call Anthropic API
        Map<String, Object> requestBody = Map.of(
                "model", MODEL,
                "max_tokens", 1024,
                "system", systemPrompt,
                "messages", List.of(
                        Map.of("role", "user", "content", request.getQuestion())
                )
        );

        try {
            Map<?, ?> response = webClient.post()
                    .uri(ANTHROPIC_API_URL)
                    .header("x-api-key", anthropicApiKey)
                    .header("anthropic-version", "2023-06-01")
                    .header("content-type", "application/json")
                    .bodyValue(requestBody)
                    .retrieve()
                    .bodyToMono(Map.class)
                    .block();

            String answer = extractAnswer(response);
            return new AiChatResponse(answer, dam.getName(), dam.getId());

        } catch (Exception e) {
            log.error("Anthropic API call failed", e);
            return new AiChatResponse(
                    "Sorry, the AI advisor is temporarily unavailable. Please check the dam info above for guidance.",
                    dam.getName(),
                    dam.getId()
            );
        }
    }

    // Builds a rich system prompt using all the dam's data
    private String buildSystemPrompt(DamDTO dam) {
        StringBuilder sb = new StringBuilder();
        sb.append("You are SA FishFind's expert fishing advisor for South African dams, specifically Gauteng.\n");
        sb.append("You are knowledgeable, practical, and speak like a local South African fishing expert.\n");
        sb.append("Keep answers concise and useful. Use local terms (e.g. 'lekker spot', 'boilies', 'hairig').\n\n");

        sb.append("The angler is asking about: ").append(dam.getName()).append("\n\n");
        sb.append("DAM DETAILS:\n");
        sb.append("- Location: ").append(dam.getAddress()).append("\n");
        sb.append("- Best fishing times: ").append(dam.getBestFishingTimes()).append("\n");
        sb.append("- Activity level: ").append(dam.getActivityLevel()).append("\n");
        sb.append("- Entrance fee: R").append(dam.getEntranceFeeAdult()).append(" per adult\n");

        if (dam.getCampingAvailable()) {
            sb.append("- Camping: R").append(dam.getCampingFeePerNight()).append(" per night\n");
        }
        if (dam.getChaletsAvailable()) {
            sb.append("- Chalets: from R").append(dam.getChaletFeePerNight()).append(" per night\n");
        }

        sb.append("\nFISH SPECIES PRESENT:\n");
        if (dam.getFishSpecies() != null) {
            for (DamDTO.FishSpeciesDTO s : dam.getFishSpecies()) {
                sb.append("- ").append(s.getCommonName())
                        .append(": best bait = ").append(s.getBestBait())
                        .append(", best rig = ").append(s.getBestRig())
                        .append(", average size = ").append(s.getAverageSize()).append("\n");
            }
        }

        sb.append("\nSAFETY ADVISORY:\n");
        sb.append("- Hippos present: ").append(dam.getHipposPresent() ? "YES — keep distance!" : "No").append("\n");
        sb.append("- Crocodiles: ").append(dam.getCrocodilesPresent() ? "YES — do not enter water!" : "No").append("\n");
        sb.append("- Bilharzia risk: ").append(dam.getBilharziaRisk() ? "YES — do not swim" : "Low").append("\n");
        if (dam.getDangerAdvisory() != null) {
            sb.append("- Advisory: ").append(dam.getDangerAdvisory()).append("\n");
        }

        sb.append("\nNEARBY BAIT SHOPS:\n");
        if (dam.getNearbyBaitShops() != null) {
            for (DamDTO.BaitShopDTO shop : dam.getNearbyBaitShops()) {
                sb.append("- ").append(shop.getName())
                        .append(" (").append(shop.getDistanceFromDamKm()).append(" km away), ")
                        .append("hours: ").append(shop.getOpeningHours()).append("\n");
            }
        }

        sb.append("\nAnswer the angler's question using only the information above. ");
        sb.append("If something isn't covered, give practical general South African fishing advice.");
        return sb.toString();
    }

    @SuppressWarnings("unchecked")
    private String extractAnswer(Map<?, ?> response) {
        if (response == null) return "No response from AI advisor.";
        List<?> content = (List<?>) response.get("content");
        if (content == null || content.isEmpty()) return "Empty response from AI advisor.";
        Map<?, ?> firstBlock = (Map<?, ?>) content.get(0);
        return (String) firstBlock.get("text");
    }
}
