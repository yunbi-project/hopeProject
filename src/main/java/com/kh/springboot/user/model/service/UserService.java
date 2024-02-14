package com.kh.springboot.user.model.service;

import com.kh.springboot.user.model.vo.User;

public interface UserService {


	User loginUser(String email);

	int insertUser(User user);

	int idCheck(String email);

	User idfind(String name, String phone);

	User pwdfind(String email, String phone);

	int repassword(String password, String email);


}