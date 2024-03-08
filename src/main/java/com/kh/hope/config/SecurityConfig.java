package com.kh.hope.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

import com.kh.hope.member.service.CustomOAuth2UserService;
import com.kh.hope.user.oauth2.CustomClientRegistrationRepo;

import lombok.RequiredArgsConstructor;


@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig {

    private final CustomOAuth2UserService customOAuth2UserService;
    private final CustomClientRegistrationRepo customClientRegistrationRepo;
    
    // SecurtiyConfig 생성자는 CustomOAuth2UserService를 주입 받는다.

   
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
		    	.authorizeHttpRequests((auth) -> auth
		    		.requestMatchers("/**","/login", "login.me","singup.me").permitAll()
		    		.requestMatchers("/admin/**").hasRole("ADMIN") 
		    		.requestMatchers("/mypage").hasAnyRole("ADMIN","USER")
		    		.anyRequest().permitAll()
		    		);	
        http
                .oauth2Login((oauth2) -> oauth2		// OAuth2 로그인 기능에 대한 진입점
                		.loginPage("/login")
                		.clientRegistrationRepository(customClientRegistrationRepo.clientRegistrationRepository())
                        .userInfoEndpoint((userInfoEndpointConfig) -> 
                         userInfoEndpointConfig.userService(customOAuth2UserService)));
        

        return http.build();
    }
}