package com.kh.hope.user.model.service;

import com.kh.hope.user.model.vo.User;

public interface UserService {


	User loginUser(String email);

	int insertUser(User user);

	int idCheck(String email);

	User idfind(User user);

	User pwdfind(User user);

	int repassword(String password, String email);

	void certifiedPhoneNumber(String phone, String numStr);




}