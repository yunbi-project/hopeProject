package com.kh.hope.user.model.vo;

import com.kh.hope.user.model.vo.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class User {
	
	private String email;
	private int userNo;
	private String password;
	private String phone;
	private String userName;
	private String loginType;
	private String status;
	private String role;
	private String confirmPassword;
}