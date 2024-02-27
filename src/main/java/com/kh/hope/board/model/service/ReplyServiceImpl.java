package com.kh.hope.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hope.board.model.dao.ReplyDao;
import com.kh.hope.board.model.vo.Reply;
import com.kh.hope.board.model.vo.Report;

@Service
public class ReplyServiceImpl implements ReplyService{

	
	@Autowired
	private ReplyDao dao;
	
	@Override
	public int insertReply(Reply r) {
		
		return dao.insertReply(r);
	}

	@Override
	public List<Reply> replyList(int boardNo) {
		return dao.replyList(boardNo);
	}

	@Override
	public int updateReply(int replyNo, String replyContent) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("replyNo", replyNo);
	    params.put("replyContent", replyContent);
	    return dao.updateReply(params);
	}

	@Override
	public int deleteReply(int replyNo) {
		return dao.deleteReply(replyNo);
	}

	@Override
	public int insertReport(Report rp) {
		return dao.insertReport(rp);
	}


	
	
	

	
	
}
