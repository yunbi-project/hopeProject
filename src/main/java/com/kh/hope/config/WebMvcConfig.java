package com.kh.hope.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.kh.hope.session.Interceptor.SessionExpirationInterceptor;



@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(getSessionExpirationInterceptor()).addPathPatterns("/**") // 모든 요청에 대해 인터셉트
				.excludePathPatterns("/","/idfind" , "/passwordfind" , "idfind.me" , "/idcheck.me" , "pwdfind.me" , "repassword.me"
										,"/idcheck","", "/singup.me","/idCehck" ,"/login.me", "/login","/error","/resources/**" , "logout.me"
										,"/program/list/**", "/program/detail/**", "/board/R" , "/board/C", "/board/N", "/board/Q" , "/board/detail/**",
										"/activityreport/P","/activityreport/P/**","/activityreport/D","/activityreport/D/**","/donate/list",
										"/donate/detail/**","/product/**","/product.bo","/sendSMS1.do","/productNoCheck.bo","productUpdateCheck.bo"); 
	}
	@Bean
	public SessionExpirationInterceptor getSessionExpirationInterceptor() { 
		return new SessionExpirationInterceptor();
	}
}