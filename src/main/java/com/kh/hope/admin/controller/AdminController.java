package com.kh.hope.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.hope.admin.model.service.AdminService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/admin/adminIndex")
	public String index() {
		return "admin/adminIndex";
	}
	
	@GetMapping("/admin/charts")
	public String charts() {
		return "admin/charts";
	}
	
	@GetMapping("/admin/tables")
	public String tables() {
		return "admin/tables";
	}
	
	@GetMapping("/admin/memberList")
	public String memberList() {
		return "admin/memberList";
	}
	
	@GetMapping("/admin/boardManagement")
	public String boardManagement() {
		return "admin/boardManagement";
	}

}
