package com.kh.hope.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.hope.donate.model.service.DonateService;
import com.kh.hope.donate.model.vo.Donate;
import com.kh.hope.payment.model.service.PaymentService;
import com.kh.hope.payment.model.vo.PaymentData;
import com.kh.hope.payment.model.vo.ReadyResponse;
import com.kh.hope.user.model.vo.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService service;
	
	@Autowired
	private DonateService donateService;
	
	@GetMapping("/donate/payment")
	public @ResponseBody ReadyResponse payReady(PaymentData payment, int totalAmount,
				HttpSession session, Donate d) {
		
		String userNo = ((User)session.getAttribute("loginUser")).getUserNo()+"";
		int donateNo = d.getDonateNo();
		d = donateService.donateDetail(d.getDonateNo());
		
		ReadyResponse readyResponse = service.payReady(payment, totalAmount, userNo, donateNo);
		
		return readyResponse;
	}
	
}
