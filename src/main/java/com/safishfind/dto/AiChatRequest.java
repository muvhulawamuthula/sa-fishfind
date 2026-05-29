package com.safishfind.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AiChatRequest {
    private Long damId;       // Which dam is the user asking about
    private String question;  // The angler's question
}
