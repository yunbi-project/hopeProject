package com.kh.hope.main.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hope.board.model.vo.Board;
import com.kh.hope.donate.model.vo.Donate;
import com.kh.hope.main.model.vo.MainTotal;

@Repository
public class MainDao {
	
	@Autowired
	private SqlSessionTemplate session;

//	공지사항 리스트
	public List<Board> selectNoticeList5(Map<String, Object> map) {
		return session.selectList("mainMapper.selectNoticeList5", map);
	}

//  나눔소식 리스트
	public List<Board> selectShareListTop(Map<String, Object> map) {
		return session.selectList("mainMapper.selectShareListTop", map);
	}

//	마감임박 후원
	public Donate selectDonateEnd() {
		return session.selectOne("mainMapper.selectDonateEnd");
	}
	
//  후원 리스트
	public List<Donate> selectDonateList(Map<String, Object> map) {
		return session.selectList("mainMapper.selectDonateList", map);
	}

//	총 후원자 수, 총 봉사지원자 수
	public MainTotal selectTotal() {
		return session.selectOne("mainMapper.selectTotal");
	}



}
