package com.kh.hope.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.hope.board.model.service.BoardService;
import com.kh.hope.board.model.vo.Board;
import com.kh.hope.common.Template.model.vo.Pagenation;
import com.kh.hope.common.model.vo.PageInfo;

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
	public String NoticeList(
			Model m,
			@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			@RequestParam Map<String,Object> map
			) {		
		int listCount = service.selectListCount(map);
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagenation.getPageInfo(listCount,currentPage,pageLimit,boardLimit);
				
		List<Board> list = service.noticeList(pi,map);
		m.addAttribute("list", list);
		m.addAttribute("pi",pi);
		m.addAttribute("param",map);
		System.out.println(list);
		return "board/SnoticeList";
	}
	/*자주묻는질문*/
	@GetMapping("/Q")
	public String faqList(Model m) {
		List<Board> list = service.faqList();
		m.addAttribute("list", list);		
		return "board/SFAQList";
	}
	/*자주묻는질문 물품기부*/
	@GetMapping("/Q/1")
	public String faqList1(Model m) {
		List<Board> list = service.faqList1();
		m.addAttribute("list", list);		
		return "board/SFAQListProduct";
	}
	@GetMapping("/Q/2")
	public String faqList2(Model m) {
		List<Board> list = service.faqList2();
		m.addAttribute("list", list);		
		return "board/SFAQListProduct2";
	}
	@GetMapping("/Q/3")
	public String faqList3(Model m) {
		List<Board> list = service.faqList3();
		m.addAttribute("list", list);		
		return "board/SFAQListProduct3";
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
