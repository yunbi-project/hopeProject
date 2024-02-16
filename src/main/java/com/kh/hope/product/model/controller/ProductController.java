package com.kh.hope.product.model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	
	
	@GetMapping("/product.bo")
	public String productForm() {
		
		
		return "product/donateProductForm";
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