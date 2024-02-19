package com.kh.hope.mypage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.hope.mypage.model.service.MypageService;
import com.kh.hope.mypage.model.vo.Editprofile;
import com.kh.hope.mypage.model.vo.Mypage;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@GetMapping("/mypage")
	public String mypageList(
			Model model
			) {
		List<Mypage> donatelist = mypageService.selectMypageDonateList();
		System.out.println(donatelist);
		model.addAttribute("donatelist",donatelist);
		
		List<Mypage> bookmarklist = mypageService.selectMypageBookmarkList();
		System.out.println(bookmarklist);
		model.addAttribute("bookmarklist",bookmarklist);
		
		List<Mypage> programlist = mypageService.selectMypageProgramList();
		System.out.println(programlist);
		model.addAttribute("programlist",programlist);
		
		return "mypage/mypage";
	}
	
	@GetMapping("/editprofile")
	public String editprofileList(
			Model model
			) {
		List<Editprofile> editprofilelist = mypageService.selectEditProfileList();
		System.out.println(editprofilelist);
		model.addAttribute("editprofilelist",editprofilelist);
		
		return "editprofile/editprofile";
	}
	
	
	
}
