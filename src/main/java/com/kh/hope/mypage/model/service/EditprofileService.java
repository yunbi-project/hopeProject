package com.kh.hope.mypage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hope.mypage.model.dao.EditprofileDao;

import com.kh.hope.user.model.vo.User;

@Service
public class EditprofileService {
	
	@Autowired
	private EditprofileDao editprofileDao;

	public int updateUser(User user) {
		return editprofileDao.updateUser(user);
		
	}

	

	

	
	
	


}
