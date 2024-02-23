package com.kh.hope;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

/* 
 * SpringBootApplication 내부 어노테이션들
 * 
 * 1. SpringBootConfiguration
 * 		- springboot 설정파일임을 의미
 * 
 * 2. EnableAutoConfiguration
 * 		- application-context를 관리해주는 어노테이션
 * 
 * 3. Compoent-scan : 현재 실행된 클래스기준으로, 하위에 속한 모든 클래스들중 빈객체로 등록가능한 클래스인지 검사한다.
 * 		 
 * 
 * */
@EnableScheduling
@SpringBootApplication
public class SpringbootApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringbootApplication.class, args);
	}
	
}
