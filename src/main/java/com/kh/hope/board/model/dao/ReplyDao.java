package com.kh.hope.board.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hope.board.model.vo.Reply;
import com.kh.hope.board.model.vo.Report;

@Repository
public class ReplyDao {
	
	@Autowired
	private SqlSessionTemplate session;

	public int insertReply(Reply r) {
		return session.insert("boardMapper.insertReply",r);
	}

	public List<Reply> replyList(int boardNo) {
		return session.selectList("boardMapper.replyList",boardNo);
	}

	public int updateReply(Map<String,Object> params) {
	    return session.update("boardMapper.updateReply", params);
	}

	public int deleteReply(int replyNo) {
		
		return session.update("boardMapper.deleteReplyOnly",replyNo);
	}

	public int insertReport(Report rp) {

		return session.insert("boardMapper.insertReport",rp);
	}

	
}
