package com.kh.hope.product.model.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.hope.product.model.service.ProductService;
import com.kh.hope.product.model.vo.Product;
import com.kh.hope.product.model.vo.ProductCategory;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes({"donateType", "product"})
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/product")
	public String product() {
		return "product/donateProduct";
	}
	
	
	@GetMapping("/product/donateProductForm")
	public String prductForm(Model model) {
		
		List<ProductCategory> list = productService.selectProductCategoryList();
		
		model.addAttribute("list", list);
		
		return "product/donateProductForm";
	}
	
//	proudct 페이지에서 proudctForm으로 이동할 때 donateType(개인, 기업) 전달
    @PostMapping("/product.bo")
    public String handleDonationForm(@RequestParam("donateType") String donateType, Model model) {
        // donateType을 사용하여 원하는 처리를 수행합니다.
        // 이 예제에서는 donateType을 콘솔에 출력하겠습니다.
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
    	
    	
    	int result = productService.insertProduct(p);
    	
    	
    	String url = "";
    	if(result > 0) {
    		session.setAttribute("alertMsg", "물품 기부가 성공적으로 신청되었습니다.");
    		url = "redirect:/product/donateProductResult";
    		
    	}else {
    		model.addAttribute("errorMsg", "물품 기부 신청에 실패하였습니다.");
    		url = "redirect:/errorPage";
    	}
    	
    	return url;
    }
    
    
//  휴대폰 전화번호 인증
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
    
    
//  물품기부 신청 후, 물품기부 번호 확인 페이지
    @GetMapping("/product/donateProductResult")
    public String selectProductNo(Model model) {
        

        
        int productNo = productService.selectProductNo();
        
        model.addAttribute("productNo", productNo);
        

        return "product/donateProductResult";
    }

//	물품 기부번호 리스트 조회
	@PostMapping("/productNoCheck.bo")
	@ResponseBody
	public List<Product> selectProductNoCheck(
			Model model,
			HttpServletRequest request,
			@RequestParam("phone") String phone
			) {
		
		
		List<Product> product = productService.selectProductNoCheck(phone);
		
		model.addAttribute("product", product);
		
		return product;
	}
	
	
//	물품 기부 수정 폼
	@GetMapping("/product/donateProductUpdate")
	public String updateProductForm(
			HttpServletRequest request,
			Model model
			) {
		
	    // 세션에서 특정 플래그가 설정되어 있는지 확인
	    Boolean hasVisited = (Boolean) request.getSession().getAttribute("hasVisitedDonateProductUpdate");
	    if (hasVisited != null && hasVisited) {
	        // 플래그가 이미 설정되어 있으면 직접적인 URL 접근을 막기 위해 다른 페이지로 리다이렉트
	        return "redirect:/errorPage"; // 적절한 리다이렉트 경로로 수정
	    }
	    
	    // 플래그를 설정하여 다음에 직접적인 URL 접근을 막음
	    request.getSession().setAttribute("hasVisitedDonateProductUpdate", true);
	    
	    
	    List<ProductCategory> list = productService.selectProductCategoryList();
		
		model.addAttribute("list", list);
	    
		
		return "product/donateProductUpdate";
	}
	
//	물품 기부 수정 체크
	@PostMapping("productUpdateCheck.bo")
	public String selectProductUpdateCheck(
			Model model,
			HttpServletRequest request,
			@RequestParam("phone") String phone,
			@RequestParam("productNo") int productNo,
			@RequestParam("puserName") String puserName
			){
		
		Product pro = new Product(); // Product 객체 생성
		
		
		pro.setPhone(phone);
		pro.setProductNo(productNo);
		pro.setPuserName(puserName);
		
		
		Product product = productService.selectProductUpdateCheck(pro);
		
		model.addAttribute("product", product);
		
		if(product != null) {
			// 세션에서 플래그 제거
		    request.getSession().removeAttribute("hasVisitedDonateProductUpdate");
			
			return "product/donateProductUpdate";
		}
		return "";
	}
	
//	물품 기부 수정(update)
	@PostMapping("/product/productUpdate")
	public String updateProduct(
			HttpServletRequest request,
			Product pro,
    		Model model,
			HttpSession session) {
		int result = productService.updateProduct(pro);
	    
	    if(result > 0) {
    		session.setAttribute("alertMsg", "물품 기부가 성공적으로 수정되었습니다.");
    		return "redirect:/";
	    }else {
    		return "redirect:/errorPage";
	    }
	}
	


}