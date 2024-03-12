package com.kh.hope.mypage.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Mypage {
	
	// 기부 (donate) 물품
	private int productAmount;
	private Date productDate;
	private String categoryName;
	private String productType;
	private String productWay;
	private String status;
	private int donateCount;
	private int productCount; // 물품 기부 신청 상태 카운트
	private int statusCount; // 물품 기부 완료 상태 카운트
	private String optionalText;
	
	// 기부 (donate) 후원금
	private Date createDate;
	private String payType;
	private int donateAmount;
	private String donateTitle;
	private int donateNo;
	// 봉사활동 (program)
	// 즐겨찾기 (bookmark)
	private String programName;
	private Date programActivityStartDate;
	private Date programActivityEndDate;
	private int programNo;
	private int result;
	
}

