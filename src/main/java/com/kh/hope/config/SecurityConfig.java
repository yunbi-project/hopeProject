package com.kh.hope.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

import com.kh.hope.member.service.CustomOAuth2UserService;

import oracle.net.aso.h;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    private final CustomOAuth2UserService customOAuth2UserService;
    
    // SecurtiyConfig 생성자는 CustomOAuth2UserService를 주입 받는다.

    public SecurityConfig(CustomOAuth2UserService customOAuth2UserService) {

        this.customOAuth2UserService = customOAuth2UserService;
    }


    // httpSecurity
    // 
    /*
     * "SecurityFilterChain" 
     * 이 필터 체인은 웹 요청에 대한 보안 규칙을 적용하는데 사용되고, 특정 URL 패턴 또는 요청에 대해 적용되는 보안 설정을 정의한다.
     * 인증된 사용자에 대해서만 접근을 허용하는지 또는 특정 권환이 있는지를 확인할 수 있다.
     * 
     * "HttpSecurity"
     *  HttpSecurity를 사용하여 Spring Security가 요청을 처리하는 방법을 정의할 수 있다.
     *  예를 들어, 'csrf', 'httpBasic', 'formLogin', 'oauth2Login'과 같은 다양한 보안 설정을 구성할 수 있다.
     *  
     *  HttpSecurity를 통해 사용자가 로그인할 때, 로그아웃할 때, 권한이 없는 페이지에 접근할 때 등 다양한 시나리오에 대한 보안 규칙을 정의할 수 있다.
     * */
    
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        http.headers((headerConfig) -> headerConfig.frameOptions(config->config.disable()))
                .csrf((csrf) -> csrf.disable())
                .cors( cors -> cors.disable());

        http
                .formLogin((login) -> login.disable());

        http
                .httpBasic((basic) -> basic.disable());

        http
                .oauth2Login((oauth2) -> oauth2		// OAuth2 로그인 기능에 대한 진입점
                		.loginPage("/login")
                        .userInfoEndpoint((userInfoEndpointConfig) -> 
                         userInfoEndpointConfig.userService(customOAuth2UserService)));

        http
                .authorizeHttpRequests((auth) -> auth
                        .requestMatchers("/**" ).permitAll()	// 모든 요청 허용
                        .anyRequest().permitAll());		    // 인증된 요청만 허용

        return http.build();
    }
}