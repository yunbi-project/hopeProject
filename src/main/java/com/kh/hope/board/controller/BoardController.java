package com.kh.hope.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.hope.board.model.service.BoardService;
import com.kh.hope.board.model.vo.Board;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes({"loginUser"})
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService service;
	
	/*각 페이지 리스트조회*/
	/*공지사항*/
	@GetMapping("/N")
	public String NoticeList(Model m) {
		List<Board> list = service.noticeList();
		m.addAttribute("list", list);
		return "board/SnoticeList";
	}
	/*자주묻는질문*/
	@GetMapping("/Q")
	public String faqList(Model m) {
		List<Board> list = service.faqList();
		m.addAttribute("list", list);		
		return "board/SFAQList";
	}
	/*이야기*/
	@GetMapping("/C")
	public String storyList(Model m) {		
		 List<Board> list = service.storyList();
		 m.addAttribute("list", list);
		 System.out.println(list);		 
		return "board/SstoryList";
	}
	/*나눔후기*/
	@GetMapping("/R")
	public String reviewList(Model m) {					 
		return "board/SreviewList";
	}
}
