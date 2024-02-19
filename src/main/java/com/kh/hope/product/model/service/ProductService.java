package com.kh.hope.product.model.service;

import com.kh.hope.product.model.vo.Product;

public interface ProductService {

//	물품 기부 신청
	int insertProduct(Product p);

//	휴대폰 인증
	void certifiedPhoneNumber(String phone, String numStr);

}
