package com.kh.hope;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/")
	public String home() {
		return "mainPage";
	}
	
	@GetMapping("/errorPage")
	public String errorPage() {
		return "common/errorPage";
	}
}
