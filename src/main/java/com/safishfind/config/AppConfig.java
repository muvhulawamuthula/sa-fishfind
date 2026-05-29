package com.safishfind.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.reactive.function.client.WebClient;

@Configuration
@EnableWebSecurity
public class AppConfig {

    // WebClient for outbound Anthropic API calls
    @Bean
    public WebClient webClient() {
        return WebClient.builder()
                .codecs(config -> config.defaultCodecs().maxInMemorySize(2 * 1024 * 1024))
                .build();
    }

    // Security config — open for now, lock down before production
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            .csrf(AbstractHttpConfigurer::disable)
            .authorizeHttpRequests(auth -> auth
                // Public endpoints — anyone can read dam data
                .requestMatchers("/api/v1/dams/**").permitAll()
                .requestMatchers("/api/v1/advisor/**").permitAll()
                .requestMatchers("/actuator/health").permitAll()
                // Everything else requires auth (future user features)
                .anyRequest().authenticated()
            );
        return http.build();
    }
}
