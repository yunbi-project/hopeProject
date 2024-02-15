package com.kh.hope.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hope.user.model.dao.UserDao;
import com.kh.hope.user.model.vo.User;



@Service
public class UserServiceImpl implements UserService {
	
	
	@Autowired
	private UserDao userDao;

	@Override
	public User loginUser(String email) {
		return userDao.loginUser(email);
	}

	@Override
	public int insertUser(User user) {
		return userDao.insertUser(user);
	}

	@Override
	public int idCheck(String email) {
		return userDao.idCheck(email);
	}

	@Override
	public User idfind(String name, String phone) {
		return userDao.idfind(name, phone);
	}

	@Override
	public User pwdfind(String email, String phone) {
		return userDao.pwdfind(email, phone);
	}

	@Override
	public int repassword(String password, String email) {
		return userDao.repassword(password, email);
	}

}
