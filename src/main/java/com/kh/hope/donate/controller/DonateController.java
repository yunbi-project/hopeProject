package com.kh.hope.donate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.kh.hope.donate.model.service.DonateService;
import com.kh.hope.donate.model.vo.Donate;

@Controller
public class DonateController {

	@Autowired
	private DonateService service;
	
	@GetMapping("/donate/list")
	public String donateList(Model model) {
		List<Donate> list = service.donateList();
		
		model.addAttribute("list", list);
		System.out.println(list);
		return "donate/donateList";
	}
	
	@GetMapping("/donate/detail/{donateNo}")
	public String donateDetail(@PathVariable int donateNo, Model model ) {
		Donate donate = service.donateDetail(donateNo);
		model.addAttribute("donate", donate);
		return "donate/donateDetail";
	}
}
