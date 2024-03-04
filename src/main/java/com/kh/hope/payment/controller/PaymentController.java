package com.kh.hope.payment.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.hope.donate.model.service.DonateService;
import com.kh.hope.payment.model.service.PaymentService;
import com.kh.hope.payment.model.vo.PaymentInfo;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@SessionAttributes({"loginUser"})
public class PaymentController {
	
	@Autowired
	private PaymentService service;
	
	@Autowired
	private DonateService donateService;
	
	
	
    private final IamportClient api;

    public PaymentController() {
        this.api = new IamportClient("4631557810013234",
                "RXaZxN71ApyiafDqHj0MYP7Hdgf1HmyxMbS3cbDXKbiRXKJVsMMWIy4N6dAJ10iLw9XkaziiW7h92YhD");
    }


	@ResponseBody
	@RequestMapping(value="/verifyiamport/{imp_uid}", method=RequestMethod.POST)
	public IamportResponse<Payment> paymentByImpUid(Model model, Locale locale, HttpSession session
			, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException{	
		
			return api.paymentByImpUid(imp_uid);
	}
    

	
	
	//결제 완료 시 DB에 결제 완료 처리 - 02.15
	//관리자 페이지 코드 추가 - 02.19
	@RequestMapping(value="/paySuccess", method=RequestMethod.POST)
	public void paySuccess(    
    		int donateNo,
    		int donateAmount,
    		String optionalText,
    		int userNo,
    		String anonymous,
			RedirectAttributes ra,
			PaymentInfo payInfo,
			HttpServletRequest request) {
		

		System.out.println(donateNo + donateAmount + optionalText + userNo + anonymous);
		

		
		Map<String, Object> map = new HashMap<>();
		map.put("donateNo", donateNo);
		map.put("userNo", userNo);
		map.put("donateAmount", donateAmount);
		map.put("optionalText", optionalText);
		map.put("anonymous", anonymous);
		
		int result = service.insertPay(map);
		

		if(result > 0) {
			ra.addFlashAttribute("alertMsg", "성공적으로 결제되었습니다.");
			System.out.println("결제 성공");
		}else {
			ra.addFlashAttribute("alertMsg", "결제하는데 실패하였습니다.");
			System.out.println("결제 실패");
		}
		
	}	
	

	
}
