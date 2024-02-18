package com.kh.hope.member.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.kh.hope.member.dto.CustomOAuth2User;
import com.kh.hope.member.dto.GoogleResponse;
import com.kh.hope.member.dto.NaverResponse;
import com.kh.hope.member.dto.OAuth2Response;
import com.kh.hope.member.model.vo.MemberEntity;
import com.kh.hope.user.model.dao.UserDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

/*
 * DefaultOAuth2UserService 상속받아서 CustomOAuth2UserService 클래스로 커스터마이징 
 * 
 * 필요한 컬럼 username, email , role 을 받아야하기 때문.
 * */

@Service
public class CustomOAuth2UserService extends DefaultOAuth2UserService {
    
    @Autowired
    private UserDao memberEntityMapperDao;
    
    @Autowired
    private HttpServletRequest request;
    
    
    // OAuth2UserRequest로부터 사용자 정보를 로드하는 메서드를 재정의합니다.
    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        
    	
    	// 세션을 가져오기 위해 HttpServletRequest를 사용합니다.
        HttpSession session = request.getSession();
        
    	// 기본 DefaultOAuth2UserService의 loadUser 메서드를 호출하여 OAuth2 사용자 정보를 가져온다.
        OAuth2User oAuth2User = super.loadUser(userRequest);
        System.out.println("사용자 == " + oAuth2User.getAttributes());
        
        // 가져온 사용자 정보에서 registrationId를 가져옵니다.
        String registrationId = userRequest.getClientRegistration().getRegistrationId();
        OAuth2Response oAuth2Response = null;
        
        

        
        MemberEntity member = new MemberEntity(); // 사용자 엔티티 객체 생성

        // registrationId에 따라 OAuth2Response를 설정
        if(registrationId.equals("naver")) {
            oAuth2Response = new NaverResponse(oAuth2User.getAttributes());
            member.setLoginType("4"); // 네이버 => 4 로그인 타입 설정
    
            
        } else if (registrationId.equals("google")) {
            oAuth2Response = new GoogleResponse(oAuth2User.getAttributes());
            member.setLoginType("3"); // 구글 => 3 로그인 타입 설정
            
        } else {
            return null; // 해당하는 registrationId가 없으면 null 반환
           
        }
        
        String userName = oAuth2Response.getName();
        String providerid = oAuth2Response.getName()+" "+oAuth2Response.getProviderId();
        
        
        
        // username으로 MemberEntity를 조회합니다.
        MemberEntity existData = memberEntityMapperDao.findByUsername(providerid);
        String role = "B";

        // 조회된 MemberEntity가 없으면 새로운 사용자로 등록합니다.
        if(existData == null) { // 처음 로그인한경우 insert
            member.setUserName(oAuth2Response.getName());
            member.setEmail(oAuth2Response.getEmail());
            member.setRole(role); // 사용자 역할 설정
            member.setProviderid(providerid);
            
            memberEntityMapperDao.save(member); // 사용자 엔티티 저장
            session.setAttribute("loginUser", member);
            
           
         // loginUser 객체 선언 이후에 세션에서 가져와야 합니다.
            MemberEntity loginUser = (MemberEntity) session.getAttribute("loginUser");
            
        } else { // 이미 로그인을 진행한 경우 update
            existData.setUserName(userName);
            existData.setEmail(oAuth2Response.getEmail());
            existData.setLoginType(member.getLoginType()); // 로그인 타입 설정
            memberEntityMapperDao.update(existData); // 사용자 엔티티 업데이트
            
            session.setAttribute("loginUser", existData);
            
            MemberEntity loginUser = (MemberEntity) session.getAttribute("loginUser");
            System.out.println( "else : " + loginUser.getUserName());
        }

        // CustomOAuth2User 객체를 생성하여 반환합니다.
        return new CustomOAuth2User(oAuth2Response , role);
    }
}
