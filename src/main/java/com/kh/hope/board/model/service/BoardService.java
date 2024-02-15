package com.kh.hope.board.model.service;

import java.util.List;

import com.kh.hope.board.model.vo.Board;

public interface BoardService {

	List<Board> noticeList();

	List<Board> faqList();

	List<Board> storyList();

}
