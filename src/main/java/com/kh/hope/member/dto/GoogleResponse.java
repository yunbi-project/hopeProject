package com.kh.hope.member.dto;

import java.util.Map;

public class GoogleResponse implements OAuth2Response{

    private final Map<String, Object> attribute;

    // googel api로부터 받아온 사용자의 정보를 Map 형태로 정보를 담아준다.
    public GoogleResponse(Map<String, Object> attribute) {
        this.attribute = attribute;
    }


    @Override
    public String getProvider() {
        return "google";
    }

    // api에서 발급해주는 아이디 반환
    @Override
    public String getProviderId() {
    	// google 응답 데이터의 "sub" 키에 해당하는 값을 문자열로 변환
        return attribute.get("sub").toString();
        
    }

    @Override
    public String getEmail() {
    	// email 키에 해당하는 값을 문자열로 변환 
        return attribute.get("email").toString();
    }

    @Override
    public String getName() {
    	// google 응답 데이터의 name 키에 값 문자열로 변환
        return attribute.get("name").toString();
    }
   
}
