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
	public String selectProgramList(Model model, RedirectAttributes ra, Program program ,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "ingOnly", required = false) Boolean ingOnly
			, @RequestParam Map<String, Object> map			
			) {
		log.info("map 정보확인 {}" , map);
		
		int listCount=service.selectListCount(map);
		int pageLimit = 10;
		int boardLimit = 10;
		
		log.info("program 정보확인 {}" , program);
		
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
	public String insertProgram(Program program, RedirectAttributes ra, HttpSession session) {
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser != null) {
			program.setUserNo(loginUser.getUserNo());
		}else {
				ra.addFlashAttribute("alertMsg", "프로그램 등록은 로그인 후 이용해주세요.");
				System.out.println("로그인 필요");
			}

			int result = service.insertProgram(program);

			if (result > 0) {
				ra.addFlashAttribute("alertMsg", "활동 게시글이 등록되었습니다. 목록페이지로 돌아갑니다.");
				System.out.println("등록 성공");

			} else {
				ra.addFlashAttribute("alertMsg", "회원정보를 정확히 입력해주세요");
				System.out.println("메뉴 등록 실패");
			}
		
		return "redirect:/program/list";
	}

	// 프로그램 디테일
	@GetMapping("/program/detail/{programNo}")
	public String detailProgram(@PathVariable int programNo, Model model) {
		Program program = service.detailProgram(programNo);
		int count = service.requestCount(programNo);
		if (count > 0) {
			ResponseEntity.ok(count);
		}
		model.addAttribute("program", program);
		model.addAttribute("count", count);
		return "program/programDetail";
	}

	// 프로그램 신청, request insert
	@PostMapping("/program/detail/{programNo}")
	public String requestProgram(@PathVariable int programNo, Request r, Likes l, HttpSession session,
			Model model, RedirectAttributes ra) {

		 int userNo = 0;
		 User loginUser = (User) session.getAttribute("loginUser");

		 if (loginUser != null) {
	        userNo = loginUser.getUserNo();
	        r.setUserNo(userNo);
		    l.setUserNo(userNo);
		    l.setProgramNo(programNo);
		    
	        Request request = service.requestSelectProgram(r);
	        Likes likes = service.isLikeExists(l);
	        System.out.println(likes);
	        if(likes != null) {
	        	model.addAttribute("alertMsg", "이미 찜한 게시물입니다. 마이페이지에서 확인해주세요.");
	        	model.addAttribute("likes", likes);
	        }else {
	        	model.addAttribute("alertMsg", "관심있는 게시글 저장했습니다. 마이페이지에서 확인해주세요.");
	        	int result = service.programLike(l);
	        }
	        
	        if (request != null) {
	            // 이미 요청한 경우
	        	model.addAttribute("alertMsg", "이미 지원한 게시글입니다. 마이페이지에서 확인해주세요.");
	        	model.addAttribute("r", request);
	        } else {
	            // 새로운 요청인 경우
	            int result = service.requestProgram(r);
	            if (result > 0) {
	                model.addAttribute("alertMsg", "프로그램 지원 완료");
	            }
	        }
		        model.addAttribute("r", r);
		    } else {
		        session.setAttribute("alertMsg", "로그인 후 이용해주세요.");
		    }
		return "redirect:/program/programDetail/{programNo}";
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
