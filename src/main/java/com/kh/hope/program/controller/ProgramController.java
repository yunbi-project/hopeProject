package com.kh.hope.program.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.hope.common.Template.model.vo.Pagenation;
import com.kh.hope.common.model.vo.PageInfo;
import com.kh.hope.program.model.service.ProgramService;
import com.kh.hope.program.model.vo.Likes;
import com.kh.hope.program.model.vo.Program;
import com.kh.hope.program.model.vo.Request;
import com.kh.hope.user.model.vo.User;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@SessionAttributes({ "loginUser" })
@Slf4j
public class ProgramController {

	@Autowired
	private ProgramService service;
	

	@GetMapping("/program/list")
	public String selectProgramList(Model model, RedirectAttributes ra, Program program,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "ingOnly", required = false) Boolean ingOnly, @RequestParam Map<String, Object> map) {
//		log.info("map 정보확인 {}", map);

		int listCount = service.selectListCount(map);
		int pageLimit = 10;
		int boardLimit = 10;

//		log.info("program 정보확인 {}", program);

		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		List<Program> list = service.selectProgramList(pi, map);

		if (ingOnly != null && ingOnly) {
			map.put("ingOnly", ingOnly);
			listCount = service.selectListCount(map);
			list = service.filterList(pi, map);
		} else {
			listCount = service.selectListCount(map);
			list = service.selectProgramList(pi, map);
		}

		model.addAttribute("list", list);

		model.addAttribute("pi", pi);
		model.addAttribute("param", map);

		return "program/programList";
	}

	// 프로그램 만들기
	@GetMapping("/program/insert")
	public String insertProgram(@ModelAttribute("loginUser") User loginUser, Program program, HttpSession session) {
		if (loginUser != null) {
			program.setUserNo(loginUser.getUserNo());
			return "program/programForm";
		} else {
			session.setAttribute("alertMsg", "로그인 후 이용해주세요.");
			return "redirect:/program/list";
		}
	}

	@PostMapping("/program/insert")
	public String insertProgram(@ModelAttribute("loginUser") User loginUser, Program program, RedirectAttributes ra, HttpSession session) {
		if (loginUser != null) {
			program.setUserNo(loginUser.getUserNo());
		} else {
			ra.addFlashAttribute("alertMsg", "프로그램 등록은 로그인 후 이용해주세요.");
			System.out.println("로그인 필요");
		}

		int result = service.insertProgram(program);

		if (result > 0) {
			ra.addFlashAttribute("alertMsg", "활동 게시글이 등록되었습니다. 목록페이지로 돌아갑니다.");
			System.out.println("등록 성공");
		}

		return "redirect:/program/list";
	}

	// 프로그램 디테일
	@GetMapping("/program/detail/{programNo}")
	public String detailProgram(@PathVariable int programNo, Model model, HttpSession session) {
		Program program = service.detailProgram(programNo);
		int count = service.requestCount(programNo);
		
		int userNo = 0;
		
		User loginUser = (User) session.getAttribute("loginUser");
		
		userNo = loginUser.getUserNo();
		
		int like = service.isLikeExists(userNo, programNo);
		int requestCount = service.isRequestExists(userNo, programNo);
//		System.out.println(like);
		System.out.println(requestCount);
		
		model.addAttribute("program", program);
		model.addAttribute("count", count);
		model.addAttribute("like", like);
		model.addAttribute("requestCount", requestCount);

		return "program/programDetail";
	}

	// like insert
	@PostMapping("/program/detail/like/{programNo}")
	public ResponseEntity<String> programLike(@PathVariable int programNo, @RequestParam("loginUser") int userNo, HttpSession session,
			Model model) {
			Likes l = new Likes().builder().programNo(programNo).userNo(userNo).build();
			
			int result = service.programLike(l);
			return ResponseEntity.ok(result+"");
		}

	// like delete
	@PostMapping("/program/detail/unlike/{programNo}")
	public ResponseEntity<String> programUnlike(
			@PathVariable int programNo, @RequestParam int userNo,
			HttpSession session
			) {
		Likes l = new Likes().builder().programNo(programNo).userNo(userNo).build();
		int result = service.programUnlike(l);
		return ResponseEntity.ok(result+"");
	}
	
	// program 지원
	@PostMapping("/program/detail/request/{programNo}")
	public ResponseEntity<String> requestProgram(@PathVariable int programNo, @RequestParam int userNo, HttpSession session, Model model) {

		Request request = new Request().builder().programNo(programNo).userNo(userNo).build(); 
				
//		int result = service.requestSelectProgram(request);
		int result = service.requestProgram(request);
		return ResponseEntity.ok(result+"");
	}

}
