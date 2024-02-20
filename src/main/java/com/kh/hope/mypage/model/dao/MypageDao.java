package com.kh.hope.mypage.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hope.mypage.model.vo.Mypage;

@Repository
public class MypageDao {

	@Autowired
	private SqlSession session;
	
	public List<Mypage> selectMypageDonateList() {
		return session.selectList("mypageMapper.mypageDonateList");
	}

	public List<Mypage> selectMypageBookmarkList() {
		return session.selectList("mypageMapper.mypageBookmarkList");
	}

	public List<Mypage> selectMypageProgramList() {
		return session.selectList("mypageMapper.mypageProgramList");
	}

	

	

	
	
}
