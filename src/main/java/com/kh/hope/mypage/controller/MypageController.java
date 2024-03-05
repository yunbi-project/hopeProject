package com.kh.hope.mypage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.hope.mypage.model.service.MypageService;
import com.kh.hope.mypage.model.vo.Mypage;
import com.kh.hope.user.model.vo.User;

import jakarta.servlet.http.HttpSession;

@Controller
@SessionAttributes({"loginUser"})
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@GetMapping("/mypage")
	public String mypageList(
			HttpSession session,
			Model model
			) {
		
		User loginUser= (User)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			session.setAttribute("alertMsg", "로그인을 해주세요.");
			return "redirect:/";
		}else {
			
			int userNo = loginUser.getUserNo();
			
			List<Mypage> donatelistp = mypageService.selectMypageDonateListP(userNo);
			model.addAttribute("donatelistp",donatelistp);
			
			List<Mypage> donatelistm = mypageService.selectMypageDonateListM(userNo);
			model.addAttribute("donatelistm",donatelistm);
		
			List<Mypage> bookmarklist = mypageService.selectMypageBookmarkList(userNo);
			model.addAttribute("bookmarklist",bookmarklist);
			
			List<Mypage> programlist = mypageService.selectMypageProgramList(userNo);;
			model.addAttribute("programlist",programlist);
			
			return "mypage/mypage";
		}
	}
	
	@PostMapping("/mypage")
	@ResponseBody
	public String deleteBookmark(@RequestParam("programNo") int programNo, HttpSession session) {
	    User loginUser = (User) session.getAttribute("loginUser");
	    if (loginUser == null) {
	        return "redirect:/"; // 로그인되지 않은 경우 처리
	    }
	    
	    int userNo = loginUser.getUserNo();

	    boolean deleted = mypageService.deleteBookmark(userNo, programNo);
	    if (deleted) {
	        return "success"; // 삭제 성공
	    } else {
	        return "failed"; // 삭제 실패
	    }
	}
	
	
	
	
	
	
	
}
