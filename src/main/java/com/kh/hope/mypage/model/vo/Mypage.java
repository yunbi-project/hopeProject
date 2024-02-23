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
	private String receipt;
	
	// 기부 (donate) 후원금
	private int payNo;
	private String payType;
	private int donateAmount;
	
	
	// 봉사활동 (program)
	// 즐겨찾기 (bookmark)
	private String programName;
	private Date programActivityStartDate;
	private Date programActivityEndDate;
	
	private int programNo;
	
}

