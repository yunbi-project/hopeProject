package com.kh.hope.donate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.kh.hope.donate.model.service.DonateService;
import com.kh.hope.donate.model.vo.CurrentUser;
import com.kh.hope.donate.model.vo.Donate;
import com.kh.hope.payment.model.service.PaymentService;
import com.kh.hope.payment.model.vo.PaymentData;
import com.kh.hope.user.model.service.UserService;
import com.kh.hope.user.model.vo.User;

@Controller
public class DonateController {

	@Autowired
	private DonateService service;
	private UserService userService;
	private PaymentService paymentService;
	
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
		
		if(donate != null) {
		List<CurrentUser> currentUser = service.selectCurrentUser(donateNo);
		
		model.addAttribute("donate", donate);
		model.addAttribute("currentUser",currentUser);
		}
		
//		User user = this.userService.loginUser("qq@gmail.com");
//		int paymentId = (int)System.currentTimeMillis();
//		
////		PaymentData paymentData = this.service.save(paymentData);
//		
//		//멀티PG 분기(db로 관리할 수 있다)
//		String[] pg_code = {"nice"};
//		String[] channelKey = {"channel-key-be913655-023d-46c3-8d64-730c0335ab55"};
//		
//		long seleted_pg = donateNo % 2;
//		
//		//스토어 아이디
//		model.addAttribute("storeId", "store-8f6f306a-dbde-4b32-b80e-d224a95b48a9" );
//		
//		//pg사 채널키
//		model.addAttribute("channelKey", channelKey[(int)seleted_pg]);
//		
//		//상점주문번호
//		model.addAttribute("paymentId", paymentId);
//		
//		//회원, 도네이트, 주문정보
//		model.addAttribute("user", user);
//		model.addAttribute("donate", donate);
//		model.addAttribute("paymentData", paymentData);
		
		return "donate/donateDetail";
	}
	
}
