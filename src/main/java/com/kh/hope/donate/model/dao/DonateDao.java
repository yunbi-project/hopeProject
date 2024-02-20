package com.kh.hope.donate.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hope.donate.model.vo.CurrentUser;
import com.kh.hope.donate.model.vo.Donate;

@Repository
public class DonateDao {
	
	@Autowired
	private SqlSession session;

	public List<Donate> donateList() {
		return session.selectList("donate.donateList");
	}

	public Donate donateDetail(int donateNo) {
		return session.selectOne("donate.donateDetail", donateNo);
	}

	public List<CurrentUser> selectCurrentUser(int donateNo) {
		return session.selectList("donate.selectCurrentUser", donateNo);
	}

}
