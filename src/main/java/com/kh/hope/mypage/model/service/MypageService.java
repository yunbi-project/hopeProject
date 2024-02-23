package com.kh.hope.mypage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.hope.mypage.model.dao.MypageDao;
import com.kh.hope.mypage.model.vo.Mypage;

@Service
public class MypageService {

	@Autowired
	private MypageDao mypageDao;

	public List<Mypage> selectMypageDonateListP(int userNo) {
		return mypageDao.selectMypageDonateListP(userNo);
	}
	
	public List<Mypage> selectMypageDonateListM(int userNo) {
		return mypageDao.selectMypageDonateListM(userNo);
	}
		
	public List<Mypage> selectMypageBookmarkList(int userNo) {
		return mypageDao.selectMypageBookmarkList(userNo);
	}

	public List<Mypage> selectMypageProgramList(int userNo) {
		return mypageDao.selectMypageProgramList(userNo);
	}

	public boolean deleteBookmark(int userNo, int programNo) {
		return mypageDao.deleteBookmark(userNo, programNo);
	}
	


	
	
}
