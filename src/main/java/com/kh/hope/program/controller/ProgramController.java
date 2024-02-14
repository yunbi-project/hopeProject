package com.kh.hope.program.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.hope.program.model.service.programService;
import com.kh.hope.program.model.vo.Program;

import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ProgramController {
	
	@Autowired
	private programService service;
	
	@GetMapping("/program/programList")
	public List<Program> selectProgramList(
			Model model,
			HttpServletResponse res
			){
		List<Program> list = service.selectProgramList();
		System.out.println(list);
		model.addAttribute("list", list);
		return list;
	}
	
//	@GetMapping("/programDetail")
//	public String selectProgramDetail(
////			@PathVariable int programNo
//			) {
////		Program program = service.selectProgramDetail(programNo);
////		ResponseEntity<Program> res = null;
////		
////		if(program == null) {
////			res = ResponseEntity.notFound().build();
////		}else {
////			res = ResponseEntity.ok().body(program);
////		}
////		return res;
//		return "programDetail";
//	}

}
