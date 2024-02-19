package com.kh.hope.program.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.hope.program.model.service.ProgramService;
import com.kh.hope.program.model.vo.Likes;
import com.kh.hope.program.model.vo.Program;
import com.kh.hope.program.model.vo.Request;
import com.kh.hope.user.model.vo.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProgramController {
	
	@Autowired
	private ProgramService service;
	
	@GetMapping("/program/list")
	public String selectProgramList(
			Model model) {
		List<Program> list = service.selectProgramList();
		model.addAttribute("list", list);
		System.out.println(list);
		return "program/programList";
	}
	
	// 프로그램 만들기
	@GetMapping("/program/insert")
	public String insertProgram() {
		return "program/programForm";
	}
	
	@PostMapping("/program/insert")
	public String insertProgram(Program program, RedirectAttributes ra) {
		
		int result = service.insertProgram(program);
		
		String url = "";
		
		if(result > 0) {
//			ra.addFlashAttribute("successMessage", "글 작성 완료");
			System.out.println("메뉴 등록 성공");
			
		}else {
			System.out.println("메뉴 등록 실패");
		}
		return "program/programForm";	
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
