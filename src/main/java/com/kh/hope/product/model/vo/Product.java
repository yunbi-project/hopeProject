package com.kh.hope.product.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Product {
	
	private int productNo;  // 물품 기부 번호
	private String productType; // 물품 기부 타입 (개인, 기업)
	private String puserName; // 이름
	private String businessName; // 기업 이름
	private String phone;  // 전화번호
	private String email;   // 이메일
	private String productWay;   // 기부 방식
	private String productAmount;   // 기부 수량
	private String status;   // 기부 완료 확인(Y/N)
	private Date productDate;   // 기부 날짜
	private int categoryNo;  // cateygoryName, categoryNo 같이 저장
	private String inquiryContent;   // 문의 사항
	

	
	private String categoryName;   // 카테고리 이름
}
