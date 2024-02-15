package com.kh.hope.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hope.board.model.dao.BoardDao;
import com.kh.hope.board.model.vo.Board;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDao dao;

	@Override
	public List<Board> noticeList() {
		
		return dao.noticeList();
	}

	@Override
	public List<Board> faqList() {
		
		return dao.faqList();
	}

	@Override
	public List<Board> storyList() {
		
		return dao.storyList();
	}
}
