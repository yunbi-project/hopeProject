package com.kh.hope.product.model.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.hope.product.model.service.ProductService;
import com.kh.hope.product.model.vo.Product;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes({"donateType"})
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/product")
	public String product() {
		return "product/donateProduct";
	}
	
	
	@GetMapping("/product/donateProductForm")
	public String prductForm() {
		
		return "product/donateProductForm";
	}
	
//	proudct 페이지에서 proudctForm으로 이동할 때 donateType(개인, 기업) 전달
    @PostMapping("/product.bo")
    public String handleDonationForm(@RequestParam("donateType") String donateType, Model model) {
        // donateType을 사용하여 원하는 처리를 수행합니다.
        // 이 예제에서는 donateType을 콘솔에 출력하겠습니다.
        System.out.println("선택된 기부 유형: " + donateType);
        model.addAttribute("donateType", donateType);
        
        // 다음에 할 작업에 따라 적절한 뷰 이름을 반환합니다.
        // 여기서는 새로운 페이지로 이동할 것이므로 해당 뷰 이름을 반환합니다.
        return "redirect:/product/donateProductForm";
    }
    
    @PostMapping("/product/donateProductForm")
    public String insertProduct(
    		Product p,
    		Model model,
			HttpSession session) {
    	
    	
    	
    	log.info("Product : {}", p);
    	

    	int result = productService.insertProduct(p);
    	
    	
    	String url = "";
    	if(result > 0) {
    		session.setAttribute("alertMsg", "물품 기부가 성공적으로 신청되었습니다.");
    		System.out.println("물품 등록 성공");
    		url = "product/donateProductResult";
    		
    	}else {
    		model.addAttribute("errorMsg", "물품 기부 신청에 실패하였습니다.");
    		System.out.println("물품 등록 실패");
    		
    	}
    	
    	return url;
    }
    
    
//    휴대폰 전화번호 인증
    @PostMapping("/sendSMS1.do") //jsp 페이지 넘긴 mapping 값
    @ResponseBody    
        public String sendSMS(String phone) {
     
            Random rand  = new Random(); //랜덤숫자 생성하기 !!
            String numStr = "";
            for(int i=0; i<4; i++) {
                String ran = Integer.toString(rand.nextInt(10));
                numStr+=ran;
            }
            
            
            productService.certifiedPhoneNumber(phone, numStr); //휴대폰 api 쪽으로 가기 !!

             
              return numStr;
        }
    
    
//  물품기부 신청 후, 물품기부 번호 확인
	@GetMapping("/product/donateProductResult")
	public String donateProductResult() {
		
		return "product/donateProductResult";
	}
    

}