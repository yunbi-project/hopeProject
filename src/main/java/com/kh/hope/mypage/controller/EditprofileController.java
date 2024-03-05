package com.kh.hope.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hope.mypage.model.service.EditprofileService;
import com.kh.hope.user.model.vo.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class EditprofileController {

    @Autowired
    private EditprofileService editprofileService;
    
    @GetMapping("/editprofile")
    public String showEditProfileForm() {
        // 프로필 정보 수정 폼을 보여주는 페이지로 이동
        return "mypage/editprofile";
    }
    
    @PostMapping("editprofile")
	public String updateUser(
			User user,
			@RequestParam("postcode") String postcode,
			@RequestParam("address") String address,
			@RequestParam("detailAddress") String detailAddress,
			HttpSession session,
			Model model) {
	
	User loginUser= (User)session.getAttribute("loginUser");
	int userNo = loginUser.getUserNo();
	
	String userName = user.getUserName();
	user.setUserNo(userNo);
	
	String total =  address +  "," + postcode +  "," + detailAddress;
	user.setAddress(total);
	
	int result = editprofileService.updateUser(user);
	
	
	
	return "redirect:/editprofile";
	}
}
