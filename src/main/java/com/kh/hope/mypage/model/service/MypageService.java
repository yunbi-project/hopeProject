package com.kh.hope.mypage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hope.mypage.model.dao.MypageDao;
import com.kh.hope.mypage.model.vo.Editprofile;
import com.kh.hope.mypage.model.vo.Mypage;

@Service
public class MypageService {

	@Autowired
	private MypageDao mypageDao;

	public List<Mypage> selectMypageDonateList() {
		return mypageDao.selectMypageDonateList();
	}
	
	public List<Mypage> selectMypageBookmarkList() {
		return mypageDao.selectMypageBookmarkList();
	}

	public List<Mypage> selectMypageProgramList() {
		return mypageDao.selectMypageProgramList();
	}
	
	public List<Editprofile> selectEditProfileList() {
		return mypageDao.selectEditProfileList();
	}
	
	

	
	
	
}
