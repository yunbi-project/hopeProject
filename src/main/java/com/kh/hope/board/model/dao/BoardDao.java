package com.kh.hope.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hope.board.model.vo.Board;

@Repository
public class BoardDao {
	
	@Autowired
	private SqlSessionTemplate session;

	public List<Board> noticeList() {
		
		return session.selectList("boardMapper.noticeList");
	}

	public List<Board> faqList() {
		
		return session.selectList("boardMapper.faqList");
	}

	public List<Board> storyList() {
			return session.selectList("boardMapper.storyList");
	}
}
