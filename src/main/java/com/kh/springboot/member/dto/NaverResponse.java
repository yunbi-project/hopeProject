package com.kh.springboot.member.dto;

import java.util.Map;

//Naver API로부터 받아온 사용자 정보를 처리하는 클래스
public class NaverResponse implements OAuth2Response {

 private final Map<String, Object> attribute;

 // NaverResponse의 생성자. Map 형태의 네이버 api로부터 받아온 사용자 정보를 담아준다.
 public NaverResponse(Map<String, Object> attribute) {
	 
	 this.attribute = (Map<String, Object>) attribute.get("response");
     
     // Naver API의 응답 데이터는 "response" 키에 해당하는 값으로 전달된다.
     // 해당 값은 Map 형태로 받아와서 attribute에 저장.
 }

 // OAuth2Response 인터페이스의 메서드 정의.
 // 인터페이스에 선언된 메서드들을 구현해야함.

 // 제공자(provider)를 반환하는 메서드.
 @Override
 public String getProvider() {
     return "naver"; // Naver 제공자를 나타낸다.
 }

 // 제공자 ID(providerId)를 반환하는 메서드
 @Override
 public String getProviderId() {
     // Naver 응답 데이터의 "id" 키에 해당하는 값을 문자열로 변환하여 반환.
     return attribute.get("id").toString();
 }

 // 사용자 이메일을 반환하는 메서드
 @Override
 public String getEmail() {
     // Naver 응답 데이터의 "email" 키에 해당하는 값을 문자열로 변환하여 반환.
     return attribute.get("email").toString();
 }

 // 사용자 이름을 반환하는 메서드입
 @Override
 public String getName() {
     // Naver 응답 데이터의 "name" 키에 해당하는 값을 문자열로 변환하여 반환합.
     return attribute.get("name").toString();
 }
}