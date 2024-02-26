package com.kh.hope.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hope.board.model.dao.ReplyDao;
import com.kh.hope.board.model.vo.Reply;

@Service
public class ReplyServiceImpl implements ReplyService{

	
	@Autowired
	private ReplyDao dao;
	
	@Override
	public int insertReply(Reply r) {
		
		return dao.insertReply(r);
	}
	
	

	
	
}
