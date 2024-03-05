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

import com.kh.hope.chat.model.vo.Chat;
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
public class ProgramController {

	@Autowired
	private ProgramService service;

	// 프로그램 리스트
	@GetMapping("/program/list")
	public String selectProgramList(Model model, RedirectAttributes ra, Program program,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "ingOnly", required = false) Boolean ingOnly, @RequestParam Map<String, Object> map) {
		// 페이지네이션 구현
		int listCount = service.selectListCount(map);
		int pageLimit = 10;
		int boardLimit = 10;

		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		// 리스트
		List<Program> list = service.selectProgramList(pi, map);

		// 진행중인 게시글만 필터링 -> 리스트로
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
		if (loginUser.getUserNo() == 1) {
			program.setUserNo(loginUser.getUserNo());
			return "program/programForm";
		} else {
			session.setAttribute("alertMsg", "관리자만 접근 가능합니다. 로그인 후 이용해주세요.");
			return "redirect:/program/list";
		}
	}

	// 프로그램 , 채팅방 다중인설트
	@PostMapping("/program/insert")
	public String insertProgram(@ModelAttribute("loginUser") User loginUser, Program program, RedirectAttributes ra, HttpSession session
			) {
		//로그인 유저 관리자
		if (loginUser.getUserNo() ==1) {
			program.setUserNo(loginUser.getUserNo());
		} else {
			ra.addFlashAttribute("alertMsg", "프로그램 등록은 로그인 후 이용해주세요.");
		}
		
		Chat c = new Chat();
		// 채팅방 회원 번호, 제목
		c.setUserNo(loginUser.getUserNo());
		c.setChatTitle(program.getProgramName());
		// 프로그램 번호
		c.setProgramNo(program.getProgramNo());

		// 게시글 작성 및 채팅방 생성
		int result = service.insertProgram(program, c);

		if (result > 0) {
			ra.addFlashAttribute("alertMsg", "활동 게시글이 등록되었습니다. 목록페이지로 돌아갑니다.");
			return "redirect:/program/list"; // 등록 성공 시 목록 페이지로 리디렉션
		} else {
			ra.addFlashAttribute("alertMsg", "활동 게시글 등록에 실패했습니다. 다시 시도해주세요.");
			return "redirect:/program/new"; // 등록 실패 시 다시 등록 페이지로 리디렉션
		}
	}

	// 프로그램 디테일
	@GetMapping("/program/detail/{programNo}")
	public String detailProgram(@PathVariable int programNo, Model model, HttpSession session, Chat c) {

		Program program = service.detailProgram(programNo);
		int count = service.requestCount(programNo);
		
		User loginUser = (User) session.getAttribute("loginUser");
		int userNo = 0;

		// 로그인한 경우
		if (loginUser != null) {
			userNo = loginUser.getUserNo();
			
			int like = service.isLikeExists(userNo, programNo);
			int requestCount = service.isRequestExists(userNo, programNo);
			
			model.addAttribute("like", like);
			model.addAttribute("requestCount", requestCount);
			model.addAttribute("userNo", userNo);
		}
			model.addAttribute("program", program);
			model.addAttribute("count", count);

		// programNo값이랑 같은 채팅방을 가져온다.
		c.setProgramNo(programNo);

		int chatNo = service.selectChatRoomNo(c);
		model.addAttribute("chatNo", chatNo);

		return "program/programDetail";
	}

	// like insert
	@PostMapping("/program/detail/like/{programNo}")
	public ResponseEntity<String> programLike(@PathVariable int programNo, @ModelAttribute("loginUser") User loginUser,
			HttpSession session, Model model) {
		Likes l = new Likes().builder().programNo(programNo).userNo(loginUser.getUserNo()).build();

		int result = service.programLike(l);
		return ResponseEntity.ok(result + "");
	}

	// like delete
	@PostMapping("/program/detail/unlike/{programNo}")
	public ResponseEntity<String> programUnlike(@PathVariable int programNo, HttpSession session,
			@ModelAttribute("loginUser") User loginUser) {

		Likes l = new Likes().builder().programNo(programNo).userNo(loginUser.getUserNo()).build();
		int result = service.programUnlike(l);
		return ResponseEntity.ok(result + "");
	}

	// program 지원
	@PostMapping("/program/detail/request/{programNo}")
	public ResponseEntity<String> requestProgram(@PathVariable int programNo, @RequestParam int userNo,
			HttpSession session, Model model) {

		Request request = new Request().builder().programNo(programNo).userNo(userNo).build();

		int result = service.requestProgram(request);
		return ResponseEntity.ok(result + "");
	}

	// 프로그램 업데이트 get
	@GetMapping("/program/update/{programNo}")
	public String programUpdate(@PathVariable("programNo") int programNo, HttpSession session, Model model) {
		Program program = service.detailProgram(programNo);

		User loginUser = (User) session.getAttribute("loginUser");

		if (loginUser != null) {
			model.addAttribute("program", program);

			return "program/programUpdate";
		} else {
			session.setAttribute("alertMsg", "로그인 후 이용해주세요.");
			return "redirect:/program/list";
		}
	}

	// 프로그램 수정
	@PostMapping("/program/update/{programNo}")
	public String programUpdate(@ModelAttribute("loginUser") User loginUser, Program program, RedirectAttributes ra,
			HttpSession session) {
		if (loginUser.getUserNo() ==1) {
			program.setUserNo(loginUser.getUserNo());
		} else {
			ra.addFlashAttribute("alertMsg", "로그인 후 이용해주세요.");
		}

		int result = service.updateProgram(program);

		if (result > 0) {
			ra.addFlashAttribute("alertMsg", "활동 게시글이 수정되었습니다. 목록페이지로 돌아갑니다.");
		}
		return "redirect:/program/list";
	}

	@GetMapping("/program/delete/{programNo}")
	public String programDelete(@PathVariable("programNo") int programNo, Model m, RedirectAttributes ra,
			@ModelAttribute("loginUser") User loginUser, Program program) {

		if (loginUser.getUserNo() ==1) {
			int result = service.deleteProgram(programNo);

			if (result > 0) {
				ra.addFlashAttribute("alertMsg", "게시글 삭제에 성공하였습니다.");

			} else {
				ra.addFlashAttribute("alertMsg", "삭제에 실패하였습니다.");
			}
		}

		return "redirect:/program/list";
	}

}
