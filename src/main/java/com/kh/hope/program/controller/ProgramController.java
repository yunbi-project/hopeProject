package com.kh.hope.program.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.kh.hope.program.model.service.ProgramService;
import com.kh.hope.program.model.vo.Program;

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
		return "/program/programList";
	}
	
	@GetMapping("/program/insert")
	public String insertProgram() {
		return "/program/programForm";
	}
//	
//	@PostMapping("/program/insert")
//	public String insertProgram(@RequestBody Program p) {
////		int result = service.insertProgram(p);
//		
//		if(result >0) {
//			System.out.println("메뉴 등록 성공");
//		}else {
//			System.out.println("메뉴 등록 실패");
//		}
//		return "/program/programForm";
//	}
}
