package com.kh.springboot.member.model.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class MemberEntity { // 소셜로그인 
	
	private Long id;
	private String username;
	private String email;
	private String role;
	private String loginType;
	private String providerid;

	private int userNo;
	private String password;
	private String phone;
	private String status;
	// 실질적으로 db에 저장되는 vo는  email, userNo, userName, loginType, status, role
}
