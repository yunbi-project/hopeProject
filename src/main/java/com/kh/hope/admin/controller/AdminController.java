package com.kh.hope.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.hope.admin.model.service.AdminService;
import com.kh.hope.admin.model.vo.BlackList;
import com.kh.hope.user.model.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/adminIndex")
	public String index() {
		
	
		
		return "admin/adminIndex";
	}
	
	@GetMapping("/charts")
	public String charts() {
		return "admin/charts";
	}
	
	@GetMapping("/tables")
	public String tables() {
		return "admin/tables";
	}
	
	// 회원 리스트 조회
	@GetMapping("/memberList")
	public String memberList(Model model) {
		
		List<User> list = adminService.selectAllUser();
		
		model.addAttribute("list", list);
		
		log.info("list의 정보 {}" , list);
		
		return "admin/memberList";
	}
	
	@GetMapping("/boardManagement")
	public String boardManagement() {
		return "admin/boardManagement";
	}

	// 사용자 삭제
	@PostMapping("/deleteUser")
	@ResponseBody
	public String deleteUser(@RequestParam("userNo") int userNo,
						     @RequestParam("reason") String reason) {
		
		int user = adminService.deleteUser(userNo, reason);
		
		log.info("userNo 값 {}" , userNo);
		log.info("comment 정보 {}" , reason);
		if(user > 0) {
			return "success";
		}
		return "error";
	}
	// 회원정보 확인
	@GetMapping("/getUserOne")
	@ResponseBody
	public User getUserOne(@RequestParam("userNo") int userNo,
							Model model
			) {
		System.out.println(userNo);
		User userOne = adminService.getUserOne(userNo);
		log.info("userOne {}" , userOne);
		
		
		return userOne;
	}
	
	// 회원정보 확인 수정
	@PostMapping("/updateUserInfo")
	@ResponseBody
	public String updateUserInfo(User user) {
		
		log.info("update user 정보 {}", user);
		int result = adminService.updateUserInfo(user);

		if(result > 0) {
			return "success";
		}
		return "error";
	}
	
	// 검색기능
	@PostMapping("/searchUserByName")
	@ResponseBody
	public List<User> searchUserByName(@RequestParam("userName") String userName) {
		
		
		List<User> userByName = adminService.searchUserByName(userName); 
		
		log.info("userByName 정보 확인 : {}" ,userByName);
		
		return userByName;
	}	
	// 블랙리스트 조회
	@GetMapping("/blackListView")
	private String blackListView(Model model) {
		
		List<BlackList> list = adminService.blackListView();
		
		model.addAttribute("list" , list);
		
		log.info("list 정보 확인 : {}" , list);
		
		
		return "admin/blackListView";
	}
	// 블랙리스트 정지풀기
	@PostMapping("/releseStop")
	@ResponseBody
	public String releseStop(@RequestParam("userNo") int userNo) {
		
		// User 테이블 정지풀기
		int result = adminService.releseStop(userNo);
		int stop = 0;
		
		if(result > 0) {
			stop = adminService.modifyUserStop(userNo);
		}
		
		if (stop > 0) { 
			return "success";
		}
		
		return "error";
	}
	
	// 블랙리스트 회원번호 검색
	@PostMapping("/searchByUserNo")
	@ResponseBody
	public List<BlackList> searchByUserNo(@RequestParam("userNo") int userNo) {
		
		log.info("userNo 정보확인 : {}" , userNo);
		
		List<BlackList> list = adminService.searchByUserNo(userNo);

		return list; 
	}
	
}
