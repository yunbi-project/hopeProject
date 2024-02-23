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

@Controller
@SessionAttributes({"loginUser"})
public class ProgramController {
	
	@Autowired
	private ProgramService service;
	
	@GetMapping("/program/list")
	public String selectProgramList(
			Model model,
			@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			@RequestParam Map<String,Object> map) {
		int listCount = service.selectListCount(map);
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagenation.getPageInfo(listCount,currentPage,pageLimit,boardLimit);
		
		List<Program> list = service.selectProgramList(pi, map);
		model.addAttribute("list", list);
		model.addAttribute("pi",pi);
		model.addAttribute("param",map);
		System.out.println(list);
		return "program/programList";
	}
	
	// 프로그램 만들기
	@GetMapping("/program/insert")
	public String insertProgram(@ModelAttribute("loginUser") User loginUser,
			Program program, HttpSession session) {
		if(loginUser != null) {
			program.setUserNo(loginUser.getUserNo());		
			return "program/programForm";
		}else {
			session.setAttribute("errorMeslsage", "로그인 후 이거 왜 안되냐고 ");
			return "redirect:/program/list";
		}
	}
	
	@PostMapping("/program/insert")
	public String insertProgram(Program program, RedirectAttributes ra) {
		
		int result = service.insertProgram(program);
		
		String url = "";
		
		if(result > 0) {
			ra.addFlashAttribute("alertMessage", "활동 게시글이 등록되었습니다. 목록페이지로 돌아갑니다.");
			System.out.println("등록 성공");
			
		}else {
			ra.addFlashAttribute("errorMsg", "회원정보를 정확히 입력해주세요");
			System.out.println("메뉴 등록 실패");
		}
		return "redirect:/program/list";	
	}
	
	//프로그램 디테일
	@GetMapping("/program/detail/{programNo}")
	public String detailProgram(@PathVariable int programNo, Model model) {
		Program program = service.detailProgram(programNo);
		int count = service.requestCount(programNo);
		if(count > 0) {
			ResponseEntity.ok(count);
		}
		model.addAttribute("program", program);
		model.addAttribute("count", count);
		return "program/programDetail";
	}
	
	public boolean isLikeExists(int programNo, int userNo) {
        // 데이터베이스에서 해당 프로그램 번호와 사용자 번호의 좋아요가 있는지 확인
        return service.isLikeExists(programNo, userNo);
    }
	
	//프로그램 신청, request insert
	@PostMapping("/program/detail/{programNo}")
	public String requestProgram(
			@PathVariable int programNo, 
			Request r,
			Likes l,
			HttpSession session,
			RedirectAttributes ra) {
		
		service.requestProgram(r);
		
		int userNo = 0;
		User loginUser = (User) session.getAttribute("loginUser");
		
		if(loginUser != null) {
			userNo = loginUser.getUserNo();
		}
		r.setUserNo(loginUser.getUserNo());
		l.setUserNo(loginUser.getUserNo());
		
		if(isLikeExists(programNo, userNo)) {
			ra.addAttribute("errorMessage", "이미 찜한 게시글입니다. 마이페이지에서 확인해주세요.");
		}else {
			service.programLike(l);
		}

		return "program/programDetail";	
	}
	
//	@DeleteMapping("/program/detail/{programNo}")
//	public String programUnlikes(
//			@PathVariable int programNo,
//			Likes l,
//			HttpSession session
//			) {
//		User loginUser = (User) session.getAttribute("loginUser");
//		int userNo = 0;
//		if(loginUser != null) {
//			userNo = loginUser.getUserNo();
//		}
//		
//		if(l.getUserNo() == userNo) {
//			service.programUnlikes(l);
//		}
//		
//		return "redirect:/program/detail/{programNo}";
//	}
	
}
