package com.kh.hope.board.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hope.board.model.vo.Reply;

@Repository
public class ReplyDao {
	
	@Autowired
	private SqlSessionTemplate session;

	public int insertReply(Reply r) {
		return session.insert("boardMapper.insertReply",r);
	}
	
	
}
