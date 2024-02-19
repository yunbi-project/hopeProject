package com.kh.hope.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hope.board.model.dao.BoardDao;
import com.kh.hope.board.model.vo.Board;
import com.kh.hope.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDao dao;


	/*공지사항리스트*/
	@Override
	public int selectListCount(Map<String, Object> map) {
		
		return dao.selectListCount(map);
	}

	@Override
	public List<Board> noticeList(PageInfo pi, Map<String, Object> map) {
	
		return dao.noticeList(pi,map);
	}
	/*자주묻는질문*/
	@Override
	public List<Board> faqList() {
		
		return dao.faqList();
	}
	@Override
	public List<Board> faqList1() {
		// TODO Auto-generated method stub
		return dao.faqList1();
	}
	

	@Override
	public List<Board> faqList2() {
		
		return dao.faqList2();
	}

	@Override
	public List<Board> faqList3() {
		
		return dao.faqList3();
	}
	/*이야기리스트*/
	@Override
	public List<Board> storyList() {
		
		return dao.storyList();
	}

	
}
