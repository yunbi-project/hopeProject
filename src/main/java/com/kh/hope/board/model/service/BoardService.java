package com.kh.hope.board.model.service;

import java.util.List;
import java.util.Map;

import com.kh.hope.board.model.vo.Board;
import com.kh.hope.common.model.vo.PageInfo;

public interface BoardService {

	/*noticeList*/
	int selectListCount(Map<String, Object> map);
	
	List<Board> noticeList(PageInfo pi, Map<String, Object> map);
	
	/*FAQList*/
	List<Board> faqList();

	List<Board> storyList();

	List<Board> faqList1();

	List<Board> faqList2();

	List<Board> faqList3();


}
