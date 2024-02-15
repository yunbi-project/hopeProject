package com.kh.hope.mypage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.hope.mypage.model.service.MypageService;
import com.kh.hope.mypage.model.vo.Mypage;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@GetMapping("/mypage")
	public String mypageList(
			Model model
			
			) {
		List<Mypage> list = mypageService.selectMypageList();
		model.addAttribute("list",list);
		System.out.println(list);
		return "/member/mypage";
	}
	
	
}
