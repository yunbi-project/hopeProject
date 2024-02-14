package com.kh.springboot.member.dto;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.core.user.OAuth2User;


public class CustomOAuth2User implements OAuth2User {

    private final OAuth2Response oAuth2Response; // oauth 2 응답데이터
    private final String role;	// 사용자 역할

    public CustomOAuth2User(OAuth2Response oAuth2Response, String role) {
        this.oAuth2Response = oAuth2Response;		
        this.role = role;	
    }

    // 사용자의 Oauth2 응답 데이터 반환
    @Override
    public Map<String, Object> getAttributes() {
        return null;
    }

    // 사용자의 권환 정보 반환
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() { // role값

        Collection<GrantedAuthority> collection = new ArrayList<>();

        // 사용자의 역할을 GrantedAuthority로 추가
        collection.add(new GrantedAuthority() {

            @Override
            public String getAuthority() {

                return role;
            }
        });

        return collection;
    }

    // 사용자의 이름 반환 
    @Override
    public String getName() {

        return oAuth2Response.getName();
    }

    // 필요할 수 있어서 이름을 (제공자 + 제공자 아이디) 만들어봤음.
    public String getUsername() {

        return oAuth2Response.getProvider()+" "+oAuth2Response.getProviderId();
    }
}