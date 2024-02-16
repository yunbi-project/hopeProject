package com.kh.hope.product.model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hope.product.model.service.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
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
	
	
    @PostMapping("/productForm.bo")
    public String handleDonationForm(@RequestParam("donateType") String donateType, Model model) {
        // donateType을 사용하여 원하는 처리를 수행합니다.
        // 이 예제에서는 donateType을 콘솔에 출력하겠습니다.
        System.out.println("선택된 기부 유형: " + donateType);
        model.addAttribute("donateType", donateType);
        
        // 다음에 할 작업에 따라 적절한 뷰 이름을 반환합니다.
        // 여기서는 새로운 페이지로 이동할 것이므로 해당 뷰 이름을 반환합니다.
        return "redirect:/product/donateProductForm";
    }
    
    
	
	
	/*
	 * @PostMapping("/product.bo") public String
	 * processProductForm(@RequestParam("donateGood") String donateType,
	 * HttpServletRequest request) { // donateGood 값을 사용하여 필요한 로직을 처리
	 * 
	 * // 적절한 뷰로 리다이렉트 (컨텍스트 경로를 포함하여) String contextPath =
	 * request.getContextPath(); return "redirect:" + contextPath +
	 * "/product/donateProductForm"; }
	 */
}