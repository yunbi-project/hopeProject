package com.kh.hope.product.model.service;

import java.util.List;

import com.kh.hope.product.model.vo.Product;

public interface ProductService {

//	물품 기부 신청
	int insertProduct(Product p);

//	휴대폰 인증
	void certifiedPhoneNumber(String phone, String numStr);

//  물품 기부 번호 확인
	int selectProductNo();

//	물품 기부번호 리스트 조회
	List<Product> selectProductNoCheck(String phone);

}
