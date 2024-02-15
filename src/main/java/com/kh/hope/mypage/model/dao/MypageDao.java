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
	
	public List<Mypage> selectMypageList() {
		return session.selectList("mypageMapper.mypageList");
	}

	
}
