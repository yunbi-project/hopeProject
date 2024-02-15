package com.kh.hope.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.hope.product.model.service.ProductService;


@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/product")
	public String product() {
		return "/product/donateProduct";
	}
}